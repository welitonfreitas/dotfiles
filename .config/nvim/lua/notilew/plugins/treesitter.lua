-- modified version of code from this config
--https://github.com/fredrikaverpil/dotfiles/blob/main/nvim-fredrik/lua/fredrik/plugins/core/treesitter.lua
return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		event = "BufRead",
		branch = "master",
		build = ":TSUpdate",
		---@class TSConfig
		opts = {
			-- custom handling of parsers
			ensure_installed = {
				"astro",
				"bash",
				"c",
				"css",
				"diff",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"graphql",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"json5",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			},
		},
		config = function(_, opts)
			require'nvim-treesitter.configs'.setup {
				-- A list of parser names, or "all" (the listed parsers MUST always be installed)
				ensure_installed = opts.ensure_installed,
				
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,
				
				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,
				
				-- List of parsers to ignore installing (or "all")
				ignore_install = { "javascript" },
				
				---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
				-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
				
				highlight = {
					enable = true,
				
					-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
					-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
					-- the name of the parser)
					-- list of language that will be disabled
					-- disable = { "c", "rust" },
					-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = false,
				},
				}
			
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = "BufRead",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
		},
		opts = {
			multiwindow = true,
		},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		keys = {
			{
				"af",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
				end,
				desc = "Select outer function",
				mode = { "x", "o" },
			},
			{
				"if",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
				end,
				desc = "Select inner function",
				mode = { "x", "o" },
			},
			{
				"ac",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
				end,
				desc = "Select outer class",
				mode = { "x", "o" },
			},
			{
				"ic",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
				end,
				desc = "Select inner class",
				mode = { "x", "o" },
			},
			{
				"as",
				function()
					require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
				end,
				desc = "Select local scope",
				mode = { "x", "o" },
			},
		},
		---@module "nvim-treesitter-textobjects"
		opts = { multiwindow = true },
	},
}
