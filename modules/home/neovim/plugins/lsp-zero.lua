local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr })
	lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_format = require('lsp-zero').cmp_format({ details = true })

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	},
	mapping = cmp.mapping.preset.insert({
		['<Tab>'] = cmp.mapping.confirm({ select = false }),
		['<C-f>'] = cmp_action.luasnip_jump_forward(),
		['<C-b>'] = cmp_action.luasnip_jump_backward(),
	}),
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
	--- (Optional) Show source name in completion menu
	formatting = cmp_format,
	preselect = 'item',
	completion = {
		completopt = 'menu,menuone,noinsert'
	},
})

require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.rust_analyzer.setup {}
require 'lspconfig'.nixd.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.clangd.setup {}
