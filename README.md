# Cross-linguistic Data Formats

To allow exchange of cross-linguistic data and decouple development of tools and methods from that of databases, standardized data formats are necessary.

The main types of cross-linguistic data we are concerned with here are wordlists and structure datasets which are used in historical linguistics.


## Design goals

- Data should be both editable "by hand" and amenable to reading and writing by software.
- UTF-8 encoded text files.
- Reference entities rather than duplicate.
- IDs should be resolvable HTTP URLs if possible.


## Core format specification

A cross-linguistic dataset is encoded in the following set of files:

- The core data file, encoded in csv, 
- additional metadata provided as JSON file following the guidelines of the [Model for Tabular Data and Metadata on the Web](http://www.w3.org/TR/tabular-data-model/#standard-file-metadata), 
- sources - if not referenced by Glottolog ID - supplied as BibTeX file (with the citation keys serving as local Source IDs).

If the name of the dataset is `clds`, the respective filenames are
- `clds.csv`
- `clds-metadata.json`
- `clds.bib`


### Identifiers

Following our design goal to reference rather than duplicate entities, identifiers should be used to reference existing entities (e.g. Glottolog languages, WALS features, etc.). To do so, identifiers must be formatted as resolvable HTTP(S) URLs.

Alternatively, identifiers may be used to reference dataset local entities which are defined in the datasets metadata (or not at all). In this case identiers must be composed of the characters defined by the regular expression `[a-zA-Z0-9\-_]`. This restriction makes sure that these identifiers can be used as path components of HTTP URLs (see [rfc3986](https://tools.ietf.org/html/rfc3986#section-2.3)).


### The data file

The core data file is encoded in [csv](http://tools.ietf.org/html/rfc4180) using the [UTF-8](http://en.wikipedia.org/wiki/UTF-8) character encoding. This file must have a header, i.e. the first row
must contain the list of column names. While the file may contain any number of columns, columns with a specific 
meaning in our context are detected by name:

- `ID`: identifies a row in the data file; either a local ID - preferably an [UUID](http://en.wikipedia.org/wiki/Universally_unique_identifier) - or an (equally universally unique) URL like http://wold.clld.org/word/7214142329897819 or http://wals.info/valuesets/1A-niv
- `Language_ID`: identifies the language or variety the data in the row is about. A [Glottolog languoid URL](http://glottolog.org), or *glottocode* or ISO-639-3 code (FIXME: require a URL, or a disambiguating prefix?), or a local identifier.
- `Source`: Semikolon-separated source specifications, of the form *<source_ID>[<source context>]*, e.g. *http://glottolog.org/resource/reference/id/318814[34]*, or *meier2015[3-12]* where *meier2015* is a citation key in the accompanying BibTeX file.
- `Comment`: Free text comment.

Notes:

- Using UTF-8 as character encoding means editing these files with MS Excel is not completely trivial, because Excel assumes cp1252 as default character encoding.


### The metadata file

Should be [JSON-LD](http://json-ld.org/), containing a dataset distribution description using the [DCAT vocabulary](http://www.w3.org/TR/vocab-dcat/#class-distribution). This will make it easy to [catalog](http://www.w3.org/TR/vocab-dcat/#class-catalog)
cross-linguistic datasets.


## Data types

- [Wordlists](wordlist.md)
- [Structure dataset](structure_dataset.md)
