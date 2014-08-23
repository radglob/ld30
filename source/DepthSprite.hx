package ;

import flixel.FlxSprite;

/**
 * ...
 * @author Jeremy Neal
 */
class DepthSprite extends FlxSprite
{
	public var Z:Int;

	public function new(X:Float, Y:Float, Z:Int) 
	{
		super(X, Y);
		this.Z = Z;
	}
	
	override public function update():Void
	{
		super.update();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	
}