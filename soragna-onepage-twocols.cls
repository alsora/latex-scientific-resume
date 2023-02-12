%----------------------------------------------------------------------------------------
%	CLASS OPTIONS AND REQUIRED PACKAGES
%----------------------------------------------------------------------------------------

\ProvidesClass{soragna-onepage-twocols}[2014/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass{article}

\usepackage{hyperref} % Required for links

\usepackage{sidecap}
\usepackage{url}
\usepackage{float}
\usepackage{graphicx}

\usepackage{ifthen}
\usepackage{xstring}

% useful for multiline comments
\newcommand{\comment}[1]{}

%----------------------------------------------------------------------------------------
%	COLORS
%----------------------------------------------------------------------------------------

\usepackage[usenames,dvipsnames]{xcolor} % Required for custom colors

\definecolor{Mulberry}{HTML}{72243D}
\definecolor{SlateGray}{HTML}{2E2E2E}
\definecolor{LightGray}{HTML}{666666}
\definecolor{DarkGray}{HTML}{333333}

\colorlet{primary}{SlateGray}
\colorlet{headings}{Sepia}
\colorlet{details}{LightGray}
\colorlet{jobtitle}{SlateGray}

\makeatletter
\newcommand{\globalcolor}[1]{%
  \color{#1}\global\let\default@color\current@color
}
\makeatother


%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

\usepackage[hmargin=0.5cm, vmargin=0.5cm]{geometry} % Specifies horizontal and vertical page margins

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage{fontspec} % Required for specifying custom fonts in XeLaTeX

%manually define some fonts

\newcommand{\usefontlato}
{\setmainfont[Scale=1.0,
Path = fonts/lato/,
BoldItalicFont=Lato-RegIta,
BoldFont=Lato-Reg,
ItalicFont=Lato-LigIta]
{Lato-Lig}}

\newcommand{\usefontroboto}
{\setmainfont[Scale=1.0, 
Path = fonts/roboto/,
BoldItalicFont=Roboto-BoldItalic,
BoldFont=Roboto-Bold,
ItalicFont=Roboto-LightItalic]
{Roboto-Italic}}

\newcommand{\usefontrobotomono}{\setmainfont[Scale=0.75,
Path = fonts/roboto_mono/,
BoldItalicFont=RobotoMono-MediumItalic,
BoldFont=RobotoMono-Medium,
ItalicFont=RobotoMono-LightItalic]
{RobotoMono-Regular}}

% switch command for selecting font
% fallback to latex standard fonts
\newcommand{\choosefont}[1]{%
\IfStrEqCase{#1}{
	{Lato}{\usefontlato}
    {Roboto}{\usefontroboto}
    {Roboto_mono}{\usefontrobotomono}}
    [\setmainfont{#1}] % else case
}


% The font used where \sfffamily is called
\setsansfont[Scale=MatchLowercase,Mapping=tex-text, Path = fonts/raleway/]{Raleway-ExtraLight} 


% create a tag: word or sentence surrounded by a rectangle with rounded edges
\usepackage{amssymb}
\usepackage{tikz}
\newcommand{\cvtag}[1]{%
  \tikz[baseline]\node[anchor=base,draw=DarkGray!30,rounded corners,inner xsep=0.5ex,inner ysep =0.75ex,text height=1.3ex,text depth=.25ex]{#1};
}

%----------------------------------------------------------------------------------------
%	ENABLE / DISABLE POSITION LOGOS
%----------------------------------------------------------------------------------------

\newcommand{\usepositionlogos}[1]{
	\ifthenelse{\equal{#1}{true}}
	{
		\newcommand{\positionwidth}{0.86\linewidth}
		\newcommand{\logowidth}{0.15\linewidth}
	}
	{
		\newcommand{\positionwidth}{\linewidth}
		\newcommand{\logowidth}{0mm}
	}
}

%----------------------------------------------------------------------------------------
%	ICON SET CHOICE
%----------------------------------------------------------------------------------------

\newcommand{\chooseiconset}[1]{
	\ifthenelse{\equal{#1}{fontawesome}}
    {
    	\DeclareRobustCommand{\aboutmeicon}				{\hfill\scalebox{1}{\mbox{\faUser}}}
		\DeclareRobustCommand{\technicalskillsicon}		{\hfill\scalebox{1}{\mbox{\faCogs}}}
		\DeclareRobustCommand{\languagesicon}			{\hfill\scalebox{1}{\mbox{\faLanguage}}}
		\DeclareRobustCommand{\experienceicon}			{\hfill\scalebox{1}{\mbox{\faSuitcase}}}
		\DeclareRobustCommand{\educationicon}			{\hfill\scalebox{1}{\mbox{\faGraduationCap}}}
		\DeclareRobustCommand{\awardscertificatesicon}	{\hfill\scalebox{1}{\mbox{\faTrophy}}}
		\DeclareRobustCommand{\publicationsicon}		{\hfill\scalebox{1}{\mbox{\faBook}}}

		\DeclareRobustCommand{\emailicon}				{{\color{headings} \faEnvelope}}
		\DeclareRobustCommand{\phoneicon}				{{\color{headings} \faPhone}}
		\DeclareRobustCommand{\githubicon}				{{\color{headings} \faGithub}}
		\DeclareRobustCommand{\mapicon}					{{\color{headings} \faMapMarker}}
    }
    {
    	\ifthenelse{\equal{#1}{freepik}}
    	{
    		\DeclareRobustCommand{\aboutmeicon}				{\hfill\scalebox{1}{\mbox{\includegraphics[width=1em]{images/icons/boss.png}}}}
    		\DeclareRobustCommand{\technicalskillsicon}		{\hfill\scalebox{1}{\mbox{\includegraphics[width=1em]{images/icons/tools.png}}}}
    		\DeclareRobustCommand{\languagesicon}			{\hfill\scalebox{1}{\mbox{\includegraphics[width=1em]{images/icons/translator.png}}}}    	
    		\DeclareRobustCommand{\experienceicon}			{\hfill\scalebox{1}{\mbox{\includegraphics[width=1em]{images/icons/briefcase.png}}}}
    		\DeclareRobustCommand{\educationicon}			{\hfill\scalebox{1}{\mbox{\includegraphics[width=1em]{images/icons/open-book.png}}}}
    		\DeclareRobustCommand{\awardscertificatesicon}	{\hfill\scalebox{1}{\mbox{\includegraphics[width=1em]{images/icons/quality.png}}}}
    		\DeclareRobustCommand{\publicationsicon}		{\hfill\scalebox{1}{\mbox{\includegraphics[width=1em]{images/icons/plan.png}}}}

			\DeclareRobustCommand{\emailicon}				{\raisebox{-0.2em}{\includegraphics[width=1.2em]{images/icons/email.png}}}
			\DeclareRobustCommand{\phoneicon}				{\raisebox{-0.2em}{\includegraphics[width=1.2em]{images/icons/phonebook.png}}}
			\DeclareRobustCommand{\githubicon}				{\raisebox{-0.2em}{\includegraphics[width=1.2em]{images/icons/github.png}}}
			\DeclareRobustCommand{\mapicon}					{\raisebox{-0.2em}{\includegraphics[width=1.2em]{images/icons/map.png}}}
    	}
    	{
			% empty icons if nothing is selected
			\DeclareRobustCommand{\aboutmeicon}{}
			\DeclareRobustCommand{\technicalskillsicon}{}
			\DeclareRobustCommand{\languagesicon}{}
			\DeclareRobustCommand{\experienceicon}{}
			\DeclareRobustCommand{\educationicon}{}
			\DeclareRobustCommand{\awardscertificatesicon}{}
			\DeclareRobustCommand{\publicationsicon}{}

			\DeclareRobustCommand{\emailicon}{}
			\DeclareRobustCommand{\phoneicon}{}
			\DeclareRobustCommand{\githubicon}{}
			\DeclareRobustCommand{\mapicon}{}
    	}
    }
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
{
\color{details}\fontspec[Path = fonts/raleway/]{Raleway-ExtraLight}\fontsize{8pt}{10pt}\selectfont % Text styling of the text
Last Updated on \today % Last Updated text
}
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
\DeclareDocumentCommand{\headersection}{m}
{%
	% key defaults + new ones
  	\setkeys{headersection}{name={Name}, surname={Surname}, phone={+1 000 0000000}, mail={yahoo@gmail.com}, website={https://www.whitehouse.gov/}, address={Address}, birth={25 December 2018},#1}%
	\centering{ % Center the name
		\fontsize{40pt}{60pt} % Font size
		\fontspec[Path = fonts/lato/]{Lato-Hai}\selectfont \bfseries \mm@name \thinspace
		\fontspec[Path = fonts/lato/]{Lato-Bol}\selectfont \mm@surname
	}%
	\\[5pt] % Whitespace between the name and contact information
	\centering{ % Center the contact information
		\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{11pt}{14pt}\selectfont
		\ifthenelse{\equal{\mm@mail}{}}{\hphantom{1pt}} { \emailicon ~\href{mailto:\mm@mail}{\mm@mail} ~~}
		\ifthenelse{\equal{\mm@phone}{}}{\hphantom{1pt}} { \phoneicon ~\mm@phone ~~}
		\ifthenelse{\equal{\mm@address}{}}{\hphantom{1pt}} { \mapicon ~\mm@address ~~}
		\ifthenelse{\equal{\mm@website}{}}{\hphantom{1pt}} { \githubicon ~\href{\mm@website}{\mm@website} ~~}
	} % Contact information font
	\noindent\makebox[\linewidth]{\rule{\paperwidth}{0.4pt}} % Horizontal rule
	\vspace{-10pt} % Reduce whitespace after the rule slightly
}
\makeatother

%----------------------------------------------------------------------------------------
%	SECTION TITLE STYLING AND SPACING
%----------------------------------------------------------------------------------------

% Wrapper commands to be used for sections on the left or right column
\newcommand{\leftsection}[2]{\section{#1 #2}}
% Aligns icons in the right column with the company/position logos
\newcommand{\rightsection}[2]{\section{#1 {#2 \hspace{\logowidth}}}}

\usepackage{titlesec} % Required for customizing section/subsection/etc titles

% Removes the spacing around the main section titles
\titlespacing{\section}{0pt}{0pt}{0pt}
% Removes the spacing around the subsections
\titlespacing{\subsection}{0pt}{0pt}{0pt}

\newcommand{\titlefontsize}{20pt}
\newcommand{\titlefontbaselineskip}{25pt} %1.2 x size

% Customize the section titles
\titleformat{\section}{ 
\color{headings}
\scshape\fontspec[Path = fonts/kiona/]{Kiona-Regular}\fontsize{\titlefontsize}{\titlefontbaselineskip}\selectfont \raggedright\uppercase}{}{0em}{}[]
% alternative title fonts:
%[Path = fonts/lato/]{Lato-Bol}

% Customize the subsections
\titleformat{\subsection}{ 
\color{DarkGray}
\fontspec[Path = fonts/caviar_dreams/]{CaviarDreams_Bold}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase}{}{0em}{}[]
%[Path = fonts/lato/]{Lato-Bol}

% Defines a command to add a set amount of space after sections and subsections
\newcommand{\sectionspace}{\vspace{8pt}}

%----------------------------------------------------------------------------------------
%	CREATE POSITION COMMAND
%----------------------------------------------------------------------------------------

% define the \createposition command, used for listing work experiences and education entries

\makeatletter
% ========= KEY DEFINITIONS =========
\define@key{createposition}{company}{\def\mm@company{#1}}
\define@key{createposition}{title}{\def\mm@title{#1}}
\define@key{createposition}{date}{\def\mm@date{#1}}
\define@key{createposition}{location}{\def\mm@location{#1}}
\define@key{createposition}{logo}{\def\mm@logo{#1}}
\define@key{createposition}{description}{\def\mm@description{#1}}
\DeclareDocumentCommand{\createposition}{m}%
{%
	% key defaults + new ones
	\setkeys{createposition}{company={My Company},title={Engineer of nothing},date={May 2013 - Aug 2013}, location={Russia}, logo={images/logo/mcdonalds}, description={},#1}%
    
    % first minipage for position details and decscription
    \begin{minipage}{\positionwidth}  
		% company/university name
		{  \color{DarkGray}\fontspec[Path = fonts/caviar_dreams/]{CaviarDreams_Bold}\fontsize{12pt}{12pt}\selectfont\bfseries\uppercase {\mm@company} \normalfont}
		% same line job title
		{  \raggedright\scshape\fontspec[Path = fonts/caviar_dreams/]{CaviarDreams_Bold}\fontsize{11pt}{13pt}\selectfont { ~|~~ {\color{jobtitle}  \mm@title  }\\} \normalfont}
	
		% new line date and location    
		\ifthenelse{\equal{\mm@date}{}}{} {{\small\makebox[0.6\linewidth][l]{\color{details} \faCalendar\hspace{0.5em}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {\mm@date } \normalfont}}}
		\ifthenelse{\equal{\mm@location}{}}{} {{\small\makebox[0.3\linewidth][l]{\color{details} \faMapMarker\hspace{0.5em}\raggedright\fontspec[Path = fonts/raleway/]{Raleway-Medium}\fontsize{10pt}{12pt}\selectfont {\mm@location } \normalfont}}}
	
		% new line optional position description
		\mm@description
  	\end{minipage}%
  	%
  	%
  	% second optional minipage for company logo if logo width > 0
	\ifthenelse{\lengthtest{\logowidth > 1mm}}
	{%
		\begin{minipage}{\logowidth}
			\ifthenelse{\equal{\mm@logo}{}}
			{}
			{ \begin{flushright} \includegraphics[width=1.4cm] {\mm@logo} \end{flushright} }
		\end{minipage}
	}
	{}
}
\makeatother


% create a dashed line as divider between experiences.
% to use it add \divider in the .tex file
\usepackage{dashrule}

\newcommand{\divider}{\color{text!30}{\hdashrule{0.92\linewidth}{0.5pt}{2.15pt}}\medskip}

%----------------------------------------------------------------------------------------
%	LANGUAGES
%----------------------------------------------------------------------------------------

\newcommand{\languageskill}[3]{
	\raisebox{-0.1em}{\includegraphics[width=1em]{#3}}
	\makebox[1.5cm][l]{
		#1:
	}
	~ #2\\
}

%----------------------------------------------------------------------------------------
%	ITEMS SETTINGS
%----------------------------------------------------------------------------------------

% Used for entries with a date and a name/description
\newcommand*{\dateitem}[2]{
  \begin{tabular}{p{0.08\textwidth} p{0.9\textwidth}}   
       {#1} & {#2}
  \end{tabular}
  %\par\addvspace{#1}
}

%----------------------------------------------------------------------------------------
%	BIBLIOGRAPHY SETTINGS
%----------------------------------------------------------------------------------------

\usepackage{natbib}
%\bibliographystyle{abbrvnat}
\bibliographystyle{plainyrrev}
\renewcommand{\bibsection}{}
