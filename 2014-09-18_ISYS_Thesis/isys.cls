\ProvidesClass{isys}[2013/12/09 v0.104 LaTeX document class for ISYS thesis]

\typeout{}
\typeout{}
\typeout{  ISYS - Institute for System Dynamics, University Stuttgart}
\typeout{  Thesis Style 2013, Version 0.104 }
\typeout{}

% isys.cls is currently maintained by 
%  Alexander Pertsch (alexander.pertsch@isys.uni-stuttgart.de)
%
% Class file based on earlier isys.cls by Karl Lukas Knierim and Ulf Schaper 
%
% Changes:
% 2010-09-07, AP: (english) if more than one supervisor is given, "supervisors" is printed instead of "supervisor", 
%  v0.9                      babel package is loaded with option english
%                 (all)     added default values for subtitle and date
%                 (all)     use full Universitaet Stuttgart logo, international version for langugage=english
%                 (thesis)  introduced new options "bachelor" and "master"
%                 (all)     made packages ifthen and chngpage obsolete
%	                (all)     cleanup of unused options and code
%                 (all)     make class compatible to latex -> dvi -> ps -> pdf document generation
%                 (oneside) introduced new option to avoid empty pages in output, usefull for draft documents
%                 (german)  add declaration of authorship as required for bachelor/master thesis at 
%                             University of Stuttgart. Official english translation is missing!

% 2011-07-15, AP: (all)     added captions=nooneline to treat single-line captions and multi-line captions equally
%  v0.91
%                 (all)     changed all koma-options to adhere to name=value format
%                 (all)     changed logo to contain institute name

% 2011-07-27, AP: (english) bugfix: string "Supervisors" is now correctly printed when muline supervisors are given
%  v0.92

% 2011-08-05, AP: (all)     changed logos
%  v0.93										new package: lmodern - to enable copying umlauts etc. from pdf

% 2011-08-31, AP: (all)     changed logo sizes
%  v0.94										added new option Studiengang

% 2012-02-01, AP: (all)     wording ``Institute for System Dynamics'' instead of ``... of ...''
%  v0.94										

% 2012-02-17, AP: (all)     title page flush left, new layout, appendix numbering not roman
%  v0.95										

% 2012-05-14, AP: (all)     fix empty listoffigures/listoftables at end of document if 
%	 v0.96			               \appendix is used
%  										      fix unnecessary lines around partner logo

% 2012-10-04, AP: (all)     fix: \@date instead of \@datestring in \DeclarationOfAuthorship
%	 v0.96			               size of ISYS logo reduced

% 2012-10-17, AP: (all)     size of ISYS logo changed
%	 v0.99

% 2012-12-01, AP, PT: (german)  fix: change latin1 characters in German version of \DeclarationOfAuthorship to 
%	 v0.100			              their generic latex encoding (thanks to P. Tempel for contributing this bugfix)
%								fix: insert paragraph between date and authorname in \DeclarationOfAuthorship

% 2013-03-25, AP, PT: (german)  fix: custom data via \date{} command now works
%	 v0.101			  (all)     add: date format depending on language using isodate package (credits to P. Tempel)           
% 								add: titlepage: Datum des Vortrags / Date of the defence

% 2013-06-28, AP: (all)         add \foreigntitle and \foreignsubtitle to print title in foreign language
%	 v0.102			 

% 2013-12-09 AP: (all)          fix error message for empty foreigntitle, add some \struts to keep layout consistent
%	 v0.103			 

% 2013-12-09 AP: (all)          change text for date to "Examination Date" (Prüfungsdatum)
%	 v0.104			            change font size to 11pt

% 2013-12-11 AP: (all)          change font size for captions to \small
%	 v0.105			            

\newif\if@english 
\newif\if@german  
\newif\if@thesisdraft  
\newif\if@partner
\newif\if@partnerlogo
\newif\if@dategiven
\newif\if@subtitle
\newif\if@oneside
\newif\if@printedAbstract
\@printedAbstractfalse

\def\@thesistype{}

% Thesis type
\DeclareOption{da}{\@isdatrue}
\DeclareOption{sa}{\@issatrue}
\DeclareOption{thesis=da}{\def\@thesistype{da}}
\DeclareOption{thesis=sa}{\def\@thesistype{sa}}
\DeclareOption{thesis=bachelor}{\def\@thesistype{ba}}
\DeclareOption{thesis=master}{\def\@thesistype{ma}}
\DeclareOption{thesis=semester}{\def\@thesistype{se}}

