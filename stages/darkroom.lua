function onCreate()
	makeLuaSprite('bg', 'lbi/bg',-800, -600);
	--addLuaSprite('bg', false);
	
	makeAnimatedLuaSprite('lights1','lbi/right_lights', 600, -400) --50
	addAnimationByPrefix('lights1','light1', 'idle0000', 24)
	addAnimationByPrefix('lights1','light2', 'idle0001', 24)
	addLuaSprite('lights1', false)
	
	makeAnimatedLuaSprite('lights2','lbi/center_lights', -200, -400) --50
	addAnimationByPrefix('lights2','light1', 'idle0000', 24)
	addAnimationByPrefix('lights2','light2', 'idle0001', 24)
	addLuaSprite('lights2', false)
	
	makeAnimatedLuaSprite('lights3','lbi/left_lights', -800, -400) --50
	addAnimationByPrefix('lights3','light1', 'idle0000', 24)
	addAnimationByPrefix('lights3','light2', 'idle0001', 24)
	addLuaSprite('lights3', false)

	setScrollFactor("lights1", 0.8, 1)
	setScrollFactor("lights2", 1.1, 1.2)
	--setScrollFactor("lights3", 0.8, 1.1)
	
	setProperty('boyfriendCameraOffset[0]', 125) --[125, -200],
	setProperty('boyfriendCameraOffset[1]', -200)
end

local i = 2
function onBeatHit() 
	if curBeat % 2 == 0 then
		i = 1
	end
	if curBeat % 2 == 1 then
		i = 2
	end
end

function onUpdate()
		objectPlayAnimation('lights1', 'light'..i, false)
		objectPlayAnimation('lights2', 'light'..i, false)
		objectPlayAnimation('lights3', 'light'..i, false)
end