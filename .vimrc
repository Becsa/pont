call plug#begin('~/vim/vimfiles/plugin')
Plug 'justinmk/vim-sneak' "inline motion s{char}{char}
Plug 'PietroPate/vim-tex-conceal' "kiegeszites a latex concelhez
Plug 'ludovicchabant/vim-gutentags' "tagek latexhez pl
	autocmd FileType tex,latex,bib,bitex,biber "setlocal tags=./tags;/
	set tags=./tags,/media/sf_megosztott/preambulum/bibliography/tags,./TAGS,tags;~,TAGS;~;
Plug 'godlygeek/tabular'
" Plug 'dreadnaut/vim-bargreybars' "gvim ne legyen feher az alja
" Plug 'plasticboy/vim-markdown'
Plug 'jiangmiao/auto-pairs' "zarojel stb parban
Plug 'markonm/traces.vim' "search/replace preview
Plug 'liuchengxu/vim-which-key'
	set timeoutlen=500
	nnoremap <silent> <leader>      :<c-u>WhichKey '\'<CR>
	let g:maplocalleader = ','
	nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
Plug 'honza/vim-snippets' "snippetek az ultisnipshez kell
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'liuchengxu/vim-clap' "kereso ablak leader ?
	"vim-clap kereses gyorsbillen
	nnoremap <leader>? :Clap blines<CR>
	nnoremap <leader>g :Clap grep<CR>
	nnoremap <leader>/ :Clap files<CR>
	nnoremap <leader>v :Clap registers<CR>
	nnoremap <leader>a :Clap windows<CR>
Plug 'dense-analysis/ale' "linting
Plug 'sainnhe/vim-color-forest-night'
Plug 'sheerun/vim-polyglot' "nyelv sintax
Plug 'psliwka/vim-smoothie' "gorgetes smooth
Plug 'lervag/vimtex' "latex
Plug 'tpope/vim-surround' "zarojelek
Plug 'tpope/vim-repeat' "parancsok ismetlese, pl a zarojelekhez
Plug 'scrooloose/nerdtree' "filebongeszo
Plug 'junegunn/goyo.vim' "focus mode
Plug 'mhinz/vim-startify' "kezdokepernyo
Plug 'junegunn/limelight.vim' "focus modhoz sotetites
Plug 'vimwiki/vimwiki' "jegyzetek, org mode jellegu
	let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown'}]
	let g:vimwiki_folding= 'custom'
	autocmd FileType wiki set foldmethod=marker
	let g:vimwiki_table_mappins = 0
Plug 'bling/vim-airline' "statusbar
Plug 'tpope/vim-commentary' "kommenteles
"Plug 'vifm/vifm.vim'
" Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit' "github vimben
Plug 'airblade/vim-gitgutter' "track git changes +
Plug 'SirVer/ultisnips' "makrok
Plug 'mbbill/undotree' "visszavonasok latszodnak
Plug 'dhruvasagar/vim-zoom' "ablakba zoomolas
Plug 'kshenoy/vim-signature' "markokat mutatja oldalt
Plug 'kien/ctrlp.vim' "fuzzy finder jellegu
	nnoremap <silent><leader>P :CtrlP<CR>
	let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
	let g:ctrlp_custom_ignore = {
	  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	  \ 'file': '\v\.(exe|so|dll|fls|log)$',
	  \ }
Plug 'kana/vim-textobj-user' "textobjektek pl delete around(
" Plug 'rbonvall/vim-textobj-latex' "textobjektek latexhez, vimtex is tudja alapbol szovel redudant
call plug#end()
"latex, matekos csavotol
	let g:tex_flavor ='latex'
	let g:vimtex_view_general_viewer = 'zathura'
	let g:vimtex_view_method='zathura'
	let g:vimtex_view_general_options_latexmk = '-reuse-instance'
	let g:vimtex_latexmk_progname = 'nvr' "nvim miatt kell
	let g:vimtex_quickfix_mode=0
	let g:polyglot_disabled = ['latex']
	set conceallevel=2
	let g:tex_conceal='abdgms'
	let g:tex_comment_nospell=1
"package dokumentacio
	nnoremap <silent><leader>k :VimtexDocPackage<CR>
	nnoremap <silent><leader>c :copen<CR>
