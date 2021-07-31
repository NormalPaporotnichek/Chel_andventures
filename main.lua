local scene = require("scene1")

love.load = function()
  if scene.ld then
    scch = require("libs.screenChanger")
    scene:ld()
  end
end

love.update = function(dt)
  if scene.upd then
    scene:upd(dt)
  end
end

love.draw = function()
  if scene.dr then
    scene:dr()
  end
end

love.keypressed = function(key)
  if scene.kpresd then
    scene:kpresd(key)
  end
end

--[[love.keypressed = function(key)
  if key == "q" then scene = require("scene1")
  elseif key == "w" then scene = require("scene2") end
end--]]