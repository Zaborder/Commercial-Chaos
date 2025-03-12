local activated = false --i made this in 20 minutes give me a break
function onCreate()
	makeAnimatedLuaSprite('nibbler','mini', 0, 400)
	addAnimationByPrefix('nibbler','idle', 'idle', 24)
	addAnimationByPrefix('nibbler','explosion', 'explosion', 24)
	objectPlayAnimation('nibbler','idle', false)
	setProperty('nibbler.visible', false)
	addLuaSprite('nibbler',true)
	
	makeLuaText('space', 'PRESS SPACE TO DODGE', 0, 0, 0)
	setTextAlignment('space', 'center')
	setTextSize('space', 78)
	screenCenter('space')
	addLuaText('space')
	setProperty('space.alpha',0)
end
function onBeatHit()
	if curBeat == 1 then
	doTweenAlpha('shiftappear', 'space', 1, 1, 'quadOut')
	end
	if curBeat == 24 then
	doTweenAlpha('shiftappear', 'space', 0, 1, 'quadOut')
	end
end
function onUpdate()
	if activated == true and getProperty('nibbler.x') <= 1000 and keyboardJustPressed('SPACE') then
		triggerEvent('Play Animation','shoot','bf')
		triggerEvent('Screen Shake','0.25,0.02','')
		objectPlayAnimation('nibbler','explosion', false)
		playSound('shoot',1)
		runTimer('end',0.2)
		activated = false
	end

	if activated == true and getProperty('nibbler.x') >= 1000 and getProperty('nibbler.x') <= 1100 then
		objectPlayAnimation('nibbler','explosion', false)
		runTimer('end',0.2)
		runTimer('loose health',0.2)
		triggerEvent('Play Animation','singRIGHTmiss','bf')
		playSound('missnote1',1)
		activated = false
	end

	spin = spin + 4
	setProperty('nibbler.angle',spin)
end

function onEvent(n,v,b)
	if n == 'throw' then
		triggerEvent('Play Animation','throw','dad')
		runTimer('nibblermove',0.2)
		setProperty('nibbler.x', 400)
		activated = true
	end
	if n == 'subtitles' then
		setTextFont('subtitles', 'Arista2.0.ttf')
	end
end

function onTimerCompleted(t,l,ll)
	if t == 'nibblermove' then
		setProperty('nibbler.visible', true)
		doTweenX('nibblerX', 'nibbler', 2000, 1, linear)
		objectPlayAnimation('nibbler','idle', false)
		playSound('peperami',1)
	end
	if t == 'end' then
		setProperty('nibbler.visible', false)
		setProperty('nibbler.x', 400)
		activated = false
	end
	
	if t == 'loose health' then
		setProperty('health', getProperty('health')-0.25)
	end

end
