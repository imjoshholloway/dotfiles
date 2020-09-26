" enable tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#tabs_label = ''

" disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''

" just show the file name
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#formatter = 'unique_tail'

" enable powerline fonts
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" coc integration
let g:airline#extensions#coc#enabled = 1

let g:airline_theme = 'onedark'

set showtabline=2   " always show tabs
set noshowmode      " we don't need to see things like -- INSERT -- anymore

" Sections
" let g:airline_section_c = ''
" let g:airline_section_a = ''
let g:airline_section_y = ''
let g:webdevicons_enable_airline_tabline = 1
