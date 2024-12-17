return {
	{ "Mofiqul/vscode.nvim" },

	{
		"folke/trouble.nvim",
		opts = { use_diagnostic_signs = true },
	},

	{ "folke/trouble.nvim", enabled = true },

	{
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-emoji" },
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			table.insert(opts.sources, { name = "emoji" })
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{
				"<leader>fp",
				function()
					require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
				end,
				desc = "Find Plugin File",
			},
		},
		opts = {
			defaults = {
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				pyright = {},
			},
		},
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/typescript.nvim",
			init = function()
				require("lazyvim.util").lsp.on_attach(function(_, buffer)
					vim.keymap.set(
						"n",
						"<leader>co",
						"TypescriptOrganizeImports",
						{ buffer = buffer, desc = "Organize Imports" }
					)
					vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
				end)
			end,
		},
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				tsserver = {},
			},
			---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
			setup = {
				tsserver = function(_, opts)
					require("typescript").setup({ server = opts })
					return true
				end,
			},
		},
	},

	{ import = "lazyvim.plugins.extras.lang.typescript" },

	-- add more treesitter parsers
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
			},
		},
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			-- add tsx and treesitter
			vim.list_extend(opts.ensure_installed, {
				"tsx",
				"typescript",
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			table.insert(opts.sections.lualine_x, {
				function()
					return "😄"
				end,
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function()
			return {}
		end,
	},

	{ import = "lazyvim.plugins.extras.ui.mini-starter" },

	{ import = "lazyvim.plugins.extras.lang.json" },

	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
				"ast-grep",
				"clang-format",
				"csharp-language-server",
				"csharpier",
				"harper-ls",
				"netcoredbg",
				"omnisharp",
				"omnisharp-mono",
				"semgrep",
				"sonarlint-language-server",
				"trivy",
				"biome",
				"cfn-lint",
				"fixjson",
				"jq",
				"json-lsp",
				"jsonlint",
				"nxls",
				"prettier",
				"prettierd",
				"rome",
				"spectral-language-server",
				"lemminx",
				"xmlformatter",
				"erb-formatter",
				"erb-lint",
				"html-lsp",
				"htmlbeautifier",
				"htmlhint",
				"lwc-language-server",
				"markuplint",
				"rustywind",
				"stimulus-language-server",
				"templ",
				"twiggy-language-server",
			},
		},
	},
}
