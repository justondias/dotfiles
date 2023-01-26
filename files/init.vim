" ensure vim-plug is installed and then load it
call plug#begin('~/.vim/plugged')

" General {{{
    " Abbreviations
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute

	" remove spaces on save
	autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
	function! <SID>StripTrailingWhitespaces()
		"save last search & cursor position
		let _s=@/
		let l = line(".")
		let c = col(".")
		%s/\s\+$//e
		let @/=_s
		call cursor(l, c)
	endfunction

    set autoread " detect when a file is changed

    set history=1000 " change history to 1000
    set textwidth=120

    set backspace=indent,eol,start " make backspace behave in a sane manner

    " Searching
    set ignorecase " case insensitive searching
    set smartcase " case-sensitive if expresson contains a capital letter
    set hlsearch " highlight search results
    set incsearch " set incremental search, like modern browsers
    set nolazyredraw " don't redraw while executing macros

    " error bells
    set noerrorbells
    set visualbell
    set t_vb=
    set tm=500
" }}}

" Appearance {{{
    set number " show line numbers
	set relativenumber
    set wrap " turn on line wrapping
    set wrapmargin=8 " wrap lines when coming within n characters from side
    set linebreak " set soft wrapping
    set showbreak=↪
    set autoindent " automatically set indent of new line
    set ttyfast " faster redrawing
    set diffopt+=vertical,iwhite,internal,algorithm:patience,hiddenoff
    set laststatus=2 " show the status line all the time
    set so=7 " set 7 lines to the cursors - when moving vertical
    set wildmenu " enhanced command line completion
    set hidden " current buffer can be put into background
    set showcmd " show incomplete commands
    set noshowmode " don't show which mode disabled for PowerLine
    set wildmode=list:longest " complete files like a shell
    set shell=$SHELL
    set cmdheight=1 " command bar height
    set title " set terminal title
    set showmatch " show matching braces
    set mat=2 " how many tenths of a second to blink
    set updatetime=300
    set signcolumn=yes
    set shortmess+=c

    " Tab control
    set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
    set tabstop=4 " the visible width of tabs
    set softtabstop=4 " edit as if the tabs are 4 characters wide
    set shiftwidth=4 " number of spaces to use for indent and unindent
    set shiftround " round indent to a multiple of 'shiftwidth'

    " code folding settings
    set foldmethod=syntax " fold based on indent
    set foldlevelstart=99
    set foldnestmax=10 " deepest fold is 10 levels
    set nofoldenable " don't fold by default
    set foldlevel=1

    " toggle invisible characters
    set list
	set showbreak=↪\
	set listchars=eol:¬,tab:❯⋅,trail:•,extends:❯,precedes:❮,space:␣,nbsp:␣

    set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
    " switch cursor to line when in insert mode, and block when not
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

    if &term =~ '256color'
        " disable background color erase
        set t_ut=
    endif

    " enable 24 bit color support if supported
    if (has("termguicolors"))
        if (!(has("nvim")))
            let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
            let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
        endif
        set termguicolors
    endif

    " highlight conflicts
    match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

    " Load colorschemes
    Plug 'airblade/vim-gitgutter'
    Plug 'chriskempson/base16-vim'
    Plug 'joshdick/onedark.vim'
" }}}

" General Mappings {{{
	nnoremap <SPACE> <Nop>
	let mapleader =' '
    " remap esc
    inoremap jk <esc>
	xnoremap jk <esc>

    " shortcut to save
    nmap <leader>, :w<cr>

	"By pressing ctrl+r in visual mode, you will be prompted to enter text to replace with. Press enter and then confirm each change you agree with y or decline with n.
	"This command will override your register h so you can choose other one (by changing h in the command above to another lower case letter) that you don't use.
	vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>"

	"move windows with SHIFT + CTRL + h/j/k/l
	"nnoremap <C-h> <C-w>h
	nnoremap <leader>h <C-w>h
	nnoremap <leader>j <C-w>j
	nnoremap <leader>k <C-w>k
	nnoremap <leader>l <C-w>l

	nnoremap <C-c> :windo wincmd H<CR>
	nnoremap <C-x> :windo wincmd K<CR>

	" ctrl + o to use CocSearch (dep in ripgrep)
	nnoremap <leader>o :CocSearch

	" moving up and down work as you would expect
    nnoremap <silent> j gj
    nnoremap <silent> k gk
    nnoremap <silent> ^ g^
    nnoremap <silent> $ g$

	"nnoremap th  :tabfirst<CR>
	nnoremap tk  :tabnext<CR>
	nnoremap tj  :tabprev<CR>
	"nnoremap tl  :tablast<CR>
	"nnoremap tt  :tabedit<Space>
	"nnoremap tn  :tabnext<Space>
	"nnoremap tm  :tabm<Space>
	nnoremap td  :tabclose<CR>
	nnoremap tn  :tabnew<CR>

	" remove extra whitespace
    "nmap <leader><space> :%s/\s\+$<cr>
    "nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

	" keep visual selection when indenting/outdenting
	vmap < <gv
	vmap > >gv
