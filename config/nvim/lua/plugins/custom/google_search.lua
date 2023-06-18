local M = {}

local function getSelectedText()
  local start_pos = vim.fn.getpos("'<") -- Get start position of visual selection
  local end_pos = vim.fn.getpos("'>") -- Get end position of visual selection

  -- Calculate the range of the visual selection
  local start_line = start_pos[2]
  local start_col = start_pos[3]
  local end_line = end_pos[2]
  local end_col = end_pos[3]

  -- Adjust the range if the visual selection ends in linewise mode
  if end_col == 0 then
    end_line = end_line - 1
  end

  -- Get the text within the visual selection
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local selected_text = table.concat(lines, "\n")

  -- Trim the leading and trailing text based on column positions
  local lines_count = #lines
  if lines_count > 1 then
    -- Trim leading text in the first line
    selected_text = selected_text:sub(start_col + 1)
    -- Trim trailing text in the last line
    selected_text = selected_text:sub(1, -(#lines[lines_count] - end_col))
  else
    -- Trim both leading and trailing text in a single line selection
    selected_text = selected_text:sub(start_col + 1, end_col)
  end

  return selected_text
end

function M.google_search()
  local selected_text = getSelectedText()
  local encoded_query = vim.fn.escape(selected_text, "&")

  local search_url = "https://www.google.com/search?q=" .. encoded_query:gsub(" ", "+")
  os.execute("open " .. search_url)
end

return M
