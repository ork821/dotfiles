require("configs.lazy")

require("lazy").setup("plugins")


------------
-- nvim tree
------------
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})
--------------------------
-- bufferlines
--
vim.opt.termguicolors = true
local bufferline = require('bufferline')
bufferline.setup {
	options = {
            mode = "buffers", -- set to "tabs" to only show tabpages instead
            indicator = {
                icon = '▎', -- this should be omitted if indicator style is not 'icon'
                style = 'icon',
            },
            buffer_close_icon = '󰅖',
            modified_icon = '●',
            close_icon = '',
            left_trunc_marker = '',
            right_trunc_marker = '',
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    text_align = "left",
                    separator = true
                }
            },

    }
}

-- mason
require("mason").setup()
require("mason-lspconfig").setup()
require("configs.lspconfig")
local lspconf = require "configs.lspconfig"
require("mason-lspconfig").setup_handlers {
	-- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
    		--on_attach = lspconf.on_attach,
    		--on_init = lspconf.on_init,
   		  --capabilities = lspconf.capabilities,
	    }
        end,
    }
--


require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)
