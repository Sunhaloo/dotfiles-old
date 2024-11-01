return {
    {
        'windwp/nvim-autopairs',
		-- load on insert
        event = "InsertEnter",
        config = true,
        opts = {
			-- disable plugin in these "filetypes"
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
			-- disable plugin when recording a macro
            disable_in_macro = true,
			-- disable plugin when in visual block mode
            disable_in_visualblock = true,
			-- disable plugin when in replace mode
            disable_in_replace_mode = true,
            ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
            enable_moveright = true,
			-- add braket pairs after quotes
            enable_afterquote = true,
			-- check for brackets in the same line
            enable_check_bracket_line = true,
            enable_bracket_in_quote = true,
			-- disable abbreviations
            enable_abbr = false,
            break_undo = true, -- switch for basic rule break undo sequence
            check_ts = false,
            map_cr = true,
            map_bs = true,
            map_c_h = false,
            map_c_w = false,
        },
    }
}
