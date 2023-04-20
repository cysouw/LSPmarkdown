# Writing in Pandoc-markdown {#sec:writing}

## Basic editing

The basic principles of writing in Markdown are explained at various places online. However, the most authorative summary is provided by the [~~commonmark~~](https://commonmark.org) project. The most basic rules are:

- use hashes (#) at the start of a line for headings. The number of hashes indicates the heading level.
- use stars (\*) around text that should be set in *italics*.
- square brackets `[]` are used for all kind of links and cross-references (see below).

## Pandoc advanced editing

The possibilities of markdown are enhanced by Pandoc with various crucial formatting options as specified in the [~~Pandoc User's Guide~~](https://pandoc.org/MANUAL.html#pandocs-markdown). These formatting options will all be retained in the various conversions from Markdown into other formats (e.g. HTML or PDF). For example, [footnotes](https://pandoc.org/MANUAL.html#footnotes) are included by using the following format inside your text at the position where the footnote mark should occur.^[This is an example footnote. Footnote text between square brackets and a circumflex symbol before the brackets.]

```
^[Footnote text between square brackets and a circumflex symbol before the brackets.]
```

In the current LSPmarkdown framework there is an additional filter added that will change strikethrough formatting (by enclosing double tildes) into ~~small caps~~ formatting. This is a convenience option because linguistic texts often use small caps, but only rarely strikethrough. To remove this automatic conversion, simply remove the filter `strikeout-to-smallcaps` from the conversion files (e.g. from the file `tohtml.yaml`).

## Cross-referencing

Pandoc itself contains some basic cross-referencing options. However, it is strongly recommended to install the extra software [~~pandoc-crossref~~](https://github.com/lierdakil/pandoc-crossref). This allows for various flexible options to automatically insert internal cross-references in your text. Basically, you add a label to a heading by adding it behind the heading like this:

```
## Some Heading {#mylabel}
```

In your text you then refer to this heading by typing `[@mylabel]` which will result in a cross reference like this: [@sec:writing]. ~~pandoc-crossref~~ has many more possibilities and options as explained in detail in the [user's guide](https://lierdakil.github.io/pandoc-crossref/).

## Linguistic examples

To add linguistic examples, the LSPmarkdown skeleton includes a Pandoc-filter [~~pandoc-ling~~](https://github.com/cysouw/pandoc-ling). A full [user's guide](https://cysouw.github.io/pandoc-ling/readme.html) describing all options and limitations is available. Basically, you can add linguistic examples using the following format:

```
::: ex
a. This is an example sentence.
b. And another one.
:::
```

This will result in a numbered example as shown below. You can refer to this example using abbreviations like `[@next]` before the examples or `[@last]` after the example, e.g. see example [@next].

::: ex
a. This is an example sentence.
b. And another one.
:::

## Figures

To insert figures into your text, prepare figures separately and store them in the directory `figures`. In your markdown then add a line like the following below the table. This will be automatically numbered, and you can use the code `[@fig:crossreferencelabel]` in your text to refer to the figure, for example [@fig:crossreferencelabel].

```
![Caption text here](figures/myfigure){#fig:crossreferencelabel}
```

To prepare HTML output it is prefereable to convert any figure into [~~SVG~~](https://en.wikipedia.org/wiki/SVG) format. There are many [online converters](https://convertio.co/pdf-svg/) that can do this. You can include different file formats with the same filename into the directory `figures`, e.g. `myfigure.pdf` and `myfigure.svg`.

![This is an example figure.](figures/myfigure){#fig:crossreferencelabel}

## Tables

The situation to include tables is not yet very user friendly in Pandoc-Markdown. The editing and conversion of tables is currently a field of active development within Pandoc, so this will probably be improved substantially in the near future. For now, check out the possibilities for formatting tables in the Pandoc [user's guide](https://pandoc.org/MANUAL.html#tables). If you use Visual Studio Code, then there is a useful extension that might be helpful for formatting tables called [~~table formatter~~](https://marketplace.visualstudio.com/items?itemName=shuworks.vscode-table-formatter).

| Right | Left | Default | Center |
|------:|:-----|---------|:------:|
|   12  |  12  |    12   |    12  |
|  123  |  123 |   123   |   123  |
|    1  |    1 |     1   |     1  |

Table: This is an example table {#tbl:crossreferencelabel}

To add a caption to the table, add a line like the following below the table. This will be automatically numbered, and you can use the code `[@tbl:crossreferencelabel]` in your text to refer to the table, for example see [@tbl:crossreferencelabel].

```
Table: Caption text here {#tbl:crossreferencelabel}
```

## References {#sec:references}

Pandoc includes a [~~citeproc~~](https://pandoc.org/MANUAL.html#citations) extension to treat references and bibliography using the [~~citation style language (CSL)~~](https://citationstyles.org) framework. The current framework uses the ['unified style sheet for linguistics'](https://www.zotero.org/styles?q=linguistics) by default. There are various ways to include references, but two options seem to be most useful:

- if you manage your references in [~~BibTeX~~](http://www.bibtex.org) style, then you only have to add a path to your BibTeX-file in `3_SETTINGS.yaml`
- if you manage your references with [Zotero](https://www.zotero.org) then you should additionally install [BetterBibTeX](https://retorque.re/zotero-better-bibtex/installation/).

For the Zotero/BetterBibTeX workflow, you will have to additionally do the following:

- create an synchronised BibTeX file in Zotero by using `File >> Export Library…` checking `keep updated`. Save this file somewhere where you can easily find it on your computer. The simplest solution would be save this file inside the LSPmarkdown directory.
- add a path to this file in `3_SETTINGS.yaml`.
- set `Preferences >> Better BibTeX >> Automatic export >> Automatic export: On change`.

In both options your references will have a 'citation key' which typically uses a format like `chomsky1957` (but this format can be changed to your liking). To include a reference in your text use the link as shown below. This will result in a reference in your text [@Chomsky1957: 23]. You can add anything you like after the citations key, typically page numbers. To suppress the name inside the brackets, add a dash-minus symbol before the '@' symbol. This will result in a reference to Bloomfield [-@Bloomfield1925].

```
[@Chomsky1957: 23]
[-@Bloomfield1925]
```
