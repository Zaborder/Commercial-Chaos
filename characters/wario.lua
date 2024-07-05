function onUpdate(elapsed)
	if songName == 'wicked-impostor' then
		if curStep >= 1036 then 
			setProperty('dadGroup.x', getProperty('dadGroup.x') + 2 * math.cos(curDecBeat / 4 * math.pi) * elapsed * 60)
			setProperty('dadGroup.y', getProperty('dadGroup.y') + 3 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
		end
	end

	--if mustHitSection == true then
	--	setProperty('camFollow.x', getProperty('camFollow.x'))
	--	setProperty('camFollow.y', getProperty('camFollow.y'))
	--else
	--	setProperty('camFollow.x', getProperty('camFollow.x') + 2 * math.cos(curDecBeat / 4 * math.pi) * elapsed * 60)
	--	setProperty('camFollow.y', getProperty('camFollow.y') + 3 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
	--end
end