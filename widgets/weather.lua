local wibox = require("wibox")
local vicious = require("vicious")

local weather = wibox.widget.textbox()
vicious.register(weather, vicious.widgets.weather, "Weather: ${city} | Temp: ${tempc}⁰C | Humid: ${humid}%", 1200, "KPVD")
---vicious.register(weather, vicious.widgets.weather, "Weather: ${city}.  Sky: ${sky}. Temp: ${tempc}c Humid: ${humid}%. Wind: ${windkmh} KM/h", 1200, "LFBO")

return weather
