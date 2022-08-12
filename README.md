Vim Sensible AutoComp
================

## Contents

-   [Introduction](#introduction)
-   [Dependencies](#dependencies)
-   [Installation](#installation)
    -   [Vim](#vim)
    -   [Neovim](#neovim)

## Introduction

I can’t tell you how many times I’ve went through an auto-completion
plugin only to be ultimately and inevitably disappointed. The common
problems they all share are:

-   They are too bloated.
-   They do not make use of Vim’s **built-in** completion functionality.
-   They require manual compilation because they use other languages.
-   They do not work for every language.
    -   You may need separate plugins for separate languages.

Mine literally solved all of these issues by giving a **reasonable**
auto-completion program. It takes less than twenty lines of code because
that is all that is needed. Here is how it works:

Omni-completion and tags in the current file  
If you are typing alphanumeric characters File location completion

If you are typing locations to files

That is how it **should** work. Also, there are no configuration options
because there does not need to be. It is sensible by default.

## Dependencies

-   [VimCompletesMe](https://github.com/ackyshake/VimCompletesMe)

## Installation

### Vim

``` sh
`# user` git clone https://github.com/amarakon/vim-sensible-autocomp ~/.vim/pack/vendor/start/vim-sensible-autocomp
```

### Neovim

``` sh
`# user` git clone https://github.com/amarakon/vim-sensible-autocomp ~/.local/share/nvim/site/pack/default/start/vim-sensible-autocomp
```
