local wibox = require("wibox")
local calendar = require("calendar")

local textclock = wibox.widget.textclock()
calendar({
    today = '<b><span color="#ff0000">%2i</span></b>'
}):attach(textclock)

return textclock

