local create_command = vim.api.nvim_create_user_command

create_command("Vimrc", ":e $MYVIMRC", {})
create_command("SVimrc", ":luafile $MYVIMRC", {})
create_command("Bd", "bp|bd #", {})
create_command("Restart", ":cq 111", {})
