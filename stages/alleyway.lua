function onCreate()

	makeLuaSprite('sky','alleyway/sky',-1400, -600);
	addLuaSprite('sky', false);
	scaleObject('sky',1.5,1.5)

	makeLuaSprite('bghouse2','alleyway/bghouse2', 1100, -350);
	addLuaSprite('bghouse2', false);

	makeLuaSprite('line','alleyway/line', 500, -500);
	addLuaSprite('line', false);

	makeLuaSprite('bghouse','alleyway/bghouse', 700, -400);
	addLuaSprite('bghouse', false);


	makeLuaSprite('line2','alleyway/line2', 200, -300);
	addLuaSprite('line2', false);

	makeLuaSprite('tree2','alleyway/tree2', 200, -800);
	addLuaSprite('tree2', false);
	setProperty('tree2.color', 0x050505)

	makeLuaSprite('tree','alleyway/tree1',-800, -800);
	addLuaSprite('tree', false);
	setProperty('tree.color', 0x050605)

	makeLuaSprite('backwall','alleyway/backwall', 300, 20);
	addLuaSprite('backwall', false);

	makeLuaSprite('backfloor','alleyway/backfloor', 500, 370);
	addLuaSprite('backfloor', false);

	makeLuaSprite('building','alleyway/building',-1200, -400);
	addLuaSprite('building', false);

	makeLuaSprite('wall','alleyway/wall',-1200, -30);
	addLuaSprite('wall', false);

	makeLuaSprite('floor','alleyway/floor',-1200, 450);
	addLuaSprite('floor', false);
	
	makeLuaSprite('pole','alleyway/pole',-800, -600);
	addLuaSprite('pole', false);

	makeLuaSprite('light','alleyway/light',-800, -600);
	addLuaSprite('light', true);

	makeLuaSprite('vignette', 'vignette',0,0)
	--setProperty('vignette.alpha',0)
	addLuaSprite('vignette', true)
	setScrollFactor('vignette', 0, 0);
	scaleObject('vignette', 2,2)
	screenCenter('vignette')

	setScrollFactor('backwall', 0.85, 1)
	setScrollFactor('line', 0.85, 0.9)
	setScrollFactor('line2', 0.85, 0.9)
	setScrollFactor('bghouse', 0.93, 0.95)
	setScrollFactor('bghouse2', 0.93, 0.95)
	setScrollFactor('building', 0.85, 0.86)
	setScrollFactor('tree1', 0.85, 0.89)
	setScrollFactor('tree2', 0.87, 0.96)

	setScrollFactor('pole', 0.75, 0.75)
end