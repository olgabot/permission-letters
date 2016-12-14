
TEX_NAME = olga-botvinnik-cv
PDF_NAME = ${TEX_NAME}-`date +%Y-%M`

all:
	latex ${TEX_NAME}.tex
	# bibtex each citation class separately
	# These are defined in .tex, not the names of the .bib iles
	bibtex journal
	bibtex book
	bibtex poster
	latex ${TEX_NAME}.tex
	latex ${TEX_NAME}.tex
	dvips -t letter -Ppdf ${TEX_NAME}.dvi -o ${PDF_NAME}.ps
	# Comment out the next line if you want to create a PDF
	ps2pdf ${PDF_NAME}.ps ${PDF_NAME}.pdf

