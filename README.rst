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

Install Latex and download the moderncv theme. Place the moderncv theme somewhere Latex can find it. You can just place the folder in the same place as your .tex file as I have::

    /my-resume
        my-resume.tex
        my-resume.pdf
        /moderncv

Compiling the Resume
====================

Simply use the ``pdflatex`` command in your terminal::

    pdflatex my-resume.tex

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
	- Added a `Makefile` to `make all` for the publications because it's pretty tedious otherwise.
		- If you try to switch between BibTeX and Bib**La**TeX, it will complain that BibLaTeX didn't create the `.bbl` file. So, `make all` calls `make clean` which removes all `.aux`, `.blg` and `.bbl` files so that you start fresh every time. 
	- Creates a new pdf for the year and the month, so you can keep track of CVs over time. E.g. `olga-botvinnik-cv.tex` will get a pdf of `olga-botvinnik-cv-2016-12.pdf` for 