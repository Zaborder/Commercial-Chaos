function onCreatePost()
	makeLuaText('subtitles', '', 0, 0, 0)
	setTextAlignment('subtitles', 'center')
	setTextSize('subtitles', 25)
	setTextFont('subtitles', 'vcr.ttf')
	setTextWidth('subtitles', 500)
	screenCenter('subtitles', 'x')
	addLuaText('subtitles')
	if downscroll then
		setProperty('subtitles.y', getProperty('scoreTxt.y')+35)
	else
		setProperty('subtitles.y', getProperty('healthBar.y')-110)
    end
end
function onEvent(name, v1, v2)
	if name == 'subtitles' then
		setTextString('subtitles', (v1));
		if value2 == '' then
			setTextColor('lyrics', 'FFFFFF')
		else
			setTextColor('lyrics', (v2))
		end
	end
end