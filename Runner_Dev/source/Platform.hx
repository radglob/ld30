package ;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.util.FlxVector;
import openfl.geom.Point;

/**
 * ...
 * @author ...
 */
class Platform extends FlxGroup
{
	//
	var m_uid:Int;
	static var UID_COUNTER:Int = 0;
	
	//
	public static var TILE_SIZE:Int = 32;
	
	//
	public var m_x:Float;
	public var m_y:Float;
	public var m_width:Int;
	public var m_height:Int;
	public var m_min:FlxVector;
	public var m_max:FlxVector;

	public function new(X:Float=0, Y:Float=0) 
    {
		//
        super();
		
		//
		m_x = X;
		m_y = Y;
		
		//
		m_uid = UID_COUNTER + 1;
		UID_COUNTER++;
	}
	
	//
	/*override public function update():Void {
		print_camera_distance();
	}*/
	
	//
	public function get_camera_distance():Float { return FlxG.camera.target.x - this.m_max.x;}
	
	//
	public function print_camera_distance():Void {
		
		//
		trace("platform camera distance: " + get_camera_distance());
		//FlxG.log.add("platform position: " + get_camera_distance());
	}
	public function print_kill():Void {
		
		//
		trace("killed platform: " + m_uid);
		//FlxG.log.add("killed platform: " + m_uid);
	}

	
	//
	public function add_spike():Void {
		
		//
		var px:Float = m_min.x + Math.random() * (m_width - TILE_SIZE);
		var py:Float = m_max.y-TILE_SIZE;
		
		//
		add( new Hazard_Spike(px, py) );
	}
}