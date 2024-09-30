set nocompatible

scriptversion 4

call pathogen#infect()
call pathogen#helptags()

filetype plugin on
filetype indent on
syntax on

colo andrew

runtime startup/settings.vim
runtime startup/mappings.vim
runtime startup/acp.vim
runtime startup/plugins.vim

runtime! andrews_nerdtree/plugin.vim
runtime! nerdtree/plugin.vim
