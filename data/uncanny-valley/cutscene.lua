function onBeatHit()
	if curBeat == 355 then
		makeVideoSprite("myCutscene", "lyrics", 0, 0, "other", false);
		setProperty("myCutscene.alpha", 1);
	end
end