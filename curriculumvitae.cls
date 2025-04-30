%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CurriculumVitae
% LaTeX Class
% Version 2.0 (12/10/23)
%
% This class originates from:
% http://www.LaTeXTemplates.com
%
% Authors:
% Brendan Harris
% Based on a template by Omar Roldan
% Based on a template by  Jan Vorisek (jan@vorisek.me)
% Based on a template by Jan Küster (info@jankuester.com)
% Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
%
% License:
% The MIT License (see included LICENSE file)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	CLASS CONFIGURATION
%----------------------------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{curriculumvitae}[2023/10/12 CurriculumVitae class v2.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}} % Pass through any options to the base class
\ProcessOptions\relax % Process given options

\LoadClass{extarticle} % Load the base class

%----------------------------------------------------------------------------------------
%	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
%----------------------------------------------------------------------------------------

\setlength{\parindent}{0mm} % Suppress paragraph indentation

\usepackage[hidelinks]{hyperref} % Required for links but hide the default boxes around links

% \pagestyle{empty} % No headers or footers

\usepackage{moresize} % Provides more font size commands (\HUGE and \ssmall)
\usepackage{enumitem}
%----------------------------------------------------------------------------------------
%	PAGE LAYOUT
%----------------------------------------------------------------------------------------

\usepackage{geometry} % Required for adjusting page dimensions and margins

\geometry{
	paper=a4paper, % Paper size, change to letterpaper for US letter size
	top=1.6cm, % Top margin
	bottom=1.6cm, % Bottom margin
	left=1.6cm, % Left margin
	right=1.6cm, % Right margin
	headheight=0.75cm, % Header height
	footskip=1cm, % Space from the bottom margin to the baseline of the footer
	headsep=0.5cm, % Space from the top margin to the baseline of the header
	%showframe, % Uncomment to show how the type block is set on the page
}

%----------------------------------------------------------------------------------------
%	FONTS
%----------------------------------------------------------------------------------------

\usepackage[utf8]{inputenc} % Required for inputting international characters

% \usepackage[default]{raleway}
% \usepackage[defaultsans]{droidsans}
% \usepackage{cmbright}
% \usepackage{mathptmx}
\usepackage{tgpagella,eulervm}

% \renewcommand*\familydefault{\sfdefault} % Force the sans-serif version of any font used

%------------------------------------------------

% \usepackage{fontawesome} % Required for FontAwesome icons
\usepackage{fontspec}
\newfontfamily{\fabrands}[Path=./logos/]{Font Awesome 6 Brands-Regular-400}
\newfontfamily{\fafree}[Path=./logos/]{Font Awesome 6 Free-Regular-400}
\newfontfamily{\fasolid}[Path=./logos/]{Font Awesome 6 Free-Solid-900}

% Command to output an icon in a black square box with text to the right
\newcommand{\icon}[3]{%
	\vcenteredhbox{\colorbox{white}{\makebox(#2, #2){\textcolor{black}{\large #1}}}}%
	\vcenteredhbox{\textcolor{black}{\ #3}}%
}

% Font awesome icon list
\def\faglobe{\selectfont \fasolid \char"F0AC}
\def\faenvelope{\selectfont \fasolid \char"F0E0}
\def\famapmarker{\selectfont \fasolid \char"F3C5}
\def\fabluesky{\selectfont \fabrands \char"E671}
\def\faphone{\selectfont \fasolid \char"F095}
\def\fagithub{\selectfont \fabrands \char"F09B}

%----------------------------------------------------------------------------------------
%	GRAPHICS DEFINITIONS
%----------------------------------------------------------------------------------------

\usepackage{tikz} % Required for creating the plots
\usetikzlibrary{shapes, backgrounds}
\tikzset{x=1cm, y=1cm} % Default tikz units

% Command to vertically centre adjacent content
\newcommand{\vcenteredhbox}[1]{% The only parameter is for the content to centre
	\begingroup%
		\setbox0=\hbox{#1}\parbox{\wd0}{\box0}%
	\endgroup%
}

%----------------------------------------------------------------------------------------
%	CUSTOM SECTIONS
%----------------------------------------------------------------------------------------
\def\Vhrulefill{\leavevmode\leaders\hrule height 0.7ex depth \dimexpr0.4pt-0.7ex\hfill\kern0pt}

\usepackage[toc]{multitoc}
\renewcommand*{\multicolumntoc}{2}
% \setlength{\columnseprule}{0.5pt}
\setcounter{secnumdepth}{0}
\def\contentsname{\textcolor{black}{\normalsize \MakeUppercase{\textbf{Contents}}} \hspace{4pt} \Vhrulefill\vspace{0.5em}}

% Command to output section title headings
\newcommand{\cvsect}[1]{% The only parameter is the section text
	\vspace{\baselineskip} % Whitespace before the section title
	{\section[#1]{}}
	\vspace{-3em}
	\textcolor{black}{ \MakeUppercase{\textbf{#1}}} \hspace{4pt} \Vhrulefill \vspace{2em}% Section title
}

%----------------------------------------------------------------------------------------
%	ENTRY LIST
%----------------------------------------------------------------------------------------

\usepackage{longtable} % Required for tables that span multiple pages
\setlength{\LTpre}{0pt} % Remove default whitespace before longtable
\setlength{\LTpost}{0pt} % Remove default whitespace after longtable

\setlength{\tabcolsep}{0pt} % No spacing between table columns

% Environment to hold a new list of entries
\newenvironment{entrylist}{
	\begin{longtable}[H]{l l}
}{
	\end{longtable}
}

\newcommand{\entry}[4]{% First argument for the leftmost date(s) text, second is for the bold entry heading, third is for the bold right-aligned entry qualifier and the fourth is for the entry description
	\parbox[t]{0.15\textwidth}{% 17.5% of the text width of the page
	   \small #1 % Leftmost entry date(s) text
	}%
	&\parbox[t]{0.65\textwidth}{% 82.5% of the text width of the page
		\textbf{#2}% Entry heading text
		\hfill\\% Horizontal whitespace
		#4 % Entry description text
	}%
	\parbox[t]{0.2\textwidth}{%
	\hfill% Horizontal whitespace
	{\footnotesize \textbf{\textcolor{black}{#3}}}\\% Right-aligned entry qualifier text
	}\\\\}

% Command to output a separator slash between lists, e.g. '  /  '
\newcommand{\slashsep}{\hspace{3mm}/\hspace{3mm}}
