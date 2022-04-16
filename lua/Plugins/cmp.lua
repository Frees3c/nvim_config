-- nvim-cmp config.
-- Vsnip Stuff from: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings

local types = require("cmp.types")

local WIDE_HEIGHT = 40

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require("cmp")
cmp.setup {
    preselect = cmp.PreselectMode.None,
    completion = {
      keyword_length = 0,
      autocomplete = false,
    },
    -- completion = {
    --     completeopt = "menuone,noselect"
    --     -- autocomplete = false,
    -- },
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
        end
    },
    documentation = {
        border = vim.g.floating_window_border_dark,
        -- border = {"", "", "", " ", "", "", "", " "},
        -- winhighlight = "NormalFloat:NormalFloat,FloatBorder:NormalFloat",
        -- maxwidth = math.floor((WIDE_HEIGHT * 2) * (vim.o.columns / (WIDE_HEIGHT * 2 * 16 / 9))),
        -- maxheight = math.floor(WIDE_HEIGHT * (WIDE_HEIGHT / vim.o.lines))
    },
    confirmation = {
        default_behavior = types.cmp.ConfirmBehavior.Insert,
        get_commit_characters = function(commit_characters)
            return commit_characters
        end
    },
    min_length = 0, -- allow for `from package import _` in Python
    -- ... Your other configuration ...

    
     mapping = {
        ["<C-d>"] = cmp.mapping.scroll_docs(-5),
        ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-e>"] = cmp.mapping.close(),
        ["<CR>"] = function(fallback)
            if cmp.visible() then
                return cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = true,
                }(fallback)
            else
                return fallback()
            end
        end,
        ["<C-n>"] = function(fallback)
            if cmp.visible() then
                return cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }(fallback)
            else
                return cmp.mapping.complete { reason = cmp.ContextReason.Auto }(fallback)
            end
        end,
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    },   
    -- mapping = {
    --     ["<C-p>"] = cmp.mapping.select_prev_item(),
    --     ["<C-n>"] = cmp.mapping.select_next_item(),
    --     ["<Tab>"] = cmp.mapping(
    --         function(fallback)
    --             if cmp.visible() then
    --                 vim.fn.feedkeys(t("<cr>"), "")
    --             elseif vim.fn["vsnip#available"](1) == 1 then
    --                 vim.fn.feedkeys(t("<Plug>(vsnip-expand-or-jump)"), "")
    --             elseif check_back_space() then
    --                 vim.fn.feedkeys(t("<tab>"), "n")
    --             else
    --                 fallback()
    --             end
    --         end,
    --         {
    --             "i",
    --             "s"
    --         }
    --     ),
    --     ["<CR>"] = cmp.mapping.confirm(
    --         {
    --             behavior = cmp.ConfirmBehavior.Replace,
    --             select = true
    --         }
    --     )
    -- },
    formatting = {
        format = function(entry, vim_item)
            local icons = require("lsp.kind").icons
            vim_item.kind = icons[vim_item.kind]
            vim_item.menu =
                ({
                nvim_lsp = "(LSP)",
                emoji = "(Emoji)",
                path = "(Path)",
                calc = "(Calc)",
                cmp_tabnine = "(Tabnine)",
                vsnip = "(Snippet)",
                luasnip = "(Snippet)",
                buffer = "(Buffer)"
            })[entry.source.name]
            vim_item.dup =
                ({
                buffer = 1,
                path = 1,
                nvim_lsp = 0
            })[entry.source.name] or 0
            return vim_item
        end
    },
    sources = {
        {name = "nvim_lsp", max_item_count = 20, priority_weight = 100},
        {name = "vsnip", priority_weight = 80},
        {name = "buffer", max_item_count = 5, priority_weight = 70},
        {name = "path", priority_weight = 110},
        {name = "emoji", priority_weight = 10},
        {name = "nvim_lua", priority_weight = 90}
    }
}

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({map_char = {tex = ""}}))

-- local capabilities = vim.lsp.protocol.make_client_capabilities()

-- capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
