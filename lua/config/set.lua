local opt = vim.opt


-- cursor as block
opt.guicursor = ""

-- shared clipboard
vim.o.clipboard = 'unnamedplus'

-- line numbers
opt.nu = true
opt.relativenumber = true

-- tab settings
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.autoindent = true
opt.smartindent = true

opt.wrap = false

-- backup of changes
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- search
opt.inccommand = "split"
opt.hlsearch = false
opt.incsearch = true
opt.smartcase = true
opt.ignorecase = true

-- color
opt.termguicolors = true

opt.scrolloff = 10
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50

-- netrw settings
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.g.netrw_keepdir = 0
