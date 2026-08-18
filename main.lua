x = 0
start = false;
state = "bekerja"
break30Set = 0;

function love.load()
     knight = love.graphics.newImage("knight.png")
    knight:setFilter("nearest", "nearest")

     knight_sleep = love.graphics.newImage("knight-sleep.png")
    knight_sleep:setFilter("nearest", "nearest")
end

function love.update(dt)

    if start == true then
        x = x + dt
    if state == "bekerja" then
        if x >= 1500 then
            x = 0
             break30Set = break30Set + 1
            state = "istirahat"
        end
    end

   if break30Set == 4 and state == "istirahat" then
        if x >= 1800 then
            x = 0;
            break30Set = 0
            state = "bekerja"
         
        end
   elseif state == "istirahat" then
     if x >= 300 then
            x = 0
            state = "bekerja"
        end
    end


    end
     
end

function love.mousepressed(x, y, button)--temskuy parameter wajib
   if button == 1 then 
     start = true
   elseif button == 2 then
    
    start = false
   end
end

function love.draw()
  local minutes = math.floor(x/60)
  local seconds = math.floor(x%60)

    if state == "bekerja" then
        love.graphics.draw(knight_sleep, -5, -20, 0, 4, 4)
    elseif state == "istirahat" then
         love.graphics.draw(knight, -5, -20, 0, 4, 4)
    end
        
    if start == false and state == "bekerja" then
          love.graphics.draw(knight, -5, -20, 0, 4, 4)
            love.graphics.print(string.format("%02d:%02d", minutes, seconds))
        
    end
        
end



