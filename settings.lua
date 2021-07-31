return{

ld = function(self)
  
  keys = require("libs.userkeys")
  
  qua = require("libs.libquadtastic")
  local raw_tree = require("spr.quads")
  image = love.graphics.newImage("spr/animatsia_derevo.png")
  quads = qua.create_quads(raw_tree, image:getWidth(), image:getHeight())
  frN = 1
  delay = 0
  duration = 0.1
  
  local camera = require "libs.gamera"
  cam = camera.new(0,0,1920,1080)
  -- создадим камеру (и сразу укажем размер большой картинки)
	cam:setWorld(0,0,3000,3000)	-- в любой момент меняем размеры нашей огромной картинки
	cam:setWindow(0,0, 1920,1080) -- задаем размер окошка через которое будем смотреть на нашу картинку
  
  sand = love.graphics.newImage( "spr/sand.png" )
  chel = love.graphics.newImage( "spr/chel.png" )
  friend = love.graphics.newImage( "spr/friend.png" )
  home = love.graphics.newImage( "spr/home.png" )
  
  x, y = 0, 0
	scale = 1
	newAngle = 0
  
end,



dr = function(self)
  love.graphics.clear(0,0,130)
  
	cam:draw(function(l,t,w,h)
      
		-- тут рисуем то, что покажет камера
      love.graphics.draw(sand, 0, 0, 0, 0.55, 0.55)
			--love.graphics.print("l,t,w,h:"..l..","..t..","..w..","..h, 200,170)
     
      love.graphics.draw(home, 1000, 800, 0, 1, 1, 100, 150)
      love.graphics.draw(chel, x, y, 0, 1, 1, 100, 150)
			love.graphics.rectangle("line", 10,10, 120, 20)
			love.graphics.rectangle("fill", 90,40, 29, 50)
			love.graphics.rectangle("line", 100,90, 20, 520)
      love.graphics.draw(image, quads.tree[frN], 200, 200)
      love.graphics.draw(friend, 200, 300, 0, 1, 1, 100, 150)
       
		end)
	-- тут рисуем то, что всегда должно быть видно на экране.
	
  love.graphics.setColor(255,56,56)
	love.graphics.rectangle("line", 10,10, 40, 10)
	love.graphics.print("x,y:"..x..","..y, 10,30)
  love.graphics.print(collectgarbage("count"))
end,


 kpresd = function(self, key)
  if key == keys.fullscKey then
    scch.cycle()
  end
end,


upd = function(self, dt)
  
end
}