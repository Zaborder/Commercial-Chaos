function onCreate()
	-- background shit
	--[[makeLuaSprite('bgcolor', '', -800, -400) 
	makeGraphic('bgcolor', 3000, 1500, 'e2d891')
	addLuaSprite('bgcolor', false)--]]

	makeLuaSprite('bg', 'main_bg', -1200, -1000); -- -400, -400
	addLuaSprite('bg', false);
	--scaleObject('bg', 0.7, 0.7)
--[[
	makeLuaSprite('carpet', 'carpet', -700, 625);
	addLuaSprite('carpet', false);
	scaleObject('carpet',1.75,1.75);

	makeLuaSprite('furniture', 'furniture', -400, 300);
	addLuaSprite('furniture', false);	
]]
end