let b:vcm_tab_complete = 'omni'

function! Cache()
	if &ft =~ 'netrw\|gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif
	call feedkeys("a\<c-x>\<c-o>\<escape>")
endfunction

function! Complete()
	let line = getline('.')
	let pos = col('.') - 1

	if pumvisible() || line =~ '^#!.*$' ||
				\&ft =~ 'gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif

	if v:char == '/' || line[pos - 1] == '/'
		call feedkeys("\<c-x>\<c-f>")
	elseif (v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z')
		call feedkeys("\<plug>vim_completes_me_forward")
	endif
endfunction

autocmd vimenter * call Cache()
autocmd insertcharpre * call Complete()
