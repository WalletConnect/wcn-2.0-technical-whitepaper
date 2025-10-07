# Makefile for LaTeX paper compilation

# Main tex file (without .tex extension)
MAIN = main

# PDF output
PDF = $(MAIN).pdf

# LaTeX compiler
LATEX = pdflatex
BIBTEX = bibtex

# Compilation flags
LATEX_FLAGS = -interaction=nonstopmode -halt-on-error

.PHONY: all clean view watch help

# Default target
all: $(PDF)

# Compile the PDF
$(PDF): $(MAIN).tex references.bib
	@echo "Compiling LaTeX document..."
	$(LATEX) $(LATEX_FLAGS) $(MAIN)
	$(BIBTEX) $(MAIN)
	$(LATEX) $(LATEX_FLAGS) $(MAIN)
	$(LATEX) $(LATEX_FLAGS) $(MAIN)
	@echo "Compilation complete: $(PDF)"

# Quick compile (single pass, no bibliography)
quick:
	$(LATEX) $(LATEX_FLAGS) $(MAIN)

# Clean auxiliary files
clean:
	@echo "Cleaning auxiliary files..."
	rm -f *.aux *.log *.bbl *.blg *.toc *.out *.lot *.lof *.fls *.fdb_latexmk *.synctex.gz *.alg *.acn *.glo *.ist
	@echo "Clean complete."

# Clean everything including PDF
cleanall: clean
	rm -f $(PDF)
	@echo "Removed $(PDF)"

# Open the PDF (macOS)
view: $(PDF)
	open $(PDF)

# Watch for changes and recompile (requires fswatch on macOS: brew install fswatch)
watch:
	@echo "Watching for changes... Press Ctrl+C to stop."
	@fswatch -o *.tex *.bib | xargs -n1 -I{} make quick

# Help target
help:
	@echo "Available targets:"
	@echo "  make          - Compile the PDF with full bibliography"
	@echo "  make quick    - Quick compile (single pass, no bibliography)"
	@echo "  make clean    - Remove auxiliary files"
	@echo "  make cleanall - Remove all generated files including PDF"
	@echo "  make view     - Open the PDF (macOS)"
	@echo "  make watch    - Watch files and recompile on changes (requires fswatch)"
	@echo "  make help     - Show this help message"
