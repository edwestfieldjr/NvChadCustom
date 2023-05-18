return {
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = 1, ---@type number? set to 1 to check for updates very slowly
    notify = false, -- will NOT get a notification when new updates are found
    frequency = 86400, -- check for updates every 24 hours
  },

  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = false, -- will NOT get a notification when changes are found
  },
}
