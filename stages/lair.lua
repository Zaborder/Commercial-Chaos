function onUpdate()
end
function onCreate()
	-- background shit
	
	makeLuaSprite('moon', 'gru/moon', -180, -2015)
	addLuaSprite('moon', false)
	
	makeLuaSprite('cloud', 'gru/clouds', -600, -1800)
	addLuaSprite('cloud', false)

	makeLuaSprite('second', 'gru/second_floor', -1400, -2400)
	addLuaSprite('second', false)
	--setProperty('second.alpha',0)

	makeLuaSprite('first', 'gru/first_floor', -1400, -700)
	addLuaSprite('first', false)
	
	makeLuaSprite('rail', 'gru/rails', -1400, -875)
	--setProperty('rail.alpha',0)
	addLuaSprite('rail', true)

	makeLuaSprite('light', 'gru/light', 1030, -305)
	addLuaSprite('light', false)
	
	makeLuaSprite('wire', 'gru/wires', -1400, -2400)
	setProperty('wire.alpha',0)
	addLuaSprite('wire', false)

    setObjectOrder('boyfriendGroup', 20)
	

	doTweenY('secondx','second.scale', 1.5, 0.1, 'linear')
	doTweenX('secondy','second.scale', 1.5, 0.1, 'linear')
	doTweenY('moonx','moon.scale', 0.3, 0.1, 'linear')
	doTweenX('moony','moon.scale', 0.3, 0.1, 'linear')
	doTweenY('cloudx','cloud.scale', 0.75, 0.1, 'linear')
	doTweenX('cloudy','cloud.scale', 0.75, 0.1, 'linear')

	
	makeLuaSprite('white', '', -1200, -600)
	makeGraphic('white', 3500, 2000, 'FFFFFF')
	setProperty('white.alpha',0)
	addLuaSprite('white', false)
	
	makeLuaSprite('platform', 'gru/platform', -200, 300)
	setProperty('platform.alpha', 0)
	addLuaSprite('platform', false)

	makeAnimatedLuaSprite('upper2','gru/bumpers/upperbehind', -1200, -900) --50
	addAnimationByPrefix('upper2','idle', 'minionupperbehind', 24)
	addLuaSprite('upper2', false)
	
	makeAnimatedLuaSprite('back','gru/bumpers/backbumpers', 375,25) --50
	addAnimationByPrefix('back','idle', 'minionbackbumpers', 24)
	addLuaSprite('back', false)
	
	makeAnimatedLuaSprite('bumpers','gru/bumpers/bottombumpers', -870, 150) --50
	addAnimationByPrefix('bumpers','idle', 'minbottom', 24)
	addLuaSprite('bumpers', false)
	
	makeAnimatedLuaSprite('upper','gru/bumpers/upperbumpers', 50, -1200) --50
	addAnimationByPrefix('upper','idle', 'minupper', 24)
	addLuaSprite('upper', true)
	
	
	--setScrollFactor('firstfloor', 0.9, 0.9);
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('upper2','idle', false)
		objectPlayAnimation('back','idle', false)
		objectPlayAnimation('bumpers','idle', false)
		objectPlayAnimation('upper','idle', false)
	end
end