package ;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxTypedGroup;
import flixel.FlxObject;
import flixel.util.FlxColor;

/**
 * ...
 * @author Jeremy Neal
 */
class PlayerSandbox extends FlxState
{

	private var _player:Player;
	private var _platform:Platform;
	private var _platform2:Platform;
	
	private var _platforms:FlxTypedGroup<Platform>;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		_player = new Player(0, 0, 1);
		add(_player);
		
		_platform = new Platform(400, FlxG.height - 80, 1, 100, 80);
		
		_platform2 = new Platform(200, FlxG.height - 40, 1, 100, 40);
		
		_platforms = new FlxTypedGroup<Platform>();
		_platforms.add(_platform);
		_platforms.add(_platform2);
		add(_platforms);
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		FlxG.collide(_platforms, _player, checkCollision);
		super.update();
	}
	
	private function checkCollision(obstacle:FlxSprite, player:FlxSprite):Void
	{
		// If player hits the side, change obstacle color.
		if (player.y + player.height > obstacle.y)
			obstacle.color = FlxColor.RED;
		else
			obstacle.color = FlxColor.WHITE;
		
		FlxObject.separate(obstacle, player);
	}
}