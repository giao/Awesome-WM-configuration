local wibox = require("wibox")
local vicious = require("vicious")

local memwidget = wibox.widget.textbox()
vicious.cache(vicious.widgets.mem)
vicious.register(memwidget, vicious.widgets.mem,
    function (widget, args)
        if args[1] >= 50 and args[1] < 75 then
            return string.format("RAM: <span color=\"#CC9933\">%2d%%</span> (<span color=\"#CC9933\">%dMB</span>/%dMB)", args[1], args[2], args[3])
        elseif args[1] >= 75 then
            return string.format("RAM: <span color=\"#FF0000\">%2d%%</span> (<span color=\"#FF0000\">%dMB</span>/%dMB)", args[1], args[2], args[3])
        else
            return string.format("RAM: %2d%% (%dMB/%dMB)", args[1], args[2], args[3])
        end
    end, 1) -- Update every 1 seconds

return memwidget
