function! Cache()
	if &ft =~ 'netrw\|gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif
	call feedkeys("a\<c-x>\<c-o>\<escape>")
endfunction

function! Complete()
	if pumvisible() || &ft =~ 'gitcommit\|text\|markdown\|rmd\|tex\|plaintex'
		return
	endif

	if (v:char == '/' || v:char == '$' || v:char == '~' || v:char == '.')
		call feedkeys("\<c-x>\<c-f>")
	elseif ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z') || (v:char >= '0' || v:char == '0') && (v:char != '{' && v:char != '}'))
		call feedkeys("\<plug>vim_completes_me_forward")
	endif
endfunction

autocmd vimenter * call Cache()
autocmd insertcharpre * call Complete()
