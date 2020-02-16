- 常用网站：[wikibooks](https://en.wikibooks.org/wiki/LaTeX)，[overleaf](https://www.overleaf.com/learn/latex/)

- 设置A4纸，字体大小为12pt，report格式（分章节，换页留白）

  ```latex
  \documentclass[a4paper, 12pt]{report}
  ```

- 使用\DeclareMathOperator, \newtheorem, proof

  ```latex
  \usepackage{amsmath, amsthm}
  \newtheorem{theorem}{Theorem}[chapter]
  \newtheorem{corollary}{Corollary}[theorem]
  \newtheorem{lemma}[theorem]{Lemma}
  \newtheorem{definition}{Definition}[chapter]
  ```

- 使用花体\mathscr, 加粗字体\bm, 空心字体\mathbb, 半空心字体\mathbbm

  ```latex
  \usepackage{mathrsfs, bm, amsfonts, amssymb, bbm}
  ```

- 常用package

  ```latex
  \usepackage{color, xcolor} % 使用颜色
  \usepackage[utf8]{inputenc} % 使用utf8编码
  \usepackage{hyperref} % 使用\href, \url
  \usepackage{enumitem} % 使用\enumerate
  \usepackage{float} % 使用[H]标签，让图片和文字一起浮动
  ```

  

- 使用beamer

  ```latex
  \documentclass[10pt,aspectratio=43,mathserif]{beamer} 
  \usepackage{multimedia, animate} % beamer内置定理块
  \usetheme{Berlin} 
  \title{Title}
  \subtitle{\fontsize{9pt}{14pt}\textbf{subtitle}}
  \author{Shitong CHAI}
  \institute{ISIMA}
  \date{\today}
  
  \AtBeginSection[]
  {
  	\begin{frame}<beamer>
  	\frametitle{\textbf{table of contents}}
  	\tableofcontents[currentsection]
      \end{frame}
  }
  \beamerdefaultoverlayspecification{<+->}
  \begin{document}
  \frame{\titlepage}
  %\section{Table of contents}
  %\begin{frame}{table of contents}
  %\tableofcontents
  %\end{frame}
  \section{a section}
  \begin{frame}[fragile]{incGM+} % 如果有lstlisting则必须添加fragile
      \begin{lstlisting}[language=python, frame=single]
      \end{lstlisting}
  \end{frame}
  \bibliography{bibtex}{}
  \bibliographystyle{plain}
  \end{document}
  ```

- 使用tikz

  ```latex
  \usepackage{tikz}
  \begin{document}
  \begin{equation}
      \begin{tikzpicture}
          \node[shape=circle,draw=black] (A) at (0,0) {};
          \node[shape=circle,draw=black] (B) at (0,1) {};
          \node[shape=circle,draw=black] (C) at (1,0) {};
          \node[shape=circle,draw=black] (D) at (1,1) {};
          \path [-] (A) edge node {} (B);
          \path [-] (B) edge node {} (C);
          \path [-] (A) edge node {} (C);
          \path [-] (B) edge node {} (D); 
      \end{tikzpicture}
      \tag{$G$}
  \end{equation}
  \end{document}
  ```

- 使用\lstlisting, \lstset

  ```latex
  \usepackage{listings}
  \lstset{
    basicstyle=\ttfamily,
    columns=fullflexible,
    breaklines=true,
  }
  % SPARQL:
  % \lstset{language=SQL,morekeywords={PREFIX,java,rdf,rdfs,url}}
  \begin{docuement}
      \begin{lstlisting}[language=python, frame=single]
      \end{lstlisting}
  \end{document}
  ```

- 使用\newtcblisting

  ```latex
  \usepackage[most]{tcolorbox}
  \newtcblisting{commandshell}{colback=white,colupper=black,colframe=black!75!black,
  listing only,listing options={language=sh, breaklines=true,aboveskip=0pt, belowskip=0pt},
  every listing line={\small\ttfamily\bfseries{[root@shchai]\$} }}
  
  \newtcblisting{sqlshell}{colback=white,colupper=black,colframe=black!75!black,
  listing only,listing options={language=SQL, breaklines=true, aboveskip=0pt, belowskip=0pt},
  every listing line={\small\ttfamily\bfseries{SQL> }}}
  
  \newtcblisting{messageshell}{colback=white,colupper=black,colframe=black!75!black,
  listing only,listing options={language={}, basicstyle=\small\ttfamily, breaklines=true,aboveskip=0pt, belowskip=0pt},
  every listing line={}}
  \begin{docuement}
      \begin{commandshell}
      \end{commandshell}
  \end{document}
  ```

- 使用algorithm, algorithmic

  ```latex
  \usepackage[chapter]{algorithm}
  \renewcommand{\algorithmicrequire}{\textbf{Input:}}
  \renewcommand{\algorithmicensure}{\textbf{Output:}}
  \begin{document}
  \begin{algorithm}
      \caption{DBSCAN}\label{euclid}
      \begin{algorithmic}[1]
          \Require Given parameter $\varepsilon,\mathcal{M}$ and $N_\varepsilon(i),i=1,2,\cdots,N$.
          \Ensure $M=\{m_i\}_{i=1}^N$
          \State $k=1;m_i=0,i=1,2,\cdots,N;$
          \State $I=\{1,2,\cdots,N\}$;
          \While{$I\neq \emptyset$}
              \State Get an element $i$ from $I$, and let $I:=I\setminus\{i\}$;
              \If{$m_i=0$}\Comment{If point i has not been visited.}
                  \State Initialize $T:=N_\varepsilon(i)$;
                  \If{$|T|<\mathcal{M}$}
                      \State $m_i=-1$;\Comment{Label point i as noise point}
                  \Else\Comment{If point i is a core point}
  
                      \State $m_i=k$;\Comment{Indicate point i belonging to $C_k$}
                      \While{$T\neq \emptyset$}
                          \State Get any element $j$ from $T$, let $T:=T\setminus\{j\}$;
                          \If{$m_j=0$ or $m_j=-1$}
                              \State $m_j=k$;
                          \EndIf 
                          \If{$|N_\varepsilon(j)|\geq\mathcal{M}$}
                              \State{$T:=T\cup N_\varepsilon(j)$;}
                          \EndIf 
                      \EndWhile 
                      \State $k=k+1$;
                  \EndIf 
              \EndIf
          \EndWhile
      \end{algorithmic}
  \end{algorithm}
  \end{document}
  ```

- 添加页眉和页脚

  ```latex
  \usepackage{fancyhdr}
  \pagestyle{fancy}
  \fancyhf{}
  \rhead{\leftmark}
  \cfoot{\thepage}
  ```

- 调节页边距

  ```latex
  \usepackage{geometry}
  \geometry{left=3cm, right=2.5cm, top=2.5cm, bottom=2.5cm}
  ```

- 添加图片

  ```latex
  \usepackage{graphicx}
  \graphicspath{{img/}}
  \begin{document}
      \begin{figure}[H]
          \centering
          \includegraphics[width=0.8\textwidth,height=50mm]{}
          \caption{Test Test Test}
      \end{figure}
  \end{document}
  ```

- 文档框架

  ```latex
  \title{Report}
  \date{}
  \author{Shitong CHAI}
  
  \begin{document}
  
  \maketitle
  \tableofcontents
  
  \chapter {Something about report\cite{cortes1995support}}
  
  \bibliography{bibtex}{}
  \bibliographystyle{plain}
  \end{document}
  ```

- 使用ifthen宏（\whiledo, \ifthenelse, \value, \setcounter, \stepcounter），在宏中使用\intcalcMod

  ```latex
  \usepackage{ifthen}
  \usepackage{intcalc, calc}
  \newcounter{i}
  \begin{document}
      \begin{figure}[H]
      % 以下代码把图片目录下的0.png-36.png以每行四张的格式平铺成一张图
      \centering
          \begin{tabular}{c p{3cm}p{3cm}clc} 
              \setcounter{i}{0}
              \whiledo{\value{i} < 37} {
                  \includegraphics[width=0.13\textwidth]{\thei} 
                  \ifthenelse{\intcalcMod{\value{i}}{4} = 3}{\\}{&}
                  \stepcounter{i}
              }
  
          \end{tabular}
          \caption{Frequent patterns generated ($\tau=7$)}
      \end{figure}
  \end{document}
  ```

  

- bibtex.bib

  ```latex
  @article{cortes1995support,
    title={Support-vector networks},
    author={Cortes, Corinna and Vapnik, Vladimir},
    journal={Machine learning},
    volume={20},
    number={3},
    pages={273--297},
    year={1995},
    publisher={Springer}
  }
  ```

- 编译

  ```bash
  xelatex report
  bibtex report
  xelatex report
  xelatex report
  ```

  

