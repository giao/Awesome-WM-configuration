local wibox = require("wibox")
local vicious = require("vicious")

local weather = wibox.widget.textbox()
vicious.register(weather, vicious.widgets.weather, "Weather: ${city}, Temp: ${tempc}⁰C", 1200, "UWGG")

return weather
