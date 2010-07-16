" Default configuration file for Vim
" Written by Aron Griffis <agriffis@gentoo.org>
" Modified by Ryan Phillips <rphillips@gentoo.org>
" Modified some more by Ciaran McCreesh <ciaranm@gentoo.org>
" Added Redhat's vimrc info by Seemant Kulleen <seemant@gentoo.org>

set nocompatible        " Use Vim defaults (much better!)
set bs=2                " Allow backspacing over everything in insert mode
set nohlsearch
set novisualbell
set history=50          " keep 50 lines of command history
set ruler               " Show the cursor position all the time
set showmode
set autoindent
set loadplugins

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

if v:lang =~ "^ko"
  set fileencodings=euc-kr
  set guifontset=-*-*-medium-r-normal--16-*-*-*-*-*-*-*
elseif v:lang =~ "^ja_JP"
  set fileencodings=euc-jp
  set guifontset=-misc-fixed-medium-r-normal--14-*-*-*-*-*-*-*
elseif v:lang =~ "^zh_TW"
  set fileencodings=big5
  set guifontset=-sony-fixed-medium-r-normal--16-150-75-75-c-80-iso8859-1,-taipei-fixed-medium-r-normal--16-150-75-75-c-160-big5-0
elseif v:lang =~ "^zh_CN"
  set fileencodings=gb2312
  set guifontset=*-r-*
endif
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=utf-8,latin1
endif

" Don't use Ex mode, use Q for formatting
map Q gq

syntax on

filetype plugin on
filetype indent on

colorscheme zellner

noremap <C-h> :ta <C-R>=expand("<cword>")<CR><CR>

au BufRead,BufNewFile *.als setfiletype alloy4

source ~/.vimnet/dirmode.vim

