# LaTeX Compilator
LATEX_COMPILER = pdflatex

# Make sure to have access to pythontex
PYTHONTEX = pythontex


# Fichier principal LaTeX
FILE_NAME = main
MAIN_TEX_FILE = $(FILE_NAME).tex

# Cible par défaut
all: pdf

# Règle pour générer le PDF
pdf: $(MAIN_TEX_FILE) $(wildcard *.py)
	$(LATEX_COMPILER) $<
	$(PYTHONTEX) $<
	$(LATEX_COMPILER) $<
# Can be optionnal if you don't use biblatex
	$(LATEX_COMPILER) $< 

# Règle pour nettoyer les fichiers générés
clean:
	rm -f *.aux *.log *.out *.pytxcode *.pytxmcr *.synctex.gz *.toc *.pdf *.fdb_latexmk *.fls 
	rm -r pythontex-files-$(FILE_NAME)

.PHONY: all pdf clean
