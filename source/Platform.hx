package ;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxVector;

/**
 * ...
 * @author Jeremy Neal
 */
class Platform extends FlxSpriteGroup
{
	private var m_uid:Int;
	static var UID_COUNTER:Int = 0;
	
	public static var TILE_SIZE:Int = 32;
	
	public var m_x:Float;
	public var m_y:Float;
	public var m_width:Float;
	public var m_height:Float;
	public var m_min:FlxVector;
	public var m_max:FlxVector;
	
	public function new(X:Float = 0, Y:Float = 0) 
	{
		super();
		m_x = X;
		m_y = Y;
		
		m_uid = UID_COUNTER + 1;
		UID_COUNTER++;
	}
	
	public function get_camera_distance():Float
	{
		return FlxG.camera.target.x - this.m_max.x;
	}
	
	public function add_spike():Void
	{
		var px:Float = m_min.x + Math.random() * (m_width - TILE_SIZE);
		var py:Float = m_max.y - TILE_SIZE;
		add(new HazardSpike(px, py));
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