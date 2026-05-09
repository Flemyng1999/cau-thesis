%%
%% caumthesis.cls — 中国农业大学硕士学位论文（兼容入口）
%% 推荐新文档直接使用 caugradthesis.cls，并设置 \thesisdegree{硕士}。
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{caumthesis}[2026/05/09 CAU Master Thesis compatibility wrapper]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{caugradthesis}}
\ProcessOptions\relax
\LoadClass{caugradthesis}
\thesisdegree{硕士}
\degreecategory{农学硕士}

\endinput
