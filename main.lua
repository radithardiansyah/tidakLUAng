x = 0
start = false;

function love.update(dt)
    local break30Set = 0;
    local state = "bekerja"

    character = love.graphics.newImage("knight.png")
    character:setFilter("nearest", "nearest")

    if start == true then
        x = x + dt
    if state == "bekerja" then
        if x >= 15 then
            x = 0
             break30Set = break30Set + 1
            state = "istirahat"
        end
    end

   if break30Set == 4 and state == "istirahat" then
        if x >= 33 then
            x = 0;
            break30Set = 0
            state = "bekerja"
        end
   elseif state == "istirahat" then
     if x >= 18 then
            x = 0
            state = "bekerja"
        end
    end


    end
     
end

function love.mousepressed(button)
   if button == 1 then 
     start = true
   elseif button == 2 then
    start = false
   end
end

function love.draw()
        love.graphics.draw(character, -5, -20, 0, 4, 4)
        
end