% Language
\DeclareOption{english}{\@englishtrue\@germanfalse}
\DeclareOption{german}{\@germantrue\@englishfalse}
\DeclareOption{ngerman}{\@germantrue\@englishfalse}
\DeclareOption{language=english}{\@englishtrue\@germanfalse}
\DeclareOption{language=german}{\@germantrue\@englishfalse}

% Draft
\DeclareOption{draft}{\@thesisdrafttrue}
\DeclareOption{thesisdraft}{\@thesisdrafttrue}

% Oneside or twoside printing
\DeclareOption{oneside}{\PassOptionsToClass{open=any}{scrreprt}\@onesidetrue}
\DeclareOption{twoside}{\PassOptionsToClass{open=right}{scrreprt}\@onesidefalse}


% set paper format
\DeclareOption{a4}{\PassOptionsToPackage{paper=a4}{typearea}}
\DeclareOption{letter}{\PassOptionsToPackage{paper=letter}{typearea}}

\ExecuteOptions{thesis=sa, language=english, paper=a4, twoside}
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Required Style Files
\RequirePackage{graphicx}
\RequirePackage[english,ngerman]{babel}
\RequirePackage{lmodern}
\RequirePackage[english,ngerman,num]{isodate} % support for internationalization of date
\daymonthsepgerman{}%
\monthyearsepgerman{}{}%



% Set pagesize for PDF or DVI correctly
\PassOptionsToPackage{pagesize=auto}{typearea}

\LoadClass[fontsize=11pt,DIV=13,BCOR=8mm,%     
				listof=totoc,%
				bibliography=totoc,%
				parskip=half,%
				chapterprefix,numbers=noenddot,%
				%open=right,% start new chapter on right sides only
				cleardoublepage=empty,% number empty pages 
				twoside=true,
				captions=tableheading,
				captions=nooneline
				]{scrbook}


% Classic serif fonts for headlines
\addtokomafont{sectioning}{\rmfamily}
\RequirePackage[automark]{scrpage2}

% Smaller caption font looks better
\addtokomafont{caption}{\small}


% Chapter have empty head
\renewcommand*{\chapterpagestyle}{plain}
% Default pagestyle for begin
\pagestyle{empty}

% Include only sections in table of contents
\setcounter{tocdepth}{1}

% start of main Body
\newcommand{\mainMatter}{
	%\mainmatter
}

% bugfix: \appendix sets tocdepth to 0, tables and figures are on 
% depth 1, so reset tocdepth if changed in toc
\newcounter{isys@savetocdepth}


\AtBeginDocument{
  \if@german
    \selectlanguage{ngerman}
  \else
    \selectlanguage{english}
  \fi
	%\cleardoubleemptypage
	%\setcounter{page}{1}
	%\pagenumbering{Roman}
	\pagenumbering{arabic}
	\pagestyle{scrheadings}
	\addtocontents{toc}{\protect\setcounter{isys@savetocdepth}{\protect\value{tocdepth}}} 
}

\AtEndDocument{
		\addtocontents{toc}{\protect\setcounter{tocdepth}{\protect\value{isys@savetocdepth}}} 
}


% start of appendix
\let\oldAppendix\appendix
\renewcommand{\appendix}{
	\oldAppendix
	% Include only chapters in table of contents
	\addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
}

% For compatibility reasons
\newcommand{\postMatter}{
	\appendix
}

