local love = require "love"

function Enemy()
    return {
        level = 1,
        redius = 20,
        x = -10,
        y = -50,

        move = function (self, player_x, player_y)
            -- When the enemy is on the left side of the player, the enemy should move right to approach the player. 
            if player_x - self.x > 0 then
                self.x = self.x + self.level
            elseif player_x - self.x < 0 then
                self.x = self.x - self.level
            end

            if player_y - self.y > 0 then
                self.y = self.y + self.level
            elseif player_y - self.y < 0 then
                self.y = self.y - self.level
            end
        end,

        draw = function (self)
            love.graphics.setColor(255/255, 125/255 , 122/255)
            love.graphics.circle("fill", self.x, self.y, self.radius)
            love.graphics.setColor(1, 1, 1)
        end
    }


end

return Enemy