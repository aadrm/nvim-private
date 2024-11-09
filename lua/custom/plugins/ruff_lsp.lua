-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
return {
  -- 'neovim/nvim-lspconfig',
  -- config = function()
  --   -- Configure ruff-lsp here
  require('lspconfig').ruff.setup {
    -- Optional: limit to python files
    -- on_attach = on_attach,
    on_attach = function(client, bufnr)
      if client.name == 'ruff' then
        -- Disable hover in favor of Pyright's hover
        client.server_capabilities.hoverProvider = false
      end
    end,
    filetypes = { 'python' },
    root_dir = require('lspconfig.util').find_git_ancestor,
    single_file_support = true,
    init_options = {
      settings = {
        args = { '--select=E,F,W,C90,UP,I,SIM,Q,TRY,N,ASYNC,A,FIX,R,LOG', '--line-length=88' },
      },
    },
  },
}
