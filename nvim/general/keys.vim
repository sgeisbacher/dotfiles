" meta-modifier: https://stackoverflow.com/a/27607327

let mapleader=' '

nnoremap <m-h> :wincmd h<CR>
nnoremap <m-l> :wincmd l<CR>
nnoremap <leader>vs :wincmd v<CR>
nnoremap <leader>ss :wincmd s<CR>
nnoremap > <C-w>>
nnoremap < <C-w><

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

vnoremap <Up> <nop>
vnoremap <Down> <nop>

nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j
nnoremap <Left> <C-w>h
nnoremap <Right> <C-w>l

nnoremap <m-o> :FZF<CR>
nnoremap <m-f> :GFiles<CR>

nnoremap \ "

nnoremap <C-i> <C-a>
nmap <C-d> <C-x>

nnoremap [ {
nnoremap ] }

nnoremap <m-f> :Format<CR>

nnoremap gb <C-^>
nnoremap <leader>d  :<C-u>CocList diagnostics<cr>

nnoremap <leader><leader> :nohlsearch<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>bd :ls<CR>:bdelete<Space>
nnoremap <m-p> :bp<CR>
nnoremap <m-n> :bn<CR>

nnoremap <m-j> :call GitGutterNextHunkCycle()<CR>
nnoremap <leader>hs :GitGutterStageHunk<CR>
nnoremap <leader>hn :GitGutterNextHunk<CR>
nnoremap <leader>hp :GitGutterPrevHunk<CR>
nnoremap <leader>hd :GitGutterPreviewHunk<CR>

" reopen last Ag-search
nmap <leader>fp :Ag<CR><C-P>
nmap <leader>ffp :Agf<CR><C-P>
" open Ag
nmap <leader>f :Ag<CR>
nmap <leader>ff :Agf<CR>

nnoremap <C-t> :NERDTreeToggle<CR>

function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction

