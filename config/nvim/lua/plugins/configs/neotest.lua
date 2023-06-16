local setup, neotest = pcall(require, "neotest")

if not setup then
    return
end

neotest.setup({
  adapters = {
    require("neotest-python"),
    require("neotest-go"),
    require("neotest-jest"),
  },
  highlights = {
    adapter_name = "NeotestAdapterName",
    border = "NeotestBorder",
    dir = "NeotestDir",
    expand_marker = "NeotestExpandMarker",
    failed = "NeotestFailed",
    file = "NeotestFile",
    focused = "NeotestFocused",
    indent = "NeotestIndent",
    marked = "NeotestMarked",
    namespace = "NeotestNamespace",
    passed = "NeotestPassed",
    running = "NeotestRunning",
    select_win = "NeotestWinSelect",
    skipped = "NeotestSkipped",
    target = "NeotestTarget",
    test = "NeotestTest",
    unknown = "NeotestUnknown",
    watching = "NeotestWatching"
  },
  icons = {
    child_indent = "│",
    child_prefix = "├",
    collapsed = "─",
    expanded = "╮",
    failed = "F",
    final_child_indent = " ",
    final_child_prefix = "╰",
    non_collapsible = "─",
    passed = "●",
    running = "",
    running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
    skipped = "",
    unknown = "",
    watching = ""
  },
})
