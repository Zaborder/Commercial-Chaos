function onCreate()
	makeLuaSprite('white', nil, -1000, -800)
	makeGraphic('white', 3000, 3000, 'FFFFFF')
	setScrollFactor('white', 0.3, 0.3)
	scaleObject('white', 2.5,2.5)
	addLuaSprite('white',false)

	makeLuaSprite('livingroom', 'couch', -1150,-550);
	addLuaSprite('livingroom', false)
	scaleObject('livingroom',4,4)
	setProperty('livingroom.visible', false)

	makeLuaSprite('black', '', -950, -450); 
        makeGraphic('black', 3200, 1600, '000000');
        addLuaSprite('black', true);
	setScrollFactor('black', 0, 0);
	setProperty('black.alpha',1);

	makeAnimatedLuaSprite('couch','couchrun', -1800, 300) 
	addAnimationByPrefix('couch','idle', 'frame', 24)
	objectPlayAnimation('couch','idle', false)
	setProperty('couch.flipX', true)
	addLuaSprite('couch', false)
end
function onSongStart()
	doTweenAlpha('fade', 'black', 0, 10, 'quadIn')
end
function onBeatHit()
	if curBeat == 149 then
		doTweenX('couchright', 'couch', 2000, 10, 'linear') 
	end
	if curBeat == 208 then
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('livingroom.visible', true)
		setProperty('gf.visible', false)
		setProperty('boyfriendGroup.x', 900)
		setProperty('boyfriendGroup.y', -300)
	end
	if curBeat == 404 then
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('livingroom.visible', false)
		setProperty('gf.visible', true)
		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x')-900)
		setProperty('boyfriendGroup.y', getProperty('boyfriendGroup.y')+300)
	end
end