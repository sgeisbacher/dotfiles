nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4.. --history=/tmp/fzf.hist'}, <bang>0)
command! -bang -nargs=* Agf call fzf#vim#ag(<q-args>, {'options': '--history=/tmp/fzf.hist'}, <bang>0)

let g:fzf_layout = { 'down': '~40%' }
