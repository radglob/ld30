package ;

import flixel.FlxG;

/**
 * ...
 * @author Jeremy Neal
 */
class Platform extends DepthSprite
{

	public function new(X:Float, Y:Float, Z:Int, width:Int, height:Int) 
	{
		super(X, Y, Z);
		makeGraphic(width, height);
		immovable = true;
	}
	
	override public function update()
	{
		super.update();
	}
	
	override public function destroy()
	{
		super.destroy();
	}
	
}