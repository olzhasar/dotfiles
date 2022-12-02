local create_command = vim.api.nvim_create_user_command

create_command("Vimrc", ":e $MYVIMRC", {})
create_command("SVimrc", ":source $MYVIMRC", {})
