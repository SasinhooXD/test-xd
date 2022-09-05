function onUpdate()
	if not high then
    noteTweenX('defaultPlayerStrumY0', 4, ((screenWidth / 3) - 330) - 0, 0.5)
    noteTweenX('defaultPlayerStrumY1', 5, ((screenWidth / 3) - 220) - 0, 0.5)
    noteTweenX('defaultPlayerStrumY2', 6, ((screenWidth / 3) - 110) - 0, 0.5)
    noteTweenX('defaultPlayerStrumY3', 7, ((screenWidth / 3) + 0) - 0, 0.5)
    noteTweenX('defaultFPlayerStrumY0', 0, ((screenWidth / 3 * 2) - 0) - 100, 0.5)
    noteTweenX('defaultFPlayerStrumY1', 1, ((screenWidth / 3 * 2) + 110) - 100, 0.5)
    noteTweenX('defaultFPlayerStrumY2', 2, ((screenWidth / 3 * 2) + 220) - 100, 0.5)
    noteTweenX('defaultFPlayerStrumY3', 3, ((screenWidth / 3 * 2) + 330) - 100, 0.5)
	end
end

function onStepHit()

	if curStep == 896 then
        noteTweenAlpha("NoteAlpha0", 0, 0.3, 0.3, backOut)
		noteTweenAlpha("NoteAlpha1", 1, 0.3, 0.3, backOut)
		noteTweenAlpha("NoteAlpha2", 2, 0.3, 0.3, backOut)
		noteTweenAlpha("NoteAlpha3", 3, 0.3, 0.3, backOut)
		noteTweenAlpha("NoteAlpha4", 4, 0.3, 0.3, backOut)
		noteTweenAlpha("NoteAlpha5", 5, 0.3, 0.3, backOut)
		noteTweenAlpha("NoteAlpha6", 6, 0.3, 0.3, backOut)
		noteTweenAlpha("NoteAlpha7", 7, 0.3, 0.3, backOut)
	end
end

function onBeatHit()
if curBeat == 252 then
	noteTweenAlpha("NoteAlpha0", 0, 1, 0.3, backOut)
	noteTweenAlpha("NoteAlpha1", 1, 1, 0.3, backOut)
	noteTweenAlpha("NoteAlpha2", 2, 1, 0.3, backOut)
	noteTweenAlpha("NoteAlpha3", 3, 1, 0.3, backOut)
	noteTweenAlpha("NoteAlpha4", 4, 1, 0.3, backOut)
	noteTweenAlpha("NoteAlpha5", 5, 1, 0.3, backOut)
	noteTweenAlpha("NoteAlpha6", 6, 1, 0.3, backOut)
	noteTweenAlpha("NoteAlpha7", 7, 1, 0.3, backOut)
	end
end

function onUpdatePost(elapsed)
	high = curStep > drugone and curStep < drugoneend or curStep > drugtwo and curStep < drugtwoend
	songPos = getSongPosition() / 300
	P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
	P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
	setProperty('iconP1.x',P1Mult - 110)
	setProperty('iconP1.origin.x',240)
	setProperty('iconP1.flipX',true)
	setProperty('iconP2.x',P2Mult + 110)
	setProperty('iconP2.origin.x',-100)
	setProperty('iconP2.flipX',false)
	setProperty('healthBar.flipX',true)
end

function onCreatePost()
	drugone = 512
	drugoneend = 640
	drugtwo = 1216
	drugtwoend = 1488
end

--easy script configs
IntroTextSize = 45	--Size of the text for the Now Playing thing.
IntroSubTextSize = 35 --size of the text for the Song Name.
IntroTagColor = 'FFFF00'	--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
--easy script configs
--actual script
function onCreate()
	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', 'empty', -405-IntroTagWidth, 15+ 200)
	makeGraphic('JukeBoxTag', 400+IntroTagWidth, 150, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', -405-IntroTagWidth, 15+ 200)
	makeGraphic('JukeBox', 400, 150, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 400, -405-IntroTagWidth, 30+ 200)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', "snas", 400, -405-IntroTagWidth, 80+ 200)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize - 8)
	addLuaText('JukeBoxSubText')
	makeLuaText('more', "Composed by: Sic", 400, -405-IntroTagWidth, 125+ 200)
	setTextAlignment('more', 'left')
	setObjectCamera('more', 'other')
	setTextSize('more', IntroSubTextSize)
	addLuaText('more')
end

--motion functions
function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
	doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
	doTweenX('MoveInThree', 'JukeBoxText', 0, 1, 'CircInOut')
	doTweenX('MoveInFour', 'JukeBoxSubText', 0, 1, 'CircInOut')
	doTweenX('MoveInFui', 'more', 0, 1, 'CircInOut')
	
	runTimer('JukeBoxWait', 1.5, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFoasdur', 'more', -450, 1.5, 'CircInOut')
	end
end