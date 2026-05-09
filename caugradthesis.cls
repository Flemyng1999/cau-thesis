%%
%% caugradthesis.cls — 中国农业大学研究生学位论文
%%
%% Copyright (c) 2026 Yangming Feng (Flemyng1999)
%% License: LPPL 1.3c — see LICENSE
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{caugradthesis}[2026/05/09 CAU Graduate Thesis v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}
\makeatletter

% 差异化设置
\def\cauthesis@type{graduate}
\def\cauthesis@headertext{中国农业大学研究生学位论文}

\RequirePackage{cauthesis-base}

% ============================================================
% 封面变量（研究生：密级/学号/申请学位门类级别/专业或领域/研究方向）
% ============================================================
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\newcommand{\thesistitleen}[1]{\def\@thesistitleen{#1}}
\newcommand{\thesisauthor}[1]{\def\@thesisauthor{#1}}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\coadvisor}[1]{\def\@coadvisor{#1}}
\newcommand{\classify}[1]{\def\@classify{#1}}      % 分类号
\newcommand{\unitcode}[1]{\def\@unitcode{#1}}      % 单位代码
\newcommand{\studentid}[1]{\def\@studentid{#1}}    % 学号
\newcommand{\confidlevel}[1]{\def\@confidlevel{#1}}% 密级
\newcommand{\degreelevel}[1]{\def\@degreelevel{#1}\def\@thesisdegree{#1}\def\cauthesis@headertext{中国农业大学#1学位论文}}% 学位级别（硕士/博士）
\newcommand{\thesisdegree}[1]{\degreelevel{#1}}    % 封面副标题与页眉中的学位级别
\newcommand{\degreecategory}[1]{\def\@degreecategory{#1}}% 申请学位门类级别（农学硕士/农业硕士等）
\newcommand{\major}[1]{\def\@major{#1}}            % 专业名称
\newcommand{\fieldname}[1]{\def\@fieldname{#1}}    % 专业领域名称（专业学位）
\newcommand{\researchfield}[1]{\def\@researchfield{#1}}% 研究方向
\newcommand{\college}[1]{\def\@college{#1}}
\newcommand{\thesisdate}[1]{\def\@thesisdate{#1}}

\def\@thesistitle{论文题目}
\def\@thesistitleen{Thesis Title in English}
\def\@thesisauthor{研究生姓名}
\def\@advisor{导师姓名\quad 职称}
\def\@coadvisor{}
\def\@classify{}
\def\@unitcode{10019}
\def\@studentid{}
\def\@confidlevel{}
\def\@degreelevel{硕士/博士}
\def\@thesisdegree{硕士/博士}
\def\@degreecategory{}
\def\@major{专业名称}
\def\@fieldname{}
\def\@researchfield{研究方向}
\def\@college{学院名称}
\def\@thesisdate{XXXX 年 XX 月}

% ============================================================
% 封面（研究生标准布局；按 2025 冬 Word 模板）
% ============================================================
\newcommand{\makecover}{%
  \thispagestyle{empty}%
  \ifx\@fieldname\empty
    \edef\@fieldname{\@major}%
  \fi
  \noindent\begin{minipage}[t][\textheight][s]{\textwidth}%
    {\xiaosi\songti
      \noindent
      \makebox[5.5em][s]{分类号}：\coverdotuline{10em}{\@classify}\hfill
      \makebox[5.5em][s]{单位代码}：\coverdotuline{9em}{\@unitcode}\par
      \vspace{6pt}
      \noindent
      \makebox[5.5em][s]{密级}：\coverdotuline{10em}{\@confidlevel}\hfill
      \makebox[5.5em][s]{学号}：\coverdotuline{9em}{\@studentid}\par}%
    \vspace*{12mm}
    \begin{center}
      \includegraphics[width=10cm]{cau-title.pdf}\\[4mm]
      {\heiti\fontsize{18pt}{22pt}\selectfont\textbf{\@thesisdegree 学位论文}}
    \end{center}
    \vspace{18mm}
    \begin{center}
      {\heiti\erhao\textbf{\@thesistitle}}\\[5mm]
      {\fontsize{16pt}{20pt}\selectfont\textbf{\@thesistitleen}}
    \end{center}
    \vspace{18mm}
    \begin{center}
      \begin{tabular}{@{}rl@{}}
        {\sihao\songti\makebox[9em][s]{研究生}：} & \coverlineuline{\@thesisauthor}\\[6pt]
        {\sihao\songti\makebox[9em][s]{指导教师}：} & \coverlineuline{\@advisor}\\[6pt]
        \ifx\@coadvisor\@empty\else
        {\sihao\songti\makebox[9em][s]{合作指导教师}：} & \coverlineuline{\@coadvisor}\\[6pt]
        \fi
        {\sihao\songti\makebox[9em][s]{申请学位门类级别}：} & \coverlineuline{\@degreecategory}\\[6pt]
        {\sihao\songti\makebox[9em][s]{专业名称}：} & \coverlineuline{\@fieldname}\\[6pt]
        {\sihao\songti\makebox[9em][s]{研究方向}：} & \coverlineuline{\@researchfield}\\[6pt]
        {\sihao\songti\makebox[9em][s]{所在学院}：} & \coverlineuline{\@college}\\[6pt]
      \end{tabular}
    \end{center}
    \vfill
    \begin{center}{\sihao\songti\@thesisdate}\end{center}
  \end{minipage}%
  \clearpage
}

% ============================================================
% 独创性声明（与“关于学位论文使用授权的说明”同页）
% ============================================================
\newcommand{\makedeclaration}{%
  \thispagestyle{empty}%
  \centerheading{独创性声明}%
  \begingroup
    \xiaosi\songti
    \setlength{\parindent}{2em}%
    \par
    \indent 本人声明所呈交的学位论文是我个人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中已经注明引用、已经声明生成式人工智能使用情况和致谢的内容外，论文中不包含其他人已经发表或撰写过的研究成果，不包含使用生成式人工智能直接生成的内容，也不包含本人为获得中国农业大学或其他教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表达了谢意。\par
    \vspace{4em}%
    \noindent 学位论文作者签名：\underline{\hspace{8em}}\hfill 时间：\hspace{3em}年\hspace{2em}月\hspace{2em}日\par
  \endgroup
}

% ============================================================
% 关于学位论文使用授权的说明（与“独创性声明”同页）
% ============================================================
\newcommand{\makeauthorization}{%
  \centerheading{关于学位论文使用授权的说明}%
  \begingroup
    \xiaosi\songti
    \setlength{\parindent}{2em}%
    \par
    \indent 本人完全了解中国农业大学有关保留、使用学位论文的规定。本人同意中国农业大学有权保存及向国家有关部门和机构送交论文的纸质版和电子版，允许论文被查阅和借阅。\par
    \indent \textbf{（保密的学位论文在解密后应遵守此协议）}\par
    \vspace{3em}%
    \noindent 学位论文作者签名：\underline{\hspace{8em}}\hfill 时间：\hspace{3em}年\hspace{2em}月\hspace{2em}日\par\vspace{1.5em}
    \noindent 导师签名：\underline{\hspace{10em}}\hfill 时间：\hspace{3em}年\hspace{2em}月\hspace{2em}日\par
  \endgroup
  \clearpage
}

% ============================================================
% 论文创新点（独立章节，前置部分）
% ============================================================
\newenvironment{innovation}{%
  \clearpage
  \phantomsection\addcontentsline{toc}{section}{论文创新点}%
  \markright{论文创新点}%
  \centerheading{论文创新点}%
  \xiaosi\songti
  \setlength{\parindent}{2em}%
  \par
}{\clearpage}

% ============================================================
% 作者简介（研究生版：在学期间发表论文 必填）
% ============================================================
\newenvironment{authorinfo}{%
  \clearpage
  \phantomsection\addcontentsline{toc}{section}{作者简介}%
  \markright{作者简介}%
  \centerheading{作者简介}%
  \xiaosi\songti
  \setlength{\parindent}{0pt}%
  \par
}{\clearpage}

\makeatother
\endinput
