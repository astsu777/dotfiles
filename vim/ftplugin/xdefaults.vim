" Tex filetype
augroup ft_xdefaults
	autocmd!
	" Run XRDB when exiting the file
	autocmd BufWritePost Xresources,Xdefaults,xresources,xdefaults !xrdb %
augroup END