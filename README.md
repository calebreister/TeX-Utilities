###TeX-Utilities

This repository contains my LaTeX preamble and the script(s) that I wrote to assist in LaTeX projects. In has several useful macros including a condensed integration syntax and a new scientific notation macro that uses the small E notation. The Lua file contains a set of functions that I wrote to convert a separated value file (CSV, TSV, ...) into a Lua table so that the data can be manipulated or converted to a different format. Currently, I only have a function that converts it to the LaTeX tabular format, but it would be very easy to write a function that can transform it into almost any other text format (such as JSON or HTML). My intent is to use it in LuaTeX documents so that I can conveniently make tabulars from spreadsheets.

###Sample Usage of csv.lua
This code contains an example of how to use csv.lua to convert a CSV file to a LaTeX tabular when the project is built. More information about the functions used can be found in csv.lua.

```TeX
\documentclass[12pt,letterpaper]{article}
\usepackage[utf8x]{luainputenc}
\usepackage{luacode} %\luaexec macro: allows for '\\hline' in inline code
\directlua{require('csv.lua')}

\def\arraystretch{2} %Give tabular environments internal padding

\begin{document}
	\begin{tabular}{|c|c|c|}
	    \hline
	    \luaexec{
		    t = dataToTable('test.csv')
		    tex.sprint(tableToTeX(t, '\\hline'))
	    } \\
	    \hline
	\end{tabular}
	\hspace{2cm}
	\begin{tabular}{c|c|c}
	    \luaexec{
		    tex.sprint(tableToTeX(t, '\\hline', {2}))
	    }
	\end{tabular}
	\hspace{2cm}
	\begin{tabular}{c|cc}
	    \luaexec{
		    tex.sprint(tableToTeX(t, '\\hline', {2, 4, 6, 8}))
	    }
	\end{tabular}
\end{document}
```
