let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\}

let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'typescript': ['tsserver', 'eslint'],
\   'typescriptreact': ['tsserver', 'eslint'],
\   'javascript': ['tsserver', 'eslint'],
\   'javascriptreact': ['tsserver', 'eslint'],
\}

fun! s:MapForAle(cmd)
  execute 'autocmd FileType '.g:ale_linters->keys()->join(',').' '.a:cmd
endfun

call s:MapForAle('setlocal omnifunc=ale#completion#OmniFunc')
call s:MapForAle('nnoremap <c-]> :ALEGoToDefinition<cr>')
call s:MapForAle('nnoremap K :ALEHover<cr>')
call s:MapForAle('nnoremap gra :ALECodeAction<cr>')
call s:MapForAle('nnoremap grn :ALERename<cr>')
call s:MapForAle('nnoremap grr :ALEFindReferences<cr>')
call s:MapForAle('nnoremap ]d :ALENext<cr>')
call s:MapForAle('nnoremap [d :ALEPrevious<cr>')
