
require "snake"

function update()

  -- tick game
  snake.input(gpio.read(action_gpio) == 0)
  snake.update()
  snake.draw(screen)
  
  --restart timer
  updateTmr:start()
end

-- SDA == blue
-- SCL == red
-- GND == grey
-- VCC == green

function main()
  -- setup i2c interface
  print("Setting up display")
  local bus_id  = 0
  local sda = 3 -- GPIO0 - D3
  local scl = 4 -- GPIO2 - D4
  i2c.setup(bus_id, sda, scl, i2c.FAST)
  local sla = 0x3C
  screen = u8g2.ssd1306_i2c_128x64_noname(bus_id, sla)
  
  --inputs
  action_gpio = 5 --GPIO14 D5 
  gpio.mode(action_gpio, gpio.INPUT, gpio.PULLUP)
  
  is_action_button_down = false
  --gpio.trig(action_gpio, "both", function(level, when, eventcount)
  --  if level == 1 then 
  --    is_action_button_down = true
  --  elseif is_action_button_down == true then
  --    snake.input(true)
  --    is_action_button_down = false
  --  end
  --end)
  
  
  print("Setting up snake")
  -- setup display
  snake = newSnake(bus_id)
  snake.update()

  -- start clock for updates
  updateTmr = tmr.create()
  updateTmr:register(20,tmr.ALARM_SEMI, function() -- semi auto to protect against over run
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
