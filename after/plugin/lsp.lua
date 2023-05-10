require("neodev").setup({
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

local opts = {
  format_opts = {
    timeout_ms = 10000,
  },
  servers = {
    ['null-ls'] = {
        'javascript',
        'typescript',
        'lua',
        'python',
        'c_sharp'
    },
  }
}

lsp.format_mapping('gq', opts)

lsp.format_on_save(opts)

lsp.setup()

-- See mason-null-ls.nvim's documentation for more details:
-- https://github.com/jay-babu/mason-null-ls.nvim#setup
require('mason-null-ls').setup({
  ensure_installed = nil,
  automatic_installation = false,
  handlers = {
      -- Here you can add functions to register sources.
      -- See https://github.com/jay-babu/mason-null-ls.nvim#handlers-usage
      --
      -- If left empty, mason-null-ls will  use a "default handler"
      -- to register all sources
  }
})

local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    -- Here you can add tools not supported by mason.nvim
  }
})
