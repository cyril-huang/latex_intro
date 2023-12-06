# Copyright (C) 2001-2023  Cyril Huang, Gyoza Workshop 

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

TARGET	:= latex.pdf beamer.pdf
CHPATER	:= tex.tex install.tex packages.tex advance.tex math.tex
DEBUG	:= $(TARGET:pdf=xdv)

%.pdf: %.tex
	xelatex $< ;  [ -f $*.idx ] && makeindex $*.idx; xelatex $<
%.xdv: %.tex
	xelatex $<
%.html: %.tex
	latex2html -html_version 4.0,latin1,unicode $<

default: $(TARGET) $(CHAPTER)

debug: $(DEBUG)

clean:
	rm -f *.aux *.toc *.log *.out *.vrb *.nav *.snm *.ilg *.ind *.idx \
	*.dvi *xdv *.ps $(TARGET) $(DEBUG)
