function onCreatePost()
	precacheImage('character/icm-first-person')
end
function onBeatHit()
	if curBeat == 32 then
		setProperty('lights1.visible', false)
		setProperty('lights2.visible', false)
		setProperty('lights3.visible', false)
		triggerEvent('Change Character', 'dad', 'icm-pov')
		setProperty('boyfriendGroup.visible', false)
		setProperty('defaultCamZoom',0.75)
		cameraFlash('Hud', '000000', 1,false)
	end

end