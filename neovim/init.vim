call plug#begin('~/.vim/plugged')
  Plug 'fatih/vim-go'
  Plug 'tweekmonster/hl-goimport.vim', { 'for': 'go' }
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'for':'go'}
  Plug 'luochen1990/rainbow'
  Plug 'junegunn/vim-emoji'
  Plug 'tpope/vim-surround'   
  Plug 'ryanoasis/vim-devicons'
  Plug 'itchyny/lightline.vim'
  Plug 'josa42/vim-lightline-coc'
  Plug 'google/vim-colorscheme-primary'
  Plug 'joshdick/onedark.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end() 
syntax on
colorscheme onedark

    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
    let g:go_fmt_command = 'goimports'
    let g:go_test_timeout = '30s'
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
    "let g:go_auto_sameids = 1
    let g:go_snippet_engine = 'ultisnips'
    let g:go_doc_popup_window = 1
    let g:go_metalinter_command='golangci-lint'
    " gopls
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    "let g:go_debug=['lsp']
    " set to use coc.vim -> disable vim-go: GoDef short cut
    let g:go_def_mapping_enabled = 0
    let g:go_doc_keywordprg_enabled = 0
    let g:go_gopls_enabled = 0
    let g:go_gopls_options = ['-remote=auto']
    let g:go_fmt_autosave = 0
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }


  nmap <space>ed :CocCommand explorer --preset .vim<CR>
  nmap <space>ef :CocCommand explorer --preset floating<CR>
  nmap <space>ec :CocCommand explorer --preset cocConfig<CR>
  nmap <space>eb :CocCommand explorer --preset buffer<CR>
  " List all presets
  nmap <space>e :CocCommand explorer <cr>
  " Easier Moving
    map <C-J> <C-W>j<C-W>_
    map <C-K> <C-W>k<C-W>_
    map <C-L> <C-W>l<C-W>_
    map <C-H> <C-W>h<C-W>_
  nmap <space>ef :CocCommand explorer --preset floating<CR>

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> gh :call <SID>show_documentation()<CR>

 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction 
