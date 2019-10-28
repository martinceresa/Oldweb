---
title: QuickFuzz
---

### QuickFuzz

[QuickFuzz](https://github.com/CIFASIS/QuickFuzz) is an abandoned project. It is a tool written in Haskell
designed for testing un-expected inputs of common file formats on third-party
software, taking advantage of off-the-shelf, well known fuzzers. Unlike other
generational fuzzers, QuickFuzz **does not** require to write specifications for the
file formats in question since it relies on existing file-format-handling
libraries available on the Haskell code repository.

### MegaDeTH

[MegaDeTh](https://github.com/CIFASIS/Megadeth) is an abandoned project, spin-off of QuickFuzz.
Mega Derivation TH (MegaDeTh) gives the user an aggressive way to derive
instances for all the intermediate nested types that are needed to make the
top-level instance work.
