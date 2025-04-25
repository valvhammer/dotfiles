local vim = vim


local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('Mofiqul/vscode.nvim')
Plug('vim-airline/vim-airline')
Plug('tpope/vim-fugitive')
Plug('nvim-treesitter/nvim-treesitter')
Plug('nvim-treesitter/playground')
Plug('preservim/nerdtree')

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

vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        -- Core delimiters
        vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#FFD70A" })

        -- Class/struct/enum names
        vim.api.nvim_set_hl(0, "@type.definition", { fg = "#33BBB0" })

        -- Custom type usage (e.g., user-defined types)
        vim.api.nvim_set_hl(0, "@type", { fg = "#33BBB0" })

        -- Preprocessor macros
        vim.api.nvim_set_hl(0, "@constant.macro", { fg = "#569CD6" })

        -- Function names
        vim.api.nvim_set_hl(0, "@function", { fg = "#DCDC9D" })

        -- Keywords like struct/class/union/typedef
        vim.api.nvim_set_hl(0, "@keyword.type", { fg = "#569CD6" })

        -- Preprocessor directives like #include
        vim.api.nvim_set_hl(0, "@include", { fg = "#569CD6" })

        -- Strings
        vim.api.nvim_set_hl(0, "@string", { fg = "#CE9178" })

        -- Numbers
        vim.api.nvim_set_hl(0, "@number", { fg = "#B5CEA8" })

        -- Comments (no italic)
        vim.api.nvim_set_hl(0, "@comment", { fg = "#6A9955" })

        -- Operators (+, -, etc.)
        vim.api.nvim_set_hl(0, "@operator", { fg = "#D4D4D4" })

        -- Control flow keywords
        vim.api.nvim_set_hl(0, "@keyword", { fg = "#C586C0" })
        vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#569CD6" })
        vim.api.nvim_set_hl(0, "@keyword.modifier", { fg = "#569CD6" })
    end,
})

vim.cmd("doautocmd ColorScheme")

vim.cmd('silent! set number')
vim.cmd('silent! set rnu')
vim.cmd('silent! set cursorline')
vim.cmd('silent! set tabstop=4')
vim.cmd('silent! set shiftwidth=4')
vim.cmd('silent! set expandtab')
vim.cmd('silent! set noshowmode')
vim.cmd('silent! set shm+=I')

vim.api.nvim_set_hl(0, "CursorLineNr", {fg = "#ffdd33", bg = "NONE", bold = true})

vim.g['airline#exentions#branch#enabled'] = 1

vim.api.nvim_create_autocmd("TermClose", {
    callback = function()
        vim.cmd("close")
    end
})

vim.api.nvim_create_user_command("Term", function()
    vim.cmd("tabnew | terminal")
end, {})

