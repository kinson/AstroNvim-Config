---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts.ensure_installed = require("astrocore").list_insert_unique(opts.ensure_installed, {
      "lua",
      "elixir",
      -- "vim",
      -- add more arguments for adding more treesitter parsers
    })

    opts.auto_install = true

    -- TODO: Do I need this?
    opts.autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
    }

    return opts
  end,
}
