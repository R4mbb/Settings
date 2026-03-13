return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        -- C-Enter 로 자동완성 확정
        ["<C-CR>"] = cmp.mapping.confirm({ select = true }),
        -- Enter 는 일반 줄바꿈으로 복원
        ["<CR>"] = cmp.mapping(function(fallback)
          fallback()
        end, { "i" }),
      })

      return opts
    end,
  },
}
