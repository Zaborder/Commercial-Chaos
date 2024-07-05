function onUpdate()
	if curBeat >= 32 then
		if mustHitSection == false then
			setProperty('defaultCamZoom',0.5)
		else
			setProperty('defaultCamZoom',0.6)
		end
	end
end

function onBeatHit()
	if curBeat == 32 then
		setProperty('bg.visible', false)
	end
end