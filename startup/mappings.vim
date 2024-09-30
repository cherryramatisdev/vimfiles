nnoremap s <nop>
nnoremap Q <nop>

" Easily mark a single line in character-wise visual-mode
nnoremap vv _vg_

" <space>x -> :X
" For easier typing of custom commands
nnoremap <space> :call <SID>SpaceMapping(0)<cr>
xnoremap <space> :<c-u>call <SID>SpaceMapping(1)<cr>

function! s:SpaceMapping(visual)
  echo
  let l:c = nr2char(getchar())

  if a:visual
    normal! gv
  endif

  call feedkeys(':'.toupper(l:c))
endfunction

" Motion for "next/last object". For example, "din(" would go to the next "()" pair
" and delete its contents.
onoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
xnoremap an :<c-u>call <SID>NextTextObject('a', 'f')<cr>
onoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
xnoremap in :<c-u>call <SID>NextTextObject('i', 'f')<cr>
onoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
xnoremap al :<c-u>call <SID>NextTextObject('a', 'F')<cr>
onoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>
xnoremap il :<c-u>call <SID>NextTextObject('i', 'F')<cr>

function! s:NextTextObject(motion, dir)
  echo "Jump to next motion: "
  let c = nr2char(getchar())

  if c ==# "b"
    let c = "("
  elseif c ==# "B"
    let c = "{"
  elseif c ==# "d"
    let c = "["
  endif

  exe "normal! ".a:dir.c."v".a:motion.c
endfunction

" Always move through visual lines:
nnoremap <silent> j gj
nnoremap <silent> k gk
xnoremap <silent> j gj
xnoremap <silent> k gk

" Moving through tabs:
nnoremap <C-l> gt
nnoremap <C-h> gT

" Moving through splits:
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" Faster scrolling:
nnoremap <silent> J 5gj
nnoremap <silent> K 5gk
xnoremap <silent> J 5gj
xnoremap <silent> K 5gk

" Resize windows
nnoremap <left>  <c-w><
nnoremap <right> <c-w>>
nnoremap <up>    <c-w>-
nnoremap <down>  <c-w>+

" Reindent whole file
nnoremap ++ :call lib#InPlace("normal! gg=G")<cr>

" Completion remappings
inoremap <c-j> <c-n>
inoremap <c-k> <c-p>
inoremap <c-o> <c-x><c-o>
inoremap <c-u> <c-x><c-u>
inoremap <c-f> <c-x><c-f>
inoremap <c-l> <c-x><c-l>
set completefunc=syntaxcomplete#Complete

" Splitting and joining code blocks
nmap <silent> sj <Plug>SplitjoinSplit
nmap <silent> sk <Plug>SplitjoinJoin
" Execute normal vim join if in visual mode
xnoremap sk J

" Sideways: moving
nnoremap s< :SidewaysLeft<CR>
nnoremap s> :SidewaysRight<CR>

" Sideways: argument text object
omap <silent> aa <Plug>SidewaysArgumentTextobjA
xmap <silent> aa <Plug>SidewaysArgumentTextobjA
omap <silent> ia <Plug>SidewaysArgumentTextobjI
xmap <silent> ia <Plug>SidewaysArgumentTextobjI

" Sideways: add new argument
nmap ,si <Plug>SidewaysArgumentInsertBefore
nmap ,sa <Plug>SidewaysArgumentAppendAfter
nmap ,sI <Plug>SidewaysArgumentInsertFirst
nmap ,sA <Plug>SidewaysArgumentAppendLast

" Inline edit
nnoremap ,e :InlineEdit<cr>
xnoremap ,e :InlineEdit<cr>

" Split and execute any command:
nnoremap __ :split \|<Space>
" Tab-split and execute
nnoremap _t :tab split \|<Space>

" Open new tab more easily:
nnoremap ,t :tabnew<cr>
nnoremap ,T mt:tabedit %<cr>`tgT:quit<cr>

" Paste in insert and command modes
inoremap <c-v> <esc>pa
cnoremap <c-v> <c-r>"

" Quit tab, even if it's just one
nnoremap <silent> QQ :call <SID>QQ()<cr>
function! s:QQ()
  for l:bufnr in tabpagebuflist()
    if bufexists(l:bufnr)
      let l:winnr = bufwinnr(l:bufnr)
      exe l:winnr.'wincmd w'
      quit
    endif
  endfor
endfunction

" NERD Tree:
nnoremap gn :NERDTreeToggle<cr>
nnoremap gN :NERDTree<cr>

nnoremap <leader>f :NERDTreeFind<cr>

" Toggle quickfix
" NOTE: can't use :cwindow, only closes if there's nothing there.
" NOTE: probably doesn't handle location list well
nnoremap <silent> go :call <SID>ToggleQuickfix()<cr>
function! s:ToggleQuickfix()
  for n in range(1, winnr('$'))
    if getwinvar(n, '&buftype') == 'quickfix'
      " quickfix buffer found in tab, close
      cclose
      return
    endif
  endfor

  " no quickfix found, open it
  copen
endfunction

" Like "*", but for multiple files
nnoremap s* :call <SID>SearchWord(expand('<cword>'))<cr>
function! s:SearchWord(word)
  let position = getpos('.')
  let active_window = winnr()

  exe 'Ack \b'.a:word.'\b'

  exe active_window.'wincmd w'
  cclose

  let qflist = getqflist()

  if len(qflist) == 0
    " nevermind, nothing was found (probably impossible)
    return
  endif

  let active_item = qflist[0]
  let active_index = 0

  if len(qflist) > 1 && position == getpos('.')
    " this is the place we started from, jump to the next one
    let active_index = 1
    silent cnext
  endif

  echo "Ack: Result ".(active_index + 1)." of ".len(qflist)
endfunction

" Show last search in quickfix (http://travisjeffery.com/b/2011/10/m-x-occur-for-vim/)
nnoremap g/ :vimgrep /<C-R>//j %<CR>\|:cw<CR>

" Quickly switch between / and ? when searching
cnoremap <expr> <c-l> <SID>CmdlineToggle()
function! s:CmdlineToggle() abort
  let command_type = getcmdtype()
  if command_type != '/' && command_type != '?'
    return ''
  endif

  let command_line     = getcmdline()
  let command_line_pos = getcmdpos()
  let other_mode       = (command_type == '/') ? '?' : '/'

  let search_command   = "\<c-c>"..other_mode..command_line
  let position_command = "\<home>"..repeat("\<right>", command_line_pos - 1)

  call feedkeys(search_command..position_command, 'n')
  return ''
endfunction

" Delete left-hand side of assignment
nnoremap d= df=x
nnoremap c= df=xi

" Text object for the visible screen
onoremap a+ :<c-u>normal! HVL<cr>
xnoremap a+ :<c-u>normal! HVL<cr>

" Yank current directory path
nnoremap gy :call <SID>YankDir()<cr>
function! s:YankDir()
  let current_dir = getcwd()
  call setreg(v:register, current_dir)
  echomsg 'Yanked "'.current_dir.'" to clipboard ("'.v:register.')'
endfunction

" Tabularize mappings
" For custom Tabularize definitions see after/plugin/tabularize.vim
nnoremap sa      :call <SID>Tabularize(0)<cr>
xnoremap sa :<c-u>call <SID>Tabularize(1)<cr>
function! s:Tabularize(visual)
  let saved_cursor = getpos('.')

  echohl ModeMsg | echo "-- ALIGN -- "  | echohl None
  let char = nr2char(getchar())

  if     char == '=' | let alignment = 'equals'
  elseif char == '>' | let alignment = 'ruby_hash'
  elseif char == ',' | let alignment = 'commas'
  elseif char == ':' | let alignment = 'colons'
  elseif char == ' ' | let alignment = 'space'
  else
    " just try aligning by the character
    let char = escape(char, '/.')
    let alignment = '/'.char
  endif

  if a:visual
    exe "'<,'>Tabularize ".alignment
  else
    exe 'Tabularize '.alignment
  endif

  echo
  call setpos('.', saved_cursor)
endfunction

" Tabularize "reset" -- removes all duplicate whitespace
nnoremap s= :call <SID>TabularizeReset()<cr>
xnoremap s= :call <SID>TabularizeReset()<cr>
function! s:TabularizeReset()
  let original_cursor = getpos('.')

  s/\S\zs \+/ /ge
  call histdel('search', -1)
  let @/ = histget('search', -1)

  call setpos('.', original_cursor)
endfunction

let g:ctrlp_map = '<c-f>'
