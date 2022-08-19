local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

-- Remap <space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Window navigation <h,j,k,l> = <right, down, up, left>
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<A-Up>", ":resize -2<CR>", opts)
keymap("n", "<A-Down>", ":resize +2<CR>", opts)
keymap("n", "<A-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<A-Right>", ":vertical resize -2<CR>", opts)

-- Exit the whole workspace
keymap("n", "ZZ", ":lua require('scripts.utils').SaveAndExit()<cr>", opts)
-- Save buffer
keymap("n", "<leader>w", ":w<cr>", opts)
-- Exit cur window
keymap("n", "<leader>q", ":q<cr>", opts)

-- nvim-tree plugin
keymap("n", "<leader>tt", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>tf", ":NvimTreeFindFile<cr>", opts)

-- telescope
keymap("n", "<leader>ff", ":Telescope find_files<cr>", opts)
keymap("n", "<leader>lg", ":Telescope live_grep_args<cr>", opts)
keymap("n", "<leader>bm", ":Telescope vim_bookmarks current_file<cr>", opts)
keymap("n", "<leader>bM", ":Telescope vim_bookmarks all<cr>", opts)
keymap("n", "<leader>tp", ":Telescope projects<cr>", opts)

-- toggleterm
keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<cr>", opts)
keymap("n", "<leader>th", ":ToggleTerm direction=horizontal<cr>", opts)
keymap("n", "<leader>tf", ":ToggleTerm direction=float<cr>", opts)

-- Markdown
keymap("n", "<leader>mk", ":MarkdownPreview<cr>", opts)
keymap("n", "<leader>mp", ":PasteImg<cr>", opts)

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<A-4>", "<cmd>lua require'dap'.terminate()<cr>", opts)
keymap("n", "<A-5>", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<A-6>", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<A-7>", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<A-8>", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<A-9>", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<A-d>", "<cmd>lua require'dapui'.eval()<cr>", opts)

