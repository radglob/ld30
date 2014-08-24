package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxDestroyUtil;

/**
 * ...
 * @author ...
 */
class Runner extends FlxGroup
{
	//	All our platforms!
	//
	var m_platforms:List<Platform>;
	
	//	All our platforms we need to remove.
	//
	var m_platforms_to_remove:List<Platform>;
	
	//	After this far left of our camera, we should remove platforms.
	//
	public var m_window_min_x:Float = 500;
	
	//
	public static var GRAPHIC_PREFIX_PLATFORM:String;
	public static var GRAPHIC_PREFIX_PLATFORM_V1:String = "assets/images/v1/platform_";
	public static var GRAPHIC_PREFIX_PLATFORM_V2:String = "assets/images/v2/platform_";
	public static var GRAPHIC_PREFIX_PLATFORM_V3:String = "assets/images/v3/platform_";

	public function new() 
	{
		//
		super();
		
		//
		m_platforms = new List<Platform>();
		m_platforms_to_remove = new List<Platform>();
	}
	override public function destroy():Void {
		super.destroy();
		FlxDestroyUtil.destroyArray(this.members);
	}
	
	//
	public function manual_update():Void
	{
		super.update();
		
		//
		update_remove_platforms();
	}	
	
	//
	function update_remove_platforms():Void { 
	
		//	Find our platforms to remove.
		//
		for ( obj in m_platforms ) {
			if ( obj.get_camera_distance() > m_window_min_x )
				m_platforms_to_remove.add(obj);
		}
		
		//	Remove our platforms.
		//
		for ( obj in m_platforms_to_remove )
			remove_platform(obj);
			
		//
		m_platforms_to_remove.clear();
	}
	function remove_platform(obj:Platform):Void { 
	
		//	Remove it from our special list.
		//
		m_platforms.remove(obj);
		
		//	Remove it from our group.
		//
		remove(obj);
		
		//
		obj.print_kill();
		
		//
		FlxDestroyUtil.destroy( obj );
	}
	
	//
	public function add_platform(obj:Platform):Void {
		
		//	Add to our special list.
		//
		m_platforms.add(obj);
		
		//	Add to our group.
		//
		add(obj);
	}
}