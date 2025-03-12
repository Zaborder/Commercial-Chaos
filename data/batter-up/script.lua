function onCreatePost()
	--setProperty('cameraSpeed', 100)
	precacheImage('spotlight')
	
	makeLuaSprite('spotlight1', 'mcsonic/spotlight',-550, -300);
	addLuaSprite('spotlight1', true);
	setProperty('spotlight1.alpha', 0);
	scaleObject('spotlight1',1.5,1.5);

	makeLuaSprite('spotlight2', 'mcsonic/spotlight',1200, -300);
	addLuaSprite('spotlight2', true);
	scaleObject('spotlight2',1.5,1.5);
	setProperty('spotlight2.alpha', 0);
	setProperty('spotlight2.flipX', true)

	makeLuaSprite('black', '', -1100, -200); 
        makeGraphic('black', 4700, 2500, '000000');
        addLuaSprite('black', false);
	setProperty('black.alpha',0);
	setObjectOrder('black', getProperty('dad') -1)

end
function onCreate()
	precacheImage('vignette')
	makeLuaSprite('vignette', 'vignette',0,0)
	setObjectCamera('vignette','Other')
	setProperty('vignette.alpha',0)
	addLuaSprite('vignette', false)
	scaleObject('vignette',1.25,1.25)
	screenCenter('vignette')

	makeLuaSprite('white', '', -950, -450); 
        makeGraphic('white', 3200, 1600, 'FFFFFF');
        addLuaSprite('white', true);
	setScrollFactor('white', 0, 0);
	setProperty('white.alpha',0);
end

function onBeatHit()

	if curBeat == 446 then
		doTweenAlpha('vignettehi','vignette',0.75,0.5,'sineInOut')
		setProperty('defaultCamZoom',1)
	end
	if curBeat == 448 then 
		doTweenAlpha('vignettebye','vignette',0,0.5,'sineInOut')
		setProperty('defaultCamZoom',0.47)
	end

	if curBeat >= 448 and curBeat <= 454 then 
        if curBeat % 2 == 0 then
			doTweenAngle('camHUD2', 'camHUD', -1.75, 0.1, 'circOut')
			doTweenX('camHUD2x', 'camHUD', -25, 0.1, 'circOut')
			doTweenAngle('camGame3', 'camGame', 2.25, 0.1, 'circOut')
			
        elseif curBeat % 2 == 1 then
			doTweenAngle('camHUD1', 'camHUD', 1.75, 0.1, 'circOut')
			doTweenX('camHUD1x', 'camHUD', 25, 0.1, 'circOut')
			doTweenAngle('camGame2', 'camGame', -2.25, 0.1, 'circOut')

		end
	elseif curBeat >= 455 then
      	doTweenAngle('camHUDIdle', 'camHUD', 0, 0.1, 'circOut')
		doTweenX('camHUDIdlex', 'camHUD', 0, 0.1, 'circOut')
		doTweenAngle('camGameIdle', 'camGame', 0, 0.1, 'circOut')

		doTweenAlpha('vignettebye','vignette',0,0.5,'sineInOut')	

	end

	if curBeat == 452 then
		doTweenAlpha('vignettehi','vignette',0.55,0.15,'sineInOut')	
		setProperty('defaultCamZoom',0.75)
	end

	if curBeat == 454 then
		doTweenAlpha('vignettehihihi','vignette',0.95,0.15,'sineInOut')
		setProperty('defaultCamZoom',1)
	end

	if curBeat == 456 then
		setProperty('defaultCamZoom',0.47)
		doTweenAlpha('whiteflash','white',1,0.2,'sineOut')
	end
	if curBeat == 457 then

		doTweenAlpha('vignettebye','vignette',0,0.5,'sineInOut')
	end

	if curBeat == 460 then --460 then
		doTweenAlpha('hudDisapersrssgd', 'camHUD', 0, 2, 'sineIn')
		doTweenY('hudDisapersrssgx', 'camHUD', 45, 3, 'sineInOut')
	end


end

function onUpdate()
	if curBeat >= 454 and curBeat <= 455 then
		setProperty('camFollow.x',getProperty('dad.x')-30)
	end
	
end