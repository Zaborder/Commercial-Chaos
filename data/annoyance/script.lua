
local hitnum = 0
function onCreate()
	makeLuaSprite('livingroom', 'couch', -850,-350);
	addLuaSprite('livingroom', false)
	scaleObject('livingroom',3.5,3.5)
	setProperty('livingroom.visible', false)
	
	makeLuaSprite('livingroom2', 'couch2', -350,-400);
	addLuaSprite('livingroom2', false)
	setProperty('livingroom2.visible', false)

	makeLuaSprite('store', 'store', -10000,-350);
	addLuaSprite('store', false)
	scaleObject('store',1.5,1.5)

	makeLuaSprite('black', '', -950, -450); 
	makeGraphic('black', 3200, 1600, '000000');
    	addLuaSprite('black', true);
	setScrollFactor('black', 0, 0);
	setProperty('black.alpha',1);

	makeAnimatedLuaSprite('couch','couchrun', -1800, 300) 
	addAnimationByPrefix('couch','idle', 'frame', 24)
	addLuaSprite('couch', false)
	
	makeAnimatedLuaSprite('fwhero','fw_superhero', 0, 0) 
	addAnimationByPrefix('fwhero','idle', 'idle0000', 24)
	addAnimationByPrefix('fwhero','turn', 'turn', 24)
	addAnimationByPrefix('fwhero','idle2', 'idle2', 24)
	objectPlayAnimation('fwhero','idle', false)
	addLuaSprite('fwhero', false)
	
end
function onSongStart()
	doTweenAlpha('fade', 'black', 0, 10, 'quadIn')
	setObjectOrder('boyfriendGroup', 10)
end
local gfmove = false
function onBeatHit()
	objectPlayAnimation('couch','idle', false)

	if curBeat == 470 then
		doTweenX('run moneez', 'dad', -3000, 2, 'linear')
		setProperty('couch.y', 155)
		scaleObject('couch', 2,2)
		setProperty('couch.flipX', true)
		setObjectOrder('couch', 9)
      	setProperty("defaultCamZoom",0.6) 
	end
	if curBeat == 471 then
		cameraSetTarget("boyfriend")
		doTweenX('couchleft', 'couch', getProperty('boyfriendGroup.x')-2100, 1, 'expoOut') 
		gfmove = true
	end
	if curBeat == 540 then --540 i know
		doTweenX('coucho', 'couch', getProperty('couch.x')+500, 1, 'quadOut') 
		doTweenX('storeappear', 'store', -4000, 2, 'quadOut') 
		gfmove = false
	end
	if curBeat == 548 then
		objectPlayAnimation('fwhero','turn', false)
	end
	if curBeat == 552 then --552 no
		doTweenX('storeaway', 'store', 3000, 2, 'linear') 
		doTweenX('couchappear2', 'couch', getProperty('couch.x')-500, 1, 'quadOut') 
		gfmove = true
	end
	
	if curBeat == 683 then
		doTweenX('couchclose', 'couch', getProperty('couch.x')-1300, 9, 'linear' )
		doTweenZoom('campanzoom','camGame',1,9,'quadOut')
	end



	---------
	if curBeat == 149 then
		doTweenX('couchright', 'couch', 2000, 10, 'linear') 
	end

	if curBeat == 208 then
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('livingroom.visible', true)
		setProperty('gf.visible', false)
		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x')+75)
		setProperty('boyfriendGroup.y', getProperty('boyfriendGroup.y')-300)

	end
	if curBeat == 340 then
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('livingroom.visible', false)
		setProperty('livingroom2.visible', true)
	end
	if curBeat == 404 then
      	setProperty("defaultCamZoom",0.9) 
		cameraFlash('Hud', 'FFFFFF', 1,false)
		setProperty('livingroom2.visible', false)
		setProperty('gf.visible', true)
		setProperty('boyfriendGroup.x', getProperty('boyfriendGroup.x')-75)
		setProperty('boyfriendGroup.y', getProperty('boyfriendGroup.y')+300)
	end
end
local follow = false
function onTweenCompleted(t,l,ll)
	if t == 'couchleft' then
		doTweenY('bfjump', 'boyfriendGroup', getProperty('boyfriendGroup.y')-200, 0.5, 'backOut')
	
	end
	if t == 'bfjump' then
		doTweenX('couchmoreleft', 'couch', -3700, 2, 'quadOut')
		follow = true
	end

end
function onUpdate()
	setProperty('fwhero.x', getProperty('store.x')+400)
	setProperty('fwhero.y', getProperty('store.y')+400)
	
	if curBeat >= 340 and curBeat <= 404 then
	    triggerEvent('Camera Follow Pos',850,500)
      	setProperty("defaultCamZoom",0.8) 
	end
	
	if follow == true then
		setProperty('boyfriendGroup.x', getProperty('couch.x')+2050)
	end

	if gfmove == true then
		setProperty('gf.x', getProperty('gf.x') + 25)
		if getProperty('gf.x') >= 1500 then
			setProperty('gf.x', -10000)
		end
	end
end

function onEvent(name, v1, v2)
	if name == 'subtitles' then
		setTextFont('subtitles', 'Rockwell-Bold.ttf')
	end
end
