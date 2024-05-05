return{
    -- solarized-osaka
  {
    "craftzdog/solarized-osaka.nvim",
    branch = "osaka",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        -- Added transparency
        transparent = true,
      }
    end,
  },
  -- one dark
    {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("onedark").setup({
        style = "dark",
        transparent = true, -- Turn off if you want OneDark Theme to take the wheel instead of Windows terminal's background colour
    })
    end,
  },
}
