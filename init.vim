"Minimun init.vim for testing, test section is at the bottom. In case
"something fails we still get all our key mappings to fix the problem.


call plug#begin()
	Plug 'hrsh7th/nvim-compe'
	Plug 'sirver/UltiSnips'
call plug#end()



set relativenumber

syntax on
filetype plugin indent on

"map
let mapleader = " "
noremap <leader>q :qa<cr>
noremap <silent><leader>d :bw<cr>
noremap <leader>ev :vsplit ~/.config/nvim/init.vim<cr>

"movement
inoremap <silent><expr> <c-j>     pumvisible() ? "\<Down>" :"\<c-r>=UltiSnips#ExpandSnippet()\<cr>"
inoremap jj <Esc>
inoremap g, g,zz

noremap <expr> <c-k>     pumvisible() ? "\<Up>" : "\<c-k>"
noremap g; g;zz
noremap J <c-f>
noremap K <c-b>
noremap <c-j> <c-e>
noremap <c-k> <c-y>


"command
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

"Windows
noremap <leader>j <c-w>h
noremap <leader>k <c-w>l
noremap <leader>J <c-w>H
noremap <leader>K <c-w>L
noremap <leader>l <c-w>l
noremap <leader>l <c-w>h

"misc
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

"colors
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif
"24 bit true colors
if (has('termguicolors')) | set termguicolors | endif
"Enables syntax for tty log in
if &term =~ "linux" |set notermguicolors | endif
au ColorScheme * hi normal ctermbg=234 ctermfg=15 guibg=#000000 guifg=#ABB2BF
colorscheme onedark

"let $BASH_ENV = "~/.bash_aliases"

"Uncomment for session
"augroup vimrc
"  autocmd!
"augroup END
"set ssop=resize,help,tabpages,winsize,folds
"autocmd vimrc VimLeave * exe "mks! ". '~/.vim/session.vim'
"autocmd vimrc VimEnter * nested :  exe "silent source ~/.vim/session.vim"


"============================== TEST SECTION ==============================
"Put stuff here that you need to test on a fresh install like config.


let g:UltiSnipsExpandTrigger="<F1>"
let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsSnippetDirectories=[$HOME.'/snippets']
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
"Don't have a way right now to turn off completion in a snippet: if in ultisnips completion off.
let g:UltiSnipsJumpForwardTrigger = '<tab>'



lua <<EOF
	require'compe'.setup {
		enabled          = true,
		autocomplete     = true,
		debug            = false,
		min_length       = 3,
		preselect        = 'always', -- always select the first
		throttle_time    = 80, -- default is 80,
		source_timeout   = 400, -- default is 400,
		incomplete_delay = 400,
		max_abbr_width   = 100,
		max_kind_width   = 100,
		max_menu_width   = 100,
		documentation    = true,

		source = {
			path      = true,
			calc      = true,
			nvim_lsp  = true,
			nvim_lua  = true,
			spell     = false,
			buffer    = {filetypes = buffers},
			vsnip     = false,
			ultisnips = true,
		};
	}

vim.cmd [[
inoremap <silent><expr> <C-Y>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
]]
EOF

"==========================================================================







