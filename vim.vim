" This file will not be loaded when nvim starts

" Escape from Terminal with <ESC>
tnoremap <ESC> <c-\><c-n><Plug>(esc)
nnoremap <Plug>(esc)<ESC> i<ESC>

" Default Terminal mode
autocmd TermOpen * startinsert

" https://qiita.com/Lennon_x00x_/items/e8fa47d27aaab9635161
"autocmd TermOpen * setlocal norelativenumber
"autocmd TermOpen * setlocal nonumber

" File manager
"Neotree show

" Line number
"set number

" Keybinds
map <space>e :lua vim.diagnostic.open_float(0, {scope="line"})<CR>
