" This file will not be loaded when nvim starts

" Escape from Terminal with <ESC>
tnoremap <ESC> <c-\><c-n><Plug>(esc)
nnoremap <Plug>(esc)<ESC> i<ESC>

" Default Terminal mode
autocmd TermOpen * startinsert

" File manager
"Neotree show

" Line number
"set number

" Keybinds
map <space>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>
