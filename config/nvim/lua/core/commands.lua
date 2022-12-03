local create_command = vim.api.nvim_create_user_command

create_command("Vimrc", ":e $MYVIMRC", {})
create_command("SVimrc", ":luafile $MYVIMRC", {})
create_command("Bd", "bp|bd #", {})

vim.cmd([[
  command! -bang LocalHistory call fzf#run({
    \ 'source': fzf#vim#_recent_files(),
    \ 'sink': 'e',
    \ 'options': [
    \   '--query', '!^~ !^/ !^.git/ ',
    \   '--prompt', 'FileHist> ',
    \   '--multi',
    \ ]}, <bang>0)
]])
