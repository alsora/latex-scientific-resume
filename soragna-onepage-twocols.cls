%----------------------------------------------------------------------------------------
%	CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\ProvidesClass{soragna-onepage-twocols}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\usepackage[hmargin=1.25cm, vmargin=0.75cm]{geometry} % Specifies horizontal and vertical page margins
\usepackage{hyperref} % Required for links

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage[usenames,dvipsnames]{xcolor} % Required for custom colors

\definecolor{primary}{HTML}{2b2b2b} % The primary document color for content text
\definecolor{headings}{HTML}{6A6A6A} % The color of the large sections
%\colorlet{headings}{Sepia}
\definecolor{subheadings}{HTML}{333333} % The color of subsections and places worked/studied
\definecolor{date}{HTML}{666666} % The color used for the Last Updated text at the top right

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{5D5D5D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{darktext}{HTML}{414141}
\colorlet{text}{darkgray}
\colorlet{graytext}{gray}
\colorlet{lighttext}{lightgray}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX

\setmainfont[Color=primary, Path = fonts/lato/,BoldItalicFont=Lato-RegIta,BoldFont=Lato-Reg,ItalicFont=Lato-LigIta]{Lato-Lig} % The primary font for content text; defines bold, italic and bold-italic as well

\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight} % The font used where \sfffamily is called


\usepackage{amssymb}
\usepackage{tikz}
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=text!30,rounded corners,inner xsep=0.5ex,inner ysep =0.75ex,text height=1.3ex,text depth=.25ex]{#1};
}


%----------------------------------------------------------------------------------------
%	LAST UPDATED COMMAND
%----------------------------------------------------------------------------------------

\usepackage[absolute]{textpos} % Required for positioning the Last Updated text at the top right of the page
\usepackage[UKenglish]{isodate} % Prints the Last Updated date in UK English format

\setlength{\TPHorizModule}{0.01\paperwidth} % Sets the units for the horizontal position used in the \begin{textblock} argument
\setlength{\TPVertModule}{0.01\paperwidth} % Sets the units for the vertical position used in the \begin{textblock} argument
\newcommand{\lastupdated}{ % Create a new command for printing the Last Updated text
\begin{textblock}{25}(75,2) % The position of the Last Updated text on the page (75% of the page across, 2% down)
\color{date}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont % Text styling of the text
Last Updated on \today % Last Updated text
\end{textblock}}

%----------------------------------------------------------------------------------------
%	MAIN HEADING COMMAND
%----------------------------------------------------------------------------------------

\usepackage{fontawesome}


