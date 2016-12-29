#!/bin/bash

# ./compile.sh olga-botvinnik-cv

programname=$0

function usage {
    echo "usage: $programname [tex_prefix]"
    echo "  example: $programname olga-botvinnik-cv"
    exit 1
}


latex "$1".tex
# bibtex each citation class separately
# These are defined in .tex, not the names of the .bib iles
bibtex article
bibtex book
bibtex poster
latex "$1".tex
latex "$1".tex
dvips -t letter -Ppdf "$1".dvi -o "$1".ps
# Comment out the next line if you want to create a PDF
ps2pdf "$1".ps "$1".pdf

[ -z $1 ] && { usage; }