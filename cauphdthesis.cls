%%
%% cauphdthesis.cls — 中国农业大学博士学位论文（兼容入口）
%% 推荐新文档直接使用 caugradthesis.cls，并设置 \thesisdegree{博士}。
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cauphdthesis}[2026/05/09 CAU PhD Thesis compatibility wrapper]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{caugradthesis}}
\ProcessOptions\relax
\LoadClass{caugradthesis}
\thesisdegree{博士}
\degreecategory{农学博士}

\endinput
