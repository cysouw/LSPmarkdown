# Making the book

A few different settings-files are included in this LSPmarkdown skeleton to prepare the final book from your markdown source. These are `yaml`-files with various settings. Such files are called `defaults-files` in pandoc-parlance (see the [pandoc documentation](https://pandoc.org/MANUAL.html#defaults-files)).

- the file `tohtml.yaml` is used to convert to LSP-styled HTML
- the file `topdf.yaml` is used to convert to a quick-and-easy draft PDF
- the file `totex.yaml` is used to convert to LSP-styled LaTeX and subsequent LSP-styled PDF

To use these default-files you will have to open a terminal/shell in the current directory. If you use Visual Studio Code and you have opened the whole LSPmarkdown directory with `File >> Open Folder…` then this is really easy, also when you have never used a terminal/shell. Simply open a terminal/shell through the menu `Terminal >> New Terminal` and then type the command as specified below.

## LSP-style HTML

To convert your markdown to HTML type the following command in your terminal and hit return:

    pandoc -d tohtml.yaml

As a result there will be a new file called `index.html` in the directory `docs` with the final HTML output. This file is completely self-contained and does not need any other files to work properly. You can immediately open this file locally from you computer by double-clicking it. It will open locally in you default web browser. 

Because this file is completely self-contained you can easily share it with other people (just send them the file). When you sync your whole directory with GitHub you can immediately publish this file using [`GitHub Pages`](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site). Note that the fonts used in the LSP style are Libertinus Serif (for the main text) and Arimo (for the title page). When these fonts are not installed on your computer the browser will attempt to fetch them from the internet.

For final LSP-publication there are few additional minor tweaks to be made:

- The copyright info has to be added at the start of the HTML file. This information has to be manually changed in the file `settings/LSP-copyright.md`. To include this file in the final output open the defaults-file `tohtml.yaml` and add the line as explained there.
- You might want to remove the coloured hypelinks by deleting the respective lines at the bottom of the settings-file `3_SETTINGS.yaml`.
- To add colour to the title page, you will have the change to colour in the file `settings/LSP-css.yaml` in the line `background-color`.

## Draft PDF

To convert your markdown to PDF you can use the following command in the terminal:

    pandoc -d topdf.yaml

This will produce a PDF-file called `book.pdf` in the directory `docs`. This PDF does not use the LSP styling. Instead, the PDF will use the default LaTeX-style from the conversion-software Pandoc. The advantage of this option is that this conversion to PDF is much quicker and easier than the complete LSP pathway as described below. This is particularly useful if you want to produce a quick PDF version for printing or reviewing of your text. Note that you will need LaTeX to be installed on your computer, see [@sec:installation]

## LSP-style PDF

Finally, there is a conversion option to prepare your book for LaTex-based LSP publication. The preparation of a final book for LSP is somewhat more involved because there are various checks and additional fine-tuning needed for a polished real-life publication. Basically the procedure is as follows: first, convert your markdown into raw LaTex, and second, use this LaTex to proceed through the regular LSP pipeline. To convert you markdown to raw LaTeX you can use the following command in your terminal:

    pandoc -d totex.yaml

This will produce a tex-file called `all.tex` in the directory `latex/chapters`. The directory `latex` is a slightly adapted version of the default LSP skeleton to produce a book. You will have to make a few more changes in this directory to produce a complete LSP book:

- add author and title information in the file `latex/localmetadata.tex`. 
- add any figures (preferably in PDF format) into the directory `latex/figures`
 
Then you can produce a draft version of the final LSP styled PDF by typing the following command in your terminal:

    make -C latex

This will take some time, and might very well spit out many TeX-errors. For now simply ignore these messages. If this process gets stuck, type "x" to break and ask somebody for help. If it finishes, then there will a PDF-file called `main.pdf` in the directory `latex` with your LSP-styled book. The final tweaks to this process will be performed together with the people from the *Language Science Press*.
