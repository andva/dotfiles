" Removes vi-compatibility (mandatory !)
set nocp

" Pathogen conf
filetype off
execute pathogen#infect()

" File types and coloration have to be set here
syntax on
filetype plugin on
filetype indent on

set background=dark
