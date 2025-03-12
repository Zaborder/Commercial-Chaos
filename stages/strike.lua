local booba = 1


function onCreate()
	math.randomseed(os.time());
	gfAngle = math.random(-90, 45);

	makeLuaSprite('sky','mcsonic/sky', -620,-850);
	addLuaSprite('sky',false)
	scaleObject('sky',1.5,1.5)

	makeLuaSprite('top3','mcsonic/top3', -620,-850);
	setScrollFactor('top3', 0.9, 0.9);
	addLuaSprite('top3',false)
	
	makeLuaSprite('lightning1','mcsonic/lightning1', -890,-870);
	addLuaSprite('lightning1',false)
	
	
	makeLuaSprite('top2','mcsonic/top2', -620,-850);
	setScrollFactor('top2', 0.8, 0.8);
	addLuaSprite('top2',false)
	
	makeLuaSprite('lightning2','mcsonic/lightning2', -890,-800);
	addLuaSprite('lightning2',false)
	
	makeLuaSprite('top1','mcsonic/top1', -620,-850);
	setScrollFactor('top1', 0.7, 0.7);
	addLuaSprite('top1',false)
	
	makeLuaSprite('lightning3','mcsonic/lightning3', -890,-900);
	addLuaSprite('lightning3',false)

	makeLuaSprite('cloud3','mcsonic/cloud3', -620,-850);
	setScrollFactor('cloud3', 0.6, 0.6);
	addLuaSprite('cloud3',false)
	
	makeLuaSprite('cloud2','mcsonic/cloud2', -620,-850);
	setScrollFactor('cloud2', 0.7, 0.7);
	addLuaSprite('cloud2',false)

	makeLuaSprite('cloud1','mcsonic/cloud1', -620,-850);
	setScrollFactor('cloud1', 0.8, 0.8);
	addLuaSprite('cloud1',false)

	makeLuaSprite('plate','mcsonic/plate', -950,250);
	addLuaSprite('plate',false)

	makeLuaSprite('plate2','mcsonic/plate2', -1000,-700);
	setScrollFactor('plate2', 1.2, 1.2);
	addLuaSprite('plate2',false)
	
	makeLuaSprite('grass','mcsonic/grass', -1000,-700);
	setScrollFactor('grass', 0.8, 0.8);
	addLuaSprite('grass',false)

	setProperty('lightning1.visible',false)
	setProperty('lightning2.visible',false)
	setProperty('lightning3.visible',false)


	--makeLuaSprite('cinema1', '', 0, 600);
        --makeGraphic('cinema1', 3000, 3000, '000000');
        --setObjectCamera('cinema1', 'hud');
        --addLuaSprite('cinema1', false);

        --makeLuaSprite('cinema2', '', 0, -850);
        --makeGraphic('cinema2', 3000, 1000, '000000');
        --setObjectCamera('cinema2', 'hud');
        --addLuaSprite('cinema2', false);

end