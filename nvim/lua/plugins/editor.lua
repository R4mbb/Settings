return {
  -- 색상 코드 미리보기 (#fff, rgb(), hsl() 등)
  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "*" },
      user_default_options = {
        RGB = true,
        RRGGBB = true,
        names = false,
        css = true,
        mode = "background",
        tailwind = true,
      },
    },
  },

  -- 커서 아래 단어를 동시에 강조 표시
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    opts = {
      delay = 200,
      large_file_cutoff = 2000,
    },
    config = function(_, opts)
      require("illuminate").configure(opts)
    end,
  },

  -- 괄호/따옴표 자동 페어 & 색상 구분
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufReadPost",
  },

  -- 다중 커서 (C-n 으로 선택 확장)
  {
    "mg979/vim-visual-multi",
    event = "BufReadPost",
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",
        ["Find Subword Under"] = "<C-n>",
      }
    end,
  },

  -- 빠른 파일 탐색 (harpoon2)
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end,                             desc = "Harpoon Add" },
      { "<leader>hh", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon Menu" },
      { "<leader>1",  function() require("harpoon"):list():select(1) end,                         desc = "Harpoon 1" },
      { "<leader>2",  function() require("harpoon"):list():select(2) end,                         desc = "Harpoon 2" },
      { "<leader>3",  function() require("harpoon"):list():select(3) end,                         desc = "Harpoon 3" },
      { "<leader>4",  function() require("harpoon"):list():select(4) end,                         desc = "Harpoon 4" },
    },
  },

  -- 현재 코드 컨텍스트(함수/클래스명)를 상단 고정 표시
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPost",
    opts = {
      max_lines = 3,
      trim_scope = "outer",
    },
  },

  -- 검색 결과 갯수 표시
  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup()
      local kopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap("n", "n",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "N",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "*",  [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "#",  [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
    end,
  },
}
