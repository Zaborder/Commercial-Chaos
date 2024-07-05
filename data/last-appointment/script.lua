function onCreatePost()

	makeAnimatedLuaSprite('static','static', 0,0)
	addAnimationByPrefix('static','idle', 'idlestatic', 24)
	addAnimationByPrefix('static','off', 'off', 24)
	addAnimationByPrefix('static','black', 'off0015', 24)
	objectPlayAnimation('static','idle', false)
	scaleObject('static',2.25,2.25)
	setObjectCamera('static','Other')
	setProperty('static.alpha',0)
	addLuaSprite('static', false)

	
	makeLuaSprite('vignette', 'amigo/vignette',0,0)
	setObjectCamera('vignette','Other')
	setProperty('vignette.alpha',0)
	addLuaSprite('vignette', false)

	makeLuaSprite('walls', 'amigo/walls',-1875,-800)
	setProperty('walls.visible',false)
	addLuaSprite('walls', false)
end

function onBeatHit()
	--[[if curBeat == 5 then
		runTimer('real',0)
		cameraFlash('Hud', '000000', 1,false)
	end
	if curBeat == 10 then
		runTimer('clinic',0)
		cameraFlash('Hud', '000000', 1,false)
	end
	if curBeat == 15 then
		runTimer('real',0)
		cameraFlash('Hud', '000000', 1,false)
	end
	--]]
	if curBeat == 292 then
		doTweenZoom('campanzoom','camGame',1.25,14,'sineInOut')
		doTweenAlpha('staticalpha','static',1,13.1,'sineInOut')
	end

	if curBeat == 324 then
		triggerEvent('Play Animation','hurt','bf')
		setProperty('static.alpha',0)
	end
	if curBeat == 326 then
		doTweenAlpha('staticalpha','static',1,0.5,'sineInOut')
		doTweenZoom('campanzoom2','camGame',1.6,0.5,'sineIn')
	end
	if curBeat == 327 then
		setProperty('static.alpha',1)
		objectPlayAnimation('static','off', false)
		setProperty('defaultCamZoom',0.65)
		setProperty('vignette.alpha',1)
		setProperty('dad.alpha',0)
		runTimer('real',0)
		cameraFlash('Hud', '000000', 1,false)
	end
	if curBeat == 336 then
		doTweenAlpha('secondphase','static',0,14,'quadInOut')
	end
	if curBeat == 468 then
		doTweenAlpha('dadappear','dad',1,1,'quadInOut')
	end

	if curBeat == 576 then
		runTimer('clinic',0)
		cameraFlash('Hud', 'FFFFFF', 1,false)
	end
	if curBeat == 609 then
		runTimer('real',0)
		cameraFlash('Hud', '000000', 1,false)
	end
	
	if curBeat == 737 then
		runTimer('clinic',0)
		cameraFlash('Hud', 'FFFFFF', 1,false)
	end
	if curBeat == 801 then
		runTimer('real',0)
		cameraFlash('Hud', '000000', 1,false)
	end
	
	

end
local clinic = true
function onUpdatePost()
	if curDecBeat >= 328.5 then
		objectPlayAnimation('static','black', false)
	end
	
	
	if clinic == false then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.65)
		else
			setProperty('defaultCamZoom',0.45)
		end
	setProperty('iconP2.offset.x', getRandomFloat(-5,5))
	setProperty('iconP2.offset.y', getRandomFloat(15,25))
	end
end

function onTweenCompleted(t,l,ll)
	if t == 'staticalpha' then
		setProperty('static.alpha',1)
	end

end
function onTimerCompleted(t,l,ll)
	if t == 'real' then
		setProperty('floor.visible',false)
		setProperty('wall.visible',false)
		setProperty('wallstuff.visible',false)
		setProperty('sitting.visible',false)
		setProperty('crack.visible',false)
		setProperty('flower.visible',false)
		setProperty('boyfriend.visible',false)
		triggerEvent('Change Character','dad','amigo-real-form')
		setProperty('walls.visible',true)
		
		setProperty('boyfriendCameraOffset[0]', getProperty('boyfriendCameraOffset[0]')-475)
		setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]')+50)
		clinic = false
	end

	if t == 'clinic' then
		setProperty('floor.visible',true)
		setProperty('wall.visible',true)
		setProperty('wallstuff.visible',true)
		setProperty('sitting.visible',true)
		setProperty('crack.visible',true)
		setProperty('flower.visible',true)
		setProperty('boyfriend.visible',true)
		triggerEvent('Change Character','dad','amigo')
		setProperty('walls.visible',false)
		setProperty('defaultCamZoom',0.75)
		
		setProperty('boyfriendCameraOffset[0]', getProperty('boyfriendCameraOffset[0]')+475)
		setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]')-50)
		clinic = true
	end
end