package ;
import flixel.FlxSprite;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class PropFactory
{
	public static var prefix:String = "assets/images/props/";

	public function new() 
	{
		
	}
	
	public function getProp(X:Float, Y:Float, name:String):FlxSprite
	{
		if (name == "" || name == null)
		{
			return null;
		}
		
		var prop = new FlxSprite(X, Y);
		prop.loadGraphic(prefix + name);
		prop.scale.set(0.125, 0.125);
		prop.updateHitbox();
		prop.setPosition(X, FlxG.height - prop.height);
		return prop;
	}
	
}