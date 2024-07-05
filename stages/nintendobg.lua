function onCreate()
	-- background shit
	
	
	makeLuaSprite('sky', '', -800, -400); 
	makeGraphic('sky', 4000, 1200, '42bfff');
	addLuaSprite('sky', false);

	makeLuaSprite('tree', 'undefeatable/dogtree', -400, -300)
	addLuaSprite('tree', false)
	setScrollFactor('tree', 0.9, 0.9);

	makeLuaSprite('bush', 'undefeatable/dogbush', 1100, 450)
	addLuaSprite('bush', false)
	setScrollFactor('bush', 0.9, 0.9);

	makeLuaSprite('grass', 'undefeatable/doggrass', -700, 600)
	addLuaSprite('grass', false)
	
	setObjectOrder('dadGroup', 2)
	
	makeLuaSprite('tvbg', 'undefeatable/static', -1000, -300)
	scaleObject('tvbg',2,2)
	addLuaSprite('tvbg', false)
	
	makeAnimatedLuaSprite('dogintro','undefeatable/dog-intro', -200, 800) --50
	addAnimationByPrefix('dogintro','idle', 'intro0000', 24)
	addAnimationByPrefix('dogintro','talking', 'intro', 24)
	playAnim('dogintro', 'idle')
	addLuaSprite('dogintro', true)
	setScrollFactor('dogintro', 0, 0);

	
	--setScrollFactor('boyfriendGroup', 1.1, 1.1)
	
	
end
function onUpdate()
	--doTweenY(dadTweenY, 'dad', -400-80*math.sin((currentBeat*0.25)*math.pi),0.001)	
	
	
end
local nm = true
function onUpdatePost()
	
	
	setProperty('gf.visible', false)
	if nm == true then
	if mustHitSection == false then
		setProperty('defaultCamZoom',0.65)
		doTweenY('bfsx','boyfriendGroup.scale', 1.4, 0.1, 'sineInOut')
		doTweenX('bfsy','boyfriendGroup.scale', 1.4, 0.1, 'sineInOut')
	else
		setProperty('defaultCamZoom',0.55)
		doTweenY('bfsx','boyfriendGroup.scale', 1, 0.1, 'sineInOut')
		doTweenX('bfsy','boyfriendGroup.scale', 1, 0.1, 'sineInOut')
	end
	end
end
function onBeatHit()
	if curBeat == 256 then
		doTweenAlpha('dad','dad', 0, 1, 'sineInOut')
	end
	if curBeat == 267 then
		doTweenY('dogup','dogintro', 0, 1, 'sineInOut')
	end
	if curBeat == 267 then --dog talk
		playAnim('dogintro', 'talking')
	end
	if curBeat == 277 then --dog go down
		doTweenY('dogup','dogintro', 800, 0.25, 'sineInOut')
	end
	if curBeat == 283 then --dog go up on bg
		removeLuaSprite('dogintro')
		doTweenAlpha('dad','dad', 1, 0.01, 'sineInOut')
	end

end