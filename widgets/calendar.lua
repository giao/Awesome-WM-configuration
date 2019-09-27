local awful = require("awful")
local wibox = require("wibox")
local calendar = require("calendar")

function calendar:calc_space(year, month)
    local empty_sep_size = 4
    local notify_width = 7*empty_sep_size
    local tA = { year=year, month=month, day=1 }
    local page_title = os.date('%B %Y', os.time(tA))
    local space_size = notify_width/2 - page_title:len()/2 + 1
    -- self.page_title = (" "):rep(space_size) .. '%B %Y'
    self.page_title = '%B %Y'
    return space_size
end
function calendar:switch(months)
    self:calc_space(self.year, self.month+months)
    self:show(self.year, self.month+months)
end
function calendar:attach(widget)
    widget:connect_signal('mouse::enter', function() self:show() end)
    widget:connect_signal('mouse::leave', function() self:hide() end)
    widget:buttons(awful.util.table.join(
        awful.button({         }, 1, function() self:switch(  1) end),
        awful.button({         }, 3, function() self:switch( -1) end),
        awful.button({         }, 4, function() self:switch( -1) end),
        awful.button({         }, 5, function() self:switch(  1) end),
        awful.button({ 'Shift' }, 1, function() self:switch( 12) end),
        awful.button({ 'Shift' }, 3, function() self:switch(-12) end),
        awful.button({ 'Shift' }, 4, function() self:switch(-12) end),
        awful.button({ 'Shift' }, 5, function() self:switch( 12) end)
    ))
end

local space_size = calendar:calc_space(os.date('%Y', os.time()), os.date('%m', os.time()))
local textclock = wibox.widget.textclock()
calendar({
    today       = '<b><u><span color="#EC2BAC">%2i</span></u></b>',
    col_title   = '<b>%a </b>',
    empty_sep   = '    ',
    week_col    = '<i><span color="#6D8B9D"> %V</span></i>',
    days_style  = {
        [6] = '<span color="#ECA72B">%s</span>',
        [7] = '<span color="#ff0000">%s</span>'
    },
    page_title  = '%B %Y'
}):attach(textclock)

return textclock

