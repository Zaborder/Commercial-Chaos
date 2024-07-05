function onCountdownStarted()
	--doTweenZoom('campanzoom','camGame',2.8,0.01,'quadOut')	
end
function onSongStart()

	--doTweenZoom('campanzoom','camGame',1.05,3,'quadOut')
	doTweenAlpha('hudDisapersrssgd', 'camHUD', 0, 0.25)
	--doTweenAlpha('nogru','dad',0,00.1,'linear')
end
function onUpdate()
	if curBeat >= 0 and curBeat <= 4 then --moon
		setProperty('camFollow.x',1550)
		setProperty('camFollow.y',-600)
		--setProperty('cameraSpeed', 100)
	end
	if curBeat >= 32 then
		--setProperty('camFollow.y',200)
		doTweenAlpha('helloHud', 'camHUD', 1, 0.25)
		setProperty('cameraSpeed', 1)
	
		if mustHitSection == false then
			--setProperty('camFollow.y',200)
			setProperty('defaultCamZoom',0.67)
		else
			--setProperty('camFollow.y',500)
			setProperty('defaultCamZoom',0.6)
		end
	end

	setShaderFloat("trees", "iTime", os.clock())
end
function onBeatHit()
	if curBeat == 64 then
		setSpriteShader('trees',"scroll")
	end
end

function onCreatePost()
	
	initLuaShader("scroll")
 
	--setSpriteShader('tree',"scroll")
end