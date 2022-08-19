local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
  vim.notify("comment not found!")
  return
end

comment.setup {
  -- Add a space between comment and markers
  marker_padding = true,
  -- Comment empty lines
  comment_empty = false,
  -- Create key mappings
  create_mappings = true,
  -- Normal mode mapping left hand side
  line_mapping = "<leader>cl",
  -- Visual/Operator mapping left hand side
  operator_mapping = "<leader>c",
  -- text object mapping, comment chunk,
  comment_chunk_text_object = "ic",
  -- Hook function to call before commenting takes place
  hook = function()
    filetype = vim.api.nvim_buf_get_option(0, "filetype")

    local function contains(ft_arr, ft)
      for key, var in ipairs(ft_arr) do
        if var == ft then
          return true
        end
      end
      return false
    end

    if contains({'python', 'shell'}, filetype) then
      vim.api.nvim_buf_set_option(0, 'commentstring', '# %s')
    elseif contains({'cpp', 'c'}, filetype) then
      vim.api.nvim_buf_set_option(0, 'commentstring', '// %s')
    elseif contains({'lua'}, filetype) then
      vim.api.nvim_buf_set_option(0, 'commentstring', '-- %s')
    end
  end
}
