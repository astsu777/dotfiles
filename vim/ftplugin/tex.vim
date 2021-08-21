" Tex filetype
augroup ft_tex
	autocmd!
	" Insert comment block
	inoremap ;bl %=======================<CR>%<Space><CR>%=======================<CR><++><Esc>2kA
	" Insert section
	inoremap ;sec \section{}<CR><++><Esc>kf{a
	" Insert subsection
	inoremap ;sub \subsection{}<CR><++><Esc>kf{a
	" Insert sub-subsection
	inoremap ;ssub \subsubsection{}<++><Esc>kf{a
	" Insert bulleted list
	inoremap ;bul \begin{itemize}<CR>\item<Space><CR>\end{itemize}<CR><++><Esc>2kA
	" Insert ordered list
	inoremap ;enu \begin{enumerate}<CR>\item<Space><CR>\end{enumerate}<CR><++><Esc>2kA
	" Insert code block
	inoremap ;cbl \bigskip<CR>\begin{codebl}{}<CR><++><CR>\end{codebl}<CR>\bigskip<CR><++><Esc>4k$i
	" Insert To-Do list
	inoremap ;tdl \begin{todolist}<CR>\item[\done]<Space><CR>\item[\wontfix]<Space><++><CR>\item<Space><++><CR>\end{todolist}<CR><++><Esc>4k$a
	" Insert figures
	inoremap ;fig \begin{figure}<CR>\includegraphics[width=cm]{}<CR>\centering<CR>\caption{}<CR>\end{figure}<Esc>3kf=a

	" When exiting the file, clean-up Texlive build files
	autocmd VimLeave *.tex !texclear %
augroup END