\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{epflthesis}[2023/07/20 EPFL Thesis Class]

\LoadClass[a4paper,11pt]{book}
% \usepackage{marginnote}
% \usepackage[marginparwidth=60pt]{geometry}

\RequirePackage[T2A,T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[round]{natbib}
\RequirePackage[russian,french,german,english]{babel}

% EDOC THESIS TEMPLATE: Variant 1.0 -> Latin modern, large text width&height
\RequirePackage{lmodern} % use this to fix blurry typewriter text font

% EDOC THESIS TEMPLATE: Variant 2.0 -> Utopia, Gabarrit A (lighter pages)
\RequirePackage{fourier} % Utopia font-typesetting including mathematical formula compatible with newer TeX-Distributions (>2010)
%\usepackage{utopia} % on older systems -> use this package instead of fourier in combination with mathdesign for better looking results
%\usepackage[adobe-utopia]{mathdesign}
\setlength{\textwidth}{146.8mm} % = 210mm - 37mm - 26.2mm
\setlength{\oddsidemargin}{11.6mm} % 37mm - 1in (from hoffset)
\setlength{\evensidemargin}{0.8mm} % = 26.2mm - 1in (from hoffset)
\setlength{\topmargin}{-2.2mm} % = 0mm -1in + 23.2mm 
\setlength{\textheight}{221.9mm} % = 297mm -29.5mm -31.6mm - 14mm (12 to accomodate footline with pagenumber)
\setlength{\headheight}{14mm}

% increase interline spacing slightly
\RequirePackage{setspace}
\setstretch{1.1}

% for aligning all floating figures/tables etc... to the top margin
\setlength{\@fptop}{0pt}

\RequirePackage{graphicx,xcolor}
% \graphicspath{{images/}}

\RequirePackage{subfig}
\RequirePackage{booktabs}
\RequirePackage{lipsum}
\RequirePackage{microtype}
\RequirePackage{url}

\RequirePackage{fancyhdr}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}
\fancyhead[OR]{\bfseries \nouppercase{\rightmark}}
\fancyhead[EL]{\bfseries \nouppercase{\leftmark}}
\fancyfoot[EL,OR]{\thepage}
\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyfoot[EL,OR]{\thepage}}
\fancypagestyle{addpagenumbersforpdfimports}{
    \fancyhead{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{}
    \fancyfoot[RO,LE]{\thepage}
}

\RequirePackage{listings}
\lstset{language=[LaTeX]Tex,tabsize=4, basicstyle=\scriptsize\ttfamily, showstringspaces=false, numbers=left, numberstyle=\tiny, numbersep=10pt, breaklines=true, breakautoindent=true, breakindent=10pt}

\RequirePackage{hyperref}
\hypersetup{pdfborder={0 0 0},
    colorlinks=true,
    linkcolor=black,
    citecolor=black,
    urlcolor=black}
\urlstyle{same}
\ifpdf
    \RequirePackage[final]{pdfpages}
\else
    \RequirePackage{calc}
    \RequirePackage{breakurl}
    \RequirePackage[nlwarning=false]{hypdvips}
    \RequirePackage{backref}
    \renewcommand*{\backref}[1]{}
\fi
\RequirePackage{bookmark}

\renewcommand\@pnumwidth{20pt}

\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
            \hbox{}
            \thispagestyle{empty}
            \newpage
            \if@twocolumn\hbox{}\newpage\fi\fi\fi}

\clearpage{\pagestyle{plain}\cleardoublepage}


