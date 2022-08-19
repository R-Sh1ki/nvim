# README

## 1. Usage

Requirements:
- Neovim: 0.7.0+
- Nerd Fonts

### 1.1 Ubuntu

### 1.2 Windows
To be continued

## 2. Plugins 

### 2.0 Basic Plugins
There are three plugins used to support other plugins, and you can execute
`:StartupTime` to show the startup time of Neovim.  

- `impatient`: speed up loading time
- `packer`: packer manager
- `plenary`: useful lua functions
- `vim-startuptime`: show startup time

### 2.1 UI Styles
There are some plugins to setup theme, icons, status line, and dashboard

- `onenord`: nord theme for neovim
- `nvim-web-devicons`: icons for other plugins
- `lualine`: status line configuration
- `dashboard`: neovim dashboard
- `nvim-tree`: file tree

### 2.2 Utils
There are two utils to help programing.

- `nvim-comment`: comment plugin
- `indent-blankline`: indent plugin
- `toggleterm`: open terminal

### 2.3 Treesitter

`Treesitter` is a parser generator tool and an incremental parsing library. The
`nvim-treesitter`provides a simple way to use the interface for `Treesitter` in
Neovim and some basic functionality such as highlighting based on it. I use the
following plugins to extend the functions of the `nvim-treesitter`:

- `nvim-treesitter`
- `nvim-treesitter-textobjects`
- `nvim-treesitter-textsubjects`
- `nvim-treesitter-context`
- `nvim-ts-rainbow`
- `vim-matchup`

After install the above plugins, you need to execute these commands to install
the parsers:

```bash
:TSUpdate
:TSInstall all
```
### 2.4 Telescope
When you execute `:checkhealth telescope`, you can find `telescope` depend on
some plugins and softwares:

- `plenary`
- `nvim-treesitter`
- `fd`
- `rg`

I try some plugins to add telescope functions. And after testing, I installed
these plugins (And `telescope-media-files` is not compatible with the
Ubuntu-wayland):

- `telescope`
- `telescope-ui-select`
- `telescope-fzf-native`
- `telescope-live-grep-args`
- `vim-bookmarks`
- `telescope-vim-bookmarks`


## 3. Shorcuts
`<C>` = `<Cltr>`, `<L>` = `<leader`>, in my configuration, `<leader>` = `<space>`

