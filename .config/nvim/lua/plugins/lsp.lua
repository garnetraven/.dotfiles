require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"lua_ls",
		"rust_analyzer",
	},
})

local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
	local opts = { noremap=true, silent=true, buffer=bufnr }

	-- LSP keymaps
	vim.keymap.set("n", "gd", lspconfig.util.default_config.on_attach and vim.lsp.buf.definition or vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

end

lspconfig.rust_analyzer.setup({
	on_attach = on_attach,
	settings = {
		["rust-analyzer"] = {
			cargo = { allFeatures = true },
			diagnostics = { enable = true },
		}
	}
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = { enable = false },
			runtime = {
				version = 'LuaJIT',
			},
		}
	}
})
