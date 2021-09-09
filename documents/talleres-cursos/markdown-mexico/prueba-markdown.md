---
title: Título
author: Juan Carlos Castillo
date: 24-Ago-2021
bibliography: bibliography.bib
abstract: "Economic and social inequalities have generated growing concern and crises across contemporary societies "
geometry: margin=0.8in
linestretch: '1.5'
link-citations: yes
export-format: 'pdf'
export-options: '--citeproc'
---

# 1. Probando markdown

I {++think most++} people start using R with scripts initially. Scripts are great for modular computational tasks, but for generating informative reports, Rmarkdown is a must.{~~ Rmd makes ~>~~}it possible to use a YAML header to specify certain parameters right at the beginning of the document. Built-in YAML parameters make it easier to create more organized and informative repo{--rts. In this post, I will share with you few of the YAML options I commonly use for gener--} ating HTML outputs in my data analysis projects. You can check out the following resources for details about tons of other options:

## Segundo encabezado


$$\beta_0$$

**Probando negrita**  fdfd


1. *cursiva*  ffdf fdf
2. fsdf
3. fsdf
4.

Fila 1  | Fila 2  | Fila 3
--|---|--
  celda 1 | celda 2  | celda 3

### Probando Imágenes

Insertar imagen con `![](Markdown-mark.png)` :

![](Markdown-mark.png)

Esto funciona tanto para salida en html como Latex/pdf. El problema es el tamaño y centrado de la imagen. La solución más rudimentaria es incluir código de html y latex que permita hacer esto.

- En el caso de **html**:
`<img src="Markdown-mark.png" width="200">`

<img src="Markdown-mark.png" width="400">

Y si se desea centrada:

`<center><img src="Markdown-mark.png" width="200"></center>`

<center><img src="Markdown-mark.png" width="200"></center>

- En el caso de pdf (Latex) (la sintaxis de Latex se puede ver en el preview de Atom, pero luego no aparece en renderizado html)

\begin{center}
\includegraphics[width=5cm]{Markdown-mark.png}
\end{center}



## Citas

Se dijo que era muy importante [@knight_luck_2009].

@knight_luck_2009 dijo que era muy importante

Como dijo Knight una vez [-@knight_luck_2009], eso era muy importante.

"Eso era muy importante" [@knight_luck_2009, pp. 25]

## Critic markup






## Referencias
