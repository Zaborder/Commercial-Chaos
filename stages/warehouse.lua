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

end

function onBeatHit()
	if curBeat == 112 then --324
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('livingroom.visible', true)
		setProperty('gf.visible', false)
		setProperty('boyfriendGroup.x', 900)
		setProperty('boyfriendGroup.y', -300)
	end
end