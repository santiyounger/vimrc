"2020-10-26 21:28
"" pasted on manjaro from notes 200519 
""last modification 200527

"""....        _____ ___    _   ____________
"""....       / ___//   |  / | / /_  __/  _/
"""....       \__ \/ /| | /  |/ / / /  / /
"""....      ___/ / ___ |/ /|  / / / _/ /
"""....     /____/_/  |_/_/ |_/ /_/ /___/
"""....__  ______  __  ___   __________________
"""....\ \/ / __ \/ / / / | / / ____/ ____/ __ \
""".... \  / / / / / / /  |/ / / __/ __/ / /_/ /
""".... / / /_/ / /_/ / /|  / /_/ / /___/ _, _/
"""..../_/\____/\____/_/ |_/\____/_____/_/ |_|




let mapleader =" "

""".... Some basics:
set nocompatible
filetype plugin on
syntax on
"""....colorscheme wal
set encoding=utf-8
set number
set relativenumber


""".... Load Pathogen for plugins:
" I don't need this anymore
"execute pathogen#infect()
"syntax on
"filetype plugin indent on

"""....Plug in manager note:20200205121733

call plug#begin('~/local/share/nvim/plugged')

" for searching vim shortcuts
" https://github.com/sunaku/vim-shortcut

Plug 'sunaku/vim-shortcut'

Plug 'godlygeek/tabular'

"""....Markdown plug-ins note:20200121212143
"""....Visual goyo mode
Plug 'junegunn/goyo.vim'

Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-markdown'
Plug 'reedes/vim-pencil'


"""....Markdown Preview

" Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

""".... Dim paragraphs above and below the active paragraph.
Plug 'junegunn/limelight.vim'

""".... Nerd Tree plugins
Plug 'scrooloose/nerdtree'

"""....multiple cursor for visual mode

Plug 'terryma/vim-multiple-cursors'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

"""....Surround tags for html, css, normal quotation, brakets etc

Plug 'tpope/vim-surround'

""".... Luke Smith IPA

Plug 'LukeSmithxyz/vimling'

""".... Vim wiki
"""....
Plug 'vimwiki/vimwiki', { 'tag': 'v2.4.1' }

"""....Calendar

Plug 'itchyny/calendar.vim'

"""....Checklist

Plug 'evansalter/vim-checklist'

"""....Vim Repeat
"""....
Plug 'tpope/vim-repeat'

Plug 'christoomey/vim-system-copy'

Plug 'tpope/vim-commentary'

" Vim zettlekasten + fzf for vim (which might be repeated)

Plug 'junegunn/fzf.vim'
Plug 'michal-h21/vim-zettel'

" This is a complement for vim zettle

Plug 'https://github.com/alok/notational-fzf-vim'

" For finding a vim file within ranger with <leader>f 
" it might be the cause of vimwiki failing at times

Plug 'francoiscabrol/ranger.vim'

Plug 'dhruvasagar/vim-table-mode'


call plug#end()

""""....Markdown to HTML
nmap <leader>mh :%! pandoc -f markdown -t html <cr>


""""....HTML to Md
nmap <leader>hm :%! pandoc -f html -t markdown <cr>


""""....Markdown to rtf
nmap <leader>mr :%! pandoc -f markdown -t rtf <cr>

""""....Markdown to rtf
nmap <leader>rm :%! pandoc -f rtf -t markdown <cr>


""""....Markdown to HTML
nmap <leader>mh :%! pandoc -f markdown -t html <cr>

""""....Markdown to latex
nmap <leader>ml :%! pandoc -f markdown -t latex <cr>

""""....latex to markdown
nmap <leader>lm :%! pandoc -f latex -t markdown <cr>

""""....latex to html
nmap <leader>lh :%! pandoc -f latex -t html  <cr>




"""""" SENT SLIDE PRESENTATION

""""....sent
nmap <leader>s :w!<CR>:!sent <c-r>%<CR><CR>

""""....""".... .............................................................................
"""".... iamcco/markdown-preview.nvim
"""".... .............................................................................

""""....""".... .............................................................................
"""".... iamcco/markdown-preview Config
"""".... .............................................................................

"""".... set to 1, nvim will open the preview window after entering the markdown buffer
"""".... default: 0
let g:mkdp_auto_start = 0

