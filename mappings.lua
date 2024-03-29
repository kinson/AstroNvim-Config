-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    op = { function() require("telescope.builtin").buffers() end, desc = "Find buffers" },
    qq = { function() require("telescope.builtin").live_grep() end, desc = "Search project" },
    qw = {
      function()
        require("telescope.builtin").live_grep { additional_args = function(opts) return { "--hidden" } end }
      end,
      desc = "Search project (include hidden)",
    },
    ff = { function() require("telescope.builtin").find_files() end, desc = "Find file" },
    of = {
      function() require("telescope.builtin").find_files { hidden = true } end,
      desc = "Find file (include hidden)",
    },
    ww = { function() require("telescope.builtin").grep_string() end, desc = "Find word under cursor" },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    -- customize toggle term mapping
    ["<F6>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    ["<F7>"] = false,
    ["<leader>w"] = { ":bp<bar>sp<bar>bn<bar>bd<cr>", desc = "Close buffer" },
  },
  t = {
    -- setting a mapping to false will disable it
    ["<esc>"] = { "<C-\\><C-N>", desc = "Leave normal mode" },
    ["+"] = { "2<C-\\>", desc = "Add split term" },
    ["<F6>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    ["<F7>"] = false,
  },
}
