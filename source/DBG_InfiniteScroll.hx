package ;

import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxG;

/**
 * ...
 * @author ...
 */
class DBG_InfiniteScroll extends FlxSprite
{
	public var m_speed:Float = 2;

	public function new(X:Float = 0, Y:Float = 0) 
	{
		super(X, Y);
		FlxG.camera.follow(this, FlxCamera.STYLE_PLATFORMER);
	}
	
	override public function update():Void
	{
		this.x += m_speed;
	}
	
}