local love = require "love"

function Enemy()
    local dice = math.random(1, 4)
    local _X, _y
    local _radius = 20

    if dice == 1 then
        _x = math.random(_radius, love.graphics.getWidth())
        _y = -_radius * 4
    elseif dice == 2 then
        _x = -_radius * 4
        _y = math.random(_radius, love.graphics.getHeight())
    elseif dice == 3 then
        _x = math.random(_radius, love.graphics.getWidth())
        _y = love.graphics.getHeight() + (-_radius * 4)
    else
        _x = love.graphics.getWidth() + (-_radius * 4)
        _y = math.random(_radius, love.graphics.getHeight())
    end

    return {
        level = 1,
        radius = _radius,
        x = _x,
        y = _y,

        move = function (self, player_x, player_y)
            -- When the enemy is on the left side of the player, the enemy should move right to approach the player. 
            -- move to in player x pos
            if player_x - self.x > 0 then
                self.x = self.x + self.level
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level
            end
            -- move to in player y pos
            if player_y - self.y > 0 then
                self.y = self.y + self.level
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level
            end
        end,

        -- Draw enemy
        draw = function (self)
            love.graphics.setColor(1, 0.5 , 0.5)
            love.graphics.circle("fill", self.x, self.y, self.radius)
            -- reset the color back to white
            love.graphics.setColor(1, 1, 1)
        end,
    }


end

return Enemy