package ;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxRandom;

/**
 * ...
 * @author ...
 */
class PropFactory
{
	public static var prefix:String = "images/props/";
	public static var props:Array<String> = [
	"computers-01.png",
	"computers-02.png",
	"computers-03.png",
	"computers-04.png",
	"computerTerminal-01.png",
	"dishwasher.png",
	"engine1.png",
	"engine2-01.png",
	"engine3-01.png",
	"fridges.png",
	"girders-01.png",
	"girders-02.png",
	"girders-03.png",
	"kitchenTable.png",
	"lab-01.png",
	"lab-02.png",
	"lab-03.png",
	"lab-04.png",
	"rails-01.png",
	"rails-02.png",
	"rails-03.png",
	"rails-04.png",
	"trees-01.png",
	"trees-02.png",
	"trees-03.png",
	"trees-04.png",
	"windows-01.png",
	"windows-02.png",
	"windows-03.png",
	"windows-04.png"
	];

	public function new() 
	{
		
	}
	
	public function getProp(X:Float, name:String):FlxSprite
	{
		if (name == "" || name == null)
		{
			return null;
		}
		
		var prop = new FlxSprite(X, 0);
		prop.loadGraphic(prefix + name);
		prop.scale.set(0.125, 0.125);
		prop.updateHitbox();
		prop.setPosition(X, FlxG.height - prop.height);
		return prop;
	}
	
	public function getRandomProp(X:Float, Y:Float):FlxSprite
	{
		var prop = new FlxSprite(X, Y);
		
		var randomProp = props[FlxRandom.intRanged(0, props.length - 1)];
		
		prop.loadGraphic(prefix + randomProp);
		prop.scale.set(0.125, 0.125);
		prop.updateHitbox();
		prop.setPosition(X, FlxG.height - Y - prop.height);
		return prop;
	}
	
}