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

			doTweenY('bfsx','boyfriendGroup.scale', 1, 0.1, 'sineInOut')
			doTweenX('bfsy','boyfriendGroup.scale', 1, 0.1, 'sineInOut')

			else
			doTweenY('bfsx','boyfriendGroup.scale', 1.35, 0.1, 'sineInOut')
			doTweenX('bfsy','boyfriendGroup.scale', 1.35, 0.1, 'sineInOut')


			setProperty('defaultCamZoom',0.45)
		end
		setProperty('iconP2.offset.x', getRandomFloat(-5,5))
		setProperty('iconP2.offset.y', getRandomFloat(15,25))
	else

		doTweenY('bfsx','boyfriendGroup.scale', 0.6, 0.01, 'sineInOut')
		doTweenX('bfsy','boyfriendGroup.scale', 0.6, 0.01, 'sineInOut')
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
		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x')-600)
		setProperty('boyfriendGroup.y', getProperty('boyfriendGroup.y')+700)
		triggerEvent('Change Character','dad','amigo-real-form')
		triggerEvent('Change Character','bf','bf-amigo-2')
		setProperty('walls.visible',true)

		setProperty('boyfriendCameraOffset[0]', getProperty('boyfriendCameraOffset[0]')+120)
		setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]')-500)
		clinic = false
	end

	if t == 'clinic' then
		setProperty('floor.visible',true)
		setProperty('wall.visible',true)
		setProperty('wallstuff.visible',true)
		setProperty('sitting.visible',true)
		setProperty('crack.visible',true)
		setProperty('flower.visible',true)
		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x')+600)
		setProperty('boyfriendGroup.y', getProperty('boyfriendGroup.y')-700)
		triggerEvent('Change Character','dad','amigo')
		triggerEvent('Change Character','bf','bf-amigo')
		setProperty('walls.visible',false)
		setProperty('defaultCamZoom',0.75)
		
		setProperty('boyfriendCameraOffset[0]', getProperty('boyfriendCameraOffset[0]')-120)
		setProperty('boyfriendCameraOffset[1]', getProperty('boyfriendCameraOffset[1]')+500)
		clinic = true
	end
end
function onUpdate(elapse)
	if mustHitSection == false then
	end
end