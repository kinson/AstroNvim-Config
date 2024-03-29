return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "astrodark",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
    update_in_insert = false,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
        "tsserver",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    config = {
      elixirls = function(opts)
        local path_to_elixirls = vim.fn.expand "~/Documents/vim/elixir-ls/release/language_server.sh"

        opts.settings = { elixirLs = { dialyzerEnabled = true, fetchDeps = false } }
        opts.cmd = { path_to_elixirls }
        return opts
      end,
    },
  },

  heirline = {
    colors = {
      buffer_active_bg = "#6BFF29",
      buffer_active_fg = "#444444",
      buffer_visible_bg = "#3646F5",
      buffer_visible_fg = "#ffffff",
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  plugins = {
    "windwp/nvim-ts-autotag.nvim",
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    vim.api.nvim_create_augroup("autoshowneotree", { clear = true })

    vim.api.nvim_create_autocmd("TabNewEntered", {
      desc = "Show neo tree when new tab is created",
      group = "autoshowneotree",
      -- callback = function() vim.cmd ":Neotree reveal" end,
      command = ":Neotree reveal",
    })

    vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
      desc = "highlight exs files too",
      pattern = "*.exs",
      command = "set syntax=elixir",
    })

    -- taken from page 156 of Practical Vim

    -- Set up custom filetypes
    -- vim.filetype.add {
    -- extension = {
    --   exs = "elixir",
    -- },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }
  end,
}
