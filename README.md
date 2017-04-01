Pi-Poster
=========

  some artwork for the roundest number

This repo contains two versions of a program written in the [PostScript][1] 
programming language. Both show a lot of small squares, each containing a digit
of pi with a associated color.

You can probably open the PS files in a document viewer like `evince` or
`okular`. Using the included Makefile you may also create PDF files by just 
running `make`.

Converting to PDF is done by `ps2pdf` which is part of [ghostscript][2].
Postscript can be installed by running `sudo apt-get install ghostscrip` on
most Debian based distributions.

Please let me know if you like it, have printed it or something else ;-).


[1]: https://en.wikipedia.org/wiki/PostScript
[2]: http://www.ghostscript.com/
