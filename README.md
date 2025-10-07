# Scientific Paper Template (Two-Column)

A professional two-column LaTeX template for scientific papers, technical whitepapers, and academic publications.

## Prerequisites

You need a LaTeX distribution installed on your system:

### macOS
```bash
# Install MacTeX (full distribution, ~4GB)
brew install --cask mactex

# Or install BasicTeX (minimal, ~100MB) and add packages as needed
brew install --cask basictex
```

After installing BasicTeX, you may need to install additional packages:
```bash
sudo tlmgr update --self
sudo tlmgr install collection-fontsrecommended
sudo tlmgr install algorithms
sudo tlmgr install algorithmicx
```

### Linux
```bash
# Ubuntu/Debian
sudo apt-get install texlive-full

# Fedora
sudo dnf install texlive-scheme-full

# Arch
sudo pacman -S texlive-most
```

### Windows
Download and install [MiKTeX](https://miktex.org/download) or [TeX Live](https://tug.org/texlive/).

## Quick Start

### Using Make (Recommended)

```bash
# Compile the PDF (includes bibliography)
make

# View the PDF (macOS)
make view

# Quick compile (single pass, no bibliography)
make quick

# Watch for changes and auto-recompile (requires fswatch)
brew install fswatch  # Install fswatch first
make watch

# Clean auxiliary files
make clean

# Clean everything including PDF
make cleanall
```

### Manual Compilation

```bash
cd paper

# Full compilation with bibliography
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex

# View the PDF
open main.pdf  # macOS
xdg-open main.pdf  # Linux
start main.pdf  # Windows
```

## Project Structure

```
paper/
├── main.tex          # Main LaTeX document
├── references.bib    # Bibliography file
├── figures/          # Directory for images and figures
├── Makefile          # Build automation
├── .gitignore        # Git ignore file for LaTeX
└── README.md         # This file
```

## Features

- **Two-column layout** optimized for scientific papers
- **Professional formatting** with proper margins and spacing
- **Mathematics support** with AMS packages
- **Algorithm environment** for pseudocode
- **Bibliography management** with BibTeX
- **Cross-references** for sections, equations, figures, and tables
- **Hyperlinks** with clickable references and citations
- **Clean typography** using Latin Modern fonts

## Customization

### Change Paper Size
Edit the `geometry` package settings in `main.tex`:
```latex
\usepackage[
    a4paper,  % Change to a4paper, letterpaper, etc.
    top=1in,
    bottom=1in,
    ...
]{geometry}
```

### Switch to Single Column
Change the document class:
```latex
\documentclass[10pt]{article}  % Remove twocolumn option
```

### Add More Packages
Common additions:
```latex
\usepackage{subcaption}  % For subfigures
\usepackage{tikz}        % For diagrams
\usepackage{listings}    % For code listings
\usepackage{natbib}      % For more citation styles
```

## Adding Content

### Figures
Place images in the `figures/` directory and reference them:
```latex
\begin{figure}[t]
\centering
\includegraphics[width=\columnwidth]{figures/myimage.pdf}
\caption{Your caption here.}
\label{fig:myimage}
\end{figure}
```

### Tables
```latex
\begin{table}[h]
\centering
\caption{Your table caption}
\label{tab:mytable}
\begin{tabular}{lcc}
\toprule
Header 1 & Header 2 & Header 3 \\
\midrule
Data 1 & Data 2 & Data 3 \\
\bottomrule
\end{tabular}
\end{table}
```

### Citations
Add entries to `references.bib` and cite them:
```latex
As shown in \cite{example2023}, the method...
```

## Tips

1. **Compile at least twice** when you add/change references, citations, or cross-references
2. **Run BibTeX** (`make` does this automatically) when you modify `references.bib`
3. **Use vector graphics** (PDF, SVG) for figures when possible
4. **Check the log file** (`main.log`) if compilation fails
5. **Use meaningful labels** for cross-references (e.g., `fig:architecture`, `tab:results`)

## Editor Recommendations

### VS Code
1. Install the "LaTeX Workshop" extension
2. Open `main.tex` and save to auto-compile
3. Use Cmd/Ctrl+Alt+V to preview PDF

### Overleaf
Upload the entire `paper/` directory to Overleaf for cloud-based editing with live preview.

### Vim/Neovim
Use the `vimtex` plugin for LaTeX support.

## Common Issues

### Missing Packages
If you get "File not found" errors for packages:
```bash
sudo tlmgr install <package-name>
```

### Bibliography Not Showing
Make sure you:
1. Have `\cite{}` commands in your document
2. Run the full compilation sequence: pdflatex → bibtex → pdflatex → pdflatex
3. Check that `references.bib` is in the same directory as `main.tex`

### PDF Not Updating
Clear auxiliary files and recompile:
```bash
make cleanall
make
```

## License

This template is provided as-is for academic and commercial use.
