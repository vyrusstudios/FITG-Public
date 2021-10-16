package;

//NOTE: I WAS GONNA ADD THE OLD DIALOGUE USING ALPHABET.HX BUT THIS FUCKIN THING IS SO STUPID AND DOESNT ALLOW LINE BREAKS UREFHUdysvbERIFHVIREWS
//-CyndaquilDAC

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.text.FlxTypeText;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.input.FlxKeyManager;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

using StringTools;

class DialogueBox extends FlxSpriteGroup
{
	var box:FlxSprite;

	var curCharacter:String = '';

	var curAnimation:String = '';

	var curText:String = '';

	var curAudio:String = '';

	var dialogue:Alphabet;
	var dialogueList:Array<String> = [];

	// SECOND DIALOGUE FOR THE PIXEL SHIT INSTEAD???
	var swagDialogue:FlxTypeText;

	var dropText:FlxText;
	var skipText:FlxText;

	public var finishThing:Void->Void;

	var portraitLeft:FlxSprite;
	var portraitRight:FlxSprite;
	var funnychar:FlxSprite;

	var handSelect:FlxSprite;
	var bgFade:FlxSprite;
	var blackFade:FlxSprite;

	public function new(talkingRight:Bool = true, ?dialogueList:Array<String>)
	{
		super();

		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'senpai':
				FlxG.sound.playMusic(Paths.music('Lunchbox'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
			case 'thorns':
				FlxG.sound.playMusic(Paths.music('LunchboxScary'), 0);
				FlxG.sound.music.fadeIn(1, 0, 0.8);
		}

		bgFade = new FlxSprite(0, 0);
		bgFade.frames = Paths.getSparrowAtlas('dialogueBG_Assets', 'shared');
		bgFade.animation.addByPrefix('studios', 'week1', 24, false);
		bgFade.animation.addByPrefix('alley', 'week2', 24, false);
		bgFade.animation.addByPrefix('jail', 'week3', 24, false);
		add(bgFade);

		var hasDialog = false;
		switch (PlayState.SONG.song.toLowerCase())
		{
			case 'gears':
				bgFade.animation.play('studios', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'bittersweet':
				bgFade.animation.play('studios', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'sweet-and-sour':
				bgFade.animation.play('studios', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'boss-fight':
				bgFade.animation.play('studios', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'blocks':
				bgFade.animation.play('studios', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'scraps':
				bgFade.animation.play('alley', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'rhythm':
				bgFade.animation.play('alley', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'awesome':
				bgFade.animation.play('alley', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'j':
				bgFade.animation.play('alley', true);
				box = new FlxSprite(50, 375);
				hasDialog = true;
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'angelic':
				box = new FlxSprite(50, 375);
				hasDialog = true;
				bgFade.animation.play('alley', true);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'odd':
				box = new FlxSprite(50, 375);
				hasDialog = true;
				bgFade.animation.play('studios', true);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
			case 'jail':
				box = new FlxSprite(50, 375);
				hasDialog = true;
				bgFade.animation.play('jail', true);
				box.frames = Paths.getSparrowAtlas('speech_bubble_talking');
				box.animation.addByPrefix('normalOpen', 'Speech Bubble Normal Open', 24, false);
				box.animation.addByPrefix('normal', 'speech bubble normal', 24, true);
				box.antialiasing = true;
		}

		this.dialogueList = dialogueList;
		
		if (!hasDialog)
			return;
		
		portraitLeft = new FlxSprite(-20, 40);
		portraitLeft.frames = Paths.getSparrowAtlas('weeb/senpaiPortrait');
		portraitLeft.animation.addByPrefix('enter', 'Senpai Portrait Enter', 24, false);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.9));
		portraitLeft.updateHitbox();
		portraitLeft.scrollFactor.set();
		add(portraitLeft);
		portraitLeft.visible = false;

		portraitRight = new FlxSprite(0, 40);
		portraitRight.frames = Paths.getSparrowAtlas('weeb/bfPortrait');
		portraitRight.animation.addByPrefix('enter', 'Boyfriend portrait enter', 24, false);
		portraitRight.setGraphicSize(Std.int(portraitRight.width * PlayState.daPixelZoom * 0.9));
		portraitRight.updateHitbox();
		portraitRight.scrollFactor.set();
		add(portraitRight);
		portraitRight.visible = false;

		funnychar = new FlxSprite(0, 0);
		portraitLeft.setGraphicSize(Std.int(portraitLeft.width * PlayState.daPixelZoom * 0.4));
		funnychar.animation.addByPrefix('Angry', 'PortAngry', 24, false);
		funnychar.animation.addByPrefix('Annoyed', 'PortAnnoyed', 24, false);
		funnychar.animation.addByPrefix('Awkward', 'PortAwkward', 24, false);
		funnychar.animation.addByPrefix('Confused', 'PortConfused', 24, false);
		funnychar.animation.addByPrefix('Explaining', 'PortExplaining', 24, false);
		funnychar.animation.addByPrefix('Excited', 'PortExcited', 24, false);
		funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
		funnychar.animation.addByPrefix('Scared', 'PortScared', 24, false);
		funnychar.animation.addByPrefix('Shaded', 'PortShaded', 24, false);
		funnychar.animation.addByPrefix('Surprised', 'PortSurprised', 24, false);
		funnychar.updateHitbox();
		funnychar.scrollFactor.set();
		add(funnychar);
		funnychar.visible = true;
		funnychar.antialiasing = true;

		var blackFade:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('dialogueBlack'));
		blackFade.updateHitbox();
		add(blackFade);

		
		box.animation.play('normalOpen');
		box.x = 50;
		box.y = 305;
		box.setGraphicSize(Std.int(box.width * 0.8));
		box.updateHitbox();
		add(box);

		portraitLeft.screenCenter(X);

		skipText = new FlxText(10, 10, Std.int(FlxG.width * 0.6), "", 32);
		skipText.font = 'Pixel Arial 11 Bold';
		skipText.color = 0x000000;
		skipText.text = 'press backspace or escape to skip';
		add(skipText);

		handSelect = new FlxSprite(FlxG.width * 0.9, FlxG.height * 0.9).loadGraphic(Paths.image('weeb/pixelUI/hand_textbox'));


		if (!talkingRight)
		{
			// box.flipX = true;
		}

		dropText = new FlxText(242, 502, Std.int(FlxG.width * 0.6), "", 32);
		dropText.font = 'Pixel Arial 11 Bold';
		dropText.color = 0xFF000000;
		add(dropText);

		swagDialogue = new FlxTypeText(240, 500, Std.int(FlxG.width * 0.6), "", 32);
		swagDialogue.font = 'Pixel Arial 11 Bold';
		swagDialogue.color = 0xFFFFEFF0;
		add(swagDialogue);

		dialogue = new Alphabet(0, 80, "", false, true);
		// dialogue.x = 90;
		// add(dialogue);
	}

	var dialogueOpened:Bool = false;
	var dialogueStarted:Bool = false;

	override function update(elapsed:Float)
	{
		// HARD CODING CUZ IM STUPDI
		if (PlayState.SONG.song.toLowerCase() == 'roses')
			portraitLeft.visible = false;
		if (PlayState.SONG.song.toLowerCase() == 'thorns')
		{
			portraitLeft.color = FlxColor.BLACK;
			swagDialogue.color = FlxColor.WHITE;
			dropText.color = FlxColor.BLACK;
		}

		dropText.text = swagDialogue.text;

		if (box.animation.curAnim != null)
		{
			if (box.animation.curAnim.name == 'normalOpen' && box.animation.curAnim.finished)
			{
				box.animation.play('normal');
				dialogueOpened = true;
			}
		}

		if (dialogueOpened && !dialogueStarted)
		{
			startDialogue();
			dialogueStarted = true;
		}

		if (PlayerSettings.player1.controls.BACK && isEnding != true)
			{
				remove(dialogue);
				isEnding = true;
				FlxG.sound.music.fadeOut(0.1, 0);
				new FlxTimer().start(0.2, function(tmr:FlxTimer)
				{
					box.alpha -= 1 / 5;
					bgFade.alpha -= 1 / 5 * 0.7;
//					blackFade.visible = false;
					funnychar.visible = false;
					swagDialogue.alpha -= 1 / 5;
					dropText.alpha = swagDialogue.alpha;
				}, 5);
	
				new FlxTimer().start(1.2, function(tmr:FlxTimer)
				{
					finishThing();
					kill();
				});
			}
	
		
		if (FlxG.keys.justPressed.ANY  && dialogueStarted == true)
		{
			remove(dialogue);

			FlxG.sound.play(Paths.sound('clickText'), 0.8);

			new FlxTimer().start(0.01, function(tmr:FlxTimer)
				{
					funnychar.alpha += 1 / 5;
				}, 5);


//			FlxG.sound.pause(Paths.sound(curAudio));

			
			//new FlxTimer().start(0.3, function(tmr:FlxTimer)
				//{
					//FlxG.sound.play(Paths.sound(curAudio));
				//}, 1);

			if (dialogueList[1] == null && dialogueList[0] != null)
			{
				if (!isEnding)
				{
					isEnding = true;

					if (PlayState.SONG.song.toLowerCase() == 'senpai' || PlayState.SONG.song.toLowerCase() == 'thorns')
						FlxG.sound.music.fadeOut(2.2, 0);

					new FlxTimer().start(0.2, function(tmr:FlxTimer)
					{
						box.alpha -= 1 / 5;
						bgFade.alpha -= 1 / 5 * 0.7;
//						blackFade.visible = false;
						funnychar.visible = false;
						swagDialogue.alpha -= 1 / 5;
						dropText.alpha = swagDialogue.alpha;
					}, 5);

					new FlxTimer().start(1.2, function(tmr:FlxTimer)
					{
						finishThing();
						kill();
					});
				}
			}
			else
			{
				dialogueList.remove(dialogueList[0]);
				startDialogue();
			}
		}
		
		super.update(elapsed);
	}

	var isEnding:Bool = false;
	var hasPlayedVa:Bool = false;

	function startDialogue():Void
	{
		cleanDialog();
		// var theDialog:Alphabet = new Alphabet(0, 70, dialogueList[0], false, true);
		// dialogue = theDialog;
		// add(theDialog);

		// swagDialogue.text = ;
		swagDialogue.resetText(dialogueList[0]);
		swagDialogue.start(0.04, true);

	switch (curCharacter)
	{
		case 'bf':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/BF_Portraits');
			funnychar.animation.addByPrefix('Angry', 'PortAngry', 24, false);
			funnychar.animation.addByPrefix('Awkward', 'PortAwkward', 24, false);
			funnychar.animation.addByPrefix('Confused', 'PortConfused', 24, false);
			funnychar.animation.addByPrefix('Explaining', 'PortExplaining', 24, false);
			funnychar.animation.addByPrefix('Excited', 'PortExcited', 24, false);
			funnychar.animation.addByPrefix('Scared', 'PortScared', 24, false);
			funnychar.animation.addByPrefix('Shaded', 'PortShaded', 24, false);
			funnychar.animation.addByPrefix('Surprised', 'PortSurprised', 24, false);
			funnychar.x = 600;
			funnychar.y = 0;
			funnychar.setGraphicSize(Std.int(funnychar.width * 0.7));
		case 'gf':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/GF_Portraits');
			funnychar.animation.addByPrefix('Angry', 'PortAngry', 24, false);
			funnychar.animation.addByPrefix('Annoyed', 'PortAnnoyed', 24, false);
			funnychar.animation.addByPrefix('Awkward', 'PortAwkward', 24, false);
			funnychar.animation.addByPrefix('Confused', 'PortConfused', 24, false);
			funnychar.animation.addByPrefix('Explaining', 'PortExplaining', 24, false);
			funnychar.animation.addByPrefix('Excited', 'PortExcited', 24, false);
			funnychar.animation.addByPrefix('Scared', 'PortScared', 24, false);
			funnychar.animation.addByPrefix('Surprised', 'PortSurprised', 24, false);
			funnychar.x = 250;
			funnychar.y = 0;
			funnychar.setGraphicSize(Std.int(funnychar.width * 1));
		case 'aaron':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Aaron_Portraits');
			funnychar.animation.addByPrefix('Excited', 'PortExcited', 24, false);
			funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
			funnychar.animation.addByPrefix('Scraps', 'PortScraps', 24, false);
			funnychar.x = -100;
			funnychar.y = -170;
			funnychar.y = 0;
			funnychar.setGraphicSize(Std.int(funnychar.width * 0.7));
		case 'charlie':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Charlie_Portraits');
			funnychar.animation.addByPrefix('Angry', 'PortAngry', 24, false);
			funnychar.animation.addByPrefix('Bijuu', 'PortBijo', 24, false);
			funnychar.animation.addByPrefix('Considering', 'PortConsidering', 24, false);
			funnychar.animation.addByPrefix('Flustered', 'PortFlustered', 24, false);
			funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
			funnychar.animation.addByPrefix('Shaded', 'PortShaded', 24, false);
			funnychar.animation.addByPrefix('Shouting', 'PortShouting', 24, false);
			funnychar.animation.addByPrefix('Smug', 'PortSmug', 24, false);
			funnychar.animation.addByPrefix('Surprised', 'PortSurprised', 24, false);
			funnychar.animation.addByPrefix('Threatening', 'PortThreatening', 24, false);
			funnychar.animation.addByPrefix('Tired', 'PortTired', 24, false);
			funnychar.x = -100;
			funnychar.y = 0;
			funnychar.setGraphicSize(Std.int(funnychar.width * 1));
		case 'sky':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Sky_Portraits');
			funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
			funnychar.x = 700;
			funnychar.y = 100;
			funnychar.setGraphicSize(Std.int(funnychar.width * 1));
		case 'nard':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Nard_Portraits');
			funnychar.animation.addByPrefix('Amused', 'PortAmused', 24, false);
			funnychar.animation.addByPrefix('Annoyed', 'PortAnnoyed', 24, false);
			funnychar.animation.addByPrefix('Considering', 'PortConsidering', 24, false);
			funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
			funnychar.animation.addByPrefix('Smug', 'PortSmug', 24, false);
			funnychar.animation.addByPrefix('Surprised', 'PortSurprised', 24, false);
			funnychar.x = -100;
			funnychar.y = -100;
			funnychar.setGraphicSize(Std.int(funnychar.width * 0.7));
		case 'seven':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Seven_Portraits');
			funnychar.animation.addByPrefix('Apologetic', 'PortApologetic', 24, false);
			funnychar.animation.addByPrefix('Condescending', 'PortCondescending', 24, false);
			funnychar.animation.addByPrefix('Excited', 'PortExcited', 24, false);
			funnychar.animation.addByPrefix('Explaining', 'PortExplaining', 24, false);
			funnychar.animation.addByPrefix('Pain', 'PortPain', 24, true);
			funnychar.animation.addByPrefix('Shaded', 'PortShaded', 24, false);
			funnychar.animation.addByPrefix('Threatening', 'PortThreatening', 24, false);
			funnychar.x = -100;
			funnychar.y = -100;
			funnychar.setGraphicSize(Std.int(funnychar.width * 0.7));
		case 'nathan':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Nathan_Portraits');
			funnychar.animation.addByPrefix('Amused', 'PortAmused', 24, false);
			funnychar.animation.addByPrefix('Angel', 'PortAngel', 24, true);
			funnychar.animation.addByPrefix('Confused', 'PortConfused', 24, false);
			funnychar.animation.addByPrefix('Explaining', 'PortExplaining', 24, false);
			funnychar.animation.addByPrefix('Frustrated', 'PortFrustrated', 24, false);
			funnychar.animation.addByPrefix('Annoyed', 'PortFrustrated', 24, false);
			funnychar.animation.addByPrefix('Scared', 'PortScared', 24, true);
			funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
			funnychar.animation.addByPrefix('Pointing', 'PortPointing', 24, false);
			funnychar.animation.addByPrefix('Shaded', 'PortShaded', 24, false);
			funnychar.animation.addByPrefix('Whispering', 'PortWhispering', 24, false);
			funnychar.animation.addByPrefix('Worried', 'PortWorried', 24, false);
			funnychar.x = -100;
			funnychar.y = -100;
			funnychar.setGraphicSize(Std.int(funnychar.width * 0.75));
		case 'en':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/En_Portraits');
			funnychar.animation.addByPrefix('Awkward', 'PortAwkward', 24, false);
			funnychar.animation.addByPrefix('Threatening', 'PortThreatening', 24, false);
			funnychar.animation.addByPrefix('Condescending', 'PortCondescending', 24, false);
			funnychar.animation.addByPrefix('Confused', 'PortConfused', 24, false);
			funnychar.animation.addByPrefix('Considering', 'PortConsidering', 24, false);
			funnychar.animation.addByPrefix('Reaching Out', 'PortReachingOut', 24, false);
			funnychar.animation.addByPrefix('Worried', 'PortWorried', 24, false);
			funnychar.x = -100;
			funnychar.y = 0;
			funnychar.setGraphicSize(Std.int(funnychar.width * 0.8));
		case 'nova':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Nova_Portraits');
			funnychar.animation.addByPrefix('Angry', 'PortAngry', 24, false);
			funnychar.animation.addByPrefix('Annoyed', 'PortAnnoyed', 24, false);
			funnychar.animation.addByPrefix('Apologetic', 'PortApologetic', 24, false);
			funnychar.animation.addByPrefix('Ashamed', 'PortAshamed', 24, false);
			funnychar.animation.addByPrefix('Condescending', 'PortCondescending', 24, false);
			funnychar.animation.addByPrefix('Explaining', 'PortExplaining', 24, false);
			funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
			funnychar.animation.addByPrefix('Pleased', 'PortPleased', 24, false);
			funnychar.animation.addByPrefix('Pointing', 'PortPointing', 24, false);
			funnychar.animation.addByPrefix('Smug', 'PortSmug', 24, false);
			funnychar.animation.addByPrefix('Surprised', 'PortSurprised', 24, false);
			funnychar.x = -100;
			funnychar.y = 0;
			funnychar.setGraphicSize(Std.int(funnychar.width * 1));
		case 'blockguy':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/BG_Portraits');
			funnychar.animation.addByPrefix('Idle', 'PortIdle', 24, false);
			funnychar.animation.addByPrefix('Kamil', 'PortRabbitdud', 24, false);
			funnychar.x = -100;
			funnychar.y = 0;
			funnychar.setGraphicSize(Std.int(funnychar.width * 1));
		case 'none':
			funnychar.frames = Paths.getSparrowAtlas('Portraits/Mr_Incredible_Portraits');
	}

	switch (curAnimation)
	{
		case 'excited':
			funnychar.animation.play('Excited');
		case 'explaining':
			funnychar.animation.play('Explaining');
		case 'angry':
			funnychar.animation.play('Angry');
		case 'awkward':
			funnychar.animation.play('Awkward');
		case 'annoyed':
			funnychar.animation.play('Annoyed');
		case 'shaded':
			funnychar.animation.play('Shaded');
		case 'scared':
			funnychar.animation.play('Scared');
		case 'surprised':
			funnychar.animation.play('Surprised');
		case 'confused':
			funnychar.animation.play('Confused');
		case 'idle':
			funnychar.animation.play('Idle');
		case 'bijuu':
			funnychar.animation.play('Bijuu');
		case 'flustered':
			funnychar.animation.play('Flustered');
		case 'considering':
			funnychar.animation.play('Considering');
		case 'shouting':
			funnychar.animation.play('Shouting');
		case 'smug':
			funnychar.animation.play('Smug');
		case 'pointing':
			funnychar.animation.play('Pointing');
		case 'reaching out':
			funnychar.animation.play('Reaching Out');
		case 'tired':
			funnychar.animation.play('Tired');
		case 'threatening':
			funnychar.animation.play('Threatening');
		case 'condescending':
			funnychar.animation.play('Condescending');
		case 'worried':
			funnychar.animation.play('Worried');
		case 'apologetic':
			funnychar.animation.play('Apologetic');
		case 'ashamed':
			funnychar.animation.play('Ashamed');
		case 'pleased':
			funnychar.animation.play('Pleased');
		case 'amused':
			funnychar.animation.play('Amused');
		case 'angel':
			funnychar.animation.play('Angel');
		case 'scraps':
			funnychar.animation.play('Scraps');
		case 'kamil':
			funnychar.animation.play('Kamil');
		case 'pain':
			funnychar.animation.play('Pain');
		case 'introducing':
			funnychar.animation.play('Introducing');
		case 'frustrated':
			funnychar.animation.play('Frustrated');
		case 'pointing':
			funnychar.animation.play('Pointing');
		case 'whispering':
			funnychar.animation.play('Whispering');
	}


	}
	function cleanDialog():Void
	{
		var splitName:Array<String> = dialogueList[0].split(":");
		curCharacter = splitName[1];
		curAnimation = splitName[2];
		curAudio = splitName[3];
		curText = splitName[4];
		dialogueList[0] = dialogueList[0].substr(splitName[1].length + splitName[2].length + splitName[3].length  + 4).trim();
	}
}