| mode  | shortcuts | function  | plugins | files |
| :---: | :---:     | :---      | :---    | :---  |
| `n`   | `<L>tt`       | open nvim-tree                                | `nvim-tree`                     | `keymaps`                     |
| `n`   | `<L>tf`       | find file                                     | `nvim-tree`                     | `keymaps`                     |
| `tree`| `v`           | split right                                   | `nvim-tree`                     | `config.nvim-tree`            |
| `tree`| `h`           | split bottom                                  | `nvim-tree`                     | `config.nvim-tree`            |
| `n`   | `<L>cl`       | comment single line                           | `nvim-comment`                  | `config.comment`              |
| `n`   | `<L>c[d]j`    | comment multi-line                            | `nvim-comment`                  | `config.comment`              |
| `n`   | `ic`          | select comment chunk                          | `nvim-comment`                  | `config.comment`              |
| `n`   | `[[`          | move to the next start of the function        | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `n`   | `]]`          | move to the previous start of the function    | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `n`   | `][`          | move to the next end of the function          | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `n`   | `[]`          | move to the previous end of the function      | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `v`   | `af`          | select the whole text of the function (outer) | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `v`   | `if`          | select the whole text of the function (inner) | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `v`   | `ac`          | select the whole text of the class (outer)    | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `v`   | `ic`          | select the whole text of the class (inner)    | `nvim-treesitter-textobjects`   | `config.nvim-treesitter`      |
| `v`   | `,`           | return to previous selection                  | `nvim-treesitter-textsubjects`  | `config.nvim-treesitter`      |
| `v`   | `.`           | textsubjects smart mode                       | `nvim-treesitter-textsubjects`  | `config.nvim-treesitter`      |
| `v`   | `;`           | textsubjects container (outer)                | `nvim-treesitter-textsubjects`  | `config.nvim-treesitter`      |
| `v`   | `i;`          | textsubjects container (inner)                | `nvim-treesitter-textsubjects`  | `config.nvim-treesitter`      |
| `n`   | `%`           | jump between keywords (matchup)               | `matchup`                       | `config.nvim-treesitter`      |
| `n`   | `j/k`         | Next/previous (in normal mode)                | `telescope`                     | `config.telescope`            |  
| `n`   | `H/M/L`       | Select High/Middle/Low (in normal mode)       | `telescope`                     | `config.telescope`            |
| `n`   | `gg/G`        | Select the first/last item (in normal mode)   | `telescope`                     | `config.telescope`            |
| `n/i` | `<C-n>/<Down>`| Next item                                     | `telescope`                     | `config.telescope`            |
| `n/i` | `<C-p>/<Up>`  | Previous item                                 | `telescope`                     | `config.telescope`            |
| `n/i` | `<CR>`        | Confirm selection                             | `telescope`                     | `config.telescope`            |
| `n/i` | `<C-x>`       | Go to file selection as a split               | `telescope`                     | `config.telescope`            |
| `n/i` | `<C-v>`	      | Go to file selection as a vsplit              | `telescope`                     | `config.telescope`            |
| `n/i` | `<C-t>`       | Go to a file in a new tab                     | `telescope`                     | `config.telescope`            |
| `n/i` | `<C-u>`	      | Scroll up in preview window                   | `telescope`                     | `config.telescope`            |
| `n/i` | `<C-d>`	      | Scroll down in preview window                 | `telescope`                     | `config.telescope`            |
| `i`   | `<C-/>`	      | Show mappings for picker actions              | `telescope`                     | `config.telescope`            | 
| `n`   | `?`	          | Show mappings for picker actions              | `telescope`                     | `config.telescope`            | 
| `n/i` | `<C-c>`	      | Close telescope                               | `telescope`                     | `config.telescope`            |
| `n`   | `<Esc>`	      | Close telescope                               | `telescope`                     | `config.telescope`            | 
| `n/i` | `<Tab>`	      | Toggle selection and move to next selection   | `telescope`                     | `config.telescope`            | 
| `n/i` | `<S-Tab>`	    | Toggle selection and move to prev selection   | `telescope`                     | `config.telescope`            | 
| `n/i` | `<C-q>`	      | Send all items not filtered to quickfixlist   | `telescope`                     | `config.telescope`            |
| `n/i` | `<M-q>`	      | Send all selected items to qflist             | `telescope`                     | `config.telescope`            |
| `n/i` | `<PageUp>`	  | results scrolling up                          | `telescope`                     | `config.telescope`            |
| `n/i` | `<PageDown>`	| results scrolling down                        | `telescope`                     | `config.telescope`            |
| `n`   | `<L>ff`       | :Telescope find_files                         | `telescope`                     | `keymaps`                     | 
| `n`   | `<L>lg`       | :Telescope live_grep_args                     | `telescope`                     | `keymaps`                     | 
| `n`   | `<L>bm`       | :Telescope vim_bookmarks current_file         | `telescope-vim-bookmarks`       | `keymaps`                     | 
| `n`   | `<L>bM`       | :Telescope vim_bookmarks all                  | `telescope-vim-bookmarks`       | `keymaps`                     | 
| `n`   | `mm`          | Add/remove bookmark at current line	mm	      | `vim-bookmarks`                 | default                       |
| `n`   | `mi`          | Add/edit/remove annotation at current line    | `vim-bookmarks`                 | default                       |
| `n`   | `mn`          | Jump to next bookmark in buffer               | `vim-bookmarks`                 | default                       |
| `n`   | `mp`          | Jump to previous bookmark in buffer           | `vim-bookmarks`                 | default                       |
| `n`   | `ma`          | Show all bookmarks (toggle)                   | `vim-bookmarks`                 | default                       |
| `n`   | `mc`          | Clear bookmarks in current buffer only        | `vim-bookmarks`                 | default                       |
| `n`   | `mx`          | Clear bookmarks in all buffers                | `vim-bookmarks`                 | default                       | 
| `n`   | `[count]mkk`  | Move up bookmark at current line              | `vim-bookmarks`                 | default                       |
| `n`   | `[count]mjj`  | Move down bookmark at current line            | `vim-bookmarks`                 | default                       |
| `n`   | `[count]mg`   | Move bookmark at current line to another line | `vim-bookmarks`                 | default                       |
| `n`   | `<L>tp`       | :Telescope projects                           | `project`                       | `keymaps`                     | 
| `n`   | `<Esc>`       | Esc terminal mode and you can open multi-term | `toggleterm`                    | `config.toggleterm`           | 
| `n`   | `<C-hjkl>`    | switch terminal and neovim                    | `toggleterm`                    | `config.toggleterm`           | 
| `n`   | `<C-\>`       | open and close terminal                       | `toggleterm`                    | `config.toggleterm`           | 
| `n`   | `[count]<C-\>`| open and close multi-terminal(v and h mode    | `toggleterm`                    | `config.toggleterm`           | 
| `n`   | `<L>tv`       | open v mode :ToggleTerm direction=vertical    | `toggleterm`                    | `keymaps`                     | 
| `n`   | `<L>th`       | open h mode :ToggleTerm direction=horizontal  | `toggleterm`                    | `keymaps`                     | 
| `n`   | `<L>tf`       | open f mode :ToggleTerm direction=float       | `toggleterm`                    | `keymaps`                     | 
| `n`   | `zr`          | reduces fold level throughout the buffer      | `vim-markdown`                  | default                       |
| `n`   | `zR`          | opens all folds                               | `vim-markdown`                  | default                       |
| `n`   | `zm`          | increases fold level throughout the buffer    | `vim-markdown`                  | default                       |
| `n`   | `zM`          | folds everything all the way                  | `vim-markdown`                  | default                       |
| `n`   | `za`          | open a fold your cursor is on                 | `vim-markdown`                  | default                       |
| `n`   | `zA`          | open a fold your cursor is on recursively     | `vim-markdown`                  | default                       |
| `n`   | `zc`          | close a fold your cursor is on                | `vim-markdown`                  | default                       |
| `n`   | `zC`          | close a fold your cursor is on recursively    | `vim-markdown`                  | default                       |
| -     | `o`           | dap-ui open                                   | `dap-ui`                        | `dap.dap-ui`                  |
| -     | `d`           | dap-ui remove                                 | `dap-ui`                        | `dap.dap-ui`                  |
| -     | `e`           | dap-ui edit                                   | `dap-ui`                        | `dap.dap-ui`                  |
| -     | `r`           | dap-ui repl                                   | `dap-ui`                        | `dap.dap-ui`                  |
| -     | `p`           | dap-ui toggle                                 | `dap-ui`                        | `dap.dap-ui`                  |
| -     | `<cr>`        | dap-ui expand                                 | `dap-ui`                        | `dap.dap-ui`                  |
| -     | `<Tab>`       | cmp select next item                          | `nvim-cmp`                      | `config.cmp`                  |
| -     | `<S-Tab>`     | cmp select previous item                      | `nvim-cmp`                      | `config.cmp`                  |
| -     | `<cr>`        | cmp confirm select item                       | `nvim-cmp`                      | `config.cmp`                  |

| Token   | Match type	                | Description                         |
| :---:   | :---                        | :---                                |
| sbtrkt  | fuzzy-match                 | Items that match sbtrkt             |
| 'wild   | exact-match (quoted)        | Items that include wild             |
| ^music  | prefix-exact-match	        | Items that start with music         |
| .mp3$   | suffix-exact-match	        | Items that end with .mp3            |
| !fire   | inverse-exact-match	        | Items that do not include fire      |
| !^music | inverse-prefix-exact-match  | Items that do not start with music  |
| !.mp3$  | inverse-suffix-exact-match	| Items that do not end with .mp3     |
