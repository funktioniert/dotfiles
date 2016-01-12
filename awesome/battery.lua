local wibox = require("wibox")
 
battery_widget = wibox.widget.textbox()
battery_widget:set_align("right")
 
function update_battery(widget)
   local fd = io.popen('acpi -b | cut -f2 -d"," | sed -e "s/[[:space:]]//g"')
   local status = fd:read("*all")
   fd:close()
 
   if (status == nil or status == '' )then
	status = "AC"
   end

   widget:set_markup(status)
end
 
update_battery(battery_widget)
 
mytimer = timer({ timeout = 60 })
mytimer:connect_signal("timeout", function () update_battery(battery_widget) end)
mytimer:start()

