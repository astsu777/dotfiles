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
	inoremap ;ssub \subsubsection{}<CR><++><Esc>kf{a
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
	" Insert slide (beamer)
	inoremap ;sli \section{<++>}<CR>\begin{frame}<CR>\frametitle{<++>}<CR>\begin{itemize}<CR>\item <++><CR>\end{itemize}<CR><++><CR>\end{frame}<CR><++><Esc>/<++><CR>"_c4l

	" Insert header
	function TeXHeader() abort
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Preamble\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Compiler: pdflatex\<cr>"
		execute "normal! i\\documentclass[12pt, a4paper]{article}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\usepackage[utf8]{inputenc}\<cr>"
		execute "normal! i\\usepackage{xcolor}\<cr>"
		execute "normal! i\\usepackage{graphicx}\<cr>"
		execute "normal! i\\usepackage[top = 1.90cm,bottom = 1.67cm,left = 1.90cm,right = 1.32cm]{geometry}\<cr>"
		execute "normal! i\\usepackage{soul} % Add '\\st' for strikethrough text\<cr>"
		execute "normal! i\\usepackage{hyperref}\<cr>"
		execute "normal! i\\usepackage{enumitem,amssymb}\<cr>"
		execute "normal! i\\usepackage{pifont}\<cr>"
		execute "normal! i\\usepackage[most]{tcolorbox}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\begin{document}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\title{<++>}\<cr>"
		execute "normal! i\\author{<++>}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\maketitle\<cr>"
		execute "normal! i\\tableofcontents\<cr>"
		execute "normal! i\\listoffigures\<cr>"
		execute "normal! i\\listoftables\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Document\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i<++>\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\end{document}\<cr>"
		execute "normal! /<++>\<cr>\"_c4l\<esc>l"
	endfunction
	inoremap ;hh <Esc>:call TeXHeader()<Enter>

	" Template presentation
	function TeXBeamer() abort
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Preamble\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Compiler: pdflatex\<cr>"
		execute "normal! i\\documentclass{beamer}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\usepackage[utf8]{inputenc}\<cr>"
		execute "normal! i\\usepackage{graphicx}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\title{<++>}\<cr>"
		execute "normal! i\\author{<++>}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\usetheme{Berkeley}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\maketitle\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Document\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i<++>\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\end{document}\<cr>"
		execute "normal! /<++>\<cr>\"_c4l\<esc>l"
	endfunction

	" Template Intervention Report
	function TeXInterventionReport() abort
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Preamble\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Compiler: pdflatex\<cr>"
		execute "normal! i\\documentclass[12pt, a4paper]{article}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\usepackage[utf8]{inputenc}\<cr>"
		execute "normal! i\\usepackage{xcolor}\<cr>"
		execute "normal! i\\usepackage{graphicx}\<cr>"
		execute "normal! i\\usepackage[top = 1.90cm,bottom = 1.67cm,left = 1.90cm,right = 1.32cm]{geometry}\<cr>"
		execute "normal! i\\usepackage{titlesec}\<cr>"
		execute "normal! i\\usepackage{titletoc}\<cr>"
		execute "normal! i\\usepackage{soul} % Add '\\st' for strikethrough text\<cr>"
		execute "normal! i\\usepackage{hyperref}\<cr>"
		execute "normal! i\\usepackage{enumitem,amssymb}\<cr>"
		execute "normal! i\\usepackage{pifont}\<cr>"
		execute "normal! i\\usepackage[most]{tcolorbox}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\definecolor{colsection}{HTML}{003399}\<cr>"
		execute "normal! i\\definecolor{colsubsection}{HTML}{003399}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\renewcommand{\\contentsname}{Table of Contents}\<cr>"
		execute "normal! i\\titlecontents{section}[0.5cm]\<cr>"
		execute "normal! i{\\vspace{0.1cm}}\<cr>"
		execute "normal! i{\\hypersetup{hidelinks}\\large\\contentslabel[\\thecontentslabel.]{0.5cm}}\<cr>"
		execute "normal! i{\\hspace*{-0.84cm}}\<cr>"
		execute "normal! i{\\titlerule*[.3cm]{.}\\contentspage}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\titlecontents{subsection}[1.2cm]\<cr>"
		execute "normal! i{\\vspace{0.1cm}}\<cr>"
		execute "normal! i{\\hypersetup{hidelinks}\\normalsize\\contentslabel[\\thecontentslabel.]{1cm}}\<cr>"
		execute "normal! i{\\hspace*{-0.84cm}\\uppercase}\<cr>"
		execute "normal! i{\\titlerule*[.3cm]{.}\\contentspage}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\titleformat{\\section}{\\huge\\bf\\color{colsection}}{\\thesection.}{0.5cm}{}[\\titlerule]\<cr>"
		execute "normal! i\\titleformat{\\subsection}{\\Large\\bf\\color{colsubsection}}{\\thesubsection.}{0.5cm}{}\<cr>"
		execute "normal! i\\titlespacing{\\section}{0cm}{0.5cm}{0.15cm}\<cr>"
		execute "normal! i\\titlespacing{\\subsection}{0.25cm}{0.5cm}{0cm}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\setlength\\parindent{0cm}\<cr>"
		execute "normal! i\\setlength{\\parskip}{0.25cm}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\hypersetup{urlcolor=cyan}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i% \\pagenumbering{gobble}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\renewcommand{\\familydefault}{\\sfdefault}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i% Code block\<cr>"
		execute "normal! i\\newtcblisting{codebl}[1]{\<cr>"
		execute "normal! icolback=blue!5!gray!10,\<cr>"
		execute "normal! icolframe=red!60!black,\<cr>"
		execute "normal! ifonttitle=\\bfseries,\<cr>"
		execute "normal! ititle=#1,listing only}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\begin{document}\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\title{\\textbf{\\uppercase{\\huge <++>}}\\\\[0.5cm]\<cr>"
		execute "normal! i\\uppercase{\\large <++>}}\<cr>"
		execute "normal! i\\author{{\\large <++>}\\\\\<cr>"
		execute "normal! i\\small E: \\href{mailto:<++>}{<++>}}\<cr>"
		execute "normal! i\\makeatletter\<cr>"
		execute "normal! i\\begin{titlepage}\<cr>"
		execute "normal! i\\begin{center}\<cr>"
		execute "normal! i\\vbox{}\\vspace{5cm}\<cr>"
		execute "normal! i{\\@title }\\\\[2cm]\<cr>"
		execute "normal! i\\includegraphics[scale=0.2]{~/projects/LaTeX/images/logo.jpg}\\\\[2cm]\<cr>"
		execute "normal! i{\\@author}\\\\[3cm]\<cr>"
		execute "normal! i{\\large\\@date}\<cr>"
		execute "normal! i\\end{center}\<cr>"
		execute "normal! i\\end{titlepage}\<cr>"
		execute "normal! i\\makeatother\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\tableofcontents\<cr>"
		execute "normal! i\\listoffigures\<cr>"
		execute "normal! i\\listoftables\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\newpage\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i% Document\<cr>"
		execute "normal! i%=======================\<cr>"
		execute "normal! i<++>\<cr>"
		execute "normal! i\<cr>"
		execute "normal! i\\end{document}\<cr>"
		execute "normal! /<++>\<cr>\"_c4l\<esc>l"
	endfunction

	" If the file is empty, insert the header
	if line('$') == 1 && getline(1) == ''
		:call TeXHeader()
	endif
	" When exiting the file, clean-up Texlive build files
	autocmd VimLeave *.tex !texclear %
augroup END