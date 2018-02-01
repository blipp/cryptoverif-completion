# Line Editing, History and Basic Completion for CryptoVerif's Interactive Mode

Using the ‘readline wrapper’ [`rlwrap`](https://github.com/hanslub42/rlwrap)
we can introduce line editing, history and also some very basic
completion support to the interactive mode in
[CryptoVerif](http://prosecco.gforge.inria.fr/personal/bblanche/cryptoverif/)
without the need to modify CryptoVerif itself. The completion is therefore
very basic and has no context at all.

To use it, run `cryptoverif` preceeded with `rlwrap`.

## Line Editing and Non-Persistent History
Simply run
```bash
rlwrap cryptoverif some_file.cv
```

## Line Editing and Persistent History
Giving an absolute filename leads to a shared history between all
CryptoVerif calls, a relative filename only to a shared history between
all calls in the same directory.
```bash
rlwrap --history-filename ~/.rlwrap_hist_cryptoverif cryptoverif some_file.cv
```

## Adding Completion
For use with the basic completion feature of `rlwrap` we prepared a file
containing all possible keywords, commands, parameters, and the
equivalences defined in `default.cvl`.

Please note that this completion does not have any context.

### Copy Completion File to Home Directory
To install the completion file to a hidden
file in your home directory you can use
```bash
make install
```

### Use Completion
The full command to use CryptoVerif with this feature is
```bash
rlwrap --history-filename ~/.rlwrap_hist_cryptoverif --break-chars "(){}[],+=&^%$#@"";|\\" --file ~/.rlwrap_cryptoverif_completion.conf cryptoverif some_file.cv
```

### Adding an Alias in Your Shell
Because this is quite long we suggest adding an alias to your shell
configuration. In ZSH this can look like this:

```bash
# --break-chars is just the default without ' and - because they are
# part of some chunks we want to complete
alias cryptoverif='rlwrap --history-filename ~/.rlwrap_hist_cryptoverif --break-chars "(){}[],+=&^%$#@"";|\\" --file ~/.rlwrap_cryptoverif_completion.conf cryptoverif'
```

### Changing Completion Chunks
The file
`rlwrap_cryptoverif_completion_with_comments.conf` contains the chunks
with some comments where they have been found in CryptoVerif's code or
in the manual. These comments must be removed, otherwise `rlwrap` will
pick them up as completion chunks, which is why there is the file
`rlwrap_cryptoverif_completion.conf`.

If you ever change something in
`rlwrap_cryptoverif_completion_with_comments.conf` you can produce the
file without comments by using:
```bash
make all
```

And then copy it to the right destination with
```bash
make install
```
