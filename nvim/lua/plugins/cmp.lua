return {
  {
    -- override default LazyVim nvim-cmp setup
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")

      -- disable cmp confirm on enter
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping, {
        ["<CR>"] = cmp.config.disable,
        ["<C-y"] = LazyVim.cmp.confirm({ select = true }),
      })
    end,
  },
  {
    -- setup autocomplete for nvim command line, not LazyVim default for some reason
    "hrsh7th/cmp-cmdline",
    config = function()
      local cmp = require("cmp")

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
}
