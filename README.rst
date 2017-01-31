.. -*- restructuredtext -*-

`latex-moderncv` is a repository containing my resume compiled in latex using a very nice modern theme

Credits
=======

Latex is a fantastic typesetting program that a lot of people use these days, especially the math and computer science people in academia. You can find out more about it here: http://www.latex-project.org/

If you are looking for latex resume templates, I would recommend looking at this nice list an anonymous person put together: http://linuxandfriends.com/2009/12/28/latex-resume-templates/

The moderncv theme for my resume is contributed by Xavier Danaux and can be downloaded here: http://tug.ctan.org/tex-archive/macros/latex/contrib/moderncv/

Prerequisites
=============

You will need to have latex installed on your system. If you are using OSX, the easiest way to get up and running is to download MacTex: http://tug.org/mactex/

Installation
============

Install Latex and download the moderncv theme. Place the moderncv theme somewhere Latex can find it. Check out the `Makefile` to change the variable `CV_NAME = olga-botvinnik-cv` for

    /latex-moderncv
        olga-botvinnik-cv.tex
        olga-botvinnik-cv.pdf
        /moderncv

References
==========

This is where it gets tricky. To have the different sub-sections in "Publications," you need to use the `multibib` package. I used three different sections for the references in my resume (corresponding `.bib` file):

- "Journal Articles" (`articles.bib`)
- "Books" (`books.bib`)
- "Conference Posters" (`posters.bib`)

I initialized the "Book," "Journal Article", and "Conference Poster" sections was initialized in the preamble (aka before ``\begin{document}``). Notice that the citation directive `book` corresponds to "Books", `article` corresponds to "Journal Articles," and `poster` corresponds to "Conference Posters:"

    \newcites{book,article,poster}{{Books},{Journal Articles},{Conference Posters}}

In the actual document, here is what my citations look like. Notice that `\nocitearticle` corresponds to the `article` initialized above, while `articles.bib` is the actual reference file:

    % --- START for use with multibib package ---
    % Publications from a BibTeX file using the multibib package
    \section{Publications}

    \nocitearticle{*}
    \bibliographystylearticle{habbrvyrolgabold}
    \bibliographyarticle{articles}                   % 'articles' is the name of a BibTeX file

    \nocitebook{*}
    \bibliographystylebook{habbrvyrolgabold}
    \bibliographybook{books}                   % 'books' is the name of a BibTeX file

    \nociteposter{*}
    \bibliographystyleposter{habbrvyrolgabold}
    \bibliographyposter{posters}                   % 'posters' is the name of a BibTeX file
    % --- END for use with multibib package ----


Compiling the Resume
====================

This is also tricky. I wanted to automatically build the bibliography every time, and do it from scratch. To do this, edit the `Makefile` to use your own `.tex` file name in `CV_NAME = olga-botvinnik-cv` (e.g. for `olga-botvinnik-cv.tex`), and then do:

    make cv

Cover Letters
-------------

To make cover letters, e.g. for Post-Doc applications, check out `potential-advisors/example-advisor.tex`. This is the cover letter template. This was also tricky to figure out but what's nice is that for all `.tex` files that you add to `potential-advisors`, the `make` command will iterate over all of them and create a single Cover Letter + CV document that you can send to them. The command is:

    make coverletter

Notes
=====

You are free to take my .tex file and modify it to create your own resume. Please don't use my resume for anything else without my permission, though!

Good luck!

Differences between the original fork
-------------------------------------

- References/Publications
	- Uses three publication definitions using `multibib`: `journal`, `book`, and `poster`
	- Uses `habbrvyrolgabold.bst` BibTeX style to sort publications by year and bold my name, Olga B Botvinnik. To bold your name, search for "Olga B Botvinnik" in `habbrvyrolgabold.bst` in the file and use your name instead
- Visual style
	- Uses `classic` style
	- Added page numbers with "Page 3 of 4" at bottom right footer
- Output and usage
	- Added a `Makefile` to `make cv` for the publications because it's pretty tedious otherwise.
		- If you try to switch between BibTeX and Bib**La**TeX, it will complain that BibLaTeX didn't create the `.bbl` file. So, `make all` calls `make clean` which removes all `.aux`, `.blg` and `.bbl` files so that you start fresh every time.
    - Makefile also has `make coverletter` which iterates over the `.tex` files in the `potential-advisors` folder and creates a single coverletter + cv file with the advisor's name, e.g. `olga-botvinnik-cv-example-advisor.pdf`