%%%%% CHAPTER HEADER %%%%
\RequirePackage{color}
\RequirePackage{tikz}
\RequirePackage[explicit]{titlesec}
\newcommand*\chapterlabel{}
%\renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}[display]  % type (section,chapter,etc...) to vary,  shape (eg display-type)
{\normalfont\bfseries\Huge} % format of the chapter
{\gdef\chapterlabel{\thechapter\ }}     % the label 
{0pt} % separation between label and chapter-title
{\begin{tikzpicture}[remember picture,overlay]
        \node[yshift=-8cm] at (current page.north west)
        {\begin{tikzpicture}[remember picture, overlay]
                \draw[fill=black] (0,0) rectangle(35.5mm,15mm);
                \node[anchor=north east,yshift=-7.2cm,xshift=34mm,minimum height=30mm,inner sep=0mm] at (current page.north west)
                {\parbox[top][30mm][t]{15mm}{\raggedleft \rule{0cm}{0.6cm}\color{white}\chapterlabel}};  %the empty rule is just to get better base-line alignment
                \node[anchor=north west,yshift=-7.2cm,xshift=37mm,text width=\textwidth,minimum height=30mm,inner sep=0mm] at (current page.north west)
                {\parbox[top][30mm][t]{\textwidth}{\rule{0cm}{0.6cm}\color{black}#1}};
            \end{tikzpicture}
        };
    \end{tikzpicture}
    \gdef\chapterlabel{}
} % code before the title body
\titlespacing*{name=\chapter,numberless}{-3.7cm}{83.2pt-\parskip}{-3.2pt+\parskip}
\titlespacing*{\chapter}{-3.7cm}{50pt-\parskip-\parskip}{30pt+\parskip+\parskip}
\titlespacing*{\section}{0pt}{13.2pt}{1em-\parskip}  % 13.2pt is line spacing for a text with 11pt font size
\titlespacing*{\subsection}{0pt}{13.2pt}{1em-\parskip}
\titlespacing*{\subsubsection}{0pt}{13.2pt}{1em-\parskip}
\titlespacing*{\paragraph}{0pt}{13.2pt}{1em-\parskip}

\newcounter{myparts}
\newcommand*\partlabel{}
\titleformat{\part}[display]  % type (section,chapter,etc...) to vary,  shape (eg display-type)
{\normalfont\bfseries\Huge} % format of the part
{\gdef\partlabel{\thepart\ }}     % the label 
{0pt} % separation between label and part-title
{\ifpdf\setlength{\unitlength}{20mm}\else\setlength{\unitlength}{0mm}\fi
    \addtocounter{myparts}{1}
    \begin{tikzpicture}[remember picture,overlay]
        \node[anchor=north west,xshift=-65mm,yshift=-6.9cm-\value{myparts}*20mm] at (current page.north east) % for unknown reasons: 3mm missing -> 65 instead of 62
        {\begin{tikzpicture}[remember picture, overlay]
                \draw[fill=black] (0,0) rectangle(62mm,20mm);   % -\value{myparts}\unitlength
                \node[anchor=north west,yshift=-6.1cm-\value{myparts}*\unitlength,xshift=-60.5mm,minimum height=30mm,inner sep=0mm] at (current page.north east)
                {\parbox[top][30mm][t]{55mm}{\raggedright \color{white}Part \partlabel \rule{0cm}{0.6cm}}};  %the empty rule is just to get better base-line alignment
                \node[anchor=north east,yshift=-6.1cm-\value{myparts}*\unitlength,xshift=-63.5mm,text width=\textwidth,minimum height=30mm,inner sep=0mm] at (current page.north east)
                {\parbox[top][30mm][t]{\textwidth}{\raggedleft \rule{0cm}{0.6cm}\color{black}#1}};
            \end{tikzpicture}
        };
    \end{tikzpicture}
    \gdef\partlabel{}
} % code before the title body
\titlespacing*{\part}{11.06cm}{26.4pt-\parskip-\parskip}{0pt}

\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{mathtools}

% Fix the problem with delimiter size caused by fourier and amsmath packages.
\def\resetMathstrut@{%
\setbox\z@\hbox{%
\mathchardef\@tempa\mathcode`\(\relax
\def\@tempb##1"##2##3{\the\textfont"##3\char"}%
\expandafter\@tempb\meaning\@tempa \relax
}%
\ht\Mathstrutbox@1.2\ht\z@ \dp\Mathstrutbox@1.2\dp\z@
}