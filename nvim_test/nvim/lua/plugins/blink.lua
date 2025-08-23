return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      menu = {
        border = "rounded",
      },

      documentation = {
        window = {
          border = "rounded",
        },
      },
    },
  },
}
