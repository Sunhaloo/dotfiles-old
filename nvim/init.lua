-- in short the **order** or loading the configuration files are important
-- load keymaps file
require("config.keymaps")
require("config.keymaps_md")
-- load options file
require("config.options")
-- load lazy file
require("config.lazy")
-- set the theme ( main theme `onedark` )
-- vim.cmd.colorscheme("onedark")
vim.cmd.colorscheme("nord")
-- load auto-commands file
require("config.autocmd")
