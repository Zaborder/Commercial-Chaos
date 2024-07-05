function onCreate()

    runTimer('tween', 0.5)
end
function onTimerCompleted(tag)

    if tag == 'tween' then

        noteTweenX('sus', 4, 90, 0.0005)
        noteTweenX('sus2', 5, 205, 0.0005)
        noteTweenX('sus3', 6, 315, 0.0005)
        noteTweenX('sus4', 7, 428, 0.0005)

        noteTweenX('susOp', 0, 730, 0.0005)
        noteTweenX('susOp2', 1, 845, 0.0005)
        noteTweenX('susOp3', 2, 954, 0.0005)
        noteTweenX('susOp4', 3, 1070, 0.0005)

	end
end
