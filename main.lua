x = 0
start = false;
state = "bekerja"
break30Set = 0;

function love.load()
     knight = love.graphics.newImage("knight.png")
    knight:setFilter("nearest", "nearest")

     knight_sleep = love.graphics.newImage("knight-sleep.png")
    knight_sleep:setFilter("nearest", "nearest")

    notification_sound = love.audio.newSource("notificationsound.mp3","stream")
end

function love.update(dt)

   local title = "pomodoro rest reminder is heeree"
local message = "istirahatt cuyyy"
local buttons = {"OK", escapebutton = 2} 

    if start == true then

        x = x + dt

    if state == "bekerja" then
        if x >= 1500 then
        
            notification_sound:play()
            start = false
         local pressedbutton = love.window.showMessageBox(title, message, buttons)
if pressedbutton == 1 then
    love.audio.stop(notification_sound)
start = true
   x = 0
             break30Set = break30Set + 1
            state = "istirahat"

end
         
        end
    end

   if break30Set == 4 and state == "istirahat" then
        if x >= 1800 then
            notification_sound:play()
            start = false
            local pressedbutton3 = love.window.showMessageBox(title, message, buttons)
            
            if pressedbutton3 == 1 then
                love.audio.stop(notification_sound)
                 x = 0;
            break30Set = 0
            state = "bekerja"
            start = true
         
            end
           
        end
   elseif state == "istirahat" then
     if x >= 300 then
        notification_sound:play()
        
        local pressedbutton2 = love.window.showMessageBox(title, message, buttons)
        start = false
        if pressedbutton2 == 1 then
            start = true
            love.audio.stop(notification_sound)
              x = 0
            state = "bekerja"
        end
          
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



