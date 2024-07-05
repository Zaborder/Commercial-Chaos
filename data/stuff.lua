function onCountdownStarted()
	doTweenZoom('campanzoom','camGame',2.8,0.01,'quadOut')	
end
function onSongStart()
	doTweenZoom('campanzoom','camGame',1.05,3,'quadOut')
	doTweenAlpha('hudDisapersrssgd', 'camHUD', 0, 0.25)
	doTweenAlpha('nogru','dad',0,00.1,'linear')
end
function onUpdate()
	if curBeat >= 0 and curBeat <= 8 then --moon
		setProperty('camFollow.x',750)
		setProperty('camFollow.y',-1150)
		setProperty('cameraSpeed', 100)
	end
	if curBeat >= 8 and curBeat <= 16 then --gru
		doTweenZoom('campanzoom','camGame',1.5,0.01,'quadOut')	
		setProperty('camFollow.x',-100)
		setProperty('camFollow.y',250) 
	end
	if curBeat >= 16 and curBeat <= 20 then --deals
		doTweenZoom('campanzoom','camGame',1.3,0.01,'quadOut')	
		setProperty('camFollow.x',-600)
		setProperty('camFollow.y',400)
	end
	if curBeat >= 20 and curBeat <= 24 then --minions
		doTweenZoom('campanzoom','camGame',0.8,0.01,'quadOut')	
		setProperty('camFollow.x',750)
		setProperty('camFollow.y',-550)
	end	
	if curBeat >= 24 and curBeat <= 28 then --ground minions
		doTweenZoom('campanzoom','camGame',1,0.01,'quadOut')	
		setProperty('camFollow.x',2000)
		setProperty('camFollow.y',400) 
	end
	if curBeat >= 28 and curBeat <= 28 then	--moon
		doTweenZoom('campanzoom','camGame',1,0.01,'quadOut')	
		setProperty('camFollow.x',750)
		setProperty('camFollow.y',-1150)
	end	
	if curStep >= 118 and curStep <= 128 then
		doTweenZoom('campanzoom','camGame',1.35,0.01,'quadOut')	
		doTweenAlpha('gruvisible','dad',1,00.1,'linear')
	end
	if curBeat >= 32 then
		--setProperty('camFollow.y',200)
		doTweenAlpha('helloHud', 'camHUD', 1, 0.25)
		setProperty('cameraSpeed', 1)
	
		if mustHitSection == false then
			--setProperty('camFollow.y',200)
			setProperty('defaultCamZoom',0.4)
		else
			--setProperty('camFollow.y',500)
			setProperty('defaultCamZoom',0.65)
		end
	end
end