return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
    vim.keymap.set('n', '<leader>gd', vim.cmd.Gdiff, { desc = '[G]it [D]iff' })

    local group_fugitive = vim.api.nvim_create_augroup('group_fugitive', {})

    local autocmd = vim.api.nvim_create_autocmd
    autocmd('BufWinEnter', {
      group = group_fugitive,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end
      end,
    })

    vim.keymap.set('n', '<leader>gc', '<cmd>Gvdiffsplit!<CR>')
    vim.keymap.set('n', '<leader>gu', '<cmd>diffget //2<CR>')
    vim.keymap.set('n', '<leader>gh', '<cmd>diffget //3<CR>')
  end,
}
