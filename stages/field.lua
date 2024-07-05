function onCreate()
	makeLuaSprite('sky', 'mcsonic/skyfield',-1400, -2500);
	--scaleObject('sky',1.75,1.5);
	addLuaSprite('sky', false);
	
	makeLuaSprite('ground', 'mcsonic/ground',-1200, 800);
	addLuaSprite('ground', false);
	--scaleObject('ground',2,2);
	
	makeLuaSprite('grass', 'mcsonic/grasss',-1300, -800);
	addLuaSprite('grass', false);

	makeLuaSprite('crowd', 'mcsonic/crowd',-700, -250);
	addLuaSprite('crowd', false);
	setScrollFactor('crowd', 0.85, 1);

	makeLuaSprite('crowd3', 'mcsonic/crowd3',-850, 0);
	makeLuaSprite('crowd2', 'mcsonic/crowd2',-850, 270);
	makeLuaSprite('crowd1', 'mcsonic/crowd1',-850, 450);
	addLuaSprite('crowd3', false);
	addLuaSprite('crowd2', false);
	addLuaSprite('crowd1', false);
	

	makeAnimatedLuaSprite('backboppers','mcsonic/backboppers',-315, 450)
	addAnimationByPrefix('backboppers','idle', 'backboppers', 24)
	addLuaSprite('backboppers', false)

	makeAnimatedLuaSprite('frontboppers','mcsonic/frontboppers',-520, 280)
	addAnimationByPrefix('frontboppers','idle', 'frontboppers', 24)
	addLuaSprite('frontboppers', false)

	
	setScrollFactor('backboppers1', 0.99, 1);
	setScrollFactor('frontboppers', 0.97, 1);
	setScrollFactor('crowd1', 0.90, 1);
	setScrollFactor('crowd2', 0.875, 1);
	setScrollFactor('crowd3', 0.85, 1);
	
	makeLuaSprite('field', 'mcsonic/field',-500, 1050);
	addLuaSprite('field', false);

	makeLuaSprite('stadium', 'mcsonic/stadium',-1100, -250);
	addLuaSprite('stadium', false);

end

function onCreatePost()
end

function onStepHit()
	--BG chars boppin!
	
	if curStep % 4 == 1 then
		setProperty('crowd1.y',getProperty('crowd1.y')+25)
		doTweenY('charbounce1','crowd1',getProperty('crowd1.y')-25,0.15,'circOut')
	end
	if curStep % 4 == 2 then
		setProperty('crowd2.y',getProperty('crowd2.y')+25)
		doTweenY('charbounce2','crowd2',getProperty('crowd2.y')-25,0.15,'circOut')
	end
	if curStep % 4 == 3 then
		setProperty('crowd3.y',getProperty('crowd3.y')+25)
		doTweenY('charbounce3','crowd3',getProperty('crowd3.y')-25,0.15,'circOut')
	end

	--[[if curStep % 4 == 2 then
		setProperty('crowd2.y',getProperty('crowd2.y')+25)
		doTweenY('charbounce2','crowd2',getProperty('crowd2.y')-25,0.15,'circOut')
	end--]]

end
function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('backboppers','idle', true)
		objectPlayAnimation('frontboppers','idle', true)
	end
end