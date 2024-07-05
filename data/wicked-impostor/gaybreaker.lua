function onCreatePost()


    for i = 0, 3 do
    setPropertyFromGroup('opponentStrums', i, 'x', getMidpointX('dad')-150);
    setPropertyFromGroup('opponentStrums', i, 'y', getMidpointY('dad')+100);
    setPropertyFromGroup('opponentStrums', i, 'visible', false)
    end
    setObjectOrder('dad', 19)

	makeAnimatedLuaSprite('coins','coins', getMidpointX('dad'), getMidpointX('dad')-300)
	addAnimationByPrefix('coins','spin', 'coins', 24)
	objectPlayAnimation('coins','spin', false)
    setObjectCamera('coins', 'hud');
    screenCenter('coins', 'xy')
    addLuaSprite('coins', true)
    setProperty('coins.alpha', 0)
	doTweenY('coinsx','coins.scale', 0.1, 0.1, 'sineInOut')
	doTweenX('coinsy','coins.scale', 0.1, 0.1, 'sineInOut')
end
enableSystem = true
local booba = 0
function onUpdate()


    booba = booba + 0.5
    for i = 0, 3 do
        setPropertyFromGroup('opponentStrums', 0, 'direction', 0 +booba);
        setPropertyFromGroup('opponentStrums', 1, 'direction', 90 +booba);
        setPropertyFromGroup('opponentStrums', 2, 'direction', 180 +booba);
        setPropertyFromGroup('opponentStrums', 3, 'direction', 270 +booba);
    end
    
	
    if enableSystem == true then
            	setProperty('defaultCamZoom',0.7) -- +150 -100
                    DadX = getMidpointX('dad') + 150 + getProperty('dad.cameraPosition[0]') + getProperty('opponentCameraOffset[0]')
                    DadY = getMidpointY('dad') - 100 + getProperty('dad.cameraPosition[1]') + getProperty('opponentCameraOffset[1]')
                    if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                        triggerEvent('Camera Follow Pos',DadX-DadOfs,DadY)
                    elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                        triggerEvent('Camera Follow Pos',DadX+(DadOfs/2),DadY)
                    elseif getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY-DadOfs)
                    elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                        triggerEvent('Camera Follow Pos',DadX,DadY+DadOfs)
                else
                    setProperty('defaultCamZoom',0.9)
                    triggerEvent('Camera Follow Pos',DadX,DadY)
                end
	end
end

function onStepHit()
	if curStep == 136 then 
  		doTweenAlpha('dad', 'dad', 1, 2)
  		doTweenAlpha('iconP2', 'iconP2', 1, 2)
        doTweenAlpha('hudAppear', 'camHUD', 1, 0.25)
	end
	if curStep == 1036 then 
	end
	if curStep == 2196 then  --1:21 sec/3:03
    	doTweenAlpha('hudbyebye', 'camHUD', 0, 0.5)
	end
	if curStep == 2324 then 
    	doTweenAlpha('hudhello', 'camHUD', 1, 0.25)
  		doTweenAlpha('coinshi', 'coins', 1, 2)
	    doTweenY('coinsx','coins.scale', 1, 1, 'sineInOut')
	    doTweenX('coinsy','coins.scale', 1, 1, 'sineInOut')
        doTweenAlpha('dada', 'dad', 0.5, 0.001)
	    doTweenY('dadax','dad.scale', 0.75, 1, 'sineInOut')
	    doTweenX('daday','dad.scale', 0.75, 1, 'sineInOut')
	end

end
function onCountdownStarted()
    doTweenAlpha('dad', 'dad', 0, 0.001)
  	doTweenAlpha('iconP2', 'iconP2', 0, 0.001)	
        noteTweenAlpha('opponentStrums', 0, 0, 0.01, 'linear')
        noteTweenAlpha('opponentStrums', 0, 1, 0.01, 'linear')
        noteTweenAlpha('opponentStrums', 0, 2, 0.01, 'linear')
        noteTweenAlpha('opponentStrums', 0, 3, 0.01, 'linear')

    runHaxeCode([[
        for (strum in game.opponentStrums)
        {
            strum.camera = game.camGame;
            strum.scrollFactor.set(1, 1);
        }

        for (note in game.unspawnNotes)
        {
            if (!note.mustPress) {
                note.camera = game.camGame;
                note.scrollFactor.set(1, 1);
            }
        }
    ]])
end



local fakeLength = 185000
-- how long you want the song to be (in milliseconds)

local trueLength = fakeLength

local timeBarTypes = {
    ['song name'] = function()
        return songName
    end,

    ['time left'] = function()
        return formatTime(fakeLength - (getSongPosition() - noteOffset))
    end,

    ['time elapsed'] = function()
        return formatTime(getSongPosition() - noteOffset)
    end
}

function lerp(a, b, c)
	return a + (b - a) * c
end

function boundTo(number, min, max)
    return math.max(min, math.min(max, number))
end

function formatTime(millisecond)
    local seconds = math.floor(millisecond / 1000)

    return string.format("%01d:%02d", (seconds / 60) % 60, seconds % 60)  
end

function onUpdatePost(elapsed)
    setProperty('songPercent', getSongPosition() / fakeLength)

    if getSongPosition() > trueLength then fakeLength = lerp(songLength, fakeLength, boundTo(1 - (elapsed * 5), 0, 1)) end
	
	setTextString('timeTxt', timeBarTypes[timeBarType:lower()]() or nil)
end