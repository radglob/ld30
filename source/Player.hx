package ;

import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author Jeremy Neal
 */
class Player extends DepthSprite
{
	private var _gravity:Float = 400;

	public function new(X:Float, Y:Float, Z:Int) 
	{
		super(X, Y, Z);
		makeGraphic(16, 32, FlxColor.BLUE);
		acceleration.y = _gravity;
		drag.x = 300;
	}
	
	override public function update():Void
	{
		updateMovement();
		super.update();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	
	private function updateMovement():Void
	{
		// Booleans for movement keys
		var _left = false;
		var _right = false;
		var _readyToJump = false;
		
		// For now, the ground is the bottom of the window.
		this.y = Math.min(this.y, FlxG.height - this.height);
		
		if (this.y == FlxG.height - this.height)
		{
			acceleration.y = 0;
			velocity.y = 0;
		}
		else
			acceleration.y = _gravity;
		
		_right = FlxG.keys.anyPressed(["D", "RIGHT"]);
		_left = FlxG.keys.anyPressed(["A", "LEFT"]);
		
		if (_left && _right)
		{
			_left = _right = false;
		}
		
		if (_left)
			velocity.x = -200;
			
		if (_right)
			velocity.x = 200;
		
		_readyToJump = FlxG.keys.justPressed.SPACE;
		if (_readyToJump && velocity.y == 0)
			velocity.y = -200;
	}
}