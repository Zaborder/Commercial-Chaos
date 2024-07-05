function onCountdownStarted()
	doTweenZoom('campanzoom','camGame',2.9,0.01,'sineInOut')	
end
function onSongStart()
	doTweenY('test','second.scale', 1, 6, 'sineInOut')
	doTweenX('testx','second.scale', 1, 6, 'sineInOut')
	doTweenY('mx','moon.scale', 1, 6, 'sineInOut')
	doTweenX('my','moon.scale', 1, 6, 'sineInOut')
	doTweenY('cx','cloud.scale', 1, 6, 'sineInOut')
	doTweenX('cy','cloud.scale', 1, 6, 'sineInOut')
	doTweenAlpha('sa','second',1, 3,'expoIn')
	doTweenZoom('campanzoom','camGame',0.7,6,'quadOut')

	doTweenAlpha('hudDisapersrssgd', 'camHUD', 0, 0.25)
	setProperty('boyfriend.visible', false)
	setProperty('gf.visible', false)
	setProperty('dad.visible', false)

end
function onCreatePost()

	setScrollFactor('moon',0.8,1)
	--setScrollFactor('second',1.07,1)

	precacheImage('gru/hallway')

	makeLuaSprite('hallway','gru/hallway', -1300, -950)
	addLuaSprite('hallway',false)
	setProperty('hallway.visible', false)
end


--[[local cameras = {'camGame', 'camHUD'}
function onUpdatePost(dt)

	for _,camera in ipairs(cameras) do
		setProperty(camera .. ".flashSprite.scaleX", 2)
		setProperty(camera .. ".flashSprite.scaleY", 2)

		local scale = getProperty(camera .. ".zoom") / 2
		callMethod(camera .. ".setScale", {scale, scale})
	end
end--]]

function onUpdate()
	if curBeat >= 0 and curBeat <= 16 then --moon

		setProperty('camFollow.x',650)
		setProperty('camFollow.y',-1400)
		setProperty('cameraSpeed', 100)
	end
	if curBeat >= 16 and curBeat <= 20 then --deals
		doTweenZoom('campanzoom','camGame',0.9,0.01,'quadOut')	
		setProperty('camFollow.x',-600)
		setProperty('camFollow.y',200)
	end
	if curBeat >= 20 and curBeat <= 24 then --grubottom
		doTweenZoom('campanzoom','camGame',0.8,0.01,'quadOut')	
		setProperty('camFollow.x',-550)
		setProperty('camFollow.y',-850)
	end	
	if curBeat >= 24 and curBeat <= 28 then --ground minions
		doTweenZoom('campanzoom','camGame',1.1,0.01,'quadOut')	
		setProperty('camFollow.x',600)
		setProperty('camFollow.y',100) 
	end
	if curBeat >= 28 and curBeat <= 28 then	--gruagain
		doTweenZoom('campanzoom','camGame',0.9,0.01,'quadOut')	
		setProperty('camFollow.x',-650)
		setProperty('camFollow.y',-1750)
		setProperty('cameraSpeed', 1)
	end	
	if curStep >= 118 and curStep <= 128 then
		doTweenZoom('campanzoom','camGame',1.35,0.01,'quadOut')	
		setProperty('boyfriend.visible', true)
		setProperty('gf.visible', true)
		setProperty('dad.visible', true)
	end
	if curBeat >= 32 then
		--setProperty('camFollow.y',200)
		doTweenAlpha('helloHud', 'camHUD', 1, 0.25)
		setProperty('cameraSpeed', 1)
	
		if mustHitSection == false then
			--setProperty('camFollow.y',200)
			setProperty('defaultCamZoom',0.5)

		else
			--setProperty('camFollow.y',500)
			setProperty('defaultCamZoom',0.6)
		end
	end
end

--beathit 320
-- 322
-- 324 gru start sing

--384 section before 
--388 section end
--389 bf EHHHHH
function onBeatHit()
	if curBeat == 324 then --324
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('rail.visible',false)
		setProperty('hallway.visible',true)
		setObjectOrder('bumpers', getObjectOrder('gfGroup') - 1);
		setObjectOrder('back', getObjectOrder('bumpers') - 1);

	end
	if curBeat == 388 then
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('rail.visible',true)
      		removeLuaSprite('hallway')
      		removeLuaSprite('bumpers')
        	removeLuaSprite('back')

		setProperty('dad.y', -1400)
		setProperty('dad.x', -300)
		setProperty('gf.y', -1200)
		setObjectOrder('upper', getObjectOrder('rail') + 1)
		setProperty('boyfriend.y', -1150)

		setProperty('camFollow.x',650)
		setProperty('camFollow.y',-1400)
		setProperty('cameraSpeed', 100)

	end	
	--[[if curBeat >= 389 then
		setProperty('cameraSpeed', 1)
	
		if mustHitSection == false then
        		doTweenAngle('CamTween1', 'camGame', -4, 1.8, 'quartOut ')

		else
			doTweenAngle('CamTween1', 'camGame', 4, 1.8, 'quartOut')
		end
	end--]]
end
