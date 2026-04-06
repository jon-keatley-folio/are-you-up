
function newDisplay(bus_id, sla)
  local d = {}

  d.display = u8g2.ssd1306_i2c_128x64_noname(bus_id, sla)

  d.width = 126
  d.height = 64
  
  d.drawErr = function(line1,line2,line3)
    d.display:clearBuffer()
    d.display:setDrawColor(1)
    d.display:drawFrame(1,1,125,63)
    
    d.display:setFont(u8g2.font_10x20_tf)
    d.display:drawStr(6,16,"Error")
    d.display:setFont(u8g2.font_6x10_tf)
    d.display:drawStr(6,28,line1)
    d.display:drawStr(6,41,line2)
    d.display:drawStr(6,54,line3)
    
    d.display:sendBuffer()
  end
  
  d.drawMsg = function(line1,line2,line3)
    d.display:clearBuffer()
    d.display:setDrawColor(1)
    d.display:drawFrame(1,1,125,63)
    
    d.display:setFont(u8g2.font_10x20_tf)
    d.display:drawStr(6,16,"Booting")
    d.display:setFont(u8g2.font_6x10_tf)
    d.display:drawStr(6,28,line1)
    d.display:drawStr(6,41,line2)
    d.display:drawStr(6,54,line3)
    
    d.display:sendBuffer()
  end

  return d
end
