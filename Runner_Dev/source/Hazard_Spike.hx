package ;
import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author ...
 */
class Hazard_Spike extends FlxSprite
{

	public function new(X:Float,Y:Float) 
	{
		super(X, Y);
		makeGraphic(32, 32, FlxColor.RED);
	}
	
}