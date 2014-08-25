package ;

import flixel.util.FlxColor;
import flixel.FlxG;

/**
 * ...
 * @author Jeremy Neal
 */
class Player extends DepthSprite
{
	private var _gravity:Float = 600;

	public function new(X:Float, Y:Float, Z:Int) 
	{
		super(X, Y, Z);
		loadGraphic("images/characterSpriteSheet.png", true, 128, 128, true);
		// Make hit box half and center.
		width = 64;
		offset.x = 32;
		animation.add("stand", [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18], 36);
		animation.add("run", [20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35], 32, true);
		animation.add("jump", [37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56], 40, false);
		animation.add("fall", [58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72], 28, false);
		animation.add("cry", [74, 75, 76, 77, 78, 79, 80, 81, 82, 83], 20, true);
		animation.play("run");
		acceleration.y = _gravity;
		velocity.x = 250;
		maxVelocity.x = 400;
		
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
		{
			acceleration.x = -50;
		}	
		else if (_right)
		{
			acceleration.x = 100;
		}
			
		_readyToJump = FlxG.keys.justPressed.SPACE;
		if (_readyToJump && velocity.y == 0)
		{
			velocity.y = -400;
			if (animation.curAnim != null)
				animation.curAnim.stop();
			animation.play("jump", true);
		}
		
		if (animation.curAnim == null && velocity.y == 0)
			if (velocity.x == 0)
				animation.play("stand");
			else if (velocity.x > 0 || velocity.x < 0)
				animation.play("run");
	}
}