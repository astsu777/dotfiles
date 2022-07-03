" Powershell filetype
augroup ps1_shell
	autocmd!
	" Insert function
	inoremap ;fu function<Space><Space>{<CR><++><CR>}<CR><CR><++><Esc>?{<CR>hi
	" Insert IF statement
	inoremap ;if if<Space>(<Space>)<Space>{<CR><++><CR>}<CR><++><Esc>?(<CR>li<Space>
	" Insert FOR loop
	inoremap ;fe foreach<Space>(<Space>in <++>)<Space>{<CR><++><CR>}<CR><++><Esc>?(<CR>li<Space>

	" If the file is empty, insert the header
	if line('$') == 1 && getline(1) == ''
		:call Header()
	endif

	" Set file format to DOS type
	if &modifiable
    	setlocal fileformat=dos
	endif

	" When writing the file, update the last modified timestamp
	autocmd BufWritePre,FileWritePre * :silent! %s/# Last modified: \zs.*/\=strftime('%a %d %b %Y %H:%M:%S')
	autocmd BufWritePre,FileWritePre * :silent! normal! g`'
augroup END
