--[[local tween = require 'libs.tweenlib.tween'

function love.load()
	krug = {x = 20, y = 20, r1 = 10, r2 = 10, c = {255, 0, 255}}
	go = { x = 100, y = 100,
		sprite = love.graphics.newText(love.graphics.newFont(100), "GaMe OvEr!") }
	z = {}
	for i = 1, 20 do
		z[#z + 1] = { x = i * 40, y = 600 - 20, r = love.math.random(3, 7),
			c = {love.math.random(40, 100),
				love.math.random(140, 200),
				love.math.random(0, 255)},

		}
		z[#z].tw = tween.new(love.math.random(1, 5), z[#z],
			{ x = love.math.random(0, 800),
				y = love.math.random(0, 600),
				c = {255, 0, 0},
				r = love.math.random(20, 40)
			},
			"inOutBounce")
	end
	--local t = tween.new(duration, subject, target, [easing])
	krugTweenY = tween.new(3, krug, { y = 600 - 20 }, "outBounce")
	krugTweenX = tween.new(5, krug, { x = 800 - 20, r1 = 3,
			c = {80, 255, 30} }, "outQuad")
	goTweenY = tween.new(1, go, { y = 240 }, "outElastic")
end

function love.draw()
	love.graphics.setColor(krug.c[1],krug.c[2],krug.c[3])
	love.graphics.circle("fill", krug.x, krug.y, krug.r1, krug.r2)
	love.graphics.setColor(55,255,55)
	love.graphics.draw(go.sprite, go.x, go.y, 0.1)
	--love.graphics.setColor(255,255,255)	
	for i = 1, #z do
		love.graphics.setColor(z[i].c[1],z[i].c[2],z[i].c[3])
		love.graphics.circle("fill", z[i].x, z[i].y, z[i].r, 7)
	end
end

function love.update(dt)
	krugTweenX:update(dt)
	krugTweenY:update(dt)
	goTweenY:update(dt)
	for i = 1, #z do
		z[i].tw:update(dt)
	end
end
]]--

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
  
  if delay==0 then collectgarbage("collect") end
  
  delay = delay + dt
  
  if delay > duration then
    delay = 0
    frN = frN + 1
    if frN > #quads.tree then
      frN = 1
    end
  end
  
  local speed = 130 
  if love.keyboard.isDown(keys.run) then
    speed = 300
  end
  
  local oneButton = true
  
  if love.keyboard.isDown(keys.rightKey) and love.keyboard.isDown(keys.upKey) then
		oneButton = false
    x = x + speed * dt
    y = y - speed * dt
    
  elseif love.keyboard.isDown(keys.rightKey) and love.keyboard.isDown(keys.downKey) then
    oneButton = false
    x = x + speed * dt
    y = y + speed * dt
    
  elseif love.keyboard.isDown(keys.leftKey) and love.keyboard.isDown(keys.upKey) then
    oneButton = false
    x = x - speed * dt
    y = y - speed * dt
    
  elseif love.keyboard.isDown(keys.leftKey) and love.keyboard.isDown(keys.downKey) then
    oneButton = false
    x = x - speed * dt
    y = y + speed * dt
    
	end
  
  
	if oneButton then
    
    if love.keyboard.isDown(keys.rightKey) then
      x = x + speed * dt
	
    elseif love.keyboard.isDown(keys.leftKey) then
      x = x - speed * dt
    
    elseif love.keyboard.isDown(keys.downKey) then
      y = y + speed * dt
	
    elseif love.keyboard.isDown(keys.upKey) then
      y = y - speed * dt
      
    end
    
	end
  
	cam:setPosition(x, y)	
	
	--[[if love.keyboard.isDown("w") then
		scale = scale - 0.1
	end
	if love.keyboard.isDown("s") then
		scale = scale + 0.1
	end
	cam:setScale(scale) -- увеличить камеру в 2 раза (приблизить картинку)
		
	if love.keyboard.isDown("a") then
		newAngle = newAngle - 0.01
	end
	if love.keyboard.isDown("d") then
		newAngle = newAngle + 0.01
	end
	cam:setAngle(newAngle) -- поворот камеры на угол в радианах
  ]]--
end
}