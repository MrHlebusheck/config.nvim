return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "English",
        path = "~/Obsidian/English",
      },
    },
    daily_notes = {
      folder = "Daily",
      date_format = "%d.%m.%Y"
    },
    completion = {
      nvim_cmp = true
    },
    templates = {
      subdir = "Templates",
      date_format = "%d.%m.%Y",
      time_format = "%H:%M"
    },
    ui = {
      enable = true
    }
  }
}
