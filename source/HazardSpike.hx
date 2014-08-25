package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Wallace Brown
 */
class HazardSpike extends FlxSprite
{

	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		makeGraphic(32, 32, FlxColor.RED);
	}
	
}