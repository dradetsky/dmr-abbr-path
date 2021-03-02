dmr-abbr-path
=============

Abbreviate path, for use in zsh prompts.

Shamelessly stolen from https://github.com/felixgravila/zsh-abbr-path/

Usage
-----

Just put `$(dmr_abbr_path)` in zsh prompts & whatnot.

You can set the number of chars per abbreviated path component with 

```
ZSH_ABBR_PWD_PATH_COMP_SIZE=2
```

Setting it to 1 makes it work like felix's version.

Realistically, the 1 and the default value of 2 are the only ones worth using. I
maybe didn't think it through. Oh well.
