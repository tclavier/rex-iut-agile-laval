CLEAN=*~ *.rtf *.ps *.log *.dvi *.aux *.pdf *.out *.html *.css *.bak *.toc *.pl *.4ct *.4tc *.lg *.sxw *.tmp *.xref *.idv *.tns *.nav *.snm
TEXFILES = $(wildcard *.tex)
SVGFILES= $(wildcard includes/*.svg)

all: pdf

%.pdf: %.tex
	pdflatex  $<
	pdflatex  $<

%.png: %.svg
	inkscape -f $< -e $@

clean:
	-rm -f $(CLEAN) 

png: $(patsubst %.svg,%.png,$(SVGFILES))
pdf: png $(patsubst %.tex,%.pdf,$(TEXFILES)) 
