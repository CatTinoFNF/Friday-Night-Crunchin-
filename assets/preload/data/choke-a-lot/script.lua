local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		runTimer('blackscreengone', 1);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
		doTweenAlpha('blackfade1', 'black', 0, 1.5, 'circInOut')
	end
end

function onUpdate()
	if seenCutscene then
		doTweenAlpha('blackfade1', 'black', 0, 0.1, 'circInOut')
	end
end
-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)

end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onCreate()
	makeLuaSprite('black', 'black', 0, 0)
    scaleObject('black', 10, 10)
    setScrollFactor('black', 0,0);
	setObjectCamera('black', 'hud')
    addLuaSprite('black', true)
	runTimer('blackscreengone', 1);
	if not isStoryMode == true then
		doTweenAlpha('blackfade1', 'black', 0, 0.1, 'circInOut')
	end
end

function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('week2tease');
		allowEnd = true;
return Function_Stop;
end
return Function_Continue;
end