function onUpdate()
	--setProperty('sky.y', getProperty('sky.y') + 3 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
end
function onPostUpdate()
	setProperty('sky.y', getProperty('sky.y') + 3 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
	
	--setProperty('grass.y', getProperty('grass.y') + 8 * math.sin(curDecBeat / 4 * math.pi) * elapsed * 60)
end