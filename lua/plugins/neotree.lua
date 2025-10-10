return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    close_if_last_window = true,
    window = {
      position = "left",
      width = 30,
      source = {
        "filesystem",
        "buffers",
        "git_status"
      }
    },
    source_selector = {
      winbar = true,
    },
    mappings = {
      ["P"] = {
        "toggle_preview",
        config = {
          use_float = true,
          use_image_nvim = false,
          title = 'Neo-tree Preview',
        },
      },
    },
    filesystem = {
      follow_current_file = { enabled = true }
    }
  },
  cmd = "Neotree",
  lazy = true
}
