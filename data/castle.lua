function onCreatePost()
	precacheImage('castlebg')
	precacheImage('candlelight1')
	precacheImage('candlelight2')
	precacheImage('glow')

	makeLuaSprite('castle', 'castlebg', -600, -700);
	addLuaSprite('castle', false);

	makeLuaSprite('candle1', 'candlelight1', 1400, -375);
	addLuaSprite('candle1', false);

	makeLuaSprite('glow', 'castlelight', -600, -400);
	addLuaSprite('glow', true);

	makeLuaSprite('candle2', 'candlelight2', -800, 175);
	addLuaSprite('candle2', true);
	setScrollFactor('candle2', 1.2, 1.1)	

		setProperty('castle.visible', false)
		setProperty('candle1.visible', false)
		setProperty('candle2.visible', false)
		setProperty('glow.visible', false)
end
function onBeatHit()
	if curBeat == 5	then
		setProperty('boyfriendGroup.x', 900)
		triggerEvent('Change Character', 'dad', 'chad-cc')
		setProperty('castle.visible', true)
		setProperty('candle1.visible', true)
		setProperty('candle2.visible', true)
		setProperty('glow.visible', true)
		setProperty('defaultCamZoom',0.7)
		cameraFlash('Hud', 'A020F0', 1,false)
	end
end