function onCreate()
	makeLuaSprite('wall', 'amigo/wall',-800, -400);
	addLuaSprite('wall', false);

	makeLuaSprite('floor', 'amigo/floor', -600, 700);
	addLuaSprite('floor', false)

	makeLuaSprite('wallstuff', 'amigo/wallstuff', 100, -300);
	addLuaSprite('wallstuff', false);

	makeLuaSprite('sitting', 'amigo/sitting', 800, 450);
	addLuaSprite('sitting', false);
	
	makeLuaSprite('crack', 'amigo/crack', -500, -300);
	addLuaSprite('crack', false);

	makeLuaSprite('flower', 'amigo/flower', -400, -100);
	addLuaSprite('flower', true);
	setScrollFactor('flower',0.8,0.8)
	
	scaleObject('floor',0.6,0.6)
	scaleObject('wall',1.2,0.8)
	scaleObject('wallstuff',0.6,0.6)
	scaleObject('sitting',0.6,0.6)
	scaleObject('crack',0.6,0.6)
	scaleObject('flower',0.6,0.6)
end

function onUpdate()
	setProperty('gf.visible', false)
end
