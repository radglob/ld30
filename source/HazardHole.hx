package ;

import flixel.FlxSprite;

/**
 * ...
 * @author Wallace Brown
 */
class HazardHole extends FlxSprite
{
	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		makeGraphic(32, 32, FlxColor.YELLOW);
	}
}