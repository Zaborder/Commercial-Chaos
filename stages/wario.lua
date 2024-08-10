tankX = -1050;
tankY = -900;
tankSpeed = 0;
tankAngle = 0;
function onCreate() 
	math.randomseed(os.time());
	tankSpeed = 100--math.random(5, 7);
	tankAngle = math.random(-90, 45);
	
	makeLuaSprite('b', 'bgwario', -700,-400);
	addLuaSprite('b')
	setProperty('b.angularVelocity', 300);
	scaleObject('b',1.25,1.25)
	
end

local enableSystem = true
function onUpdate(elapsed)

    setProperty('boyfriend.visible',false)

	tankAngle = tankAngle + (elapsed * tankSpeed);
	--setProperty('b.angle', tankAngle - 90 + 15);
    setProperty('b.x', tankX + (170 * math.cos(math.pi / 180 * (1 * tankAngle + 180))));
	setProperty('b.y', tankY + (170 * math.sin(math.pi / 180 * (1 * tankAngle + 180))));
	
   
    if enableSystem == true then
            	setProperty('defaultCamZoom',0.8) -- +150 -100
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
            		setProperty('defaultCamZoom',0.7)
                            triggerEvent('Camera Follow Pos',DadX,DadY)
                    end

	end
end
function onStepHit()
	if curStep == 1292 then 
        tankSpeed = 400
	end
	if curStep == 1420 then 
        tankSpeed = 100
	end
end