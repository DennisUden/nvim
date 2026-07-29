-- set <leader> to SPACE
vim.g.mapleader = " "
-- enable relative line numbers
vim.opt.relativenumber = true
-- highlight current line
vim.opt.cursorline = true
-- disable line wrap
vim.opt.wrap = false
-- disable swap file
vim.opt.swapfile = false

-- ### fix search highlighting contrast if cursor is on the result ###
local search_cursor_aug = vim.api.nvim_create_augroup("SearchCursor", { clear = true })

-- 1. Activate block cursor when you start a search
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = search_cursor_aug,
  pattern = { "/", "\\?" },
  callback = function()
    vim.opt.guicursor:append("n-v-c:block-Cursor/lCursor")
  end,
})

-- 2. Smart <Esc> that does both: clear highlights + restore cursor
vim.keymap.set("n", "<Esc>", function()
  local was_hlsearch = vim.v.hlsearch == 1

  -- Clear search highlights if they are active
  if was_hlsearch then
    vim.cmd("nohlsearch")
  end

  -- Remove the block cursor rule
  local cursor = vim.opt.guicursor:get()
  local new_cursor = {}
  for _, entry in ipairs(cursor) do
    if not entry:match("^n%-v%-c:block") then
      table.insert(new_cursor, entry)
    end
  end
  vim.opt.guicursor = new_cursor

  -- If highlights weren't active, pass through normal <Esc> behavior
  if not was_hlsearch then
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, true, true), "n", false)
  end
end, { desc = "Clear search + restore cursor" })