%
% Print out thesis type
% make local
{
	\def\@tmp{sa} \ifx\@thesistype\@tmp \typeout{Thesis is Student Thesis} \fi
	\def\@tmp{da} \ifx\@thesistype\@tmp \typeout{Thesis is Diploma Thesis} \fi
	\def\@tmp{ba} \ifx\@thesistype\@tmp \typeout{Thesis is Bachelor Thesis} \fi
	\def\@tmp{ma} \ifx\@thesistype\@tmp \typeout{Thesis is Master Thesis} \fi
	\def\@tmp{se} \ifx\@thesistype\@tmp \typeout{Thesis is Semester Thesis} \fi
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% User commands to set title page information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\examiner#1{\def\@examinerName{#1}}
\def\author#1{\def\@authorstring{#1}}
\def\major#1{\def\@majorstring{#1}}
\def\date#1{\def\@date{{\iflanguage{english}{\isodate}{\numdate}\printdate{#1}}}\@dategiventrue}
\def\presentationdate#1{\def\@presentationdate{{\iflanguage{english}{\isodate}{\numdate}\printdate{#1}}}}
\def\submissiondate#1{\def\@submissiondate{{\iflanguage{english}{\isodate}{\numdate}\printdate{#1}}}}
\def\title#1{\def\@titlestring{#1}}
\def\subtitle#1{\def\@subtitlestring{#1}\@subtitletrue}
\def\foreigntitle#1{\def\@foreigntitlestring{#1}}
\def\foreignsubtitle#1{\def\@foreignsubtitlestring{#1}}
\def\partner#1{\def\@partnerstring{#1}\@partnertrue}
\def\partnerLogo#1{\def\@partnerLogostring{#1}\@partnerlogotrue}
\def\institutename#1{\def\@instituteNameString{#1}}
\def\righttoplogo#1{\def\@RightTopLogo{#1}}
\def\righttoplogoheight#1{\def\@RightTopLogoHeight{#1}}
\def\lefttoplogo#1{\def\@LeftTopLogo{#1}}
\def\lefttoplogoheight#1{\def\@LeftTopLogoHeight{#1}}


%
% MAKETITLE FOR ISYS SA/DA Thesis
%
\def\maketitle{
	\def\categoryfont{\sffamily\itshape\small}
	\thispagestyle{empty}	
	 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   \begin{titlepage}%
	 \raggedright
	 %
	 %
  % Grafiken am Kopf der Seite
	\vspace*{-1.8cm}
	  \begin{center}
	  	\hspace*{-0.6cm}
	  		\begin{minipage}{7.8cm}
	  		\begin{flushleft}
	  			\@LeftTopLogo
	  		\end{flushleft}
	  		\end{minipage}\hfill 
	  		\begin{minipage}{7.5cm}
	  		\begin{flushright}
	  			\@RightTopLogo
	  		\end{flushright}
	  		\end{minipage}  	
		\hspace*{-.8cm}
  \end{center}

% Art der Arbeit bzw. allg. Vorspann mit Abschluss in Englisch
  	\vspace{1.7cm}
  	\if@subtitle\else % Zusatz
  	\vspace{0.4cm}
  	\fi
  	{\categoryfont\Large\@thesistypestring\strut}\par
		\vspace{0.4cm}
  % Titel und Untertitel
  	%\vspace{0.8cm}
  	\begingroup
  		\LARGE\bfseries\@titlestring\strut\hfill\par
  	\endgroup
  	\if@subtitle
  		\vspace{0.1cm}
  		{\large\bfseries\@subtitlestring\strut}\par
  	\fi
  	\vspace{.3cm}
  	\begingroup
  		\raggedleft\normalsize\itshape\if@english\selectlanguage{ngerman}\else\selectlanguage{english}\fi\@foreigntitlestring\strut\\
  	\endgroup
  	\if@subtitle
  	\begingroup
		\raggedleft\small\itshape\if@english\selectlanguage{ngerman}\else\selectlanguage{english}\fi\@foreignsubtitlestring\strut\hfil\\
  	\endgroup
  	\else
		\vspace{.7cm}
  	\fi
	\vspace{1.0cm}
  	% Autor
		\begingroup
			\normalsize\categoryfont\@submittedByString\strut
			\endgroup\\
  	\normalsize\@authorstring\strut\mdseries\par\normalsize
  % Vorlaeufige Version / Draft
  	\vbox to 0pt{%
  	\if@thesisdraft
  		\begin{center}%
  			\categoryfont\Large%
  				\@preliminaryVersionString%
  				\end{center}
	\fi}

	\vfill
	
  % Partner
  \if@partner
  	\begingroup
  		\normalsize{\categoryfont\@cooperationString}\strut\\
	    \if@partnerlogo
	      \begin{tabular}[c]{@{}l}
	      	\@partnerLogostring
	  		\end{tabular}
	  	\fi
		   \begingroup
			     \normalsize
			      \begin{tabular}[c]{@{}l@{}}
			  		    \@partnerstring
			  		\end{tabular}\par
		 		\endgroup
	 		\endgroup
	  \fi
	\vfill

		% Studiengang
  	{\normalsize\categoryfont\@majorpretextString\strut}\\
  				{\@majorstring\strut}\par
  \vspace{0.3cm}
  % Supervisor Block	
    \begingroup
			% Examiner
			\normalsize{\categoryfont\@examinerString\strut}\\
			\@examinerName\strut \par
			\vspace{0.3cm}
  		% Supervisor
			\normalsize{\categoryfont\@supervisorstring\strut}\\
			\@supervisorstringA\@supervisorstringB\@supervisorstringC\@supervisorstringD\strut\par
		\endgroup
	
	
  % Datum
  \vspace{1.1cm}
   {\normalsize
	{\categoryfont\@dateString}\\
		\@date\strut}%
	\vspace{.7cm}
		% Institut
		 \begin{center}\small\@instituteNameString\end{center}
	\vspace*{-2.5cm}
  \end{titlepage}
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \if@oneside
    \clearpage
  \else
    \cleardoublepage
  \fi
}

% configure language dependent terms

% default values

\def\@titlestring{\@latex@warning@no@line{No \noexpand\title given}}
\def\@foreigntitlestring{\@latex@warning@no@line{No \noexpand\foreigntitle given}}
\def\@foreignsubtitlestring{\errmessage{No \noexpand\foreignsubtitle given - mandatory if \noexpand\subtitle is given}}
\def\@authorstring{\@latex@warning@no@line{No \noexpand\author given}}
\def\@majorstring{\@latex@warning@no@line{No \noexpand\major given}}
\def\@examinerName{\@latex@warning@no@line{No \noexpand\examiner given}}
\def\@dateString{}
\def\@presentationDateString{}
\def\@submissionDateString{}
\def\@subtitlestring{}
\def\@partnerstring{}
\def\@partnerLogostring{}
\def\@instituteNameString{}
\def\@RightTopLogo{\hfill}
\def\@LeftTopLogo{\hfill}
\def\@presentationdate{\@date}
\def\@submissiondate{\@date}


\addto\captionsngerman{  % no blank linkes allowed!
		  \def\@supervisorstring{Betreuer}
		  \def\@RightTopLogo{\includegraphics[height=1.1cm]{logos/logoUniversitaetStuttgart}}
		  \def\@LeftTopLogo{\includegraphics[height=1.1cm]{logos/logoISYS_deutsch}}
		  %\def\@majorpretextString{\vspace{2cm}im Studiengang}
		  \def\@majorpretextString{\vspace{.5cm}Studiengang}
		  \def\@submittedByString{vorgelegt von}
		  \def\@cooperationString{in Kooperation mit}
		  \def\@examinerString{Pr\"ufer}
		  \def\@instituteNameString{Institut f\"ur Systemdynamik, Universit\"at Stuttgart, 
		  		Waldburgstra{\ss}e 17/19, 70563 Stuttgart}
		  \def\@preliminaryVersionString{Vorl\"aufige Version}
		  \def\@thesistypestring{%
        	%\tmp is local
			\def\@tmp{sa}\ifx\@thesistype\@tmp Studienarbeit\fi%
			\def\@tmp{da}\ifx\@thesistype\@tmp Diplomarbeit\fi%
			\def\@tmp{ba}\ifx\@thesistype\@tmp Bachelorarbeit\fi%
			\def\@tmp{ma}\ifx\@thesistype\@tmp Masterarbeit \fi%
			\def\@tmp{se}\ifx\@thesistype\@tmp Semesterarbeit \fi%
			}
		\def\@dateString{Pr\"ufungsdatum}
		\if@dategiven\else
			\def\@date{{\iflanguage{english}{\isodate}{\numdate}\today}}
		\fi
		\renewcommand{\abstractname}{Kurzfassung}
}
	  
\addto\captionsenglish{ % no blank linkes allowed!
		  \def\@supervisorstring{Supervisor}
		  \def\@RightTopLogo{\includegraphics[height=1.1cm]{logos/logoUniversitaetStuttgart_international}}
		  \def\@LeftTopLogo{\includegraphics[height=1.1cm]{logos/logoISYS_english}}
		  \def\@submittedByString{by} 
		  \def\@cooperationString{in coorporation with}
		  \def\@examinerString{Examiner}
		  \def\@instituteNameString{Institute for System Dynamics, University of Stuttgart, Waldburgstr. 17/19, 70563 Stuttgart}
		  \def\@preliminaryVersionString{Draft}
		  \def\@thesistypestring{\def\@tmp{sa}\ifx\@thesistype\@tmp{}Student thesis\fi%
			\def\@tmp{da}\ifx\@thesistype\@tmp{}Diploma thesis\fi%
			\def\@tmp{ba}\ifx\@thesistype\@tmp{}Bachelor thesis\fi%
			\def\@tmp{ma}\ifx\@thesistype\@tmp{}Master thesis\fi%
			\def\@tmp{se}\ifx\@thesistype\@tmp{}Semester thesis\fi%
			\space}
		  \def\@majorpretextString{\normalsize A %
				% check if diploma, master or student thesis
		  	\def\@tmp{sa}\ifx\@thesistype\@tmp{}student \fi%
				\def\@tmp{da}\ifx\@thesistype\@tmp{}diploma \fi%
		  	thesis presented to the faculty in partial fulfillment of \\
		  	the requirements for the degree %
			%
        	%\tmp is local
		  \def\@tmp{sa}\ifx\@thesistype\@tmp{}Diplom-Ingenieur\fi%
			\def\@tmp{da}\ifx\@thesistype\@tmp{}Diplom-Ingenieur\fi%
			\def\@tmp{ba}\ifx\@thesistype\@tmp{}Bachelor of Science\fi%
			\def\@tmp{ma}\ifx\@thesistype\@tmp{}Master of Science\fi%
			\def\@tmp{se}\ifx\@thesistype\@tmp{}Bachelor of Science\fi%
			\space in}
		\def\@dateString{Examination Date}
		\if@dategiven\else
			\def\@date{{\iflanguage{english}{\isodate}{\numdate}\today}}
		\fi
}

% Supervisors
\def\@supervisorstringA{\@latex@warning@no@line{No \noexpand\supervisor given}}
\def\@supervisorstringB{}
\def\@supervisorstringC{}
\def\@supervisorstringD{}

\newcounter{@supervisors}
\setcounter{@supervisors}{0}
\def\supervisor#1{\stepcounter{@supervisors}%
  \ifnum\value{@supervisors}=1
	\def\@supervisorstringA{\mbox{#1}}
  \fi
  \ifnum\value{@supervisors}=2
	\def\@supervisorstringB{,\space\mbox{#1}}
	\addto\captionsenglish{ % no blank lines allowed!
		  \def\@supervisorstring{Supervisors}
		  }
	\fi
  \ifnum\value{@supervisors}=3
	\def\@supervisorstringC{,\space\mbox{#1}}
  \fi
  \ifnum\value{@supervisors}=4
	\def\@supervisorstringD{,\space\mbox{#1}}
  \fi
  \ifnum\value{@supervisors}=5
	\@latex@warning@no@line{Too many supervisors ...}
  \fi

}



\newenvironment{abstract}{%
		\if@printedAbstract
		  \vspace{1cm}
		\else
      \if@oneside
        \clearpage
      \else
        \cleardoublepage
      \fi
		\fi
		\vspace*{0.1cm}
		\begin{center}\large \textbf{\abstractname}\end{center}
		\begin{quote}
	}
	{
    \par\end{quote}
		\normalsize\rmfamily
		\global\@printedAbstracttrue
}



\newcommand{\DeclarationOfAuthorship}{
		\cleardoublepage
    %\markboth{Erkl\"arung des Autors}{Erkl\"arung des Autors}
    \thispagestyle{empty}
	\vspace*{0.5cm}
  \begin{otherlanguage}{ngerman}
	\begin{center}
		\large\textbf{Erkl\"arung des Autors}
   	\end{center}
   	\vspace*{0.5cm}
	der \@thesistypestring{} mit dem Titel
	\begin{center}
      \textbf{\@titlestring}
      \if@subtitle \\
        \@subtitlestring
      \else\fi
  \end{center}
	\vspace*{0.5cm}
		Hiermit versichere ich, 
		\begin{enumerate}
      \item dass ich meine Arbeit bzw. bei einer Gruppenarbeit den entsprechend 
gekennzeichneten Anteil der Arbeit selbst\"andig verfasst habe, 
      \item dass ich keine anderen als die angegebenen Quellen benutzt und alle w\"ortlich oder 
sinngem\"a\ss{} aus anderen Werken \"ubernommenen Aussagen als solche gekennzeichnet habe, 
      \item dass die eingereichte Arbeit weder vollst\"andig noch in wesentlichen Teilen Gegenstand eines anderen Pr\"ufungsverfahrens gewesen ist, 
      \item dass ich die Arbeit weder vollst\"andig noch in Teilen bereits ver\"offentlicht habe und 
      \item dass das elektronische Exemplar mit den anderen Exemplaren \"ubereinstimmt.  
	  \end{enumerate}
	\vspace{\baselineskip}
	Stuttgart, den \@date
  \end{otherlanguage}
  \par\vspace{2\baselineskip}
	\@authorstring
  %
  %
	\if@english
  \par\vspace*{\baselineskip}
  {\footnotesize
  \textit{Inofficial translation of the Declaration of Authorship (\glqq{}Erkl\"arung des Autors\grqq{}). Only the original German wording is legally recognized.}
	\par
  	I hereby certify 
		\begin{enumerate}
      \item that this thesis, resp. in a group project the appropriately labeled parts of this thesis, has/have been created by myself,
      \item that no other sources than those referenced have been used, and that all ideas adopted from other work, literally or paraphrased, are appropriately labeled as such,
      \item that this submitted thesis neither in full nor to a significant part has been part of any other examination process, 
      \item that I have neither published this thesis in full nor in parts, and
      \item that the electronic version is identical to the hardcopy.  
	  \end{enumerate}
	}
\fi
	
}

\endinput	
% end of class file isys.cls



