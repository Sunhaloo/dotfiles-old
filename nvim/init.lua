-- "import" the keymaps configuration file
require("config.keymaps")
-- "import" the options configuration file
require("config.options")
-- "import" the lazy configuration file
require("config.lazy")
-- "import" the auto-command file
require("config.autocmd")

-- setting colourscheme as per 'cyberdream' documentation
vim.cmd("colorscheme vague")
