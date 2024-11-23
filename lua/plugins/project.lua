return {
    'ahmedkhalf/project.nvim',
    event = "VeryLazy",
    config = function()
        require('project_nvim').setup({
            detection_methods = { "pattern" },
            patterns = { ".git", "Makefile", "package.json", "Cargo.toml", "go.mod", ".venv", "setup.py" },
        })
    end
}
