# Useful PDF Commands

Create a blank A4 PDF page[1]:

```bash
convert xc:none -page A4 blank.pdf
```

Remove the first page of a PDF:

```bash
pdftk original.pdf cat 2-end output original_without_page_1.pdf
```

Combine PDFs together:

```bash
pdftk cover_sheet.pdf blank.pdf original_without_page_1.pdf cat output final.pdf
```

## Sources

[1] https://unix.stackexchange.com/a/277987