"ultisnips dolgok
	let g:UltiSnipsExpandTrigger ='<tab>'
	let g:UltiSnipsJumpForwardTrigger ='<tab>'
	let g:UltiSnipsJumpBackwardTrigger ='<s-tab>'
"ale beallitasok
	let g:ale_enabled = 0
	nnoremap <silent><leader>A :ALEToggle<CR>
"markdown
	let g:vim_markdown_strikethrough = 1
	let g:vim_markdown_math = 1
"coc beallitasok
	set cmdheight=2
	set updatetime=300
	set shortmess+=c
	set signcolumn=yes
	inoremap <silent><expr> <C-space>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
	inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "<C-j>"
	inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "<C-k>"
" nnoremap <silent> K :call <SID>show_documentation()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction
"
"tema beallitasok
	set termguicolors
	set background=dark
	let g:airline_theme = 'forest_night'
	let g:airline#extensions#tabline#enabled = 1
	colorscheme forest-night
"encode es betutipus
	set fileencodings=ucs-bom,utf-8,default,latin1
	set guifont=Iosevka_Term:h14:cEASTEUROPE:qDRAFT
"helyesiras ellenorzes, csak tex/latex fileokban, magyarul
	autocmd FileType tex,latex setlocal spell
	set spelllang=hu
"ctrl+l gyorsbillentyu insert modban a javitasra
	inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"altalanos beallitasok
	set clipboard=unnamedplus
	set go=a
	set autochdir
	set mouse=a
	set nohlsearch
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number
	set textwidth=300
	set foldmethod=marker
"foldokat megjegyzi a session
	" set sessionoptions=blank,buffers,folds,tabpages,winsize,terminal
"file keresesnel feldobja a fileneveket
	set wildmenu
	set wildmode=list:longest
"miket ne dobjon fel
	set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico,*.svg,*.dwg,*.bak,*.bcf,*.xml,*.blg,*.exe,*.zip,*.swp,*\\tmp\\*,*.rar,*.dxf,*.log,*.fls
	set wildignore+=*.pdf,*.psd,*.aux
"a buffert nem zarja be ha kilepek a filebol hanem csak elrejti
	set hidden
" Open file at the last known position
	autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
" tab indent
"set list lcs=tab:/|/
	highlight SpecialKey ctermfg=8
"move by visual line
	nnoremap j gj
	nnoremap k gk
"undotree meghivasa:
	nnoremap <leader>u :UndotreeToggle<cr>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| Limelight!! \| set linebreak<CR>
"	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>
" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright
" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Buffer valtasa gyorsbillentyu
	" nnoremap <leader>b :bnext<CR>
	nnoremap <silent><expr><leader>b printf(":\<C-U>%s\n", v:count ? 'buffer' . v:count : 'bnext')
"" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
"go to tag
	map <silent><C-g> <C-]>
"File megnyitasa path alapjan uj ablakban
	nnoremap gf <C-w>gf
	vnoremap gf <C-w>gf
"normalis gf kereses
	autocmd FileType tex setlocal isfname-={,}
" Word count:
	 autocmd FileType tex nnoremap <leader>W :VimtexCountWords<CR>
"uj tab megnyitasa
	map <leader>t :tabnew<CR>
"pdf file es kepek megnyitasa
	noremap gO :!zathura <cfile><CR>
"mark
	function! Marks()
	marks
	echo('Mark: ')
	" getchar() - prompts user for a single character and returns the chars
	" ascii representation
	" nr2char() - converts ASCII `NUMBER TO CHAR'
	let s:mark = nr2char(getchar())
	" remove the `press any key prompt'
	redraw
	" build a string which uses the `normal' command plus the var holding the
	" mark - then eval it.
	execute "normal! '" . s:mark
	endfunction
"jelolesek legordulo menuben
	nnoremap ' :call Marks()<CR>
"backup kulon mappaban
	set backup
	set nowritebackup
	set backupdir=~/vim_backup
	set undofile
	set undodir=~/vim/vimundo
"working directory
	command Egyetem cd /media/sf_megosztott/hetedik_felev
	command Texsnippets tabnew ~/vim/vimfiles/plugin/vim-snippets/UltiSnips/tex.snippets
	command Thesis cd /media/sf_megosztott/Szakdolgozat/Latex
	" command Backslash :s/\\/\//g
	" command Backslashg :%s/\\/\//g
	" command FigureNulla :norm i\setcounter{figure}{0}\setcounter{subfigure}{0}
