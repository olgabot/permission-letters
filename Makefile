
FOLDER = letters
NAMES = 'Yan Song' 'Michael T Lovci' 'Boyko Kakaradov' 'Patrick Liu' 'Jia L. Xu' 'Gene W Yeo'

clean:
	# Remove BibTeX and TeX auxiliary files
	rm -rf *bbl *blg *aux *log *dvi
	rm -rf ${FOLDER}/*

all: clean
	# Copy this makefile to the letter folder for compilation ease
	cp Makefile ${FOLDER}

	for NAME in $(NAMES) ; do \
		PREFIX=$$(echo $$NAME | tr ' ' '-') ; \
		sed "s:Firstname Lastname:$$NAME:" < template.tex > ${FOLDER}/$${PREFIX}.tex ; \
		echo ${FOLDER}/$${PREFIX}.tex ;\
		pushd ${FOLDER} ;\
		TEX=$${PREFIX} make compile;\
		popd ;\
	done

compile:
	latex ${TEX}.tex
		# # bibtex each citation class separately
		# # These are defined in .tex, not the names of the .bib iles
		# bibtex article
		# bibtex book
		# bibtex poster
		# latex ${TEX}.tex
		# latex ${TEX}.tex
	dvips -t letter -Ppdf ${TEX}.dvi -o ${TEX}.ps
	# # Comment out the next line if you want to create a PDF
	ps2pdf ${TEX}.ps ${TEX}.pdf
