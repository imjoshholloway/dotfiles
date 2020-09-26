let g:go_fmt_command = 'goimports'
let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1

let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1

" disable vim-go :GoDef short cut (gd)
" this is handled by our LanguageClient [LC] (coc.nvim)
let g:go_def_mapping_enabled = 0
