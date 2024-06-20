local love = require "love"

-- 遊戲玩家的光標
local player = { 
    radius = 20,
    x = 30,
    y = 30
}


function love.load()
    love.window.setTitle("Save the ball")
end

function love.update()
    player.x, player.y = love.mouse.getPosition()
end


function love.draw()
    love.graphics.circle("fill", player.x, player.y, player.radius)
end