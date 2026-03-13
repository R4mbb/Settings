-- vim-tmux-navigator: C-h/j/k/l 로 nvim ↔ tmux 패널 이동
return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",     desc = "Go to left pane" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>",     desc = "Go to lower pane" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>",       desc = "Go to upper pane" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>",    desc = "Go to right pane" },
      { "<C-\\>","<cmd>TmuxNavigatePrevious<cr>", desc = "Go to previous pane" },
    },
  },
}
