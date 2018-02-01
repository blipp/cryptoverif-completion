.PHONY: all clean install

all: rlwrap_cryptoverif_completion.conf

rlwrap_cryptoverif_completion.conf: rlwrap_cryptoverif_completion_with_comments.conf
#	Attention: the two dollar signs ($$) serve to get a single $
	sed -e 's/#.*$$//' -e '/^$$/d' rlwrap_cryptoverif_completion_with_comments.conf > rlwrap_cryptoverif_completion.conf

install: rlwrap_cryptoverif_completion.conf
	cp -i rlwrap_cryptoverif_completion.conf $(HOME)/.rlwrap_cryptoverif_completion.conf

clean:
	rm rlwrap_cryptoverif_completion.conf
