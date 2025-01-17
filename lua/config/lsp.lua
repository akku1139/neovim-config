l = require'lspconfig'

--- TypeScript
-- npm: typescript typescript-language-server
l.ts_ls.setup{}

--- Svelte
-- npm: svelte-language-server
l.svelte.setup{}
-- let g： svelte_indent_script = 0
-- let g： svelte_indent_style = 0 

