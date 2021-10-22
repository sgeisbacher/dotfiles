let mapleader=' '

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
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

nnoremap <leader>f :GFiles<CR>

nnoremap \ "

nnoremap <C-i> <C-a>
nmap <C-d> <C-x>

nnoremap [ {
nnoremap ] }

nnoremap <leader>p :Format<CR>

nnoremap gb <C-^>
nnoremap <leader>d  :<C-u>CocList diagnostics<cr>

nnoremap <leader><leader> :nohlsearch<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>bd :ls<CR>:bdelete<Space>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bn :bn<CR>

nnoremap <leader>gn :GitGutterNextHunk<CR>
nnoremap <leader>gp :GitGutterPrevHunk<CR>
nnoremap <leader>gd :GitGutterPreviewHunk<CR>

" reopen last Ag-search
nmap <leader>fp :Ag<CR><C-P>
nmap <leader>ffp :Agf<CR><C-P>
" open Ag
nmap <leader>f :Ag<CR>
nmap <leader>ff :Agf<CR>

