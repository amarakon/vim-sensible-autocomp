let g:exceptions = ['', 'nerw', 'fzf', 'gitcommit', 'text', 'markdown', 'rmd',
			\'tex', 'plaintex']

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
	if &omnifunc != "syntaxcomplete#Complete"
		set omnifunc=syntaxcomplete#Complete
	endif
	if index(g:exceptions, &ft) >= 0 | return | endif
	call feedkeys("a\<c-x>\<c-o>\<escape>")
endfunction

function! Main()
	if pumvisible() | return | endif

	if v:char == '/' || getline('.')[col('.') - 2] == '/'
		call feedkeys("\<c-x>\<c-f>")
	elseif ((v:char >= 'a' && v:char <= 'z') ||
				\(v:char >= 'A' && v:char <= 'Z')) &&
				\index(g:exceptions, &ft) < 0
		call feedkeys("\<plug>complete")
	endif
endfunction

autocmd vimenter * set shortmess+=c completeopt+=menuone,noinsert pumheight=5
autocmd filetype * call Cache()
autocmd insertcharpre * call Main()
