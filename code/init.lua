require "display"

if file.exists("config.lua") then
  require "config"
  config = get_config()
  mode = 2
else
  mode = 1
end

-- modes
-- 1 config
-- 2 wifi
-- 3 running

function update()

  if mode == 0 then
    display.drawErr("Still booting","Please wait","(o_o)")
  elseif mode == 1 then
    display.drawErr("Config.lua","Not found!","(x_x)")
  elseif mode == 2 then
    display.drawMsg("Setting up Wifi","Please wait","(-_-) z Z Z")
    
    if wifi.sta.getip() then
      mode = 3
    end
  else -- assume mode 3
    display.drawMsg("", "Checking url","(^o^)")
  end

  --restart timer
  updateTmr:start()
end

function main()
  -- setup i2c interface
  print("Setting up i2C")
  local bus_id  = 0
  local sda = 3 -- GPIO0 - D3
  local scl = 4 -- GPIO2 - D4
  i2c.setup(bus_id, sda, scl, i2c.FAST)
  local sla = 0x3C
  print("Setting up display")
  -- setup display
  display = newDisplay(bus_id, sla)
  display.drawMsg("","Please wait",":P")
  
  --setup wifi
  wifi.setmode(wifi.STATION)
  wifi.sta.config(config.ssid,config.pass)

  -- start clock for updates
  updateTmr = tmr.create()
  updateTmr:register(300,tmr.ALARM_SEMI, function() -- semi auto to protect against over run
    update()
  end)
  updateTmr:start()
end

-- delayed init to protect against errors flash blocking
local init = tmr.create()
init:register(4000,tmr.ALARM_SINGLE, function ()
  main()
	init:unregister()
end)
init:start()
