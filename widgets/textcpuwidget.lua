local wibox = require("wibox")
local vicious = require("vicious")

local cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu, 'CPU: <span color="#CC9933">$1%</span>', 1)

return cpuwidget
