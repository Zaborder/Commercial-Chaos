function onCreatePost()
	makeLuaSprite('titlecard', 'titlecards/'..songName, 0, 0); 
	setObjectCamera('titlecard', 'hud');
	screenCenter('titlecard', 'xy');
	addLuaSprite('titlecard',false);
	setProperty('titlecard.alpha', 0)
	setProperty('titlecard.y', getProperty('titlecard.height')/2 + getProperty('titlecard.y') )

	makeLuaSprite('tvBf', 'hptv',	0, 575);
	setObjectCamera('tvBf', 'hud');
	addLuaSprite('tvBf',false);
	
	makeLuaSprite('tvOpponent', 'hptv', 0,	575);
	setObjectCamera('tvOpponent', 'hud');
	addLuaSprite('tvOpponent',false);
		
	setObjectOrder('tvOpponent', getObjectOrder('healthbar') + 3);
	setObjectOrder('tvBf', getObjectOrder('healthBar') + 3);
end

curFrame = 0;
curHealth = 0;
iconAnim = 'default';
function onUpdatePost(e)

	setProperty('iconP1.x', getProperty('healthBarOV.x') + getProperty('healthBarOV.width') - 55)
	setProperty('iconP1.y', 535)
	setProperty('iconP2.x', getProperty('healthBarOV.x') - 95)
	setProperty('iconP2.y', 535)

end	
function onUpdatePost(e)

	setProperty('tvBf.x',getProperty('healthBar.x')-65)
	setProperty('tvOpponent.x',getProperty('healthBar.x')+getProperty('healthBar.width')-65)

	setProperty('iconP1.x', getProperty('tvOpponent.x'));
	setProperty('iconP1.y', getProperty('tvOpponent.y')-15);
	setProperty('iconP2.x', getProperty('tvBf.x'));
	setProperty('iconP2.y',	getProperty('tvBf.y')-15);

end

function onEvent(name,value1,value2)
	if string.lower(name) == "change character" then
		if tonumber(value1) == 1 then
			setProperty('hbFinaleRed.color', getIconColor('dad'))
		end
	end
	if name == 'titlecard' then
		doTweenAlpha('appearalpha', 'titlecard', 1, 1, 'quartOut')
		doTweenY('appeartween', 'titlecard', getProperty('titlecard.y') - getProperty('titlecard.y')/4, 1, 'backOut')
		runTimer('go-away',3)
	end
end

function onTimerCompleted(t,l,ll)
	if t == 'go-away' then
		doTweenAlpha('appearalpha', 'titlecard', 0, 0.75, 'expoIn')
		doTweenY('appeartween', 'titlecard', getProperty('titlecard.y') + getProperty('titlecard.y')/4, 0.75, 'expoIn')

	end

	if t == 'appearalpha' then
	removeLuaSprite('titlecard',true)
	end
end