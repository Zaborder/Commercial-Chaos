
function onCreate()  
	runTimer('tween', 0.5)
end
function onCreatePost()
	precacheImage('character/icm-first-person')

        setProperty('boyfriendGroup.flipX',true)
    
	makeLuaSprite('black', '', -950, -450); 
        makeGraphic('black', 3200, 1600, '000000');
        --addLuaSprite('black', true);
	setScrollFactor('black', 0, 0);
	setProperty('black.alpha',0);
	
	makeLuaSprite('bg2', '', -950, -450); 
	makeGraphic('bg2', 3200, 1600, '0dffc8');
	addLuaSprite('bg2', false);
	setScrollFactor('bg2', 0, 0);
	setProperty('bg2.alpha',0);
	
	precacheImage('vignette')
	makeLuaSprite('vignette', 'vignette',0,0)
	setProperty('vignette.alpha',0)
	addLuaSprite('vignette', true)
	setScrollFactor('vignette', 0, 0);
	scaleObject('vignette', 2,2)
	screenCenter('vignette')

end
local allowparticle = false
function onBeatHit()
	if curBeat == 191 then
		doTweenAlpha('woosh', 'black', 1, 0.27, 'quartOut')
	end
	if curBeat == 192 then
		setProperty('black.alpha', 0)
	end
	if curBeat == 287 then
		doTweenAlpha('woosh2', 'black', 1, 0.5, 'quartOut')
	end
	if curBeat == 288 then
		doTweenAlpha('wooshbye', 'black', 0, 7.5, 'quartIn')
	end
	if curBeat == 352 then --lyrics
		setProperty('black.alpha', 1)
		doTweenAlpha('hudDisapper', 'camHUD', 0, 0.25)
		allowparticle = true
	end

	if curBeat == 428 then
		setProperty('black.alpha', 0)
		doTweenAlpha('helloHud', 'camHUD', 1, 0.25)
	end
	if curBeat % 2 == 0 then
		if allowparticle == true then
			createIcon()
		end
	end
end
function onSectionHit()
	if curSection >= 106 then --or curSection >= 1 then
		removeLuaSprite('lights1', true)
		removeLuaSprite('lights2', true)
		removeLuaSprite('lights3', true)

		setProperty('boyfriendCameraOffset[0]', 0)
		setProperty('boyfriendCameraOffset[1]', 0)
		setProperty('boyfriendGroup.x', getProperty('dad.x')+180)
		setProperty('boyfriendGroup.y', getProperty('dad.y')+170)

		setProperty('defaultCamZoom',0.75)
		--cameraFlash('Hud', '000000', 1,false)
		setProperty('bg2.alpha',1);
		triggerEvent('Change Character', 'dad', 'icm-pov')
		triggerEvent('Change Character', 'bf', 'bf-pov')
		setProperty('vignette.alpha',1)

			if mustHitSection == false then
				setProperty('boyfriendGroup.visible', false)
				setProperty('dad.visible', true)
				setProperty('defaultCamZoom',0.75)
			else
				setProperty('boyfriendGroup.visible', true)
				setProperty('dad.visible', false)
				setProperty('defaultCamZoom',0.95)
			end
	end
end
local speed = 10
local num = 0
local posX = {'-700', '1900'}
local posY = {'1000', '-450'}

--look mod coming out soon im in a rush
function createIcon()
	num = num + 1
	

	local randomposXInt = getRandomInt(1, #posX)
	--local randomposYInt = getRandomInt(1, #posY)

	makeAnimatedLuaSprite('iconparticle'.. num, nil, 0, 0)
		if mustHitSection == false then
			loadGraphic('iconparticle'.. num, 'icons/icon-'..getProperty('dad.healthIcon'), 150)
		else
			loadGraphic('iconparticle'.. num, 'icons/icon-'..getProperty('boyfriend.healthIcon'), 150)
		end
	addAnimation('iconparticle'.. num, 'icon', {0, 1}, 0, true)
	playAnim('iconparticle'.. num, 'icon')
	addLuaSprite('iconparticle'.. num, false)
	setScrollFactor('iconparticle'.. num, 0, 0);
	screenCenter('iconparticle'.. num)
	setProperty('iconparticle'.. num.. '.alpha', getRandomFloat(0.6,0.9))
	scaleObject('iconparticle'.. num, getRandomFloat(0.5,1), getRandomFloat(0.5,1))
	
	doTweenX('particlemovex'.. num, 'iconparticle'.. num, posX[randomposXInt], getRandomInt(10,20), linear)
	--doTweenY('particlemovey'.. num, 'iconparticle'.. num, posY[randomposYInt], getRandomInt(20,30), linear)
	doTweenY('particlemovey'.. num, 'iconparticle'.. num, getRandomInt(2000, -1450), getRandomInt(10,20), linear)
	
	--doTweenAlpha('particlealpha'.. num, 'iconparticle'.. num, 0.2, getRandomInt(2,3), linear)
	

	setProperty('iconparticle'.. num .. '.angularVelocity', getRandomFloat(-200,200));
end
function onTimerCompleted(tag)

    if tag == 'tween' then

        noteTweenX('sus', 4, 90, 0.0005)
        noteTweenX('sus2', 5, 205, 0.0005)
        noteTweenX('sus3', 6, 315, 0.0005)
        noteTweenX('sus4', 7, 428, 0.0005)

        noteTweenX('susOp', 0, 730, 0.0005)
        noteTweenX('susOp2', 1, 845, 0.0005)
        noteTweenX('susOp3', 2, 954, 0.0005)
        noteTweenX('susOp4', 3, 1070, 0.0005)

	end
end
