" set colors for inactive and active splits
"hi ActiveWindow ctermbg=16 | hi InactiveWindow guibg=#474747 guifg=#C0C0C0
hi ActiveWindow ctermbg=16 | hi InactiveWindow guifg=#888888 
set winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow


augroup DimInactiveWindows
    au!
    au WinEnter * :ownsyntax on
    au WinEnter * set signcolumn=yes
    au WinEnter * set cursorline
"    au WinEnter * :GitGutterSignsEnable
    au WinLeave * set nocursorline
    au WinLeave * :ownsyntax off
    au WinLeave * set signcolumn=no
  augroup END

"autocmd FileType * :GitGutterSignsEnable
