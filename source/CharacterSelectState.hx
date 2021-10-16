package;

import flixel.FlxState;
import flixel.effects.FlxFlicker;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.input.gamepad.FlxGamepad;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

/**
 * character selector. THIS SHIT DONT WORK RIGHT YET LOL!!!!
 */
class CharacterSelectState extends MusicBeatState
{
    public var beef:Boyfriend;

    //char names...
    public var chars:Array<String> = ['bf', 'playable-nathan'];
    //human readable characters. the one that gets set to the text
    public var humanChars:Array<String> = ['Boyfriend', 'Nathan'];

    public var text:Alphabet;

    public var black:FlxSprite;

    public var canInteract:Bool = true;

    public var curSelected:Int = 0;

    var magenta:FlxSprite;

    public var destinationState:String;

	public function new(destination:String)
	{
		super();
        destinationState = destination;
	}

	override function create()
	{

        FlxG.sound.playMusic(Paths.music('fresh_chill'), 1, true);

        trace('play fresh chill mix');

        Conductor.changeBPM(117);

        trace('change bpm to fresh chill mixs bpm');

        var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		add(bg);
        trace('add bg');

		magenta = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		magenta.scrollFactor.x = 0;
		magenta.scrollFactor.y = 0.10;
		magenta.setGraphicSize(Std.int(magenta.width * 1.1));
		magenta.updateHitbox();
		magenta.screenCenter();
		magenta.visible = false;
		magenta.antialiasing = true;
		magenta.color = 0xFFfd719b;
		add(magenta);
        trace('add magenta bg');

        beef = new Boyfriend(0, 0, chars[0]);
        trace('bf = ' + chars[0]);
        beef.screenCenter();
        trace('screen center bf');
        add(beef);
        trace('add boyfriend');
        text = new Alphabet(0, beef.getGraphicMidpoint().y - 75, humanChars[0], true);
        trace('char text = ' + humanChars[0]);
        text.screenCenter().x;
        trace('screen center char text on the x axis');
        text.y = beef.getGraphicMidpoint().y - beef.height / 2;
        trace('set char text y to ' + text.y);
        add(text);
        trace('add char text');
        var selectText = new Alphabet(0, beef.getGraphicMidpoint().y + 75, 'CHOOSE YOUR CHARACTER', true);
        trace('select text = ' + selectText.text);
        selectText.screenCenter().x;
        trace('screen center select text on the x axis');
        selectText.y = beef.getGraphicMidpoint().y + beef.height / 2;
        trace('set select text y to ' + selectText.y);
        add(selectText);
        trace('add select text');
		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
        if(controls.ACCEPT && canInteract)
        {
            finish();
        }
        if(controls.LEFT && canInteract)
        {
            if(curSelected - 1 <= 0)
            {
                curSelected = chars.length;
                trace('curselected = ' + curSelected);
            }
            else
            {
                curSelected--;
                trace('curselected = ' + curSelected);
            }
            changeCharacter(chars[curSelected], humanChars[curSelected]);
        }
        if(controls.RIGHT && canInteract)
        {
            if(curSelected + 1 >= chars.length)
            {
                curSelected = 0;
                trace('curselected = ' + curSelected);
            }
            else
            {
                curSelected++;
                trace('curselected = ' + curSelected);
            }
            changeCharacter(chars[curSelected], humanChars[curSelected]);
        }
	}

    public function changeCharacter(char:String, charText:String)
    {
        trace('changing character to ' + char + ' and changing character text to ' + charText);
        remove(beef);
        trace('remove boyfriend');
        beef = new Boyfriend(0, 0, char);
        trace('bf = ' + char);
        beef.screenCenter();
        trace('screen center bf');
        add(beef);
        trace('add boyfriend');
        text.text = charText;
        trace('set character text to ' + text.text);
    }

    public function finish()
    {
        trace('finishing');
        FlxG.sound.music.stop();
        trace('stopping fresh chill mix');
        FlxG.sound.play(Paths.music('gameOverEnd'));
        trace('game over ending sound played');
        canInteract = false;
        trace('can interact set to false');
        if (FlxG.save.data.flashing)
            FlxFlicker.flicker(magenta, 1.1, 0.15, false);        
            trace('start flickering magenta in and out');
        if(beef.animOffsets.exists('hey'))
        {
            trace('hey exists in bfs anim offsets, playing it now');
            beef.playAnim('hey', true);
            trace('hey anim played');
        }
        else
        {
            trace('hey does not exist in bfs anim offsets, playing sing up now');
            beef.playAnim('singUP', true);
            trace('sing up played');
        }
        PlayStateChangeables.playerName = chars[curSelected];
        trace('PlayStateChangables.playerName set to ' + PlayStateChangeables.playerName);
    	new FlxTimer().start(0.75, function(tmr:FlxTimer)
		{
            switch(destinationState.toLowerCase())
            {
                default:
                    trace('switching to playstate');
                    LoadingState.loadAndSwitchState(new PlayState());
            }
		});
    }

    override function beatHit() 
	{
		super.beatHit();
        trace('beat hit');
        if(beef.animation.curAnim.name != 'hey' && beef.animation.curAnim.name != 'singUP')
		    beef.dance();
            trace('boyfriend danced');
	}
}
