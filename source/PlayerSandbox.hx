package ;

import flash.display.BitmapData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tile.FlxTileblock;
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
import flixel.util.FlxDestroyUtil;
import flixel.group.FlxSpriteGroup;

/**
 * ...
 * @author Jeremy Neal
 */
class PlayerSandbox extends FlxState  
{
	public static var GRAPHIC_PREFIX_PLATFORM:String;
	public static var GRAPHIC_PREFIX_PLATFORM_V1:String = "assets/images/v1/platform_";
	public static var GRAPHIC_PREFIX_PLATFORM_V2:String = "assets/images/v2/platform_";
	public static var GRAPHIC_PREFIX_PLATFORM_V3:String = "assets/images/v3/platform_";
	
	private var _player:Player;
	private var _backgroundImage:FlxBackdrop;
	private var collisionsAllowed:Int;
	private var secondCamera:FlxCamera;
	private var props:FlxSpriteGroup;
	private var propFactory:PropFactory;
	private var platform:PlatformNormal;
	private var platforms:FlxTypedGroup<PlatformNormal>;
	
	private static var BG_WIDTH:Int = 1024;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{	
		GRAPHIC_PREFIX_PLATFORM = GRAPHIC_PREFIX_PLATFORM_V1;
		
		// Setup cameras
		secondCamera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
		secondCamera.bgColor = FlxColor.TRANSPARENT;
		FlxG.cameras.add(secondCamera);
		
		_backgroundImage = new FlxBackdrop("assets/images/space.png", 0.6, 0.6, true, false);
		add(_backgroundImage);
		
		// Map one camera to background, other to foreground.
		_backgroundImage.cameras = [FlxG.camera];
		FlxCamera.defaultCameras = [secondCamera];
		
		// Adjust camera to fit background.
		FlxG.camera.zoom = FlxG.width / BG_WIDTH;
		FlxG.camera.setSize(BG_WIDTH, BG_WIDTH);
		
		collisionsAllowed = 3;
		
		propFactory = new PropFactory();
		
		_player = new Player(0, 0, 1);
		_player.setPosition(0, FlxG.height - _player.height);
		
		// Setup props/
		props = new FlxSpriteGroup();
		
		// Add a single prop.
		var prop = propFactory.getProp(0, 0, "fridges.png");
		props.add(prop);
		
		// Setup up platforms
		platforms = new FlxTypedGroup<PlatformNormal>();
		for (i in 1 ... 100)
		{
			platform = new PlatformNormal(i * 600, FlxG.height - 50);
			platforms.add(platform);
		}
		
		platforms.kill();
		
		add(props);
		add(platforms);
		add(_player);
		
		FlxG.mouse.visible = false;
		
		super.create();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		_player = FlxDestroyUtil.destroy(_player);
		_backgroundImage = FlxDestroyUtil.destroy(_backgroundImage);
		
		FlxG.mouse.visible = true;
		
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{	
		FlxG.camera.setBounds(0, 0, 100000, BG_WIDTH, true);
		FlxG.camera.follow(_player, FlxCamera.STYLE_PLATFORMER, new FlxPoint(-BG_WIDTH, 0));
		
		secondCamera.setBounds(0, 0, 100000, FlxG.height, true);
		secondCamera.follow(_player, FlxCamera.STYLE_PLATFORMER);
		
		if (collisionsAllowed == 0) {
			FlxG.switchState(new GameOverState());
		}
		
		FlxG.collide(platforms, _player, checkCollision);
		
		platforms.forEachDead(addToScene);
		platforms.forEachAlive(cull);
	
		super.update();
	}
	
	private function checkCollision(obstacle:FlxSprite, player:FlxSprite):Void
	{
		// If player hits the side, change obstacle color.
		if (player.y + player.height > obstacle.y)
		{
			// Show the collision, and count it.
			collisionsAllowed -= 1;
			secondCamera.shake();
			
			// Move the player away.
			player.x -= 150;
			
		}
		
		FlxObject.separate(obstacle, player);
	}
	
	private function byX(Order:Int, Obj1:FlxObject, Obj2:FlxObject):Int
	{
		return FlxSort.byValues(Order, Obj1.x, Obj2.x);
	}
	
	private function addToScene(platform:PlatformNormal)
	{
		// If within three screen lengths, add to scene.
		if (platform.x < _player.x + FlxG.width * 3)
		{
			platform.revive();
		}
	}
	
	private function cull(platform:PlatformNormal)
	{
		if (platform.x < _player.x - FlxG.width * 3)
		{
			platform.kill();
		}
	}
}