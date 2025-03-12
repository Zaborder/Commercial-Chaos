function onCreatePost()
	makeLuaSprite('black', '', 0, 0); 
    makeGraphic('black', 1300, 800, '000000');
	setObjectCamera('black', 'camHUD')
	setProperty('black.visible', false)
    addLuaSprite('black', false);
	
	precacheImage('vignette')
	makeLuaSprite('vignette', 'vignette',0,0)
	setObjectCamera('vignette','Other')
	setProperty('vignette.alpha',0)
	--addLuaSprite('vignette', false)
	scaleObject('vignette',1.25,1.25)
	screenCenter('vignette')
	
	triggerEvent('Change Character', 'dad', 'mcsonic')
	
	setProperty('boyfriend.color', getColorFromHex('000000'))
	setProperty('dad.color', getColorFromHex('000000'))
	setProperty('gf.color', getColorFromHex('000000'))
	
	
	
	makeLuaSprite('batterupbg', 'mcsonic/batterup-bg', -800, -900); 
    addLuaSprite('batterupbg', false);
	scaleObject('batterupbg',2,2)


	
end
function onSongStart()
	--doTweenAlpha('blackgoaway', 'black', 0, 2.75, 'quadIn')
	doTweenAlpha('hudbyebye', 'camHUD', 0, 2.75, 'quadIn')
	doTweenAlpha('vignettehi', 'vignette', 1, 2.75, 'quadOut')
	

end

function onUpdate()
	--setProperty('sky.y', getProperty('sky.y') + 3 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
end
function onPostUpdate()
	setProperty('sky.y', getProperty('sky.y') + 3 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
	
	--setProperty('grass.y', getProperty('grass.y') + 8 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
end

function onStepHit()
	if curStep == 114 then
		setProperty('black.alpha', 1)
		setObjectCamera('black', 'other')
		setProperty('camHUD.alpha', 1)
	end
	if curStep == 251 then
		doTweenZoom('campanzoom','camGame',1,0.25,'quadIn')
	end
end
function onBeatHit()
	if curBeat == 31 then
		removeLuaSprite('stadium', true)
		removeLuaSprite('crowd', true)
		removeLuaSprite('crowd1', true)
		removeLuaSprite('crowd2', true)
		removeLuaSprite('crowd3', true)
		removeLuaSprite('backboppers', true)
		removeLuaSprite('frontboppers', true)
		removeLuaSprite('field', true)
		removeLuaSprite('grass', true)
		removeLuaSprite('ground', true)
	end
	if curBeat == 32 then
		setProperty('black.alpha', 0)
		setProperty('vignette.alpha', 0)
		setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
		setProperty('dad.color', getColorFromHex('FFFFFF'))
		setProperty('gf.color', getColorFromHex('FFFFFF'))
	end
	if curBeat == 64 then
		cameraFlash('Hud', 'FFFFFF', 1,false)
	addLuaScript('stages/strike')
	
	end
end


gfAngle = 0;
function onUpdate(elapsed)
	if enabled == true then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.6)
		
			doTweenY('dadsx','dad.scale', 0.77, 0.1, 'sineInOut')
			doTweenX('dadsy','dad.scale', 0.77, 0.1, 'sineInOut')
		else
			setProperty('defaultCamZoom',0.4)
		
			doTweenY('dadsx','dad.scale', 0.67, 0.1, 'sineInOut')
			doTweenX('dadsy','dad.scale', 0.67, 0.1, 'sineInOut')
		end
	
	setProperty('gfGroup.angularVelocity', 5);
	gfAngle = gfAngle + (elapsed * 10);
    setProperty('gfGroup.x', 400 + (1070 * math.cos(math.pi / 180 * (1 * gfAngle + 180))));
	setProperty('gfGroup.y', -400 + (870 * math.sin(math.pi / 180 * (1 * gfAngle + 180))));
	end

end