" }}}

" General Functionality {{{
    Plug 'christoomey/vim-tmux-navigator'
    " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
    Plug 'tpope/vim-surround'

	" single/multi line code handler: gS - split one line into multiple, gJ - combine multiple lines into one
    Plug 'AndrewRadev/splitjoin.vim'

	" ctrlp configued to use ripgrep
	Plug 'ctrlpvim/ctrlp.vim'
	if executable('rg')
		set grepprg=rg\ --color=never
		let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
		let g:ctrlp_use_caching = 0
	endif

	"Nerd commenter
	Plug 'scrooloose/nerdcommenter'
	map <C-_> <plug>NERDCommenterToggle

	"pagination info
	Plug 'vim-airline/vim-airline'

	"vim-fugitive
	Plug 'tpope/vim-fugitive'
	nmap <leader>gh :diffget //3<CR>
	nmap <leader>gs :G<CR>
	nmap <leader>gd :diffget //2<CR>
" }}}

" NERDTree {{{
	Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
	Plug 'Xuyuanp/nerdtree-git-plugin'
	let g:NERDTreeNodeDelimiter = "\u00a0"
	let NERDTreeShowHidden=1
	let NERDTreeDirArrowExpandable = '▷'
	let NERDTreeDirArrowCollapsible = '▼'

	augroup nerdtree
		autocmd!
		autocmd FileType nerdtree setlocal nolist " turn off whitespace characters
		autocmd FileType nerdtree setlocal nocursorline " turn off line highlighting for performance
	augroup END

	" toggle nerd tree
	nmap <C-n> :NERDTreeToggle<CR>
	" find the current file in nerdtree without needing to reload the drawer
	nmap <silent> <leader>y :NERDTreeFind<cr>

	let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
	\ "Staged"    : "✚",
	\ "Untracked" : "✭",
	\ "Renamed"   : "➜",
	\ "Unmerged"  : "═",
	\ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
	\ "Clean"     : "✔︎",
	\ 'Ignored'   : '☒',
	\ "Unknown"   : "?"
	\ }
" }}}

" coc {{{
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-json',
	\ ]

	"prettier
	command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
	noremap <leader>p :Prettier<CR>

	" Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
	inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
		let col = col('.') - 1
		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" Remap keys for gotos
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
	endfunction

	"Highlight symbol under cursor on CursorHold
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Remap for rename current word
	nmap <F2> <Plug>(coc-rename)

	" Remap for format selected region
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)

	augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap for do codeAction of current line
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Fix autofix problem of current line
	nmap <leader>qf  <Plug>(coc-fix-current)

	" Create mappings for function text object, requires document symbols feature of languageserver.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
	nmap <silent> <C-d> <Plug>(coc-range-select)
	xmap <silent> <C-d> <Plug>(coc-range-select)

	" Use `:Format` to format current buffer
	command! -nargs=0 Format :call CocAction('format')

	" Use `:Fold` to fold current buffer
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" use `:OR` for organize import of current buffer
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

	" Add status line support, for integration with other plugin, checkout `:h coc-status`
	set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

	" Using CocList
	" Show all diagnostics
	"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}

" JavaScript {{{
	Plug 'othree/yajs.vim', { 'for': [ 'javascript', 'javascript.jsx', 'html' ] }
	" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx', 'html'] }
	Plug 'moll/vim-node', { 'for': 'javascript' }
	Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'], 'do': 'npm install' }
	Plug 'MaxMEllon/vim-jsx-pretty'
	let g:vim_jsx_pretty_highlight_close_tag = 1
" }}}

" JSON {{{
	Plug 'elzr/vim-json', { 'for': 'json' }
	let g:vim_json_syntax_conceal = 0
" }}}

call plug#end()


" Colorscheme and final setup {{{
    " This call must happen after the plug#end() call to ensure
    " that the colorschemes have been loaded
	let g:rg_command = 'rg --vimgrep -S' " run rg with smart case mode
	let g:onedark_termcolors=16
	let g:onedark_terminal_italics=1
	colorscheme onedark
" }}}
