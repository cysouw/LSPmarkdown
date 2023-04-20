# In the beginning

## Markdown philosophy

This directory is a skeleton to write a monograph for *Language Science Press* (LSP) in Markdown. [~~Markdown~~](https://daringfireball.net/projects/markdown/) was introduced by John Gruber as a easy-to-use method to write content for webpages. The principles have spread widely and are formally codified as [~~Commonmark~~](https://commonmark.org). The basic idea is to make it easy to write content, while the details of the formatting are added by an automatic conversion. 

This possibilities of this automatic conversion has been greatly extended by [~~Pandoc~~](https://pandoc.org) as introduced and maintained by John MacFarlane. Pandoc can convert between dozens of different output formats, allowing for a great freedom for the visual display of your text. Pandoc also offers many extensions to the rather basic possibilities of the original markdown/commonmark proposals. Pandoc also has a robust system to add functionality through additional modules (called 'filters') when needed. 

Although Pandoc offers a wide range of bidirectional conversions between all kinds of formats, the current system for LSP suggests that you write in Pandoc-enhanced Markdown and convert from that basis to any desired output format. The problem is that every format (e.g. LaTeX, docx, odf) has its own design-quircks, and Pandoc will never be able to convert every detail between all formats. The Pandoc-Markdown structure offers a convenient set of markup options that are garantueed to be converted well and are sufficient for scientific texts. 

Any writer's desire that is currently missing in Pandoc-Markdown can be easily added by [~~filters~~](https://pandoc.org/lua-filters.html). In essence, Pandoc filters are very similar to packages in LaTeX. Because Pandoc is still relatively new, there are not as many filters available as there are LaTeX-packages, and there is also not yet a central repository for filters like [~~CTAN~~](https://ctan.org) for LaTeX. However, filters (especially Lua-based filters) are really easy to write and adapt, especially when compared to the rather arcane format of LaTeX-packages. The current LSPmarkdown skeleton includes various special filters to prepare a scientific book that is published on the open web. Some more details about the rationale for these filters is explained [here](https://cysouw.github.io/openwebpublishing/).

There are some major benifits when using Pandoc-markdown:

- the raw text that you will write is very simple structured and easy to read in its raw form, especially when compared to LaTeX.
- markdown strictly follows the design philosophy of separating presentation from content. You write the content, while leaving the presentation to the output format by an automatic conversion.
- the raw markdown can be converted into many different output formats using [Pandoc](https;//pandoc.org), e.g. Latex, PDF, HTML, docx, etc. Because the output is generated automatically, the styling and formatting is always consistent.

There are various limitations to the current markdown setup:

- If you depend on specific functionality provided by LaTeX-packages (e.g. producing syntactic trees), then you can still use them within markdown. However, such LaTeX-specific insertions can only be conversted to LaTeX and will not be converted to other formats, like HTML or docx.
- You are currently restricted to the possibilities as described in [@sec:writing]. Anything outside of those bounds have to be added by tailor-made Pandoc filters. Suggestions and request for new filters are welcome.

Note that there are various other approaches that are similary to the current LSPmarkdown skeleton. Most prominently there is [Rmarkdown](https://rmarkdown.rstudio.com) and the related [Bookdown](https://bookdown.org), which are both based on [`knitr`](https://cran.r-project.org/web/packages/knitr/index.html) by Yihui Xie. Those approaches embed Pandoc inside R-packages and thereby offer many nice options for the visualisation of quantitative data. However, these approaches are strongly geared towards usage within [RStudio](https://posit.co/products/open-source/rstudio/).

## Installation {#sec:installation}

For writing a book with the LSPmarkdown skeleton you can use any text editor of you choice. However, prefereably stay clear of full-fledged word-processors like Microsoft Word or OpenOffice because they tend to automatically add all kind of markup in the background, often onbenowst to the user.

Currently, the free editor [~~Visual Studio Code~~](https://code.visualstudio.com) is in very active development and probably the best choice if you are not yet entangled to any other text editor. However, any text editor is fine, e.g. TextMate, BBedit, Sublime Text, Atom, or even Emacs/vim if you are so inclined.

In all modern editors (like Visual Studio Code) it is possible to open a complete directory/folder, so it becomes easy to switch between editing the different files in the LSPmarkdown directory. The current LSPmarkdown directory should be the starting point of your book. Simply rename the directory to your liking and change the current content (which is only included as an example). 

If you want to convert your text to any of the LSP-based outputs you will need to install some additional software. This can be done through a package manager like [`Homebrew`](https://brew.sh) for macOS. However, it might be easiest for new users to simple install the following three pieces of software separately:

- **Pandoc**, install instructions at <https://pandoc.org/installing.html>
- **pandoc-crossref**, install instructions at <https://github.com/lierdakil/pandoc-crossref>.
  This is a Pandoc-filter for cross-referencing that you will have to install separately, because depending on your computer you will have to install a different version.
- **LaTeX**, install instructions at <https://www.latex-project.org/get/>.
  LaTeX is needed to produce PDF output as used at the *Language Science Press*. Included in this skeleton is also an option for a quick PDF creation that can be used for the preparation of drafts in PDF form.
- **Libertinus font** from <https://github.com/alerque/libertinus/releases>.
  This font is used to produce output in the format of the *Language Science Press*. The HTML file will attempt to download this font by itself when it is not installed on your computer.

## Setup

To prepare your book there are three basic files with settings that you will have to adapt to your needs:

- the file `1_TITLEPAGE.yaml` contains the basic metadata that will end up on your title page
- the file `2_CONTENTS.yaml` contains the list of the Markdown files that make up your book. Simply list the filenames in the order as they should occur in the book here. 
- the file `3_SETTINGS.yaml` contains a few further user-settings. Specifically, you will have to specify the location of your bibliography here (see also [@sec:references]).

The current LSPmarkdown directory is prepared for direct upload as a git-repository, e.g. at Github or Gitlab. That is probably the easiest way to share your work with others, also in any pre-publication status. There are a few files included here for a more transparent sharing of your work online:

- a `LICENSE` file with a [~~CC-BY~~](https://creativecommons.org/licenses/by/4.0/) license in accordance to the LSP guidelines.
- a `README.md` file. Please write a few lines in this `README` file to introduce your book. 
- a `NEWS.md` file. This file can initally be ignored because it is geared to documenting updates for possible subsequent editions of the book.
