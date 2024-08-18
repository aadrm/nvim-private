return {
  'folke/zen-mode.nvim',
  config = function()
    vim.keymap.set('n', '<leader>z', function()
      require('zen-mode').setup {
        window = {
          backdrop = 0.1,
          width = 0.95,
          options = {},
        },
      }
      require('zen-mode').toggle()
      vim.wo.wrap = false
      ColorMyPencils()
    end, { desc = '[Z]en mode' })
  end,
}
