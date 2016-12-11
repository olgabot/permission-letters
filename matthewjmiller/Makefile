
TEX_NAME = vitae

all:
	latex ${TEX_NAME}.tex
	# bibtex each citation class separately
	bibtex journal
	bibtex refpaper
	bibtex submitpaper
	bibtex techreport 
	bibtex classproject 
	latex ${TEX_NAME}.tex
	latex ${TEX_NAME}.tex
	dvips -t letter -Ppdf ${TEX_NAME}.dvi -o ${TEX_NAME}.ps
	# Comment out the next line if you want to create a PDF
	ps2pdf ${TEX_NAME}.ps ${TEX_NAME}.pdf

