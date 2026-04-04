
function newSnake(bus_id)
  local snake = {}


  snake.width = 126
  snake.height = 64
  
  snake.head = {63,31}
  
  snake.mode = 1
  -- modes
  -- 0 = title
  -- 1 = game
  
  snake.direction = 0
  -- directions 
  -- 0 left
  -- 1 down
  -- 2 right
  -- 3 up
  
  snake.input = function(btn_pressed)
    if snake.mode == 0 then
    
    else
      if btn_pressed then
        snake.direction = snake.direction + 1
        if snake.direction > 3 then
          snake.direction = 0
        end
      end
    end
  end
  
  snake.update = function()
    if snake.mode == 0 then
      -- todo add title screen
    else
      -- move head
      if snake.direction == 0 then -- left
        snake.head[1] = snake.head[1] + 1
      elseif snake.direction == 1 then -- down
        snake.head[2] = snake.head[2] - 1
      elseif snake.direction == 2 then -- right
        snake.head[1] = snake.head[1] - 1
      elseif snake.direction == 3 then -- up
        snake.head[2] = snake.head[2] + 1
      end
      
      -- update tail
      
      -- spawn food
      
    end
  
  end


  snake.draw = function(disp)
    disp:clearBuffer()
    disp:setDrawColor(1)
    disp:drawFrame(1,1,125,63)
    
    if snake.mode == 0 then
    
    else
      disp:drawBox(snake.head[1],snake.head[2],2,2)
    end
    
    
    disp:sendBuffer()

  end

  return snake
end
