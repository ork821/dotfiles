local map = vim.keymap.set


-- nvimtree
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>f", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- bufferlines
map("n", "<tab>", "<cmd>BufferLineCycleNext<CR>", {desc = "bufferlines next tab"})
