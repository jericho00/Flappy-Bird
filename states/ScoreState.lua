ScoreState = Class{__includes = BaseState}


function ScoreState:enter(params)
    self.score = params.score

    self.Goldmedal = love.graphics.newImage('GoldMedal.png')
    self.Silvermedal = love.graphics.newImage('SilverMedal.png')
    self.Bronzemedal = love.graphics.newImage('BronzeMedal.png')
end

function ScoreState:update(dt)
    
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Game Over', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    local Medal = nil
    local TypeMedal = nil
    if self.score > 4 and self.score <10 then
        Medal = self.Bronzemedal
        TypeMedal = 'Bronze'
    elseif self.score > 9 and self.score < 15 then
        Medal = self.Silvermedal
        TypeMedal = 'Silver'
    elseif self.score > 14 then
        Medal = self.Goldmedal
        TypeMedal = 'Gold'
    end
    if Medal ~= nil then
        love.graphics.printf('Well done! You earned a '  ..TypeMedal..  ' medal', 0, 120, VIRTUAL_WIDTH, 'center')
        love.graphics.draw(Medal, VIRTUAL_WIDTH / 2 - Medal:getWidth() / 2, 130)
    end
    love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')
end