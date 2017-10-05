local wibox = require("wibox")
local vicious = require("vicious")

local cpuwidget = wibox.widget.textbox()
vicious.register(cpuwidget, vicious.widgets.cpu,
    function (widget, args)
        if args[1] >= 50 and args[1] < 75 then
            return string.format("CPU: <span color=\"#CC9933\">%2d%%</span>", args[1])
        elseif args[1] >= 75 then
            return string.format("CPU: <span color=\"#ff0000\">%2d%%</span>", args[1])
        else
            return string.format("CPU: %2d%%", args[1])
        end
    end, 1) -- Update every 1 seconds

return cpuwidget
