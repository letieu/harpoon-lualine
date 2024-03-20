## Harpoon Lualine Plugin

![Screenshot 2024-03-15 at 12 47 08 PM](https://github.com/letieu/harpoon-lualine/assets/53562817/5d6f055f-de67-46dd-8b73-ecbf7a5dba5b)

**Add a harpoon indicator to your Neovim Lualine!**

**Features:**

* Shows [Harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) status in [Lualine](https://github.com/nvim-lualine/lualine.nvim).

**Installation:**

* With **lazy.nvim**
```lua
  {
    "letieu/harpoon-lualine",
    dependencies = {
      {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
      }
    },
  }
```
* With **packer.nvim**
```lua
  use {
    'letieu/harpoon-lualine',
    opt = false,
    requires = {{'ThePrimeagen/harpoon'}}
  }

```

**Usage:**

Add this to your [Lualine](https://github.com/nvim-lualine/lualine.nvim) setup:

```lua
lualine_c = { "harpoon2" },
```

Custom config

```lua
lualine_c = { 'another_item', {
  "harpoon2",
  icon = '♥',
  indicators = { "a", "s", "q", "w" },
  active_indicators = { "A", "S", "Q", "W" },
  _separator = " ",
},

```

**How I use harpoon 💡**

Bind harpoon mark to `a`, `s`, `q`, `w` and use `Ctrl` + `a`, `s`, `q`, `w` to jump to the mark.

```lua
vim.keymap.set("n", "<C-a>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-s>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-q>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-w>", function() harpoon:list():select(4) end)
```

View current marks with lualine

```lua
lualine_c = { 
  '%=', -- make the indicator center
  {
    "harpoon2",
    indicators = { "a", "s", "q", "w" },
    active_indicators = { "A", "S", "Q", "W" },
    _separator = " ",
  }
}
```

**Enjoy!**

**Note:** Customize indicator characters by editing the configuration.

**Note:** To center the indicator, add a `%=`. For example: `lualine_c = { "%=", "harpoon2"},`
