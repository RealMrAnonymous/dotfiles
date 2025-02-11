-- Install lazy.nvim if it is not already installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Other setup
-- vim.g.mapleader = ","

vim.g.termguicolors = true

vim.cmd("filetype indent on")
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.shiftround = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.tabstop = 4

vim.opt.encoding = "utf-8"
vim.opt.linebreak = true
vim.opt.scrolloff = 3
vim.cmd("syntax enable")
vim.opt.wrap = true

vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "tex",
--     command = "setlocal nocursorline",
-- })
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    command = "setlocal nornu",
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "tex",
    command = ":NoMatchParen",
})

vim.opt.clipboard = "unnamed"

vim.keymap.set('n', "<leader>c", ":nohl<CR><C-l>")
-- vim.keymap.set('n', "<leader>u", [[<Cmd>call UltiSnips#RefreshSnippets()<CR>]])

-- vim.cmd("set spell spelllang=en_gb")
-- vim.cmd("set nospell")
vim.cmd("au FileType tex set spell spelllang=en_gb")

require("lazy").setup({
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    --     {
    --         "alexmozaidze/palenight.nvim",
    --         priority = 1000,
    --     },
    "nvim-tree/nvim-web-devicons",
    {
        "nvim-lualine/lualine.nvim",
        depedencies = { "nvim-tree/nvim-web-devicons" }
    },
    --     {
    --         "ggandor/leap.nvim",
    --         dependencies = { "tpope/vim-repeat" }
    --     },
    "karb94/neoscroll.nvim",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    --     {
    --         "folke/noice.nvim",
    --         event = "VeryLazy",
    --         dependencies = {
    --             "MunifTanjim/nui.nvim",
    --             "rcarriga/nvim-notify",
    --             "hrsh7th/nvim-cmp",
    --         },
    --     },
    --     {
    --         "nvim-telescope/telescope.nvim",
    --         tag = "0.1.5",
    --         dependencies = {
    --             "nvim-lua/plenary.nvim",
    --         },
    --     },
    {
        "lervag/vimtex",
        lazy = false,
    },
    "KeitaNakamura/tex-conceal.vim",
    "SirVer/ultisnips",
})

require("tokyonight").setup({
    style = "storm",
    transparent = true,
})
vim.cmd[[colorscheme tokyonight]]

require("lualine").setup()

-- vim.keymap.set({'n', 'x', 'o'}, 'f', '<Plug>(leap-forward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'F', '<Plug>(leap-backward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'gf', '<Plug>(leap-from-window)')
-- require("leap").opts.special_keys.prev_target = "<bs>"
-- require("leap").opts.special_keys.prev_group = "<bs>"
-- require("leap.user").set_repeat_keys("<cr>", "<bs>")

require("neoscroll").setup()

-- require("noice").setup({
--     lsp = {
--         override = {
--             ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--             ["vim.lsp.util.stylize_markdown"] = true,
--             ["cmp.entry.get_documentation"] = true,
--         },
--     },
-- })

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {'tabs'}
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {}
};

require('nvim-web-devicons').setup {
    default = true;
}

-- local builtin = require("telescope.builtin")
-- vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.g.vimtex_view_method = "zathura"
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_progname = "nvr"
vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
vim.g.vimtex_quickfix_open_on_warning = 0

vim.opt.conceallevel = 2
vim.g.tex_conceal = "abdmg"
vim.g.tex_superscripts = "[0-9a-zA-W.,:;+-<>/()=]"
vim.g.tex_subscripts = "[0-9aehijklmnoprstuvx,+-/().]"

vim.g.UltiSnipsExpandTrigger = '<C-K>'
vim.g.UltiSnipsJumpForwardTrigger = '<Tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-Tab>'

vim.g.tex_flavor = "latex"
vim.g.tex_indent_items = 0
vim.g.tex_indent_and = 0
vim.g.tex_indent_brace = 0
vim.cmd("au FileType tex vnoremap <C-_> :s/^/% /<CR>:noh<CR>")

-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "tex",
--     callback = function()
--         vim.lsp.start({
--             name = "latex-lsp",
--             cmd = { "texlab" },
--             root_dir = "~/Documents/Studie/Vakken",
--         })
--     end,
-- })

