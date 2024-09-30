packadd matchit

" NERDTree:
let g:NERDTreeHijackNetrw = 0

" Don't map over J and K
let g:NERDTreeMapJumpFirstChild = '-'
let g:NERDTreeMapJumpLastChild  = '-'

" Don't care about cd-ing to the cwd
let g:NERDTreeMapCWD = '-'

" The 's' key is a prefix for a lot of things
let g:NERDTreeMapOpenVSplit = 'so'

" I use 'go' for something else and don't use it in the NERDTree
let g:NERDTreeMapPreview = '-'

" Splitjoin:
let g:splitjoin_split_mapping                           = ''
let g:splitjoin_join_mapping                            = ''
let g:splitjoin_normalize_whitespace                    = 1
let g:splitjoin_align                                   = 1
let g:splitjoin_ruby_hanging_args                       = 0
let g:splitjoin_trailing_comma                          = 1
let g:splitjoin_handlebars_closing_bracket_on_same_line = 1
let g:splitjoin_handlebars_hanging_arguments            = 1
let g:splitjoin_python_brackets_on_separate_lines       = 1

" Inline edit:
let g:inline_edit_autowrite  = 1
let g:inline_edit_proxy_type = 'tempfile'

" Ack.vim
let g:ackprg = 'rg --vimgrep'
let g:ack_apply_qmappings = 0
let g:ack_apply_lmappings = 0

" Markdown
let g:markdown_fenced_languages = ['ruby', 'vim', 'rust', 'bash', 'python', 'typescript', 'javascript']

" surround.vim
xmap s S

" Writable search
let g:writable_search_backends = ['ack.vim']
let g:writable_search_confirm_file_rename = 0
let g:writable_search_confirm_directory_creation = 0

" Ack:
let g:ack_use_dispatch = 1