"""".... set to 1, the nvim will auto close current preview window when change
"""".... from markdown buffer to another buffer
"""".... default: 1
let g:mkdp_auto_close = 1

"""".... set to 1, the vim will refresh markdown when save the buffer or
"""".... leave from insert mode, default 0 is auto refresh markdown as you edit or
"""".... move the cursor
"""".... default: 0
let g:mkdp_refresh_slow = 0

"""".... set to 1, the MarkdownPreview command can be use for all files,
"""".... by default it can be use in markdown file
"""".... default: 0
let g:mkdp_command_for_global = 0

"""".... set to 1, preview server available to others in your network
"""".... by default, the server listens on localhost (127.0.0.1)
"""".... default: 0
let g:mkdp_open_to_the_world = 0

"""".... use custom IP to open preview page
"""".... useful when you work in remote vim and preview on local browser
"""".... more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
"""".... default empty
let g:mkdp_open_ip = ''

"""".... specify browser to open preview page
"""".... default: ''
let g:mkdp_browser = ''

"""".... set to 1, echo preview page url in command line when open preview page
"""".... default is 0
let g:mkdp_echo_preview_url = 0

"""".... a custom vim function name to open preview page
"""".... this function will receive url as param
"""".... default is empty
let g:mkdp_browserfunc = ''

"""".... options for markdown render
"""".... mkit: markdown-it options for render
"""".... katex: katex options for math
"""".... uml: markdown-it-plantuml options
"""".... maid: mermaid options
"""".... disable_sync_scroll: if disable sync scroll, default 0
"""".... sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
""""....   middle: mean the cursor position alway show at the middle of the preview page
""""....   top: mean the vim top viewport alway show at the top of the preview page
""""....   relative: mean the cursor position alway show at the relative positon of the preview page
"""".... hide_yaml_meta: if hide yaml metadata, default is 1
"""".... sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }


"""".... use a custom markdown style must be absolute path
let g:mkdp_markdown_css = '~/Dropbox/Santi-Younger/website/html/0.3light.css'

"""".... use a custom highlight style must absolute path
let g:mkdp_highlight_css = '~/Dropbox/Santi-Younger/website/html/0.3light.css'

"""".... use a custom port to start server or random for empty
let g:mkdp_port = ''

"""".... preview page title
"""".... ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

""""....""".... .............................................................................
"""".... Markdown preview mapping
"""".... .............................................................................


map <leader>mp :MarkdownPreview<CR>



"""""....""".... .............................................................................
"""""....instant markdown preview 
""""".... .............................................................................

"filetype plugin on
"""""....Uncomment to override defaults:
"""""....let g:instant_markdown_slow = 1
"""""....AUTOSTART
"let g:instant_markdown_autostart = 0
"""""....let g:instant_markdown_open_to_the_world = 1
"""""....let g:instant_markdown_allow_unsafe_content = 1
"""""....let g:instant_markdown_allow_external_content = 0
"""""....let g:instant_markdown_mathjax = 1
"""""....let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
""let g:instant_markdown_autoscroll = 0
"""""....let g:instant_markdown_port = 8888
"""""....let g:instant_markdown_python = 1

"let g:instant_markdown_browser = "firefox --new-window"

"map <leader>im :InstantMarkdownPreview<CR>
""""....""".... .............................................................................
"""".... Disable arrow keys  practice hjkl
"""".... .............................................................................
""""....

 noremap  <Up> """...."""....
 noremap! <Up> <Esc>
 noremap  <Down> """...."""....
 noremap! <Down> <Esc>
 noremap  <Left> """...."""....
 noremap! <Left> <Esc>
 noremap  <Right> """...."""....
 noremap! <Right> <Esc>
""""....
""""....

""""....""".... .............................................................................
""""....Pencil plug in 
"""".... .............................................................................
""""....
set rtp+=~/.fzf



""""....""".... .............................................................................
"""".... Change Case to Upper case
"""".... .............................................................................

function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv


""""....""".... .............................................................................
"""".... Goyo Dimensions
"""".... .............................................................................

""""....""".... .............................................................................
"""".... Goyo set up
"""".... .............................................................................

