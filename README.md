# vim-syntax
Various files for better syntax highlighting: grgen, tina, lola - I'm not always the author

## GrGen

### Syntax

Syntax files for (grgen)[http://grgen.net] are taken from the GrGen project and improved.

Extensions:
* .gm -> gm
* .grg, .gri -> grg
* .grs, .grsi -> grs

The syntax gets even more pretty if you have: `ap/vim-css-color` - when specifying the graph layout and its colors, the colors will be
directly displayed.

### Neomake Checking

Putting the `bin/grgcheck` into your `PATH` would allow `neomake/neomake` syntax checking.
What `grgcheck` does is basically check the `Rules.grg` which is in the same dir as the `*.grg` or `*.gm` file you are editing.

This means

## Tina

The petri net analyzer. The syntax-file is from me.

* .tina -> tina result file

## LoLa

The Low Level Analyzer (for petri nets). The syntax-file is from me.
I'm not sure if there exists some file-extension standard for them. I implemented:

* .lola -> lola input file
* .lolar -> lola result file
* .formula -> lola formula file

# Installation

Install it with plug.vim:
``` Plug 'balrok/vim-syntax', { 'for': ['gm', 'grg', 'gri', 'grs', 'grsi', 'tina', 'formula', 'lola', 'lolar'] }```
