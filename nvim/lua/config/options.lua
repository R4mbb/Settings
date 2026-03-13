-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

-- true color support (required for tmux)
vim.opt.termguicolors = true

-- tmux 환경에서 커서 모양 복원
if vim.env.TMUX then
  vim.opt.ttimeoutlen = 0
  -- insert mode: bar cursor, normal: block cursor
  vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50"
      .. ",a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"
      .. ",sm:block-blinkwait175-blinkoff150-blinkon175"
end

-- 줄 번호
vim.opt.number = true
vim.opt.relativenumber = true

-- 검색 개선
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 분할 창 기본 방향
vim.opt.splitbelow = true
vim.opt.splitright = true

-- 스크롤 여백
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- 긴 줄 표시 기준선
vim.opt.colorcolumn = ""

-- 탭/공백
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- 클립보드 (tmux와 공유)
vim.opt.clipboard = "unnamedplus"

-- undofile 영구 보관
vim.opt.undofile = true
vim.opt.undolevels = 10000

-- 파일 변경 자동 감지 (focus-events on 과 연동)
vim.opt.autoread = true
