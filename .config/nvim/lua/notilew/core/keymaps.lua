-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness
local opts = { noremap = true, silent = true }

-- ---------------------
-- -- General Keymaps
-- ---------------------
-- -- Most basic
-- keymap.set("n", "<leader>ss", "<cmd>wa<CR>", { desc = "Save all" })
-- keymap.set("n", "<leader> ", "<cmd>wa<CR>", { desc = "Save current file" })
-- keymap.set("n", "<leader>qq", "<cmd>wqa<CR>", { desc = "Write quit all" })
-- keymap.set("v", "p", '"_dP', { desc = "Don't override yank on visual mode" })
-- keymap.set("n", "dd", '"_dd', { desc = "Delete a line without overriding the yank register" })

-- -- use jk & kj  to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
-- keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

-- -- Scroll
-- keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll up and center screen" })
-- keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll down and center screen" })

-- -- clear search highlights
-- keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- -- window management
-- keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal width and height" })
-- keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- -- Resize the window

-- keymap.set("n", "<leader>si", "<cmd>vertical resize +5<CR>", { desc = "Increase the split window size" })
-- keymap.set("n", "<leader>sd", "<cmd>vertical resize -5<CR>", { desc = "Decrease the split window size" })

-- ---------------------
-- -- Colorscheme
-- ---------------------
-- keymap.set("n", "<leader>ud", ":colorscheme kanagawa-wave<CR>", { silent = false, desc = "Toggle default dark theme" })
-- keymap.set("n", "<leader>ui", ":colorscheme ", { desc = "Toggle colorscheme" }) -- Toggle colorscheme and installed themes easily
-- keymap.set("n", "<leader>ul", ":colorscheme dayfox<CR>", { desc = "Toggle light theme" })

-- ---------------------
-- -- Move text up and down
-- ---------------------
-- --- in normal mode
-- keymap.set(
-- 	"n",
-- 	"<Down>",
-- 	":m .+1<CR>==",
-- 	{ noremap = true, silent = true, desc = "Move current line down with down arraw key" }
-- )
-- keymap.set(
-- 	"n",
-- 	"<Up>",
-- 	":m .-2<CR>==",
-- 	{ noremap = true, silent = true, desc = "Move current line up with up arrow key" }
-- )
-- -- in visual, mode use control j or k
-- keymap.set("v", "<c-j>", ":m .+1<CR>==", opts)
-- keymap.set("v", "<c-k>", ":m .-2<CR>==", opts)

-- -- Visual Block --
-- -- Move text up and down
-- keymap.set("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap.set("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap.set("x", "<c-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap.set("x", "<c-k>", ":move '<-2<CR>gv-gv", opts)

-- ---------------------
-- -- Copy absolute & relative file path
-- ---------------------

-- -- Copy relative file path
-- keymap.set("n", "<leader>cr", function()
-- 	local relative_path = vim.fn.fnamemodify(vim.fn.expand("%"), ":.")
-- 	vim.fn.setreg("+", relative_path)
-- end, { noremap = true, silent = true, desc = "Copy relative file path" })

-- -- Copy absolute file path
-- keymap.set("n", "<leader>cc", function()
-- 	local absolute_path = vim.fn.expand("%:p")
-- 	vim.fn.setreg("+", absolute_path)
-- end, { noremap = true, silent = true, desc = "Copy complete/absolute file path" })

-- ---------------------
-- -- Format files, useful for gitignored files
-- ---------------------

-- keymap.set(
-- 	"n",
-- 	"<leader>jf",
-- 	[[:%!jq .<CR>:w<CR>]],
-- 	{ noremap = true, silent = true, desc = "Format and save json files" }
-- )



-- Move to window using the <ctrl> hjkl keys
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })
-- Resize window using <ctrl> arrow keys
keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
-- buffers
keymap.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
keymap.set("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap.set("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
keymap.set("n", "<leader>bd", function()
    Snacks.bufdelete()
end, { desc = "Delete Buffer" })
keymap.set("n", "<leader>bo", function()
    Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- save file
keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })
--new file
keymap.set("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
-- quit
keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })

-- windows
keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })
-- Snacks.toggle.zoom():map("<leader>wm"):map("<leader>uZ")
-- Snacks.toggle.zen():map("<leader>uz")

-- native snippets. only needed on < 0.11, as 0.11 creates these by default
if vim.fn.has("nvim-0.11") == 0 then
    keymap.set("s", "<Tab>", function()
      return vim.snippet.active({ direction = 1 }) and "<cmd>lua vim.snippet.jump(1)<cr>" or "<Tab>"
    end, { expr = true, desc = "Jump Next" })
    keymap.set({ "i", "s" }, "<S-Tab>", function()
      return vim.snippet.active({ direction = -1 }) and "<cmd>lua vim.snippet.jump(-1)<cr>" or "<S-Tab>"
    end, { expr = true, desc = "Jump Previous" })
  end