"""".... Goyo plugin makes text more readable when writing prose:
map <leader>g :Goyo <CR>

""""....""".... .............................................................................
"""".... Goyo set up
"""".... .............................................................................
" COMMENTED THIS OUT TO SEE IF IT INTERFERES WITH VIM FOLD

" function! s:goyo_enter()
"   if executable('tmux') && strlen($TMUX)
"     silent !tmux set status off
"     silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
"   endif
"   set noshowmode
"   set noshowcmd
"   set scrolloff=999
" endfunction

  " Limelight
  """.... ...

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  """.... ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()


""""....""".... .............................................................................
"""".... IPA and special characters set up Luke
""""....  .............................................................................
""""....
" nm <leader><leader>d :call ToggleDeadKeys()<CR>
" imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a
" nm <leader><leader>i :call ToggleIPA()<CR>
" imap <leader><leader>i <esc>:call ToggleIPA()<CR>a
" nm <F8> :call ToggleProse()<CR>


""""....""".... .............................................................................
"""".... Limelight maping keys 
""""....  .............................................................................
""""....
nmap <Leader>l <Plug>(Limelight)
xmap <Leader>l <Plug>(Limelight)

""""....""".... .............................................................................
"""".... Limelight maping keys 
""""....  .............................................................................
""""....
"""".... Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

"""".... Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

"""".... Default: 0.5
let g:limelight_default_coefficient = 0.7

"""".... Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

"""".... Beginning/end of paragraph
""""....   When there's no empty line between the paragraphs
""""....   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

"""".... Highlighting priority (default: 10)
""""....   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1


"""".... Goyo Vim Integration
"""".... ...................
""""....
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


""""....""".... .............................................................................
""""....  Vim wiki
""""....  .............................................................................
""""....
""""....set nocompatible
filetype plugin on
syntax on

""""".... vimwiki with markdown support
"let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
""""".... helppage -> :h vimwiki-syntax

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
"""""....
""""....""".... .............................................................................
""""....  Pencil pencil
""""....  .............................................................................
""""....

map <leader>ps :PencilSoft <CR>

map <leader>ph :PencilHard <CR>

""""....""".... .............................................................................
"""".... Checklist
"""".... .............................................................................
""""....

imap -c - [ ] 
nnoremap <leader>ct :ChecklistToggleCheckbox<cr>
nnoremap <leader>ce :ChecklistEnableCheckbox<cr>
nnoremap <leader>cd :ChecklistDisableCheckbox<cr>
vnoremap <leader>ct :ChecklistToggleCheckbox<cr>
vnoremap <leader>ce :ChecklistEnableCheckbox<cr>
vnoremap <leader>cd :ChecklistDisableCheckbox<cr>
""""....""".... .............................................................................
"""".... Fuzzy finder FZF
"""".... .............................................................................
""""....

nnoremap <leader>fz :FZF<cr>

"""".... .............................................................................
"""".... Spanish tildes + ~n 
"""".... .............................................................................
""""....
imap `a á
imap `A Á
imap `e é
imap `E É
imap `i í
imap `I Í
imap `o ó
imap `O Ó
imap `u ú
imap `U Ú
imap `n ñ
imap `N Ñ

"""".... ............................................
"""".... Spanish tildes + ~n 
"""".... ............................................

"""".... Esperanto
imap `h ĥ
imap `H Ĥ
imap `C Ĉ
imap `c ĉ
imap `G Ĝ
imap `g ĝ
imap `J Ĵ
imap `j ĵ
imap `S Ŝ
imap `s ŝ
imap ~U Ŭ
imap ~u ŭ

" """.... ............................................
" """.... Vim system clipboard https://github.com/christoomey/vim-system-copy
" """.... ............................................

" let g:system_copy#copy_command='xclip -sel clipboard'
" let g:system_copy#paste_command='xclip -sel clipboard -o'
let g:system_copy_silent = 1

