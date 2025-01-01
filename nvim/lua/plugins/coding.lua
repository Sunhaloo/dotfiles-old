-- file where I will be keeping all Coding and Quality Of Life plugins
return {
    {
        -- quality of life plugin that will save my ass if the power go down
        "okuuva/auto-save.nvim",
        -- version = '^1.0.0', -- see https://devhints.io/semver, alternatively use '*' to use the latest tagged release
        -- use the latest version
        version = '*',
        -- lazy loading on command
        cmd = "ASToggle",
        -- start on these 2 events
        event = { "InsertLeave", "TextChanged" },
        -- configuration for 'auto-save.nvim'
        opts = {
            -- auto-start 'auto-save.nvim' when package manager load plugins
            enabled = true,
            -- how long to wait to save ( based on the `events` )
            debounce_delay = 2000,
            -- WARNING: Test the line below V
            noautocmd = false -- ==> default value = `false`
        },
    },
}
