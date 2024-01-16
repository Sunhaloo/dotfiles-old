# S.Sunhaloo's Neovim Config
This is my own configuration; For now it is very simple.

The Neovim package manager that I am using is [lazy.nvim](https://github.com/folke/lazy.nvim) written by folke.
I have made it so that it is similar to the Neovim distribution called [LazyVim](https://www.lazyvim.org/) and you can check my version of LazyVim [here](https://github.com/Sunhaloo/dotfiles/tree/main/nvim).
Both configuration are very simple; this is because I do not need much for now as I am not even School or anything. The most important things are my keybinds.

## What's special about the keybinds?
Nothing! Suprisingly nothing; It is also simple and I am using [devaslife's](https://www.youtube.com/@devaslife) keybindings.

  - You can watch the video on [YouTube](https://www.youtube.com/watch?v=fFHlfbKVi30&t=581s)

But I have a weird thing that I had and that is being able to move the *caret* while still in **INSERT** mode.

Here is a peak at the code which is again written in Lua

```Lua

-- Navigation Within INSERT mode

keymap.set("i", "<C-h>", "<Left>", opts)
keymap.set("i", "<C-l>", "<Right>", opts)
keymap.set("i", "<C-j>", "<Down>", opts)

-- This is not working for the moment
keymap.set("i", "<C-k>", "<Up>", opts)

```

As you can see I can use `Ctrl` and `hjkl` to move the cursor about even in **INSERT** mode.

>Everything works file; but going up does not work **only** in `.lua` files. I still do not know why.
>Because I started to use Neovim on and off just recently; I still use VS Code for my quick code alteration and other stuff and I am not the greatest typer.
>This helps me to quickly remove the typo without going into **NORMAL** mode each time
