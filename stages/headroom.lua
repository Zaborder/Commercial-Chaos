function onCreate() 
	
	makeLuaSprite('bg', 'headroom', -975,-400);
	addLuaSprite('bg')
	
	doTweenAngle('left', 'bg', (getRandomInt(-5,-30)), (getRandomInt(1,2)), 'quadInOut')

	setProperty('boyfriendGroup.visible', false)
end


function onUpdate(elapsed)
	cameraSetTarget('dad')
end

function onTweenCompleted(tag)
	if tag == 'left' then
		doTweenAngle('right', 'bg', (getRandomInt(-15,-45)), (getRandomInt(1.5,3)), 'quadInOut')
	end
	if tag == 'right' then
		doTweenAngle('left', 'bg', (getRandomInt(5,15)), (getRandomInt(1.5,3)), 'quadInOut')
	end
end