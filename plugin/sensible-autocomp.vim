let g:vcm_default_maps = 0
let b:vcm_tab_complete = 'omni'

function! Complete()
	if !pumvisible()
		if (v:char == '/' || v:char == '$' || v:char == '~' || v:char == '.')
			call feedkeys("\<c-x>\<c-f>")
		elseif ((v:char >= 'a' && v:char <= 'z') || (v:char >= 'A' && v:char <= 'Z') || (v:char >= '0' || v:char == '0'))
			call feedkeys("\<plug>vim_completes_me_forward")
		endif
	endif
endfunction

if &ft != "gitcommit" && &ft != "text" && &ft != "markdown" && &ft != "rmd" && &ft != "latex"
	autocmd vimenter * call feedkeys("a\<c-x>\<c-o>\<escape>")
	autocmd insertcharpre * call Complete()
endif
