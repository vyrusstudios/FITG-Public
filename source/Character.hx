package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';
	public var doesCamshake:Bool = false;
	public var hasProjector:Bool = false;

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		antialiasing = true;

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-night':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets_Night');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);
	
				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);
	
				addOffset('scared', -2, -17);
	
				playAnim('danceRight');

			case 'gf-morning':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets_Morning');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);
	
				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);
		
				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);
		
				addOffset('scared', -2, -17);
		
				playAnim('danceRight');
	
			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -2);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');
				
			case 'gf-none':
				tex = Paths.getSparrowAtlas('characters/gfNone');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'GF Dancing Beat', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0, -400);
				addOffset('danceRight', 0, -400);

				playAnim('danceRight');
				
			case 'gf-and-her-gfs':
				tex = Paths.getSparrowAtlas('characters/GF_And_Her_GFS_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'GF Dancing Beat', [0], "", 24, false);
				animation.addByPrefix('scared', 'charlie wake up', 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);
				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-blocks':
				tex = Paths.getSparrowAtlas('characters/GF_Charlie_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'GF Dancing Beat Blocks', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Blocks', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Blocks', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);
	
				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);
				addOffset('scared', -2, -17);
	
				playAnim('danceRight');

			case 'gf-awake':
				tex = Paths.getSparrowAtlas('characters/GF_Charlie_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'GF Dancing Beat Awake', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Awake', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Awake', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);
		
				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);
				addOffset('scared', -2, -17);
		
				playAnim('danceRight');

			case 'gf-nard':
				tex = Paths.getSparrowAtlas('characters/GF_Nard');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'gf nard dancing idle', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'gf nard dancing idle', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'gf nard dancing idle', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);
	
				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);
	
				playAnim('danceRight');
			case 'gf-nard-morning':
				tex = Paths.getSparrowAtlas('characters/GF_Nard_morning');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'gf nard dancing idle', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'gf nard dancing idle', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'gf nard dancing idle', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);
	
				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);
	
				playAnim('danceRight');
	

			case 'gf-pixel':
				tex = Paths.getSparrowAtlas('characters/gfPixel');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByIndices('singUP', 'GF IDLE', [2], "", 24, false);
				animation.addByIndices('danceLeft', 'GF IDLE', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF IDLE', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

				setGraphicSize(Std.int(width * PlayState.daPixelZoom));
				updateHitbox();
				antialiasing = false;

			case 'freddy':
				// FREDDY MOTHERFUCKING FAZBEAR ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/freggy', 'shared');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'FreddyIdleDance', 24, false);
				animation.addByPrefix('singUP', 'FreddyUp', 24, false);
				animation.addByPrefix('singRIGHT', 'FreddyRight', 24, false);
				animation.addByPrefix('singDOWN', 'FreddyDown', 24, false);
				animation.addByPrefix('singLEFT', 'FreddyLeft', 24, false);

				addOffset('idle');
				addOffset("singUP", 21,8);
				addOffset("singRIGHT", - 50, -45);
				addOffset("singLEFT", 48, -39);
				addOffset("singDOWN", -9, -73);

				playAnim('idle');

			case 'sky':
				// FREDDY MOTHERFUCKING FAZBEAR ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/sky_assets', 'shared');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'sky idle', 24, false);
				animation.addByPrefix('singUP', 'sky up', 24, false);
				animation.addByPrefix('singRIGHT', 'sky right', 24, false);
				animation.addByPrefix('singDOWN', 'sky down', 24, false);
				animation.addByPrefix('singLEFT', 'sky left', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 21,8);
				addOffset("singRIGHT", - 50, -45);
				addOffset("singLEFT", 48, -39);
				addOffset("singDOWN", -9, -73);
	
				playAnim('idle');

			case 'yt':
				// LIL PARROT ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Lil_Parrot_YT', 'shared');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'Doom', 24, false);
				animation.addByPrefix('singUP', 'Pain', 24, false);
				animation.addByPrefix('singRIGHT', 'Horrifying', 24, false);
				animation.addByPrefix('singDOWN', 'Suffering', 24, false);
				animation.addByPrefix('singLEFT', 'Agony', 24, false);
		
				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);
		
				playAnim('idle');

			case 'nard':
				// NARD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Nard_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'Nard Idle', 24, false);
				animation.addByPrefix('singUP', 'Nard Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Nard Right', 24, false);
				animation.addByPrefix('singDOWN', 'Nard Down', 24, false);
			    animation.addByPrefix('singLEFT', 'Nard Left', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 124, 75);
				addOffset("singRIGHT", 143, 74);
				addOffset("singLEFT", 62, 94);
				addOffset("singDOWN", -84, -156);
	
				playAnim('idle');

			case 'seven':
				// SEVEN ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Seven_assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'Seven Idle', 24, false);
				animation.addByPrefix('singUP', 'Seven Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Seven Right', 24, false);
				animation.addByPrefix('singDOWN', 'Seven Down', 24, false);
				animation.addByPrefix('singLEFT', 'Seven Left', 24, false);
				animation.addByPrefix('ALRIGHT', 'Seven Alright', 24, false);
				animation.addByPrefix('COUGH', 'Seven Cough', 24, false);
				animation.addByPrefix('LESSGO', 'Seven Less Go', 24, false);
				animation.addByPrefix('DOTHIS', 'Seven Lets Do This!', 24, false);
				animation.addByPrefix('UGH', 'Seven Ugh', 24, false);
		
				addOffset('idle');
				addOffset("singUP", 82, 17);
				addOffset("singRIGHT", 74, 11);
				addOffset("singLEFT", 69, 19);
				addOffset("singDOWN", 60, 3);
				addOffset("singALRIGHT", 45, 14);
				addOffset("singCOUGH", 10, -31);
				addOffset("singLESSGO", 25, -5);
				addOffset("singDOTHIS", 83, 5);
				addOffset("singUGH", -16, 4);
		
				playAnim('idle');

			case 'aaron':
				// AARON ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Aaron');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'AaronIdle', 24, false);
				animation.addByPrefix('singUP', 'AaronUp', 24, false);
				animation.addByPrefix('singRIGHT', 'AaronRight', 24, false);
				animation.addByPrefix('singDOWN', 'AaronDown', 24, false);
				animation.addByPrefix('singLEFT', 'AaronLeft', 24, false);
		
				addOffset('idle');
				addOffset("singUP", 196, 58);
				addOffset("singRIGHT", -14, -111);
				addOffset("singLEFT", 102, -79);
				addOffset("singDOWN", 246, -275);
		
				playAnim('idle');

				doesCamshake = true;

			case 'playable-nathan':
				tex = Paths.getSparrowAtlas('characters/nathan_playable');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'Nathan Idle', 24, false);
				animation.addByPrefix('singUP', 'Nathan Shoot', 24, false);
				animation.addByPrefix('singRIGHT', 'Nathan Shoot', 24, false);
				animation.addByPrefix('singDOWN', 'Nathan Shoot', 24, false);
				animation.addByPrefix('singLEFT', 'Nathan Shoot', 24, false);
			
				addOffset('idle');
				addOffset("singUP", 0, 0);
				addOffset("singRIGHT", 0, 0);
				addOffset("singLEFT", 0, 0);
				addOffset("singDOWN", 0, 0);
			
				playAnim('idle');
			case 'scraps-aaron':
				// SCRAPS AARON ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Scrap_Aaron_assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'Scrap Aaron Idle', 24, false);
				animation.addByPrefix('singUP', 'Scrap Aaron Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Scrap Aaron Right', 24, false);
				animation.addByPrefix('singDOWN', 'Scrap Aaron Down', 24, false);
				animation.addByPrefix('singLEFT', 'Scrap Aaron Left', 24, false);
			
				addOffset('idle');
				addOffset("singUP", -17, 453);
				addOffset("singRIGHT", -28, -164);
				addOffset("singLEFT", 353, -93);
				addOffset("singDOWN", -76, -136);
			
				playAnim('idle');

				doesCamshake = true;

			case 'charlie':
				// CHARLIE ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Charlie');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'CharlieIdle', 24, false);
				animation.addByPrefix('singUP', 'CharlieUp', 24, false);
				animation.addByPrefix('singRIGHT', 'CharlieRight', 24, false);
				animation.addByPrefix('singDOWN', 'CharlieDown', 24, false);
				animation.addByPrefix('singLEFT', 'CharlieLeft', 24, false);
	
				addOffset('idle');
				addOffset("singUP", 25, -5);
				addOffset("singRIGHT", 10, 0);
				addOffset("singLEFT", 37, 0);
				addOffset("singDOWN", -16, -10);
	
				playAnim('idle');
			case 'block-guy':
				// BLOCK GUY ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Block_Guy_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'Block Guy Idle', 24, false);
				animation.addByPrefix('singUP', 'Block Guy UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Block Guy RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Block Guy DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Block Guy LEFT', 24, false);
		
				addOffset('idle');
				addOffset("singUP", 25, 52);
				addOffset("singRIGHT", -28, -35);
				addOffset("singLEFT", 37, -18);
				addOffset("singDOWN", -7, 1);
		
				playAnim('idle');

				hasProjector = true;
			case 'rabbitdud':
				// RABBITDUD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Rabbitdud_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'Rabbitdud Idle', 24, false);
				animation.addByPrefix('singUP', 'Rabbitdud Up', 24, false);
				animation.addByPrefix('singRIGHT', 'Rabbitdud Right', 24, false);
				animation.addByPrefix('singDOWN', 'Rabbitdud Down', 24, false);
				animation.addByPrefix('singLEFT', 'Rabbitdud Left', 24, false);
			
				addOffset('idle');
				addOffset("singUP", 25, 52);
				addOffset("singRIGHT", -28, -35);
				addOffset("singLEFT", 37, -18);
				addOffset("singDOWN", -7, 1);
			
				playAnim('idle');
	
				hasProjector = true;
			case 'en':
				// EN ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/En');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'EnIdle', 24, false);
				animation.addByPrefix('singUP', 'EnUp', 24, false);
				animation.addByPrefix('singRIGHT', 'EnRight', 24, false);
				animation.addByPrefix('singDOWN', 'EnDown', 24, false);
				animation.addByPrefix('singLEFT', 'EnLeft', 24, false);
			
				addOffset('idle');
				addOffset("singUP", 25, -5);
				addOffset("singRIGHT", 10, 0);
				addOffset("singLEFT", 37, 0);
				addOffset("singDOWN", -16, -10);
			
				playAnim('idle');
			case 'en-night':
				// EN NIGHT ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/En_Night');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'EnIdle', 24, false);
				animation.addByPrefix('singUP', 'EnUp', 24, false);
				animation.addByPrefix('singRIGHT', 'EnRight', 24, false);
				animation.addByPrefix('singDOWN', 'EnDown', 24, false);
				animation.addByPrefix('singLEFT', 'EnLeft', 24, false);
				
				addOffset('idle');
				addOffset("singUP", 25, -5);
				addOffset("singRIGHT", 10, 0);
				addOffset("singLEFT", 37, 0);
				addOffset("singDOWN", -16, -10);
			
				playAnim('idle');
			case 'nova':
				// NOVA ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/Nova');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'NovaIdle', 24, false);
				animation.addByPrefix('singUP', 'NovaUp', 24, false);
				animation.addByPrefix('singRIGHT', 'NovaRight', 24, false);
				animation.addByPrefix('singDOWN', 'NovaDown', 24, false);
				animation.addByPrefix('singLEFT', 'NovaLeft', 24, false);
				
				addOffset('idle');
				addOffset("singUP", -34, -2);
				addOffset("singRIGHT", -14, -22);
				addOffset("singLEFT", 11, 22);
				addOffset("singDOWN", -32, -2);
				
				playAnim('idle');
			case 'spooky':
				tex = Paths.getSparrowAtlas('characters/spooky_kids_assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('singUP', 'spooky UP NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'spooky DOWN note', 24, false);
				animation.addByPrefix('singLEFT', 'note sing left', 24, false);
				animation.addByPrefix('singRIGHT', 'spooky sing right', 24, false);
				animation.addByIndices('danceLeft', 'spooky dance idle', [0, 2, 6], "", 12, false);
				animation.addByIndices('danceRight', 'spooky dance idle', [8, 10, 12, 14], "", 12, false);

				addOffset('danceLeft');
				addOffset('danceRight');

				addOffset("singUP", -20, 26);
				addOffset("singRIGHT", -130, -14);
				addOffset("singLEFT", 130, -10);
				addOffset("singDOWN", -50, -130);

				playAnim('danceRight');
			case 'angelic-nathan':
				tex = Paths.getSparrowAtlas('characters/Angelic_Nathan');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('singUP', 'NathanUp', 24, false);
				animation.addByPrefix('singDOWN', 'NathanDown', 24, false);
				animation.addByPrefix('singLEFT', 'NathanLeft', 24, false);
				animation.addByPrefix('singRIGHT', 'NathanRight', 24, false);
				animation.addByPrefix('singUP-alt', 'NathanGuitarUp', 24, false);
				animation.addByPrefix('singDOWN-alt', 'NathanGuitarDown', 24, false);
				animation.addByPrefix('singLEFT-alt', 'NathanGuitarLeft', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'NathanGuitarRight', 24, false);
				animation.addByIndices('danceLeft', 'NathanIdle', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10], "", 12, false);
				animation.addByIndices('danceRight', 'NathanIdle', [11, 12, 13, 14, 15, 16, 17, 18, 19], "", 12, false);
	
				addOffset('danceLeft');
				addOffset('danceRight');
	
				addOffset("singUP", -122, 40);
				addOffset("singRIGHT", -95, -105);
				addOffset("singLEFT", 299, -144);
				addOffset("singDOWN", -62, -106);

				addOffset("singUP-alt", -119, 27);
				addOffset("singRIGHT-alt", -130, -14);
				addOffset("singLEFT-alt", 251, -151);
				addOffset("singDOWN-alt", -79, -101);
	
				playAnim('danceRight');
			case 'mom':
				tex = Paths.getSparrowAtlas('characters/Mom_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');

			case 'mom-car':
				tex = Paths.getSparrowAtlas('characters/momCar');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', "Mom Idle", 24, false);
				animation.addByPrefix('singUP', "Mom Up Pose", 24, false);
				animation.addByPrefix('singDOWN', "MOM DOWN POSE", 24, false);
				animation.addByPrefix('singLEFT', 'Mom Left Pose', 24, false);
				// ANIMATION IS CALLED MOM LEFT POSE BUT ITS FOR THE RIGHT
				// CUZ DAVE IS DUMB!
				animation.addByPrefix('singRIGHT', 'Mom Pose Left', 24, false);

				addOffset('idle');
				addOffset("singUP", 14, 71);
				addOffset("singRIGHT", 10, -60);
				addOffset("singLEFT", 250, -23);
				addOffset("singDOWN", 20, -160);

				playAnim('idle');
			case 'monster':
				tex = Paths.getSparrowAtlas('characters/Monster_Assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'monster idle', 24, false);
				animation.addByPrefix('singUP', 'monster up note', 24, false);
				animation.addByPrefix('singDOWN', 'monster down', 24, false);
				animation.addByPrefix('singLEFT', 'Monster left note', 24, false);
				animation.addByPrefix('singRIGHT', 'Monster Right note', 24, false);

				addOffset('idle');
				addOffset("singUP", -20, 50);
				addOffset("singRIGHT", -51);
				addOffset("singLEFT", -30);
				addOffset("singDOWN", -30, -40);
				playAnim('idle');
			case 'pico':
				tex = Paths.getSparrowAtlas('characters/Pico_FNF_assetss');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', "Pico Idle Dance", 24);
				animation.addByPrefix('singUP', 'pico Up note0', 24, false);
				animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico NOTE LEFT miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico Note Right Miss', 24, false);
					flipX = false;
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					// fuck you cam i finally flipped it. no longer needs to be done later.
					animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);
					animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);
					animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);
					flipX = false;
				}

				animation.addByPrefix('singUPmiss', 'pico Up note miss', 24);
				animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24);

				addOffset('idle');
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -68, -7);
				addOffset("singLEFT", 65, 9);
				addOffset("singDOWN", 200, -70);
				addOffset("singUPmiss", -19, 67);
				addOffset("singRIGHTmiss", -60, 41);
				addOffset("singLEFTmiss", 62, 64);
				addOffset("singDOWNmiss", 210, -28);

				playAnim('idle');

				flipX = true;

			case 'charlie-chugjug':
				tex = Paths.getSparrowAtlas('characters/chugjug_charlie_assets');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', "CharlieIdle", 24);
				animation.addByPrefix('singUP', 'CharlieUp0', 24, false);
				animation.addByPrefix('singDOWN', 'CharlieDown0', 24, false);
				if (isPlayer)
				{
					animation.addByPrefix('singLEFT', 'CharlieLeft0', 24, false);
					animation.addByPrefix('singRIGHT', 'CharlieRight0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'CharlieMISSRight', 24, false);
					animation.addByPrefix('singLEFTmiss', 'CharlieMISSLeft', 24, false);
					flipX = false;
				}
				else
				{
					// Need to be flipped! REDO THIS LATER!
					// fuck you cam i finally flipped it. no longer needs to be done later.
					animation.addByPrefix('singLEFT', 'CharlieRight0', 24, false);
					animation.addByPrefix('singRIGHT', 'CharlieLeft0', 24, false);
					animation.addByPrefix('singRIGHTmiss', 'CharlieMISSLeft', 24, false);
					animation.addByPrefix('singLEFTmiss', 'CharlieMISSRight', 24, false);
					flipX = false;
				}
	
				animation.addByPrefix('singUPmiss', 'CharlieMISSUp', 24);
				animation.addByPrefix('singDOWNmiss', 'CharlieMISSDown', 24);
	
				addOffset('idle');
				addOffset("singUP", -134, 311);
				addOffset("singRIGHT", -168, -111);
				addOffset("singLEFT", 362, 8);
				addOffset("singDOWN", 105, -288);
				addOffset("singUPmiss", -134, 311);
				addOffset("singRIGHTmiss", -168, -111);
				addOffset("singLEFTmiss", 362, 8);
				addOffset("singDOWNmiss", 105, -288);
	
				playAnim('idle');
	
				flipX = true;
	

			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;
				//Can I put my balls in yo jaws.
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('hitLEFT', 'BF hit left', 24, false);
				animation.addByPrefix('hitDOWN', 'BF hit down', 24, false);
				animation.addByPrefix('hitUP', 'BF hit up', 24, false);
				animation.addByPrefix('hitRIGHT', 'BF hit right', 24, false);
				animation.addByPrefix('dodge', 'boyfriend dodge', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -24, -7);
				addOffset("singLEFT", -85, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("hitUP", -29, 27);
				addOffset("hitRIGHT", -24, -7);
				addOffset("hitLEFT", -85, -6);
				addOffset("hitDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
				addOffset('dodge', 0);

				playAnim('idle');

				flipX = true;

			case 'bf-night':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND_Night', 'shared');
				frames = tex;
	
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
	
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
	
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
	
				animation.addByPrefix('scared', 'BF idle shaking', 24);
	
				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
	
				playAnim('idle');
	
				flipX = true;

			case 'bf-nightcore':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND_Nightcore', 'shared');
				frames = tex;
	
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
	
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('dodge', 'boyfriend dodge', 24, false);
	
				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead Loop", 24, true);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);
	
				animation.addByPrefix('scared', 'BF idle shaking', 24);
	
				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
				addOffset('dodge', 0);
	
				playAnim('idle');
	
				flipX = true;
		
	
			case 'bf-christmas':
				var tex = Paths.getSparrowAtlas('characters/bfChristmas');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);

				playAnim('idle');

				flipX = true;
			case 'bf-holding-gf':
				var tex = Paths.getSparrowAtlas('characters/bfAndGF');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'BF idle dance w gf', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
	
				addOffset('idle');
				addOffset("singUP", -29, 10);
				addOffset("singRIGHT", -41, 23);
				addOffset("singLEFT", 12, 7);
				addOffset("singDOWN", -10, -10);
				addOffset("singUPmiss", -29, 10);
				addOffset("singRIGHTmiss", -41, 23);
				addOffset("singLEFTmiss", 12, 7);
				addOffset("singDOWNmiss", -10, -10);
	
				playAnim('idle');
	
				flipX = true;
			case 'bf-car':
				var tex = Paths.getSparrowAtlas('characters/bfCar');
				frames = tex;
				trace('amount of frames for ' + curCharacter + ' is: ' + tex.frames.length);
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

			case 'bf-holding-gf-dead':
				frames = Paths.getSparrowAtlas('characters/bfHoldingGF-DEAD');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('singUP', "BF Dies with GF", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies with GF", 24, false);
				animation.addByPrefix('deathLoop', "BF Dead with GF Loop", 24, true);
				animation.addByPrefix('deathConfirm', "RETRY confirm holding gf", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath', 37, 14);
				addOffset('deathLoop', 37, -3);
				addOffset('deathConfirm', 37, 28);
				playAnim('firstDeath');
				flipX = true;

			case 'senpai':
				frames = Paths.getSparrowAtlas('characters/senpai');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('idle', 'Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'SENPAI UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'SENPAI LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'SENPAI RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'SENPAI DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);

				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;
			case 'senpai-angry':
				frames = Paths.getSparrowAtlas('characters/senpai');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('idle', 'Angry Senpai Idle', 24, false);
				animation.addByPrefix('singUP', 'Angry Senpai UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'Angry Senpai LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'Angry Senpai RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'Angry Senpai DOWN NOTE', 24, false);

				addOffset('idle');
				addOffset("singUP", 5, 37);
				addOffset("singRIGHT");
				addOffset("singLEFT", 40);
				addOffset("singDOWN", 14);
				playAnim('idle');

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				antialiasing = false;

			case 'spirit':
				frames = Paths.getPackerAtlas('characters/spirit');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('idle', "idle spirit_", 24, false);
				animation.addByPrefix('singUP', "up_", 24, false);
				animation.addByPrefix('singRIGHT', "right_", 24, false);
				animation.addByPrefix('singLEFT', "left_", 24, false);
				animation.addByPrefix('singDOWN', "spirit down_", 24, false);

				addOffset('idle', -220, -280);
				addOffset('singUP', -220, -240);
				addOffset("singRIGHT", -220, -280);
				addOffset("singLEFT", -200, -280);
				addOffset("singDOWN", 170, 110);

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				antialiasing = false;

			case 'parents-christmas':
				frames = Paths.getSparrowAtlas('characters/mom_dad_christmas_assets');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('idle', 'Parent Christmas Idle', 24, false);
				animation.addByPrefix('singUP', 'Parent Up Note Dad', 24, false);
				animation.addByPrefix('singDOWN', 'Parent Down Note Dad', 24, false);
				animation.addByPrefix('singLEFT', 'Parent Left Note Dad', 24, false);
				animation.addByPrefix('singRIGHT', 'Parent Right Note Dad', 24, false);

				animation.addByPrefix('singUP-alt', 'Parent Up Note Mom', 24, false);

				animation.addByPrefix('singDOWN-alt', 'Parent Down Note Mom', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Parent Left Note Mom', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Parent Right Note Mom', 24, false);

				addOffset('idle');
				addOffset("singUP", -47, 24);
				addOffset("singRIGHT", -1, -23);
				addOffset("singLEFT", -30, 16);
				addOffset("singDOWN", -31, -29);
				addOffset("singUP-alt", -47, 24);
				addOffset("singRIGHT-alt", -1, -24);
				addOffset("singLEFT-alt", -30, 15);
				addOffset("singDOWN-alt", -30, -27);

				playAnim('idle');

			case 'en-and-charlie':
				frames = Paths.getSparrowAtlas('characters/Charlie_En_Duet_Assets');
				trace('amount of frames for ' + curCharacter + ' is: ' + frames.frames.length);
				animation.addByPrefix('idle', 'Duet Idle', 24, false);
				animation.addByPrefix('singUP', 'En Up', 24, false);
				animation.addByPrefix('singDOWN', 'En Down', 24, false);
				animation.addByPrefix('singLEFT', 'En Left', 24, false);
				animation.addByPrefix('singRIGHT', 'En Right', 24, false);
				animation.addByPrefix('singUP-alt', 'Charlie Up', 24, false);
				animation.addByPrefix('singDOWN-alt', 'Charlie Down', 24, false);
				animation.addByPrefix('singLEFT-alt', 'Charlie Left', 24, false);
				animation.addByPrefix('singRIGHT-alt', 'Charlie Right', 24, false);
	
				addOffset('idle');
				addOffset("singUP", -30, 0);
				addOffset("singRIGHT", -30, 2);
				addOffset("singLEFT", -20, 0);
				addOffset("singDOWN", -26, 2);
				addOffset("singUP-alt", -333, 57);
				addOffset("singRIGHT-alt", -315, 57);
				addOffset("singLEFT-alt", -313, 46);
				addOffset("singDOWN-alt", -299, 28);
	
				playAnim('idle');
		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf') || !curCharacter.startsWith('playable'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	override function update(elapsed:Float)
	{
		if (!isPlayer)
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance()
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-none':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-night':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
	
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-morning':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
		
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-and-her-gfs':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-blocks':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
	
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-awake':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
		
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-nard':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
	
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-nard-morning':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;
		
						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
	

				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');

				case 'angelic-nathan':
					danced = !danced;
	
					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
