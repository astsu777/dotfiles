" Shell filetype
augroup ft_shell
	autocmd!
	" Insert function
	inoremap ;fu ()<Space>{<CR><Tab><++><CR>}<CR><CR><++><Esc>?()<CR>
	" Insert IF statement
	inoremap ;if if<Space>[[<Space>]];<Space>then<CR><++><CR>fi<CR><++><Esc>?];<CR>hhi<Space>
	" Insert ELIF statement
	inoremap ;el elif<Space>[[<Space>]];<Space>then<CR><++><Esc>?];<CR>hhi<Space>
	" Insert CASE statement
	inoremap ;ca case<Space>""<Space>in<CR><++>)<Space><++><Space>;;<CR><++><CR>esac<CR><++><Esc>?"<CR>i
	" Insert WHILE loop
	inoremap ;wh while<Space>;<Space>do<CR><++><CR>done<CR><++><Esc>?;<CR>i

	" Insert header
	function SHHeader() abort
		execute "normal! i#!/usr/bin/env sh\<cr>"
		execute "normal! i#=========================================================================\<cr>"
		execute "normal! i# Author: Gaetan (gaetan@ictpourtous.com) - Twitter: @GaetanICT\<cr>"
		execute "normal! i# Creation: \<c-r>=strftime('%a %d %b %Y %H:%M:%S')\<cr>\<cr>"
		execute "normal! i# Last modified: \<c-r>=strftime('%a %d %b %Y %H:%M:%S')\<cr>\<cr>"
		execute "normal! i# Version: 1.0\<cr>"
		execute "normal! i#\<cr>"
		execute "normal! i# Description: <++>\<cr>"
		execute "normal! i#=========================================================================\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i<++>"
		execute "normal! /<++>\<cr>\"_c4l"
	endfunction
	inoremap ;hh <Esc>:call SHHeader()<Enter>
	" If the file is empty, insert the header
	if line('$') == 1 && getline(1) == ''
		:call SHHeader()
	endif
	" When writing the file, update the last modified timestamp
	autocmd BufWritePre,FileWritePre * :silent! %s/# Last modified: \zs.*/\=strftime('%a %d %b %Y %H:%M:%S')
	autocmd BufWritePre,FileWritePre * :silent! normal! g`'
augroup END

" Check file in shellcheck
map <leader>s :!clear && shellcheck %<CR>