local duration = 1.75
local tweenallowed = true
function onStepHit()
	if curStep == 2836 then
		noteTweenX('moving5', 4, 115, duration, 'sineInOut');
		noteTweenX('moving6', 5, 225, duration, 'sineInOut');
		noteTweenX('moving7', 6, 335, duration, 'sineInOut');
		noteTweenX('moving8', 7, 445, duration, 'sineInOut');
		doTweenX('movingcoins', 'coins', getProperty('coins.x')+350, duration, 'sineInOut')
	end
	if curStep == 2324 then
		noteTweenX('side5', 4, 115, duration, 'sineInOut');
		noteTweenX('side6', 5, 335, duration, 'sineInOut');
		noteTweenX('side7', 6, 825, duration, 'sineInOut');
		noteTweenX('side8', 7, 1045, duration, 'sineInOut')
	end
	if curStep == 3092 then
		noteTweenX('side5', 4, 115, duration, 'sineInOut');
		noteTweenX('side6', 5, 335, duration, 'sineInOut');
		noteTweenX('side7', 6, 825, duration, 'sineInOut');
		noteTweenX('side8', 7, 1045, duration, 'sineInOut')
  		doTweenAlpha('coinsbyebye', 'coins', 0, 2)
		doTweenY('coinsxx','coins.scale', 0.1, 2, 'sineInOut')
		doTweenX('coinsyy','coins.scale', 0.1, 2, 'sineInOut')
		tweenallowed = false
	end
end
function onTweenCompleted(t,l,ll)
	if tweenallowed == true then
	if t == 'moving5' then --right
				noteTweenX('moving0', 4, 715, duration, 'sineInOut');
				noteTweenX('moving1', 5, 825, duration, 'sineInOut');
				noteTweenX('moving2', 6, 935, duration, 'sineInOut');
				noteTweenX('moving3', 7, 1045, duration, 'sineInOut')
				doTweenX('movingcoins', 'coins', getProperty('coins.x')-700, duration, 'sineInOut')
	end
	if t == 'moving0' then --left
				noteTweenX('moving5', 4, 115, duration, 'sineInOut');
				noteTweenX('moving6', 5, 225, duration, 'sineInOut');
				noteTweenX('moving7', 6, 335, duration, 'sineInOut');
				noteTweenX('moving8', 7, 445, duration, 'sineInOut');
				doTweenX('movingcoins', 'coins', getProperty('coins.x')+700, duration, 'sineInOut')
	end
	end
end
