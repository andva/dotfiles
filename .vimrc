" Removes vi-compatibility (mandatory !)
set nocp

" Pathogen conf
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" File types and coloration have to be set here
syntax on
filetype plugin on
filetype indent on

set background=dark
