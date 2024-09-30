let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'javascript': ['prettier'],
\   'javascriptreact': ['prettier'],
\}

let g:ale_fix_on_save = 1

let g:ale_linters = {
\   'typescript': ['tsserver'],
\   'typescriptreact': ['tsserver'],
\   'javascript': ['tsserver'],
\   'javascriptreact': ['tsserver'],
\}

fun! s:MapForAle(cmd)
  execute 'autocmd FileType '.g:ale_linters->keys()->join(',').' '.a:cmd
endfun

call s:MapForAle('setlocal omnifunc=ale#completion#OmniFunc')
call s:MapForAle('nnoremap <c-]> :ALEGoToDefinition<cr>')
call s:MapForAle('nnoremap K :ALEHover<cr>')
call s:MapForAle('nnoremap gra :ALECodeAction<cr>')
call s:MapForAle('nnoremap grn :ALEFindReferences<cr>')
call s:MapForAle('nnoremap grr :ALERename<cr>')
