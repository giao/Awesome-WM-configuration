local wibox = require("wibox")
local vicious = require("vicious")

local memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem, "RAM: $1% ($2MB/$3MB)", 1) -- Update every 1 seconds

return memwidget
