import flixel.input.gamepad.FlxGamepad;
import openfl.Lib;
import flixel.FlxG;

class KadeEngineData
{
    public static function initSave()
    {
        if (FlxG.save.data.newInput == null)
			trace('FlxG.save.data.newInput = null, setting to true');
			FlxG.save.data.newInput = true;

		if (FlxG.save.data.downscroll == null)
			trace('FlxG.save.data.downscroll = null, setting to false');
			FlxG.save.data.downscroll = false;

		if (FlxG.save.data.dfjk == null)
			trace('FlxG.save.data.dfjk = null, setting to false');
			FlxG.save.data.dfjk = false;

		if (FlxG.save.data.myn == null)
			trace('FlxG.save.data.myn = null, setting to false');
			FlxG.save.data.myn = false;

		if (FlxG.save.data.InstantRespawn == null)
			trace('FlxG.save.data.InstantRespawn = null, setting to false');
			FlxG.save.data.InstantRespawn = false;
			
		if (FlxG.save.data.accuracyDisplay == null)
			trace('FlxG.save.data.accuracyDisplay = null, setting to true');
			FlxG.save.data.accuracyDisplay = true;

		if (FlxG.save.data.offset == null)
			trace('FlxG.save.data.offset = null, setting to 0');
			FlxG.save.data.offset = 0;

		if (FlxG.save.data.songPosition == null)
			trace('FlxG.save.data.songPosition = null, setting to false');
			FlxG.save.data.songPosition = false;

		if (FlxG.save.data.fps == null)
			trace('FlxG.save.data.fps = null, setting to false');
			FlxG.save.data.fps = false;

		if (FlxG.save.data.changedHit == null)
		{
			trace('FlxG.save.data.changedHitX = null, setting to -1');
			FlxG.save.data.changedHitX = -1;
			trace('FlxG.save.data.changedHitY = null, setting to -1');
			FlxG.save.data.changedHitY = -1;
			trace('FlxG.save.data.changedHit = null, setting to false');
			FlxG.save.data.changedHit = false;
		}

		if (FlxG.save.data.fpsRain == null)
			trace('FlxG.save.data.fpsRain = null, setting to false');
			FlxG.save.data.fpsRain = false;

		if (FlxG.save.data.fpsCap == null)
			trace('FlxG.save.data.fpsCap = null, setting to 120');
			FlxG.save.data.fpsCap = 120;

		if (FlxG.save.data.fpsCap > 285 || FlxG.save.data.fpsCap < 60)
			trace('FlxG.save.data.fpsCap too high or low, setting to 120');
			FlxG.save.data.fpsCap = 120; // baby proof so you can't hard lock ur copy of kade engine
		
		if (FlxG.save.data.scrollSpeed == null)
			trace('FlxG.save.data.scrollSpeed = null, setting to 1');
			FlxG.save.data.scrollSpeed = 1;

		if (FlxG.save.data.npsDisplay == null)
			trace('FlxG.save.data.npsDisplay = null, setting to false');
			FlxG.save.data.npsDisplay = false;

		if (FlxG.save.data.frames == null)
			trace('FlxG.save.data.frames = null, setting to 10');
			FlxG.save.data.frames = 10;

		if (FlxG.save.data.accuracyMod == null)
			trace('FlxG.save.data.accuracyMod = null, setting to 1');
			FlxG.save.data.accuracyMod = 1;

		if (FlxG.save.data.watermark == null)
			trace('FlxG.save.data.watermark = null, setting to false');
			FlxG.save.data.watermark = false;

		if (FlxG.save.data.ghost == null)
			trace('FlxG.save.data.ghost = null, setting to true');
			FlxG.save.data.ghost = true;

		if (FlxG.save.data.distractions == null)
			trace('FlxG.save.data.distractions = null, setting to true');
			FlxG.save.data.distractions = true;

		if (FlxG.save.data.flashing == null)
			trace('FlxG.save.data.flashing = null, setting to true');
			FlxG.save.data.flashing = true;

		if (FlxG.save.data.resetButton == null)
			trace('FlxG.save.data.resetButton = null, setting to false');
			FlxG.save.data.resetButton = false;
		
		if (FlxG.save.data.botplay == null)
			trace('FlxG.save.data.botplay = null, setting to false');
			FlxG.save.data.botplay = false;

		if (FlxG.save.data.cpuStrums == null)
			trace('FlxG.save.data.cpuStrums = null, setting to true');
			FlxG.save.data.cpuStrums = true;

		if (FlxG.save.data.strumline == null)
			trace('FlxG.save.data.strumline = null, setting to false');
			FlxG.save.data.strumline = false;
		
		if (FlxG.save.data.customStrumLine == null)
			trace('FlxG.save.data.customStrumLine = null, setting to 0');
			FlxG.save.data.customStrumLine = 0;

		if (FlxG.save.data.camzoom == null)
			trace('FlxG.save.data.camzoom = null, setting to true');
			FlxG.save.data.camzoom = true;

		if (FlxG.save.data.scoreScreen == null)
			trace('FlxG.save.data.scoreScreen = null, setting to true');
			FlxG.save.data.scoreScreen = true;

		if (FlxG.save.data.inputShow == null)
			trace('FlxG.save.data.inputShow = null, setting to false');
			FlxG.save.data.inputShow = false;

		if (FlxG.save.data.optimize == null)
			trace('FlxG.save.data.optimize = null, setting to false');
			FlxG.save.data.optimize = false;
		
		var gamepad:FlxGamepad = FlxG.gamepads.lastActive;
		
		KeyBinds.gamepad = gamepad != null;

		Conductor.recalculateTimings();
		PlayerSettings.player1.controls.loadKeyBinds();
		KeyBinds.keyCheck();

		Main.watermarks = FlxG.save.data.watermark;

		(cast (Lib.current.getChildAt(0), Main)).setFPSCap(FlxG.save.data.fpsCap);
	}
}