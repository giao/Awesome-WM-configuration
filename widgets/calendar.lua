local wibox = require("wibox")
local lain = require("lain")

local textclock = wibox.widget.textclock()

lain.widget.calendar({
  attach_to = { textclock },
  notification_preset = {
    font = "Monospace 10",
    fg   = "#1B4965",
    bg   = "#F0F0F0"
  },
})

return textclock

