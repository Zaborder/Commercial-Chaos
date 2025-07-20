function onCreatePost()
			doTweenY('spookyx','boyfriend.scale', 1.2, 0.1, 'sineInOut')
			doTweenX('spookyy','boyfriend.scale', 1.2, 0.1, 'sineInOut')

	precacheImage('vignette')
	makeLuaSprite('vignette', 'vignette',0,0)
	setProperty('vignette.alpha', 0.75)
	addLuaSprite('vignette', true)
	setScrollFactor('vignette', 0, 0);
	scaleObject('vignette', 2,2)
	screenCenter('vignette')

	makeLuaSprite('shadow','alleyway/shadow',-900, -600);
	setProperty('shadow.alpha',0)
	addLuaSprite('shadow', false);

        --setProperty('boyfriendGroup.flipX',true)
	--doTweenAlpha('helloHud', 'camHUD', 1, 0.25)


	setProperty('boyfriendCameraOffset[0]', 425) --[125, -200],
	setProperty('boyfriendCameraOffset[1]', -200)


	noteTweenX('dadNormalX1', 0, 745, 0.0001, 'linear');
	noteTweenX('dadNormalX2', 1, 850, 0.0001, 'linear');
	noteTweenX('dadNormalX3', 2, 955, 0.0001, 'linear');
	noteTweenX('dadNormalX4', 3, 1060, 0.0001, 'linear');

	noteTweenX('bfleft1', 4, 90, 0.0001, 'linear');
	noteTweenX('bfleft2', 5, 205, 0.0001, 'linear');
	noteTweenX('bfleft3', 6, 315, 0.0001, 'linear');
	noteTweenX('bfleft4', 7, 425, 0.0001, 'linear');

	setProperty('boyfriend.visible', false)
	scaleObject('dad',0.75,0.75);
	doTweenAlpha('ronaldnothere', 'dad', 0, 0.25, 'quadOut')
	setProperty('light.alpha', 0)
	doTweenColor("dadbrrr", "dad", "000000", 0.01, "linear")
	setProperty('healthBar.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('timeBar.visible', false)
	setProperty('timeTxt.visible', false)
	setProperty('tvBf.visible', false)
	setProperty('tvOpponent.visible', false)
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	
	for i = 0, 7 do
		setPropertyFromGroup('strumLineNotes', i, 'visible', false)
	end
end

function onBeatHit()
    if curBeat == 30 then
	doTweenAlpha('shadowappear', 'shadow', 1, 0.25, 'quadOut')
    end
    if curBeat == 32 then
	doTweenAlpha('ronaldappear', 'dad', 1, 0.25, 'quadOut')
	setProperty('healthBar.visible', true)
	setProperty('scoreTxt.visible', true)
	setProperty('timeBar.visible', true)
	setProperty('timeTxt.visible', true)
	setProperty('tvBf.visible', true)
	setProperty('tvOpponent.visible', true)
	setProperty('defaultCamZoom',0.9) 
	for i = 0, 7 do
		setPropertyFromGroup('strumLineNotes', i, 'visible', true)
	end

    end
    if curBeat == 40 then
	setProperty('boyfriend.visible', true)
    end    
    if curBeat == 63 then
	setProperty('iconP1.visible', true)
    end    
    if curBeat == 95 then
	doTweenZoom('campanzoom','camGame',1.5,0.25,'quartOut')	
    end
    if curBeat == 96 then
	doTweenColor("dadbrrr", "dad", "FFFFFF", 0.01, "linear")
	setProperty('light.alpha', 1)	
	setProperty('shadow.alpha', 0)
	cameraFlash('camHud','FFFFFF',0.5)
	setProperty('iconP2.visible', true)
	doAlphaTween('vignettebyebye', 'vignette', 0.25, 0, 'quadOut')
    end
end

function onUpdate()

	if curBeat >= 0 and curBeat <= 32 then
		setProperty('camFollow.x',140)
		setProperty('camFollow.y',260)
		setProperty('defaultCamZoom',0.7)
		--setProperty('cameraSpeed', 1000)
		--doTweenZoom('campanzoom','camGame',5,0.01,'quadOut')	
	end
	if curBeat >= 32 then
		if curBeat >= 32 and curBeat <= 64 then
			setProperty('opponentCameraOffset[0]', 250) --[125, -200],
			setProperty('opponentCameraOffset[1]', 200)
			setProperty('defaultCamZoom',0.85)
	end
		if curBeat >= 64 then

			setProperty('opponentCameraOffset[0]', 50) --[125, -200],
			setProperty('opponentCameraOffset[1]', 200)

		if mustHitSection == false then
			setProperty('defaultCamZoom',0.7)

			doTweenY('spookyx','boyfriend.scale', 1.2, 0.1, 'sineInOut')
			doTweenX('spookyy','boyfriend.scale', 1.2, 0.1, 'sineInOut')
		else
			setProperty('defaultCamZoom',0.6)

			doTweenY('spookyx','boyfriend.scale', 1.3, 0.1, 'sineInOut')
			doTweenX('spookyy','boyfriend.scale', 1.3, 0.1, 'sineInOut')
		end
		end
	end
    if curBeat == 95 then
	setProperty('camFollow.x',950)
	setProperty('camFollow.y',60)
    end
end