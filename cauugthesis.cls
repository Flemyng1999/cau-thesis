%%
%% cauugthesis.cls — 中国农业大学本科生毕业论文（设计）
%%
%% Copyright (c) 2026 Yangming Feng (Flemyng1999)
%% License: LPPL 1.3c — see LICENSE
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cauugthesis}[2026/05/09 CAU Undergraduate Thesis v1.0]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax
\LoadClass[a4paper,12pt]{article}
\makeatletter

% 差异化设置（在加载 base 之前 def）
\def\cauthesis@type{undergraduate}
\def\cauthesis@headertext{中国农业大学本科生毕业论文（设计）}

\RequirePackage{cauthesis-base}

% ============================================================
% 封面变量（本科 5 字段）
% ============================================================
\newcommand{\thesistitle}[1]{\def\@thesistitle{#1}}
\newcommand{\thesistitleen}[1]{\def\@thesistitleen{#1}}
\newcommand{\thesisauthor}[1]{\def\@thesisauthor{#1}}
\newcommand{\advisor}[1]{\def\@advisor{#1}}
\newcommand{\coadvisor}[1]{\def\@coadvisor{#1}}
\newcommand{\major}[1]{\def\@major{#1}}
\newcommand{\college}[1]{\def\@college{#1}}
\newcommand{\thesisdate}[1]{\def\@thesisdate{#1}}

\def\@thesistitle{论文题目}
\def\@thesistitleen{Thesis Title}
\def\@thesisauthor{姓名}
\def\@advisor{导师姓名}
\def\@coadvisor{}
\def\@major{专业名称}
\def\@college{学院名称}
\def\@thesisdate{XXXX 年 XX 月}

% ============================================================
% 封面（本科：校名图 + 副标题 + 中英文题目 + 信息表 + 日期）
% 与研究生封面共用 minipage[t][\textheight][s] 框架以保证元素对齐：
%   研究生顶部有"分类号 / 单位代码 / 密级 / 学号"两行；
%   本科没有这些字段，用相同高度的占位空白替代。
% ============================================================
\newcommand{\makecover}{%
  \thispagestyle{empty}%
  \noindent\begin{minipage}[t][\dimexpr\textheight-12pt\relax][s]{\textwidth}%
    \noindent\strut\par% baseline 锚点（minipage[t] 需要先有 horizontal mode 内容）
    % graduate 顶部 2 行 \xiaosi 字段共占 ~14mm（2 × 20pt baseline）+ 6pt 内
    % 部 vspace + \vspace*{12mm} = ~28mm。bachelor 用 strut（占 1 行 = ~7mm）
    % 替代 graduate 的 2 行文字，差 ~7mm；vspace 取 20mm 抵消差额，让 logo
    % 与 graduate 同一垂直位置（实测两边 logo top y 差 < 1px）。
    \vspace*{20mm}%
    \begin{center}
      \includegraphics[width=10cm]{cau-title.pdf}\\[4mm]
      {\heiti\fontsize{18pt}{22pt}\selectfont\textbf{本科生毕业论文（设计）}}
    \end{center}
    \vspace{18mm}
    \begin{center}
      {\heiti\erhao\textbf{\@thesistitle}}\\[5mm]
      {\fontsize{16pt}{20pt}\selectfont\textbf{\@thesistitleen}}
    \end{center}
    \vspace{18mm}
    \begin{center}
      \begin{tabular}{@{}rl@{}}
        {\sihao\songti\makebox[9em][s]{学生姓名}：} & \coverlineuline{\@thesisauthor}\\[6pt]
        {\sihao\songti\makebox[9em][s]{指导教师}：} & \coverlineuline{\@advisor}\\[6pt]
        \ifx\@coadvisor\@empty\else
        {\sihao\songti\makebox[9em][s]{合作指导教师}：} & \coverlineuline{\@coadvisor}\\[6pt]
        \fi
        {\sihao\songti\makebox[9em][s]{专业名称}：} & \coverlineuline{\@major}\\[6pt]
        {\sihao\songti\makebox[9em][s]{所在学院}：} & \coverlineuline{\@college}\\[6pt]
      \end{tabular}
    \end{center}
    \vfill
    \begin{center}{\sihao\songti\@thesisdate}\end{center}
  \end{minipage}%
  \clearpage
}

% ============================================================
% 原创性声明（本科版 — 含生成式人工智能声明）
% ============================================================
\newcommand{\makedeclaration}{%
  \thispagestyle{empty}%
  \centerheading{原创性声明}%
  \begingroup
    \xiaosi\songti
    \setlength{\parindent}{2em}%
    \par
    \indent 本人郑重声明：所呈交的毕业论文（设计），是本人在导师的指导下，独立进行研究工作所取得的成果。尽我所知，除文中已经注明引用的内容外，本论文（设计）不含任何其他个人或集体已经发表或撰写过的作品成果，不包含使用生成式人工智能直接生成的内容，也不包含本人为获得中国农业大学或其他教育机构的学位或证书而使用过的材料。对本文的研究做出重要贡献的个人和集体，均已在文中作了明确说明。\par
    \vspace{5em}%
    \noindent 本人签名：\underline{\hspace{8em}}\hfill 年\hspace{2em}月\hspace{2em}日\hspace{1em}\par
  \endgroup
  \clearpage
}

% ============================================================
% 作者简介（本科版：基本介绍/教育经历/在校期间发表/在校期间项目/奖励/其他）
% ============================================================
\newenvironment{authorinfo}{%
  \clearpage
  \phantomsection\addcontentsline{toc}{section}{作者简介}%
  \markright{作者简介}%
  \vspace*{8pt}% 与 \section 一致：标题距页眉文武线下方 ~10mm 可见间距（topskip 24pt 已贡献部分）
  \centerheading{作者简介}%
  \xiaosi\songti
  \setlength{\parindent}{0pt}%
  \par
}{\clearpage}

\makeatother
\endinput
