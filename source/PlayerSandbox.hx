package ;

import flash.display.BitmapData;
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
import flixel.FlxCamera;
import flixel.util.FlxPoint;
import flixel.util.FlxRandom;
import flixel.util.FlxSort;
import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxPoint;

/**
 * ...
 * @author Jeremy Neal
 */
class PlayerSandbox extends FlxState  
{
	
	private var _player:Player;
	private var _platform:Platform;
	private var _platforms:FlxTypedGroup<Platform>;
	private var _backgroundImage:FlxBackdrop;
	private var collisionsAllowed:Int;
	private var secondCamera:FlxCamera;
	
	private static var BG_WIDTH:Int = 2048;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{	
		secondCamera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
		secondCamera.bgColor = FlxColor.TRANSPARENT;
		FlxG.cameras.add(secondCamera);
		
		_backgroundImage = new FlxBackdrop(AssetPaths.wallTile_diffuse_10__png, 0.7, 0.7, true, false);
		_backgroundImage.setGraphicSize(FlxG.width, FlxG.width);
		add(_backgroundImage);
		
		_backgroundImage.cameras = [FlxG.camera];
		FlxCamera.defaultCameras = [secondCamera];
		
		FlxG.camera.zoom = FlxG.width / BG_WIDTH;
		FlxG.camera.setSize(BG_WIDTH, Std.int(BG_WIDTH * 3 / 4));
		
		_platforms = new FlxTypedGroup<Platform>();
		
		for (i in 1...100) {
			var randomHeight = FlxRandom.intRanged(20, 40);
			var randomWidth = FlxRandom.intRanged(40, 80);
			_platform = new Platform(i * 250, FlxG.height - randomHeight, 1, randomWidth, randomHeight);
			_platform.kill();
			_platforms.add(_platform);
		}
		
		_platforms.sort(byX);
		
		add(_platforms);
		
		collisionsAllowed = 3;
		
		_player = new Player(0, 0, 1);
		_player.setPosition(0, FlxG.height - _player.height);
		add(_player);
		
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
		FlxG.camera.setBounds(0, 0, 100000, BG_WIDTH, true);
		FlxG.camera.follow(_player, FlxCamera.STYLE_PLATFORMER);
		secondCamera.setBounds(0, 0, 100000, FlxG.height, true);
		secondCamera.follow(_player, FlxCamera.STYLE_PLATFORMER);
		
		if (collisionsAllowed == 0) {
			FlxG.switchState(new GameOverState());
		}
		
		_platforms.forEachDead(addToScene);
		_platforms.forEachAlive(cull);
		
		super.update();
	}
	
	private function checkCollision(obstacle:FlxSprite, player:FlxSprite):Void
	{
		// If player hits the side, change obstacle color.
		if (player.y + player.height > obstacle.y)
		{
			// Show the collision, and count it.
			obstacle.color = FlxColor.RED;
			collisionsAllowed -= 1;
			secondCamera.shake();
			
			// Move the player away.
			player.x -= 150;
			
		}
		else
			obstacle.color = FlxColor.WHITE;
		
		FlxObject.separate(obstacle, player);
	}
	
	private function byX(Order:Int, Obj1:FlxObject, Obj2:FlxObject):Int
	{
		return FlxSort.byValues(Order, Obj1.x, Obj2.x);
	}
	
	private function addToScene(platform:Platform)
	{
		// If within three screen lengths, add to scene.
		if (platform.x < _player.x + FlxG.width * 3)
		{
			platform.revive();
		}
	}
	
	private function cull(platform:Platform)
	{
		if (platform.x < _player.x - FlxG.width * 3)
		{
			platform.kill();
		}
	}
}