package;

import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	public var sprTracker:FlxSprite;
	public var publicIsPlayer:Bool;

	public function new(char:String = 'bf', isPlayer:Bool = false)
		{
			super();
			loadGraphic(Paths.image('icons/' + char), true, 150, 150);
			animation.add(char, [0, 1], 0, false, isPlayer);
			animation.play(char);
			publicIsPlayer = isPlayer;
			switch(char){
				case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
					{
						antialiasing = false;
					}
				default:
					{
						antialiasing = true;
					}
			}
			scrollFactor.set();
		}
	public function changeChar(char:String = 'bf')
		{
			loadGraphic(Paths.image('icons/' + char), true, 150, 150);
			animation.add(char, [0, 1], 0, false, publicIsPlayer);
			animation.play(char);
			switch(char)
			{
				case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
					{
						antialiasing = false;
					}
				default:
					{
						antialiasing = true;
					}
			}
			scrollFactor.set();
		}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