" """.... ............................................
" """    Vim zettlekasten configurations
" """.... ............................................
"
" Filename format. The filename is created using strftime() function
let g:zettel_format = "%y%m%d-%H%M"
" command used for VimwikiSearch 
" possible values: "ag", "rg", "grep"
" let g:zettel_fzf_command = "ag"
" Disable default keymappings
let g:zettel_default_mappings = 0 
" This is basically the same as the default configuration
augroup filetype_vimwiki
  autocmd!
  autocmd FileType vimwiki imap <silent> [[ [[<esc><Plug>ZettelSearchMap
  autocmd FileType vimwiki nmap T <Plug>ZettelYankNameMap
  ".............. I hid this mapping below so that it doesn't interfere with vim folds
  " autocmd FileType vimwiki xmap z <Plug>ZettelNewSelectedMap
  autocmd FileType vimwiki nmap gZ <Plug>ZettelReplaceFileWithLink
augroup END

"""""" Settings for Vimwiki
"""""" comment line below to disable links
 let g:vimwiki_list = [{'path':'~/scratchbox/vimwiki/markdown/','ext':'.md','syntax':'markdown', 'zettel_template': "~/mytemplate.tpl"}, {"path":"~/scratchbox/vimwiki/wiki/"}]

"""""" Set template and custom header variable for the second Wiki
"""""" comment line below to disable links
let g:zettel_options = [{},{"front_matter" : {"tags" : ""}, "template" :  "~/mytemplate.tpl"}]

" """.... ............................................
" """    Vim zettlekasten configurations
" """.... ............................................
" example
let g:nv_search_paths = ['~/Dropbox/plain-text-notes/20200524-notes-wiki/1-Notes-wiki']

" """.... ............................................
" """   notational-fzf
" """.... ............................................

nnoremap <silent> <c-s> :NV<CR>
nnoremap <leader>nv :NV<cr>


" """.... ............................................
" """ set stylesheet tag
" """.... ............................................
imap !s <head><link rel="stylesheet" type="text/css" href="../../../Santi-Younger/website/html/0.3light.css"></head>

" """.... ............................................
" """ set stylesheet tag
" """.... ............................................

imap ,b <br><CR>
imap ,br <br><br>

"""".... ............................................
"""" fold method
""""".... ............................................
""" settings from this video https://www.youtube.com/watch?v=pnc9_d1k5-4

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"""".... ............................................
" """ SHORTCUT VIM PLUG IN https://github.com/sunaku/vim-shortcut 
" " """.... ............................................

" Shortcut show shortcut menu and run chosen shortcut
      noremap <Leader>sh :Shortcuts<Return>

" Shortcut fallback to shortcut menu on partial entry
      noremap <Leader>sh! :Shortcuts<Return>

" """.... ............................................
" """ EPUB http://bit.ly/3aidcbV
" """.... ............................................

" INTEGREATED WAY TO CONVERT EPUBS
au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

" """.... ............................................
" """ Visual split http://bit.ly/3czcBVf
" """.... ............................................

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" """.... ............................................
" """ set stylesheet tag
" """.... ............................................
imap !t \addcontentsline{toc}{chapter}


" """.... ............................................
" """ Latex syntax
" """.... ............................................
imap !c \chapter{}

" """.... ............................................
" """ Footnote vim
" """.... ............................................
imap !f [^fn1]
imap !fn [^fn1]:

" """.... ............................................
" """ vim paste http://bit.ly/3cXRoVg Mikowski
" """.... ............................................

nmap <leader>p :r !xsel --clipboard --output

" """.... ............................................
" """  steno vim http://bit.ly/2UhZwHN
" """.... ............................................


  " Move lines up/down using alt j/k when iTerm is set to:
  " Left option (⌥) key acts as Normal
  " In mapping, press opt/alt+j/k to type these characters
  nnoremap ∆ :m .+1<CR>
  nnoremap ˚ :m .-2<CR>

  inoremap ∆ <Esc>:m .+1<CR>gi
  inoremap ˚ <Esc>:m .-2<CR>gi

  vnoremap ∆ :m '>+1<CR>gv=gv
  vnoremap ˚ :m '<-2<CR>gv=gv

" """.... ............................................
" """  Spell check
" """.... ............................................

nmap <leader>sp :set spell spelllang=en_us
nmap <leader>sn :set nospell

" """.... ............................................
" """  Calendar 
" """.... ............................................

nmap <leader>cl :Calendar -first_day=monday

" """.... ............................................
" """  Shortcut-sync
" """.... ............................................
" https://github.com/LukeSmithxyz/shortcut-sync
" """.... ............................................
"
autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh
