# The Value Illusion

[![Publish](https://github.com/jimbrig/the-value-illusion/actions/workflows/publish.yml/badge.svg)](https://github.com/jimbrig/the-value-illusion/actions/workflows/publish.yml)

Field notes on R's runtime, and the design taste that follows.

**Read online:** <https://docs.jimbrig.com/the-value-illusion/>

R is a Lisp-family language that sells a Fortran-ish value illusion. These
notes decode what `inspect` is actually printing, trace the hybrid back to
S, Scheme, and the Fortran interface, and then stay with the consequence
for package design: name things, admit only valid values, show them well,
and extend them with verbs.

The type-driven half of that taste is worked out at length in
[S7 Design Notes](https://docs.jimbrig.com/s7-design-notes/). This book
points there instead of repeating it.

## Contents

- **The law** — the whole argument in one chapter.
- **The metal** — the SEXP header, three different empties, cons cells
  against generic vectors, reference counts and ALTREP, the types you only
  meet in context, and conditions as signals.
- **The hybrid** — Chambers' principles, what R borrowed, and why the REPL
  is good at discovery and bad at forcing a contract.
- **The taste** — open verbs, where state lives, runtime types, views, and
  the data-driven close.
- **Appendices** — the lab notebook of the original probes, an inquiry
  ledger, a glossary, and sources.

## Building locally

The book is prose plus Mermaid, rendered with Quarto 1.10.19. A small base-R
script checks the runtime claims that should not drift.

```sh
Rscript verification/check-claims.R
quarto render
```

`quarto preview` is enough while editing. Pushes to `main` run the checks,
render the book, and publish `_book/` to the `gh-pages` branch, which is
how it shows up under <https://docs.jimbrig.com/the-value-illusion/>.

The glossary popups use Lisa DeBruine's glossary extension, vendored under
`_extensions/`.

## License

MIT. See [LICENSE](LICENSE).
