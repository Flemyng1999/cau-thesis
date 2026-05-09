# cau-thesis

中国农业大学论文 LaTeX 模板（非官方），覆盖本科、硕士、博士三类。版式按 [2025 年研究生院《学位论文格式及书写规范》](docs/specs/论文要求（研究生）.pdf)（研生〔2025〕1 号）和 [2020 年本科生院《毕业论文（设计）撰写基本规范》](docs/specs/毕业论文（设计）规范（本科生）.pdf)（本生〔2020〕02 号）。学校官方 Word 模板放在 [`docs/word-templates/`](docs/word-templates) 供对照。

## 用法

```bash
cp -r examples/graduate ~/papers/my-thesis    # 本科：改成 examples/bachelor
cd ~/papers/my-thesis
latexmk -xelatex main.tex
```

写论文一般只碰三个地方：

- `info.tex` — 题目、姓名、学号、日期等所有个人信息，外加正文里反复出现的占位串（研究对象、数据集、方法名…）。改这里一处，封面、致谢、正文同步。
- `sections/*.tex` — 正文。
- `refs/refs.bib` — 参考文献。

`main.tex` 是骨架，结构基本不动。

正文里复用 `info.tex` 注册的内容用两个命令：

```latex
\thethesisauthor          % 取作者姓名
\thethesisdate            % 取日期
\thevar{研究对象}          % 取你在 info.tex 里 \thesisvar{研究对象}{...} 注册的串
```

## 依赖

- TeX Live 2024+ full scheme（或 MacTeX / MiKTeX 等价），编译走 xelatex + bibtex
- 中文字体：Fandol 自带就够了。封面"中国农业大学"四字楷书优先用 [LXGW ZhenKai GB](https://github.com/lxgw/LxgwZhenKai)，缺失会自动回退到 FandolKai

Linux 上 TeX Live 字体可能没注册到 fontconfig：

```bash
sudo cp /usr/local/texlive/2026/texmf-var/fonts/conf/texlive-fontconfig.conf /etc/fonts/conf.d/09-texlive-fonts.conf
sudo fc-cache -fs
```

## 本科 vs 研究生

| | 研究生（`caugradthesis`） | 本科（`cauugthesis`） |
|---|---|---|
| 封面副标题 | 硕士/博士学位论文 | 本科生毕业论文（设计） |
| 封面顶部 | 分类号 / 单位代码 / 密级 / 学号 | 无 |
| 声明页 | 独创性声明 + 学位论文使用授权 | 原创性声明 |
| 主要符号表标题 | 主要符号表 | 主要符号和术语表 |
| 参考文献 | GB/T 7714 著者-出版年制 | GB/T 7714 顺序编码制（上标 [1]） |

两者共用 `cauthesis-base.sty`，只在 cls 里写差异（cls 通过 `\cauthesis@type` 告诉 base.sty 自己是哪一类）。

## 一些约定

- 一级中文章号用 zhnum（"第一章"），图、表、公式按章编号（图 1-1, 表 2-2, 公式 3-10）
- 三线表走 booktabs：顶 / 底线 1.5 pt，栏目线 0.75 pt
- 中文 .bib 条目加 `language={chinese}`，让它排进中文区（在 A–Z 之前）
- `longtable` 表头需要手动加 `\xiaowu\songti`，hook 只把整张表设为五号宋体，不覆盖第一行

完整版式（边距、字号、行距、页眉文武线 etc.）在 `cauthesis-base.sty` 里有注释，对照规范文件看即可。

## 在 examples 目录之外编译

需要让 TeX 找到 cls / sty / logo：

```bash
TEXINPUTS=/path/to/cau-thesis::/path/to/cau-thesis/logo:: latexmk -xelatex main.tex
```

或者把 `*.cls`、`cauthesis-base.sty`、`logo/` 拷到工作目录旁边。

## 还没做的

- 封面颜色（学硕浅草绿 / 学博生命绿 / 专硕浅黄 / 专博厚土金）—— 这个理论上靠打印用纸而不是 PDF 底纹
- 专业学位 vs 学术学位的信息项差异，目前需要手动改 cls 里的标签
- 书脊页

## 鸣谢

- 共享配置思路参考了 [whu-thesis](https://github.com/whutug/whu-thesis)
- 中文字体走 [Fandol Fonts](https://ctan.org/pkg/fandol)（开源，TeX Live 自带）

## License

[LPPL-1.3c](LICENSE)。允许使用和修改；分发修改版必须改名，例如 `myorg-thesis.cls`。
