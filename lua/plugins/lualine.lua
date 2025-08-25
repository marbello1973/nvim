return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
        return {
            --[[add your custom lualine config here]]
            table.insert(opts.sections.lualine_x, {
                function()
                    return "😄"
                end,
            }),
        }
    end,
}

--[[
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
]]
