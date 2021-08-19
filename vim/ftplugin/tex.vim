" Tex filetype
augroup ft_tex
	autocmd!
	" Insert comment block
	inoremap ;bl %=======================<CR>%<Space><CR>%=======================<CR><++><Esc>2kA
	" Insert section
	inoremap ;sec \section{}<Esc>i
	" Insert subsection
	inoremap ;sub \subsection{}<Esc>i
	" Insert sub-subsection
	inoremap ;ssub \subsubsection{}<Esc>i
	" Insert bulleted list
	inoremap ;bul \begin{itemize}<CR>\item<Space><CR>\end{itemize}<Esc>ka
	" Insert ordered list
	inoremap ;enu \begin{enumerate}<CR>\item<Space><CR>\end{enumerate}<Esc>ka

	" Insert header
	function TEXHeader() abort
		execute "normal! i%=======================\<cr>% Global Properties\<cr>%=======================\<cr>"
		execute "normal! i\\documentclass[12pt, a4paprer]{article}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\usepackage[utf8]{inputenc}\<cr>"
		execute "normal! i\\usepackage{hyperref}\<cr>"
		execute "normal! i\\usepackage{graphicx}\<cr>"
		execute "normal! i\\usepackage{datetime}\<cr>"
		execute "normal! i\\usepackage[\<cr>"
		execute "normal! i\<tab>top = 1.90cm,\<cr>"
		execute "normal! i\<tab>bottom = 1.67cm,\<cr>"
		execute "normal! i\<tab>left = 1.90cm,\<cr>"
		execute "normal! i\<tab>right = 1.32cm]{geometry}\<cr>"
		execute "normal! i\\usepackage{sectsty} % Format all sections\<cr>"
		execute "normal! i\<tab>\\allsectionsfont{\underline}\<cr>"
		execute "normal! i\<tab>\\subsectionfont{}\<cr>"
		execute "normal! i\\usepackage{soul} % Add '\\st' for strikethrough text\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\setlength\\parindent{0pt}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i%\\pagenumbering{gobble}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i%\\renewcommand{\\familydefault}{\\sfdefault}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i%=======================\<cr>% Document\<cr>%=======================\<cr>"
		execute "normal! i\\begin{document}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i<++>\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\end{document}"
		execute "normal! ?+\<cr>diW"
	endfunction
	inoremap ;hh <Esc>:call TEXHeader()<Enter>
	" If the file is empty, insert the header
	if line('$') == 1 && getline(1) == ''
		:call TEXHeader()
	endif

	" When exiting the file, clean-up Texlive build files
	autocmd VimLeave *.tex !texclear %
augroup END