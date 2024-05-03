-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }
--

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
