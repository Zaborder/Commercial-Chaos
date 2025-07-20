--script by Sr. Patatusa
--if you modify this code or use it in your mod, please give credit
--it's prone to bugs, if you find any or have suggestions, don't hesitate to share!

local noteCounter = 0
local noteCounteropp = 0
local ghostSprites = {}
local ghostNumber = 0
local predirectionbf = ''
local predirectiondad = ''

function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        noteCounter = noteCounter + 1
        runTimer('resetNotecounterPla', 0.04, 1)
        if noteCounter >= 2 then
            createGhost('boyfriend', predirectionbf)
        end
        predirectionbf = direction
    end
end


function opponentNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        noteCounteropp = noteCounteropp + 1
        runTimer('resetNotecounterOpp', 0.01, 1)
        if noteCounteropp >= 2 then
            createGhost('dad', predirectiondad)
        end
    end
    predirectiondad = direction
end


function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'resetNotecounterPla' then
        noteCounter = 0
    elseif tag == 'resetNotecounterOpp' then
        noteCounteropp = 0
    end  
end

function createGhost(char, direction)
    if getProperty(char .. '.visible') then
        if getProperty(char .. '.alpha') >= 0.1 then
            local json = nil

            if currentModDirectory and currentModDirectory ~= '' then
                json = require("mods/"..currentModDirectory.."/scripts/jsonlua")
            else
                json = require("mods/scripts/jsonlua")
            end
        
            ghostNumber = ghostNumber + 1
            local ghostName = char .. 'Ghost' .. ghostNumber
            local charJson = json.parse(getTextFromFile('characters/'.. getProperty(char .. '.curCharacter')..'.json'))
        
            makeAnimatedLuaSprite(ghostName, charJson.image, getProperty(char .. '.x'), getProperty(char .. '.y'))
        
            if char == 'dad' then
                setProperty(ghostName..'.flipX', charJson.flip_x)
            elseif char == 'boyfriend' then
                setProperty(ghostName..'.flipX', not charJson.flip_x)
            end

            if charJson.no_antialiasing then
                setProperty(ghostName .. '.antialiasing', false)
            end
            
            scaleObject(ghostName, charJson.scale, charJson.scale)
        
            for _, animation in ipairs(charJson.animations) do
                addAnimationByPrefix(ghostName, animation.anim, animation.name, animation.fps, animation.loop)
                addOffset(ghostName, animation.anim, animation.offsets[1], animation.offsets[2])
            end
        
            setObjectOrder(ghostName, getObjectOrder(char..'Group'))
            setProperty(ghostName..'.alpha', getProperty(char .. '.alpha') / 2)
            addLuaSprite(ghostName)
            playAnim(ghostName, obtenerAnimacion(direction), true)
            doTweenAlpha(ghostName .. 'fadeOut', ghostName, 0, 1, 'cubeIn')
            doTweenX(ghostName .. 'fadeX', ghostName, getProperty(char .. '.x') + obtenerX(direction), 1, 'cubeIn')
            doTweenY(ghostName .. 'fadeY', ghostName, getProperty(char .. '.y') + obtenerY(direction), 1, 'cubeIn')
            ghostSprites[ghostName] = true
        end
    end
end

function getIconColor(char)
	return getColorFromHex(rgbToHex(getProperty(char .. ".healthColorArray")))
end

function rgbToHex(array)
	return string.format('%.2x%.2x%.2x', math.min(array[1],255), math.min(array[2],255), math.min(array[3],255))
end

function onTweenCompleted(tag)
    for ghostName, _ in pairs(ghostSprites) do
        if tag == ghostName .. 'fadeOut' then
            removeLuaSprite(ghostName)
            ghostSprites[ghostName] = nil
            break
        end
    end
end

function obtenerAnimacion(tecla)
    local animations = { 'singLEFT', 'singDOWN', 'singUP', 'singRIGHT' }
    return animations[tecla + 1]
end

function obtenerX(tecla)
    local moveX = { -40 , 0, 0, 40 }
    return moveX[tecla + 1]
end

function obtenerY(tecla)
    local moveY = { 0 , 40, -40, 0 }
    return moveY[tecla + 1]
end