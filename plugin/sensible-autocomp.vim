function! Complete()
	" Keyword completion
	if exists('b:completion_tried') && b:completion_tried
		let b:completion_tried = 0
		return "\<c-x>\<c-n>"
	endif

	" Omni completion
	let b:completion_tried = 1
	return "\<c-x>\<c-o>"
endfunction
inoremap <expr> <plug>complete Complete()

function! Cache()
	if &ft =~ '\|netrw\|fzf\|gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif
	call feedkeys("a\<c-x>\<c-o>\<escape>")
endfunction

function! Main()
	let line = getline('.')
	let pos = col('.') - 1

	if pumvisible() || line =~ '^#!.*$' ||
				\&ft =~ 'gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif

	if v:char == '/' || line[pos - 1] == '/'
		call feedkeys("\<c-x>\<c-f>")
	elseif (v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z')
		call feedkeys("\<plug>complete")
	endif
endfunction

set complete-=t
autocmd vimenter * call Cache()
autocmd insertcharpre * call Main()
