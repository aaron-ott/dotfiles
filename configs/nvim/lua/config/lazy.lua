local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import any extras modules here
    -- { import = "lazyvim.plugins.extras.lang.typescript" },
    -- { import = "lazyvim.plugins.extras.lang.json" },
    -- { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- import/override with your plugins
    { import = "plugins" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = false }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "yorickpeterse/nvim-window",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "flash.nvim",
      },
    },
  },
  rocks = {
    enabled = false,
  },
})

local dap = require('dap')
-- One adapter, two modes: attach -> connect to a running debugpy; launch -> spawn debugpy.adapter.
dap.adapters.python = function(callback, config)
  if config.request == "attach" then
    local c = config.connect or {}
    callback({ type = "server", host = c.host or "127.0.0.1", port = c.port or 5678 })
  else
    callback({ type = "executable", command = "python", args = { "-m", "debugpy.adapter" } })
  end
end

local function split_args(s)
  return s == "" and {} or vim.split(s, " ", { trimempty = true })
end

vim.keymap.set("n", "<leader>da", function()
  vim.ui.select({ "Run", "Attach" }, { prompt = "Debug:" }, function(choice)
    if not choice then return end
    if choice == "Run" then
      vim.ui.input({ prompt = "Args: " }, function(args)
        if args == nil then return end
        dap.run({
          type = "python",
          request = "launch",
          name = "Run with args",
          program = "${file}",
          args = split_args(args),
          console = "integratedTerminal",
        })
      end)
    else
      vim.ui.input({ prompt = "Host: ", default = "127.0.0.1" }, function(host)
        if not host then return end
        vim.ui.input({ prompt = "Port: ", default = "5678" }, function(port)
          if not port then return end
          dap.run({
            type = "python",
            request = "attach",
            name = "Attach to debugpy",
            connect = { host = host, port = tonumber(port) },
          })
        end)
      end)
    end
  end)
end, { desc = "Launch Debug" })

require('conform').setup({
    formatters_by_ft = {
        javascript = { "prettier" }
    }
})
