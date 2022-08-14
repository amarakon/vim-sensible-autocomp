let b:vcm_tab_complete = 'omni'

function! Cache()
	if &ft =~ 'netrw\|gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif
	call feedkeys("a\<c-x>\<c-o>\<escape>")
endfunction

function! Complete()
	if pumvisible() || getline('.') =~ '^\s*$' || &ft =~ 'gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif

	if (v:char == '/')
		call feedkeys("\<c-x>\<c-f>")
	elseif ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z'))
		call feedkeys("\<c-x>\<c-o>")
	endif
endfunction

autocmd vimenter * call Cache()
autocmd insertcharpre * call Complete()
