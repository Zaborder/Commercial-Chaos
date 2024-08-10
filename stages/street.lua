function onCreate()
	makeLuaSprite('street', 'ps1_bg', -600, -325);
	addLuaSprite('street', false);
	scaleObject('street',0.68,0.68);
	
	makeAnimatedLuaSprite('bumpers','ps1bop', -400, 150) --50
	addAnimationByPrefix('bumpers','idle', 'crowd', 24)
	addLuaSprite('bumpers', false)
end


function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('bumpers','idle', false)
	end
end