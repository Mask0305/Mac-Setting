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
  Plug 'uarun/vim-protobuf'
  
  " FZF
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
  Plug 'antoinemadec/coc-fzf', {'branch': 'release'}
  Plug 'preservim/nerdcommenter'
  call plug#end() 
  " 開啟語法高亮
  syntax on
  " 開啟行號
  set number
  " 高亮所在行
  set cursorline
  " 底部狀態列
  set laststatus=2
  set colorcolumn=93
  
  "允許使用複製貼上
  set clipboard=unnamed         

  " 使用色系
  colorscheme onedark
  let mapleader =','
  let maplocalleader = '_'

  " 括弧彩虹
  let g:rainbow_active = 1

  " Go的設定
    let g:go_fmt_command = "goimports"
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_structs = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1
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

" 儲存同時引入包
  nmap <space>w :w <bar> :GoImports <CR>
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

  " fzf preview
  nmap <Leader>f [fzf-p]
  xmap <Leader>f [fzf-p]

  nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
  nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
  nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
  nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
  nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
  nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
  nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
  nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
  nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
  nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
  nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
  xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
  nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
  nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
  nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
  " 查詢實做
    nnoremap <silent> <space>i    :<C-u>CocCommand fzf-preview.CocImplementations<CR>
  
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

" Using CocFzFList
  nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
  " 顯示所有的問題診斷
  nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics <CR>
  " 顯示所有的問題診斷 在這個檔案
  nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
  " 顯示所有指令
  nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
  " 顯示所有插件
  nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
  "nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
  " 取得該檔案的 outline
  nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
  nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
  nnoremap <silent> <space>g       :<C-u>CocFzfList --normal gstatus<CR>
  " Resume latest coc listå
  nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>

