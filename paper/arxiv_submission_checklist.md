# arXiv source-submission checklist

## Included source

- `main.tex` is the sole top-level document and is declared in `00README.json`.
- `sections/`, `figures/`, `references.bib`, and `neurips_2026.sty` are required source assets.
- All included figures are PDF files referenced with case-matching relative paths. PDF figures are supported by arXiv's XeLaTeX processing.
- The bibliography is generated from `references.bib`; arXiv can run BibTeX when the `.bib` file is supplied.

## Source edits made for submission

- The manuscript date is blank. arXiv supplies the submission date, avoiding the unstable `\today` value during rebuilds.
- PDF title, author, and subject metadata are defined through `hyperref`.
- Every manuscript figure has descriptive `alt` text for accessible HTML conversion.
- `00README.json` requests XeLaTeX, the Unicode-capable LaTeX processor supported by arXiv.

## Required pre-upload check

The current multilingual configuration names Windows system fonts such as `Yu Gothic`, `Malgun Gothic`, and `Segoe UI`. These fonts are not portable to arXiv. Before upload, compile the source with the XeLaTeX configuration specified in `00README.json` and inspect every non-Latin token in the Logit Lens tables. If glyphs are missing, replace those font declarations with arXiv TeX Live font filenames or package appropriately licensed open fonts with the submission.

## Do not upload

- `build/` and `.texlive-var/`
- generated auxiliary files such as `.aux`, `.log`, `.out`, `.fls`, `.fdb_latexmk`, `.synctex.gz`, and the locally built `main.pdf`
- the repository-level analysis code, notebooks, audit notes, or unrelated project files
