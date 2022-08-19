vim.g.UltiSnipsSnippetDirectories={'ultisnips'}
vim.g.UltiSnipsSnippetsDir = '~/.config/nvim/ultisnips'
-- Use <tab> jump forward trigger.
vim.g.UltiSnipsExpandTrigger = "<tab>"
-- Use <tab> jump forward trigger.
vim.g.UltiSnipsJumpForwardTrigger="<tab>"
-- Use <shift + tab> jump backward trigger.
vim.g.UltiSnipsJumpBackwardTrigger="<S-tab>"

require("cmp_nvim_ultisnips").setup{}
