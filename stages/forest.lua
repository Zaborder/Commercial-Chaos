function onCreate()
	makeLuaSprite('bg', 'forest/bg', -1325,-1325);
	addLuaSprite('bg', false);

	makeLuaSprite('moon', 'forest/moon', -1325,-1325);
	addLuaSprite('moon', false);
	
	makeLuaSprite('trees', 'forest/treebg', -1325,-1325);
	addLuaSprite('trees', false);
	
	makeLuaSprite('ground', 'forest/ground', -1325,-1325);
	addLuaSprite('ground', false);
	
	makeLuaSprite('fog1', 'forest/fog1', -1325,-1325);
	addLuaSprite('fog1', false);
	
	makeLuaSprite('tree', 'forest/tree', -1325,-1325);
	addLuaSprite('tree', false);
	
	makeLuaSprite('fog2', 'forest/fog2', -1325,-1325);
	addLuaSprite('fog2', false);
	
	makeLuaSprite('fog3', 'forest/fog3', -1325,-1325);
	addLuaSprite('fog3', true);
	
	setScrollFactor('fog1', 1.2, 1.3);
	setScrollFactor('fog2', 1.1, 1.1);
	setScrollFactor('fog3', 0.9, 0.8);

	--bg, moon, trees, ground, fog1, tree, fog2, fog3
end
