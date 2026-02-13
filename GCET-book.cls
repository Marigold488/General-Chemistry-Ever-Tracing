\ProvidesClass{GCET-book} % 类名为GCET-book
\LoadClass{ctexbook} % 调用ctexbook类，满足书籍需求

\RequirePackage{amsmath,amssymb} % 数学
\RequirePackage[version=4]{mhchem} % 化学
\RequirePackage{graphicx, xcolor, tikz,extarrows} % 图形工具箱：插入图片、使用颜色、画矢量图、更多的箭头
\RequirePackage{booktabs} % 表格神器：为了画专业的“三线表”
\RequirePackage{listings, cncolours} % 代码高亮相关
\RequirePackage{subcaption} % 插入并排的图片
\RequirePackage{tasks} % 插入选项
\RequirePackage{geometry, titlesec, fancyhdr} % 引入geometry(页边距)、titlesec(标题格式)、fancyhdr(页眉页脚)
\RequirePackage{indentfirst, enumitem, zhnumber} % 引入indentfirst(首行缩进)、enumitem(调整列表间距)、zhnumber(数字转中文"一、二")
\RequirePackage{fontspec, stackengine, unicode-math} % 引入fontspec(设字体)、stackengine(做下划线用)、unicode-math(数学公式字体)
\RequirePackage[many,breakable]{tcolorbox} % 颜色盒
\RequirePackage{extarrows,blkarray,cases} % 更多箭头、矩阵排版、分段函数/条件排版
\RequirePackage{diagbox,caption,pgfplots} % 对角线单元格、自定义图表标题样式、绘图
\RequirePackage{esvect} % 向量

% 页面设置（from LALUbook.cls）
\geometry{
    paperheight = 260mm,
    paperwidth = 185mm,
    top = 23mm,
    bottom = 23mm,
    left = 20mm,
    right = 20mm,
    headheight = 5ex,
    headsep = 5ex,
    textwidth = 132mm,
    textheight = 198mm,
    twoside,
    asymmetric, % 单双数页不分
    % bindingoffset = 18pt,
}

% 段落样式
\linespread{1.3} % 行间距：设为 1.3 倍行距
\setlength{\parindent}{2em} % 首行缩进2字符
\setlength{\parskip}{0.5em} % 段落间距0.5字符

% 字体样式
\setmathrm{Times New Roman}

% 常用数学符号
\newcommand{\diff}{\mathrm{d}}

% 解答环境
\newcommand{\ans}[1]{
    \par
    \textcolor{red}{\textbf{解答：}#1}
}

% 标题样式
\ctexset{
    chapter={format={\centering\LARGE\bfseries},name={第,章},number=\arabic{chapter}},
}

\titleformat{\chapter}[display]
    {\Huge\bfseries} 
    {
        \colorbox{gray!20}{
        \parbox[t][3em][c]{\textwidth-1em}{
            \raisebox{3.5em}{\textcolor{purple!80}{\scalebox{3}{$\sigma$\thechapter}}} \hfill
        }
        }
    }
    {-2em} 
    {
        \hfill \kaishu
    }

\titlespacing{\chapter}{0pt}{-3em}{2.5em}

% 列表样式：设置二级和三级自动列表分别是 (1) 和 i.
\setlist[enumerate,2]{label=(\arabic*)}
\setlist[enumerate,3]{label=\roman*.}
\setlist[enumerate]{
    itemsep=0pt,    % 列表项间距
    parsep=0pt,
    topsep=0pt,
    partopsep=0pt
}

% 新建环境
\newtcolorbox{basebox}[2][white]{
    before skip=1em,
    colback=white,          % 背景色
    colframe=#1!70!black, % 边框颜色
    leftrule=0.8pt,
    rightrule=0.8pt,
    toprule=1pt,
    titlerule=1pt,
    bottomrule=1pt,
    arc=0pt,                % 直角边框
    title={\bfseries #2},  % 标题文字（加粗）
    coltitle=black,         % 标题文字颜色
    colbacktitle=#1!5!white, % 标题栏背景色
    fonttitle=\bfseries,    % 标题字体加粗
    % title style={boxrule=0.8pt, colframe=#1!70!black}, % 标题栏边框
    sharp corners,          % 直角
    boxsep=5pt,             % 内边距
    after={},
    breakable,
    toprule at break=0pt,
    bottomrule at break=0pt,
    overlay first={
        \draw[thick,#1!70!black,dashed]
        (frame.south west) -- (frame.south east);
    },
    overlay middle={
        \draw[thick,#1!70!black,dashed]
        (frame.north west) -- (frame.north east)
        (frame.south west) -- (frame.south east);
    },
    overlay last={
        \draw[thick,#1!70!black,dashed]
        (frame.north west) -- (frame.north east);
    },
}

\newcounter{definition}[chapter]
\renewcommand{\thedefinition}{\thechapter.\arabic{definition}}
\newenvironment{definition}{
    \begin{basebox}[blue]{定义\refstepcounter{definition}\label{definition\thedefinition}\thedefinition}}{\end{basebox}
}

\newcounter{formula}[chapter]
\renewcommand{\theformula}{\thechapter.\arabic{formula}}
\newenvironment{formula}{
    \begin{basebox}[purple]{公式\refstepcounter{formula}\label{formula\theformula}\theformula}}{\end{basebox}
}

\newcounter{reaction}[chapter]
\renewcommand{\thereaction}{\thechapter.\arabic{reaction}}
\newenvironment{reaction}{
    \begin{basebox}[yellow]{反应方程式\refstepcounter{reaction}\label{reaction\thereaction}\thereaction}}{\end{basebox}
}

\newcounter{exercise}[chapter]
\renewcommand{\theexercise}{\thechapter.\arabic{exercise}}
\newenvironment{exercise}{
    \begin{basebox}[red]{例题\refstepcounter{exercise}\label{exercise\theexercise}\theexercise}}{\end{basebox}
}

\newcounter{application}[chapter]
\renewcommand{\theapplication}{\thechapter.\arabic{application}}
\newenvironment{application}{
    \begin{basebox}[orange]{应用\refstepcounter{application}\label{application\theapplication}\theapplication}}{\end{basebox}
}

\newenvironment{forexample}{
    \begin{basebox}[cyan]{例}}{\end{basebox}
}

\newenvironment{derivation}{
    \begin{basebox}[green]{推导}}{\end{basebox}
}

\newenvironment{answer}{
    \begin{basebox}[green]{解答}}{\end{basebox}
}

\RequirePackage{hyperref} % 引用
% \RequirePackage{cleveref} % 聪明的引用（但是歧视ctex呜呜呜）

\hypersetup{
    colorlinks=true, % 链接文字上色（否则红边框）
    linkcolor=red,  % 内部引用链接颜色
    urlcolor=blue,    % 网址链接颜色
    citecolor=black  % 参考文献引用颜色
}

\def\chapterautorefname~#1\null{第#1章\null}
\def\sectionautorefname~#1\null{第#1节\null}
\def\subsectionautorefname~#1\null{第#1小节\null}
\def\subsubsectionautorefname~#1\null{第#1小小节\null}

\def\figureautorefname~#1\null{图#1\null}
\def\tableautorefname~#1\null{表#1\null}

\def\definitionautorefname~#1\null{定义#1\null}
\def\conceptautorefname~#1\null{概念#1\null}
\def\formulaautorefname~#1\null{公式#1\null}
\def\reactionautorefname~#1\null{反应方程式#1\null}
\def\exerciseautorefname~#1\null{例题#1\null}