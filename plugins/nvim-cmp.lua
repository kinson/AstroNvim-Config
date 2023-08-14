-- taken and modified from: https://astronvim.com/Recipes/cmp#customize-keybindings
-- date: 8/12/23
return {
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts)
    -- opts parameter is the default options table
    -- the function is lazy loaded so cmp is able to be required
    local cmp = require "cmp"
    -- modify the mapping part of the table
    -- select = true so that elixir functions auto-close
    opts.mapping["<CR>"] = cmp.mapping.confirm { select = true }

    -- return the new table to be used
    return opts
  end,
}
