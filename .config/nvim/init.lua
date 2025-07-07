local vim = vim

local Plug = vim.fn['plug#']
vim.call('plug#begin')

Plug('Mofiqul/vscode.nvim')
Plug('vim-airline/vim-airline')
Plug('tpope/vim-fugitive')
Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-treesitter/playground')
Plug('preservim/nerdtree')
Plug('nvim-lua/plenary.nvim')
Plug('ej-shafran/compile-mode.nvim')
Plug('RaafatTurki/hex.nvim')
Plug('hrsh7th/nvim-cmp')

vim.call('plug#end')

require('vscode').setup({
    italic_comments = false,
    disable_nvimtree_bg = true,
})

require('vscode').load('dark')

require('nvim-treesitter.configs').setup {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = { "c", "cpp", "lua", "python", "glsl", "java" },
}

require('cmp').setup({
	completion = {
		autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
	},
	sources = {
		{ name = "nvim-lsp" },
		{ name = "buffer" },
	},
})

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#FFD70A" })
        vim.api.nvim_set_hl(0, "@type.definition",  { fg = "#33BBB0" })
        vim.api.nvim_set_hl(0, "@type",             { fg = "#33BBB0" })
        vim.api.nvim_set_hl(0, "@constant.macro",   { fg = "#569CD6" })
        vim.api.nvim_set_hl(0, "@function",         { fg = "#DCDC9D" })
        vim.api.nvim_set_hl(0, "@keyword.type",     { fg = "#569CD6" })
        vim.api.nvim_set_hl(0, "@include",          { fg = "#569CD6" })
        vim.api.nvim_set_hl(0, "@string",           { fg = "#CE9178" })
        vim.api.nvim_set_hl(0, "@number",           { fg = "#B5CEA8" })
        vim.api.nvim_set_hl(0, "@comment",          { fg = "#6A9955" })
        vim.api.nvim_set_hl(0, "@operator",         { fg = "#D4D4D4" })
        vim.api.nvim_set_hl(0, "@keyword",          { fg = "#C586C0" })
        vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#569CD6" })
        vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = "#569CD6" })
    end,
})

vim.cmd("doautocmd ColorScheme")

vim.opt.number = true
vim.opt.rnu = true
vim.opt.cursorline = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false
vim.opt.showmode = false
vim.opt.shortmess:append("I")

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

vim.api.nvim_set_hl(0, "CursorLineNr", {fg = "#ffdd33", bg = "NONE", bold = true})

vim.g['airline#extentions#branch#enabled'] = 1
vim.g['airline#extensions#whitespace#enabled'] = 0


vim.api.nvim_create_autocmd("TermClose", {
    callback = function()
        vim.cmd("close")
    end
})

vim.api.nvim_create_user_command("Term", function()
    vim.cmd("tabnew | terminal")
end, {})


