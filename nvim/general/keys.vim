" meta-modifier: https://stackoverflow.com/a/27607327

let mapleader=' '

" yank to clipboard
vnoremap <leader>y "+y
" yank to register b
nnoremap yb "byy
vnoremap yb "byy
nnoremap bp "bp
" yank to register c
nnoremap yc "cyy
vnoremap yc "cyy
nnoremap cp "cp

nnoremap <leader>vs :wincmd v<CR>
nnoremap <leader>ss :wincmd s<CR>
nnoremap > <C-w>>
nnoremap < <C-w><

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

vnoremap <Up> <nop>
vnoremap <Down> <nop>

" nnoremap <Up> <C-w>k
" nnoremap <Down> <C-w>j
" nnoremap <Left> <C-w>h
" nnoremap <Right> <C-w>l

nnoremap <m-o> :FZF<CR>
nnoremap <m-f> :GFiles<CR>

nnoremap \ "

nnoremap <C-i> <C-a>
nmap <C-d> <C-x>

nnoremap [ {
nnoremap ] }

nnoremap <m-f> :Format<CR>

nnoremap <leader><leader> :nohlsearch<CR>

vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

nnoremap <leader>b :ls<CR>:b<Space>
nnoremap <leader>bd :ls<CR>:bdelete<Space>
nnoremap <m-l> :bp<CR>
nnoremap <m-h> :bn<CR>

nnoremap <m-n> :call GitGutterNextHunkCycle()<CR>
nnoremap <m-p> :GitGutterPrevHunk<CR>
nnoremap <leader>hs :GitGutterStageHunk<CR>
nnoremap <leader>hn :GitGutterNextHunk<CR>
nnoremap <leader>hp :GitGutterPrevHunk<CR>
nnoremap <leader>hd :GitGutterPreviewHunk<CR>

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <m-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <leader>n <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <leader>p <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <S-e> <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> <m-e> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

" autocomplete (compe) 
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" reopen last Ag-search
nmap <leader>fp :Ag<CR><C-P>
nmap <leader>ffp :Agf<CR><C-P>
" open Ag
nmap <leader>f :Ag<CR>
nmap <leader>ff :Agf<CR>

" legacy
"nnoremap <C-t> :NERDTreeToggle<CR>

" toggle Nerdtree and open the current folder
function! ToggleNerdTree()
    if exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1
        execute ":NERDTreeClose"
    else
        execute ":NERDTreeFind"
    endif
endfunction

nnoremap <C-t> :call ToggleNerdTree()<CR>

function! GitGutterNextHunkCycle()
  let line = line('.')
  silent! GitGutterNextHunk
  if line('.') == line
    1
    GitGutterNextHunk
  endif
endfunction


nnoremap <leader>b :ToggleBlameLine<CR>
