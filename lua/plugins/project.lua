return {
    'ahmedkhalf/project.nvim',
    event = "VeryLazy",
    config = function()
        require('project_nvim').setup({
            manual_mode = true,
            detection_methods = { "pattern" },
            patterns = { "Makefile", "Cargo.toml", "package.json", "go.mod", ".venv", "setup.py", ".git" },
            exclude_dirs = { "~/.config/*" },
        })
    end
}
