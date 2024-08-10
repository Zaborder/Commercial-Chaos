local allow = false
function onSectionHit()
    if curSection == 105 then

    runHaxeCode([[
        for (strum in game.opponentStrums)
        {
            strum.camera = game.camGame;
            strum.scrollFactor.set(0, 0);
        }

        for (note in game.unspawnNotes)
        {
            if (!note.mustPress) {
                note.camera = game.camGame;
                note.scrollFactor.set(0, 0);
            }
        }
    ]])

    allow = true
    end
end

function onSpawnNote(i)
	if allow == true then
  	  for i = 0, 3 do
		setPropertyFromGroup('opponentStrums', i, 'x', getRandomInt(-100,1300))
		setPropertyFromGroup('opponentStrums', i, 'y', getRandomInt(-150,700))		
	   end
		noteTweenAngle('spin', i, getRandomInt(360,-360), 1, 'sineInOut');
	end
end


local direction = 10
local booba = 0
function onUpdatePost()
	if allow == true then
		booba = booba + 0.5

	        setPropertyFromGroup('opponentStrums', 0, 'direction', 0 +booba);
	        setPropertyFromGroup('opponentStrums', 1, 'direction', 90 +booba);
	        setPropertyFromGroup('opponentStrums', 2, 'direction', 180 +booba);
	        setPropertyFromGroup('opponentStrums', 3, 'direction', 270 +booba);
	end

end

