local vim = vim

local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('Mofiqul/vscode.nvim')
Plug('morhetz/gruvbox')
Plug('vim-airline/vim-airline')
Plug('tpope/vim-fugitive')
Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-treesitter/playground')
Plug('preservim/nerdtree')
Plug('nvim-lua/plenary.nvim')
Plug('ej-shafran/compile-mode.nvim')
Plug('williamboman/mason.nvim')
Plug('williamboman/mason-lspconfig.nvim')
Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-vsnip')
Plug('hrsh7th/vim-vsnip')

vim.call('plug#end')

require('vscode').setup({
    italic_comments = false,
    disable_nvimtree_bg = true,
})

--require('vscode').load('dark')

require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = { "c", "cpp", "lua", "python", "glsl", "java" },
}

require('mason').setup()

local masonlspconf = require("mason-lspconfig")

masonlspconf.setup({
	ensure_installed = { "clangd", "jdtls" },
})

local lspconfig = require('lspconfig')

--masonlspconf.setup_handlers({
--	function(server_name)
--		lspconfig[server_name].setup {}
--	end,
--})

lspconfig["clangd"].setup {}
lspconfig["jdtls"].setup {}

local cmp = require('cmp')
--
--cmp.setup({
--	snippet = {
--		expand = function(args)
--			vim.fn["vsnip#anonymous"](args.body)
--		end,
--	},
--	mapping = cmp.mapping.preset.insert({
--		['<C-b>'] = cmp.mapping.scroll_docs(-4),
--		['<C-f>'] = cmp.mapping.scroll_docs(4),
--		['<C-Space>'] = cmp.mapping.complete(),
--		['<C-e>'] = cmp.mapping.abort(),
--		['<CR>'] = cmp.mapping.confirm({select = true})
--	}),
--	sources = cmp.config.sources({
--		{ name = 'nvim_lsp' },
--		{ name = "vsnip"},
--	}, {
--		{ name = 'buffer' },
--	})
--})	

cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
          i = cmp.mapping.abort(),
          c = cmp.mapping.close(),
        }),
      ['<CR>'] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Insert }),
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        --{ name = 'ultisnips' }, -- For ultisnips users.
        --{ name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
  })


cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }, { name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'buffer' }
    })
})

-- for vscode
--vim.api.nvim_create_autocmd("ColorScheme", {
--    pattern = "*",
--    callback = function()
--        vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#FFD70A" })
--        vim.api.nvim_set_hl(0, "@type.definition",  { fg = "#33BBB0" })
--        vim.api.nvim_set_hl(0, "@type",             { fg = "#33BBB0" })
--        vim.api.nvim_set_hl(0, "@constant.macro",   { fg = "#569CD6" })
--        vim.api.nvim_set_hl(0, "@function",         { fg = "#DCDC9D" })
--        vim.api.nvim_set_hl(0, "@keyword.type",     { fg = "#569CD6" })
--        vim.api.nvim_set_hl(0, "@include",          { fg = "#569CD6" })
--        vim.api.nvim_set_hl(0, "@string",           { fg = "#CE9178" })
--        vim.api.nvim_set_hl(0, "@number",           { fg = "#B5CEA8" })
--        vim.api.nvim_set_hl(0, "@comment",          { fg = "#6A9955" })
--        vim.api.nvim_set_hl(0, "@operator",         { fg = "#D4D4D4" })
--        vim.api.nvim_set_hl(0, "@keyword",          { fg = "#C586C0" })
--        vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#569CD6" })
--        vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = "#569CD6" })
--    end,
--})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "@variable", { fg = "#82a497" })
		vim.api.nvim_set_hl(0, "@operator", { fg = "#fd8019", bold = true, }) 
	end,
})


vim.cmd("doautocmd ColorScheme")

vim.opt.number = true
vim.opt.rnu = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.shortmess:append("I")

vim.cmd("colorscheme gruvbox")
vim.cmd("highlight Normal guibg=#000000") 

vim.g.clipboard = {
    name = "xclip",
    copy = {
        ["+"] = "xclip -selection clipboard",
        ["*"] = "xclip -selection primary"
    },
    paste = {
        ["+"] = "xclip -selection clipboard -o",
        ["*"] = "xclip -selection primary -o"
    },
    cache_enabled = false,
}

vim.filetype.add({
    extension = {
    	vs = "glsl",
    	fs = "glsl",
        xinitrc = "sh",
        b = "c",
    }
})

vim.api.nvim_set_hl(0, "CursorLine", {bg = "#181818"})
vim.api.nvim_set_hl(0, "CursorLineNr", {fg = "#ffdd33", bg = "NONE", bold = true})

vim.g['airline#extentions#branch#enabled'] = 1
vim.g['airline#extensions#whitespace#enabled'] = 0

vim.g.compile_mode = {}

vim.keymap.set("n", "<C-d>", ":Compile<CR>", { noremap = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", {noremap = true })
vim.keymap.set("n", "<C-f>", "/", {noremap = true})
vim.keymap.set("n", "<M-g>", function()
    vim.cmd("+Man " .. vim.fn.input("Manpage: "))
end)
vim.keymap.set("n", "<S-a>", ":source ~/.config/nvim/init.lua<CR>", {noremap = true})

vim.keymap.set("n", "<S-s>", function()
    vim.cmd("saveas" .. vim.fn.input("File name: "))
end)

vim.keymap.set("n", "<C-e>", function()
  vim.cmd("split | terminal " .. vim.fn.input("Shell command: "))
end)


vim.api.nvim_create_user_command("Term", function()
    vim.cmd("tabnew | terminal")
end, {})

vim.api.nvim_create_user_command("TransOn", function()
	vim.cmd("highlight Normal guibg=#00000000")
end, {})

vim.api.nvim_create_user_command("TransOff", function()
	vim.cmd("highlight Normal guibg=#000000")
end, {})
