return {
    'nvim-telescope/telescope.nvim', 
    branch = '0.1.x', 
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
        { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
        { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
        { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Help Tags' },
    },
}