\makeatletter
% ========= KEY DEFINITIONS =========
\define@key{headersection}{name}{\def\mm@name{#1}}
\define@key{headersection}{surname}{\def\mm@surname{#1}}
\define@key{headersection}{website}{\def\mm@website{#1}}
\define@key{headersection}{phone}{\def\mm@phone{#1}}
\define@key{headersection}{mail}{\def\mm@mail{#1}}
\define@key{headersection}{address}{\def\mm@address{#1}}
\define@key{headersection}{birth}{\def\mm@birth{#1}}

\DeclareDocumentCommand{\headersection}{m}{%
  % ========= KEY DEFAULTS + new ones =========
  \setkeys{headersection}{name={Name}, surname={Surname}, phone={+1 000 0000000}, mail={yahoo@gmail.com}, website={https://www.whitehouse.gov/}, address={Address}, birth={25 December 2018},#1}%

\centering{ % Center the name
\fontsize{40pt}{60pt} % Font size
\fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont \mm@name ~
\fontspec[Path = fonts/lato/]{Lato-Lig}\selectfont \mm@surname
} \\[5pt] % Whitespace between the name and contact information
\centering{ % Center the contact information
    \color{headings} % Use the headings color
    \fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont
    
    \ifthenelse{\equal{\mm@mail}{}}{} {\faEnvelope ~\href{mailto:\mm@mail}{\mm@mail} ~~}
    \ifthenelse{\equal{\mm@phone}{}}{} {\faPhone ~ \mm@phone ~~}
    \ifthenelse{\equal{\mm@website}{}}{} {\faGithub ~ \href{\mm@website}{\mm@website} ~~}
    \ifthenelse{\equal{\mm@address}{}}{} {\faMapMarker ~ \mm@address ~~}

} % Contact information font
\noindent\makebox[\linewidth]{\color{headings}\rule{\paperwidth}{0.4pt}} % Horizontal rule
\vspace{-5pt} % Reduce whitespace after the rule slightly

}
\makeatother



%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

\usepackage{titlesec} % Required for customizing section/subsection/etc titles

\titlespacing{\section}{0pt}{0pt}{0pt} % Removes the spacing around the main section titles
\titlespacing{\subsection}{0pt}{0pt}{0pt} % Removes the spacing around the subsections
\newcommand{\sectionspace}{\vspace{8pt}} % Defines a command to add a set amount of space after sections and subsections

\titleformat{\section}{ % Customize the large section titles
\color{headings}\scshape\fontspec[Path = fonts/lato/]{Lato-Lig}\fontsize{16pt}{24pt}\selectfont \raggedright\uppercase}{}{0em}{}

\titleformat{\subsection}{ % Customize the subsections and places worked/studied titles
\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}

\newcommand{\runsubsection}[1]{ % Used for creating subsections where a description is required on the same line
\color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {#1} \normalfont}

\newcommand{\descript}[1]{ % Used for describing the subsection either on the same line or underneath
\color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont {#1 \\} \normalfont}

\newcommand{\location}[1]{ % Used for specifying a duration and/or location under a subsection
\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {#1\\} \normalfont}

\usepackage{keyval,xparse}% http://ctan.org/pkg/{keyval,xparse}



\usepackage{sidecap}
\usepackage{geometry}
\usepackage{url}
\usepackage{float}
\usepackage{graphicx}


\usepackage{ifthen}



\makeatletter
% ========= KEY DEFINITIONS =========
\define@key{createposition}{company}{\def\mm@company{#1}}
\define@key{createposition}{title}{\def\mm@title{#1}}
\define@key{createposition}{date}{\def\mm@date{#1}}
\define@key{createposition}{location}{\def\mm@location{#1}}
\define@key{createposition}{logo}{\def\mm@logo{#1}}
\define@key{createposition}{description}{\def\mm@description{#1}}
\DeclareDocumentCommand{\createposition}{m}{%
  % ========= KEY DEFAULTS + new ones =========
  \setkeys{createposition}{company={My Company},title={Engineer of nothing},date={May 2013 - Aug 2013}, location={Russia}, logo={images/logo/mcdonalds}, description={},#1}%
    
    % first minipage for position details and decscription
    \begin{minipage}{0.92\linewidth}  
    % company/university name
  \color{subheadings}\fontspec[Path = fonts/lato/]{Lato-Bol}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {\mm@company} \normalfont
  % same line job title
  \color{subheadings}\raggedright\scshape\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{13pt}\selectfont { | \mm@title  \\} \normalfont
  
    % new line date and location
  %\ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\faCalendar\hspace{0.5em}#3}}}%
  %\ifstrequal{#4}{}{}{{\small\makebox[0.5\linewidth][l]{\faMapMarker\hspace{0.5em}#4}}}\par    
 
    
   \ifthenelse{\equal{\mm@date}{}}{} {{\small\makebox[0.6\linewidth][l]{\faCalendar\hspace{0.5em}\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {\mm@date } \normalfont}}}
   \ifthenelse{\equal{\mm@location}{}}{} {{\small\makebox[0.3\linewidth][l]{\faMapMarker\hspace{0.5em}\color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {\mm@location } \normalfont}}}
  
    
    
 % \color{headings}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {\mm@date | \mm@location} \normalfont
  
  
  % new line optional position description
  \mm@description
  	\end{minipage}%
  	% second minipage for company logo
  	\begin{minipage}{0.05\linewidth}
  	% skip some space between text and logo
  	~~~~~~~~
  	\ifthenelse{\equal{\mm@logo}{}}{}{\includegraphics[width=1.4cm] {\mm@logo}}
	\end{minipage}%
}
\makeatother

\usepackage{dashrule}


\newcommand{\divider}{\color{text!30}{\hdashrule{0.92\linewidth}{0.5pt}{2.15pt}}\medskip}

%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

\newenvironment{tightitemize} % Defines the tightitemize environment which modifies the itemize environment to be more compact
{\vspace{-\topsep}\begin{itemize}\itemsep1pt \parskip0pt \parsep0pt}
{\end{itemize}\vspace{-\topsep}}





\usepackage{natbib}
\bibliographystyle{abbrvnat}
\renewcommand{\bibsection}{}






