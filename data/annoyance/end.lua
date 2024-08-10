local Yeah = 0
local allowmash = true
function onCreate()

	makeLuaSprite('popup', 'mashspace', 0, 0);
	addLuaSprite('popup', true)
	scaleObject('popup',0.1,0.1)
	setProperty('popup.visible', false)
	setObjectCamera('popup', 'camHUD')
	screenCenter('popup')
		
		
end
function onUpdate(elapsed, focus)
    if keyboardJustPressed('SPACE') and allowmash == true then
        Yeah = Yeah + 1
        setTextString('hitdebug', 'LICKS: ' .. Yeah);
      end

end
function onBeatHit()
	if curBeat == 684 then
		doTweenY('popupx','popup.scale', 1, 0.25, 'backOut')
		doTweenX('popupy','popup.scale', 1, 0.25, 'backOut')
		setProperty('popup.visible', true)
		allowmash = true
	end
	if curBeat == 703 then
		if Yeah >= 15 then
			makeLuaSprite('ending', 'good_ending', 0, 0);
		else
			makeLuaSprite('ending', 'bad_ending', 0, 0);
		end
		addLuaSprite('ending', true)
		setObjectCamera('ending', 'camHUD')
		screenCenter('ending')
		setProperty('ending.visible', false)

	end
	if curBeat == 704 then
		setProperty('ending.visible', true)
		setProperty('popup.visible', false)
		noteTweenAlpha('note1', 0, 0, 1, 'quadOut')
		noteTweenAlpha('note2', 1, 0, 1, 'quadOut')
		noteTweenAlpha('note3', 2, 0, 1, 'quadOut')
		noteTweenAlpha('note4', 3, 0, 1, 'quadOut')
		noteTweenAlpha('note5', 4, 0, 1, 'quadOut')
		noteTweenAlpha('note6', 5, 0, 1, 'quadOut')
		noteTweenAlpha('note7', 6, 0, 1, 'quadOut')
		noteTweenAlpha('note8', 7, 0, 1, 'quadOut')
		doTweenAlpha('p1','iconP1', 0, 1, 'quadOut')
		doTweenAlpha('p2','iconP2', 0, 1, 'quadOut')
		doTweenAlpha('tv1','tvOpponent', 0, 1, 'quadOut')
		doTweenAlpha('tv2','tvBf', 0, 1, 'quadOut')
	end
end