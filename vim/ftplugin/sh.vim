augroup ft_shell
	autocmd!
	inoremap ;fu ()<Space>{<CR><Tab><++><CR>}<CR><CR><++><Esc>?()<CR>
	inoremap ;if if<Space>[[<Space>]];<Space>then<CR><++><CR>fi<CR><++><Esc>?];<CR>hhi<Space>
	inoremap ;el elif<Space>[[<Space>]];<Space>then<CR><++><Esc>?];<CR>hhi<Space>
	inoremap ;ca case<Space>""<Space>in<CR><++>)<Space><++><Space>;;<CR><++><CR>esac<CR><++><Esc>?"<CR>i
	inoremap ;wh while<Space>;<Space>do<CR><++><CR>done<CR><++><Esc>?;<CR>i
	function Header() abort
		execute "normal! i#!/usr/bin/env bash\<cr>"
		execute "normal! i#===================================================\<cr>"
		execute "normal! i# Author: Gaetan (gaetan@ictpourtous.com)\<cr>"
		execute "normal! i# Creation: \<c-r>=strftime('%a %b %Y %H:%M:%S')\<cr>\<cr>"
		execute "normal! i# Last modified: \<c-r>=strftime('%a %b %Y %H:%M:%S')\<cr>\<cr>"
		execute "normal! i# Version: 1.0\<cr>"
		execute "normal! i#\<cr>"
		execute "normal! i# Description: <++>\<cr>"
		execute "normal! i#===================================================\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i<++>"
		execute "normal! /<++>\<cr>ciw"
	endfunction
	if line('$') == 1 && getline(1) == ''
		:call Header()
	endif
augroup END