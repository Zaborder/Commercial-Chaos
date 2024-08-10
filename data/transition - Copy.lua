function onCreatePost()
	precacheImage('character/icm-first-person')

	makeLuaSprite('black', '', -950, -450); 
        makeGraphic('black', 3200, 1600, '000000');
        addLuaSprite('black', true);
	setScrollFactor('black', 0, 0);
	setProperty('black.alpha',0);
	
	makeLuaSprite('bg2', '', -950, -450); 
	makeGraphic('bg2', 3200, 1600, '0dffc8');
	addLuaSprite('bg2', false);
	setScrollFactor('bg2', 0, 0);
	setProperty('bg2.alpha',0);
	
	precacheImage('vignette')
	makeLuaSprite('vignette', 'vignette',0,0)
	setProperty('vignette.alpha',0.5)
	addLuaSprite('vignette', false)
	setScrollFactor('vignette', 0, 0);
	scaleObject('vignette', 2,2)
	screenCenter('vignette')
	
	makeLuaText('debugiconnum', 'ICONS2: '.. getProperty('healthBar.percent'),123, 25, 350)
	setTextSize('debugiconnum','30')
	addLuaText('debugiconnum')
	runTimer('del', 2)
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
	if curBeat == 352 then
		setProperty('black.alpha', 1)
		doTweenAlpha('hudDisapper', 'camHUD', 0, 0.25)
		allowparticle = true
	end

	--if curBeat == 424 or curBeat == 1 then
	--end

	if curBeat == 427 then
		setProperty('black.alpha', 0)
		doTweenAlpha('helloHud', 'camHUD', 1, 0.25)
	end
	if curBeat % 3 == 0 then
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

			if mustHitSection == false then
				--triggerEvent('Change Character', 'bf', 'wario')
				
				setProperty('boyfriendGroup.visible', false)
				setProperty('dad.visible', true)
			else
				setProperty('boyfriendGroup.visible', true)
				setProperty('dad.visible', false)
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
	setProperty('iconparticle'.. num.. '.alpha', getRandomFloat(0.5,0.9))
	scaleObject('iconparticle'.. num, getRandomFloat(0.5,1), getRandomFloat(0.5,1))
	
	doTweenX('particlemovex'.. num, 'iconparticle'.. num, posX[randomposXInt], getRandomInt(20,30), linear)
	--doTweenY('particlemovey'.. num, 'iconparticle'.. num, posY[randomposYInt], getRandomInt(20,30), linear)
	doTweenY('particlemovey'.. num, 'iconparticle'.. num, getRandomInt(2000, -1450), getRandomInt(20,30), linear)
	
	--doTweenAlpha('particlealpha'.. num, 'iconparticle'.. num, 0.2, getRandomInt(2,3), linear)
	

	setProperty('iconparticle'.. num .. '.angularVelocity', getRandomFloat(-200,200));

    setTextString('debugiconnum', 'ICONS2: ' .. num)

end