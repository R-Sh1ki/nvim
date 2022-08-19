require("clipboard-image").setup {
  -- Default configuratio for all filetype
  default = {
    img_dir = "imgs",
    img_dir_txt = "imgs",
    img_name = function() return os.date("%Y-%m-%d-%H-%M-%S") end,
    affix = "%s"
  },

  -- Markdown configuration
  markdown = {
    img_dir = "imgs",
    img_dir_txt = "imgs",
  },
}
