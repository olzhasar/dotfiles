local create_command = vim.api.nvim_create_user_command

create_command("Bd", "bp|bd #", {})

local makefile_names = { "GNUmakefile", "makefile", "Makefile" }

local function find_makefile()
  local buf_name = vim.api.nvim_buf_get_name(0)
  local start = buf_name ~= "" and vim.fs.dirname(buf_name) or vim.uv.cwd()

  return vim.fs.find(makefile_names, { path = start, upward = true })[1]
end

local function make_targets(arglead)
  local makefile = find_makefile()
  if not makefile then
    return {}
  end

  local targets = {}
  for line in io.lines(makefile) do
    local target = line:match("^([%w%._%/%-]+)%s*:")
    local is_assignment = line:match("^%S+%s*:?=") ~= nil
    if target and not is_assignment and not target:match("%.o$") and target:find(arglead, 1, true) == 1 then
      targets[#targets + 1] = target
    end
  end

  table.sort(targets)
  return targets
end

local function has_valid_quickfix_entry()
  for _, item in ipairs(vim.fn.getqflist()) do
    if item.valid == 1 then
      return true
    end
  end

  return false
end

create_command("Make", function(opts)
  local makefile = find_makefile()
  if not makefile then
    vim.notify("No Makefile found above the current buffer", vim.log.levels.WARN)
    return
  end

  local make_dir = vim.fs.dirname(makefile)
  local args = opts.args ~= "" and " " .. opts.args or ""
  vim.cmd("make -C " .. vim.fn.fnameescape(make_dir) .. args)
  if vim.v.shell_error ~= 0 or has_valid_quickfix_entry() then
    vim.cmd("cwindow")
  end
end, {
  nargs = "*",
  complete = make_targets,
  desc = "Run make from the nearest parent Makefile",
})
