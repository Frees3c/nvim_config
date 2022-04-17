require("auto-session").setup {
  log_level = "error",
  auto_session_create_enabled = "false",
  auto_session_use_git_branch = "true",
  auto_restore_enabled = "false"
}
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
