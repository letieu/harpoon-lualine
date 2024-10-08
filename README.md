# Harpoon Lualine Plugin

![Screenshot 2024-03-15 at 12 47 08 PM](https://github.com/letieu/harpoon-lualine/assets/53562817/5d6f055f-de67-46dd-8b73-ecbf7a5dba5b)

**Add a harpoon indicator to your Neovim Lualine!**

## Features

* Shows [Harpoon](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) status in [Lualine](https://github.com/nvim-lualine/lualine.nvim).



> [!IMPORTANT]  
> Make sure to install [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2) , not harpoon on `master` branch
>


## Installation

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

## Usage

Add this to your [Lualine](https://github.com/nvim-lualine/lualine.nvim) setup:

```lua
lualine_c = { "harpoon2" },
```

**Custom config**

```lua
lualine_c = {
  {
    "harpoon2",
    icon = '♥',
    indicators = { "a", "s", "q", "w" },
    active_indicators = { "A", "S", "Q", "W" },
    color_active = { fg = "#00ff00" },
    _separator = " ",
    no_harpoon = "Harpoon not loaded",
  },
}

```

**Use function as indicator**

```lua
  -- harpoon_entry = {
  --   context = { col = 0, row = 1 },
  --   value = "init.lua"
  -- }
  local function get_harpoon_indicator(harpoon_entry)
    return harpoon_entry.value
  end

  -- lualine setup
  ...
  active_indicators = {
    get_harpoon_indicator,
    get_harpoon_indicator,
    get_harpoon_indicator,
    get_harpoon_indicator,
  },
  ...
```

## How I use harpoon 💡

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


## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center" valign="top" width="14.28%"><a href="https://mairimashita.org/"><img src="https://avatars.githubusercontent.com/u/68560840?v=4?s=100" width="100px;" alt="Taken"/><br /><sub><b>Taken</b></sub></a><br /><a href="https://github.com/letieu/harpoon-lualine/commits?author=TakenMC" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="http://letieu.github.io"><img src="https://avatars.githubusercontent.com/u/53562817?v=4?s=100" width="100px;" alt="Le Tieu"/><br /><sub><b>Le Tieu</b></sub></a><br /><a href="#maintenance-letieu" title="Maintenance">🚧</a> <a href="#ideas-letieu" title="Ideas, Planning, & Feedback">🤔</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/simachri"><img src="https://avatars.githubusercontent.com/u/3276460?v=4?s=100" width="100px;" alt="simachri"/><br /><sub><b>simachri</b></sub></a><br /><a href="https://github.com/letieu/harpoon-lualine/commits?author=simachri" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://www.pdewey.com/"><img src="https://avatars.githubusercontent.com/u/57921252?v=4?s=100" width="100px;" alt="Patrick Dewey"/><br /><sub><b>Patrick Dewey</b></sub></a><br /><a href="https://github.com/letieu/harpoon-lualine/commits?author=ptdewey" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="http://mageowlstudios.com"><img src="https://avatars.githubusercontent.com/u/32573897?v=4?s=100" width="100px;" alt="Owen L."/><br /><sub><b>Owen L.</b></sub></a><br /><a href="https://github.com/letieu/harpoon-lualine/commits?author=mageowl" title="Code">💻</a></td>
      <td align="center" valign="top" width="14.28%"><a href="https://github.com/hareki"><img src="https://avatars.githubusercontent.com/u/81374684?v=4?s=100" width="100px;" alt="Nguyen Ngoc Minh Tu"/><br /><sub><b>Nguyen Ngoc Minh Tu</b></sub></a><br /><a href="https://github.com/letieu/harpoon-lualine/commits?author=hareki" title="Code">💻</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
