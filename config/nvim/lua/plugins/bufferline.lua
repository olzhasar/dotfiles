local setup, bufferline = pcall(require, "bufferline")
if not setup then
  return
end

bufferline.setup({
  options = {
    show_buffer_close_icons = false,
    sort_by='id',
    custom_filter = function(buf_number, buf_numbers)
      if vim.bo[buf_number].filetype ~= "netrw" then
      	return true
      end
    end,
  }
})
