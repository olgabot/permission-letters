
TEX_NAME = 2016-12-07-olga-botvinnik-cv

all:
	latex ${TEX_NAME}.tex
	# bibtex each citation class separately
	# These are defined in .tex, not the names of the .bib iles
	bibtex journal
	bibtex book
	bibtex poster
	latex ${TEX_NAME}.tex
	latex ${TEX_NAME}.tex
	dvips -t letter -Ppdf ${TEX_NAME}.dvi -o ${TEX_NAME}.ps
	# Comment out the next line if you want to create a PDF
	ps2pdf ${TEX_NAME}.ps ${TEX_NAME}.pdf

