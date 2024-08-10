local canShoot = false

local minihbw = 180
local minihbh = 203

local picohbw = 250
local picohbh = 350

--this code is extremely dated i didnt have time to update it :(
function onCreate()
	
	makeLuaSprite('picoboxbg', '', 1085,475); 
	makeGraphic('picoboxbg', picohbw, picohbh, '00FF00');
	addLuaSprite('picoboxbg', true)
	setProperty('picoboxbg.alpha',0)
	
	makeLuaSprite('crosshair','crosshair',0,0)
    setLuaSpriteScrollFactor('crosshair',1,1)
    setObjectCamera('crosshair','camGame')
	addLuaSprite('crosshair',true)
	
	makeLuaSprite('shift','shift',320,125)
    setObjectCamera('shift','Other')
	addLuaSprite('shift',true)
	setProperty('shift.alpha',0)

end
function onBeatHit()
	if curBeat == 1 then
	doTweenAlpha('shiftappear', 'shift', 1, 1, 'quadOut')
	end
	if curBeat == 24 then
	doTweenAlpha('shiftappear', 'shift', 0, 1, 'quadOut')
	end
end

local canShoot = true
local spin = 0
function onUpdate()
	minihbx = getProperty('mini.x')
	minihby = getProperty('mini.y')
	setProperty('hitboxbg.x',getProperty('mini.x'))
	setProperty('hitboxbg.y',getProperty('mini.y'))


	setProperty('crosshair.x',getMouseX('camGame')+ getProperty('camGame.scroll.x'));
	setProperty('crosshair.y',getMouseY('camGame')+ getProperty('camGame.scroll.y'));

	setProperty('crosshair.offset.x',85);
	setProperty('crosshair.offset.y',85);

	if getProperty('crosshair.x') > minihbx and getProperty('crosshair.x') < minihbx+minihbw and getProperty('crosshair.y') > minihby and getProperty('crosshair.y') < minihby+minihbh and keyboardJustPressed('SHIFT') then
		playSound('shoot',1)
		setProperty('hitboxbg.visible',false)
		setProperty('health', getProperty('health')+0.05)
		cancelTimer('attacked')
		triggerEvent('Play Animation','shoot','bf')
		triggerEvent('Screen Shake','0.25,0.02','')
		objectPlayAnimation('mini','explosion', false)
		runTimer('exploded', 0.5)
		cancelTimer('')
	end
	
	setObjectOrder('crosshair', getObjectOrder('mini') +1)
	setObjectOrder('hitboxbg', getObjectOrder('mini') +1)

	spin = spin + 4
	setProperty('mini.angle',spin)
	setProperty('hitboxbg.angle',spin)
end

function onEvent(n,v,b)
	if n == 'throw' then
		createNibbler()
	end
end
local nib == 0
function createNibbler()
	nib = nib + 1
		triggerEvent('Play Animation','throw','dad')

		makeAnimatedLuaSprite('mini'..nub,'mini', 0, 300)
		addAnimationByPrefix('mini'..nub,'idle', 'idle', 24)
		addAnimationByPrefix('mini'..nub,'explosion', 'explosion', 24)
		objectPlayAnimation('mini'..nub,'idle', false)
		addLuaSprite('mini'..nub,true)
		
		makeLuaSprite('hitboxbg'..nub, '', minihbx,minihby); 
		makeGraphic('hitboxbg'..nub, minihbw, minihbh, 'FF00F0');
		addLuaSprite('hitboxbg'..nub, true)
		setProperty('hitboxbg'..nub..'.alpha',0)

		setProperty('mini'..nub..'.visible',true)
		setProperty('hitboxbg'..nub..'.visible',true)
		
		doTweenX('throwx','mini',(getRandomInt(450,500)),1,'linear')
		doTweenY('throwy','mini',(getRandomInt(100,700)),1,'linear')
		runTimer('attack',1)
		runTimer('attacked',2)

end

function onTimerCompleted(t,l,ll)
	if t == 'exploded' then
		setProperty('mini.visible',false)
	end
	if t == 'attack' then
		doTweenX('attackx','mini',1090,1,'linear')
		doTweenY('attcky','mini',500,1,'linear')
	end
	if t == 'attacked' then		
		playSound('missnote1',1)
		setProperty('health', getProperty('health')-0.25)
		triggerEvent('Play Animation','singRIGHTmiss','bf')
		runTimer('exploded', 0.5)
		objectPlayAnimation('mini','explosion', false)
		doTweenY('goodbye','mini',10500,0.1,'linear') --dont kill me i dont like it either
	end
end