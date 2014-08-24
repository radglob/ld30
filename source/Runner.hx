package ;

import flixel.group.FlxTypedGroup;
import flixel.util.FlxDestroyUtil;
import flixel.FlxG;
import flixel.FlxBasic;

/**
 * @author Wallace Brown
 */
class Runner extends FlxBasic
{
	private var m_platforms:FlxTypedGroup<Platform>;
	private var m_window_min_x:Float = 500;
	
	public static var GRAPHIC_PREFIX_PLATFORM:String;
	public static var GRAPHIC_PREFIX_PLATFORM_V1:String = "assets/images/v1/platform_";
	public static var GRAPHIC_PREFIX_PLATFORM_V2:String = "assets/images/v2/platform_";
	public static var GRAPHIC_PREFIX_PLATFORM_V3:String = "assets/images/v3/platform_";
	
	public function new() 
	{
		m_platforms = new FlxTypedGroup<Platform>();
		super();
	}
	
	override public function destroy():Void
	{
		m_platforms = FlxDestroyUtil.destroy(m_platforms);
		super.destroy();
	}
	
	override public function update():Void
	{
		update_remove_platforms();
		super.update();
	}
	
	public function update_remove_platforms():Void
	{
		for (platform in m_platforms)
		{
			if (platform.get_camera_distance() > m_window_min_x)
				remove_platform(platform);
		}
	}
	
	public inline function remove_platform(platform:Platform):Void
	{
		platform.kill();
	}
	
	public inline function add_platform(platform:Platform):Void
	{
		m_platforms.add(platform);
	}
}