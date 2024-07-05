local FadeTime = 0.5
local FadeEase = 'CircInOut'

function onCountdownStarted()
	runTimer('start',0.01)
end
function onCreatePost()

end
function onUpdate()
end
function onCountdownTick(counter)
	if counter == 0 then --Three
	end
	if counter == 1 then --Two
	setProperty('countdownReady.y', 100)
	doTweenY('readyy','countdownReady', getProperty('countdownReady.y') + 100, 0.25, 'sineInOut')

	doTweenY('cready','countdownReady.scale', 0.25, 0.001, 'sineInOut')
	doTweenY('cdready','countdownReady.scale', 1, 0.25, 'sineInOut')
	end
	if counter == 2 then --One
	setProperty('countdownSet.y', 100)
	doTweenY('sety','countdownSet', getProperty('countdownSet.y') + 100, 0.25, 'sineInOut')

	doTweenY('cset','countdownSet.scale', 0.25, 0.001, 'sineInOut')
	doTweenY('cdset','countdownSet.scale', 1, 0.25, 'sineInOut')
	end
	if counter == 3 then --Go!
	setProperty('countdownGo.y', 100)
	doTweenY('goy','countdownGo', getProperty('countdownGo.y') + 100, 0.25, 'sineInOut')

	doTweenY('cgo','countdownGo.scale', 0.25, 0.001, 'sineInOut')
	doTweenY('cdgo','countdownGo.scale', 1, 0.25, 'sineInOut')
	end
end