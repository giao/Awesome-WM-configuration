local awful = require("awful")
local wibox = require("wibox")
local calendar = require("calendar")
function calendar:attach(widget)
    widget:connect_signal('mouse::enter', function() self:show() end)
    widget:connect_signal('mouse::leave', function() self:hide() end)
    widget:buttons(awful.util.table.join(
        awful.button({         }, 1, function() self:switch(  1) end),
        awful.button({         }, 3, function() self:switch( -1) end),
        awful.button({         }, 4, function() self:switch( -1) end),
        awful.button({         }, 5, function() self:switch(  1) end),
        awful.button({ 'Shift' }, 1, function() self:switch(-12) end),
        awful.button({ 'Shift' }, 3, function() self:switch( 12) end),
        awful.button({ 'Shift' }, 4, function() self:switch(-12) end),
        awful.button({ 'Shift' }, 5, function() self:switch( 12) end)
    ))
end

local textclock = wibox.widget.textclock()
calendar({
    today       = '<b><u><span color="#EC2BAC">%2i</span></u></b>',
    title_align = 'center',
    col_title   = '<b>%a </b>',
    empty_sep   = '    ',
    week_col    = '<i><span color="#6D8B9D"> %V</span></i>',
    days_style  = {
        [6] = '<span color="#ECA72B">%s</span>',
        [7] = '<span color="#ff0000">%s</span>'
    }
}):attach(textclock)

return textclock

