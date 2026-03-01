require("core.options")
require("core.keymaps")
require("statusline")
vim.opt.statusline = "%!v:lua.require('statusline').get()"
require("core.lazy")
