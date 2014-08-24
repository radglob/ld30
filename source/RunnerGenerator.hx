package ;

import flixel.FlxG;

/**
 * ...
 * @author Wallace Brown
 */
class RunnerGenerator
{
	private var m_runner:Runner;
	
	private var m_platform_spawn_x:Float = 300;
	private var m_min_platform_y:Float = 100;
	private var m_range_platform_y:Float = 50;
	
	private var m_elapsed_time:Float = 0;
	private var m_max_time:Float = 4.5;
	private var m_max_offset_time:Float = 0;
	private var m_offset_time:Float = 0;
	
	public function new() 
	{

	}
	
	public function get_runner():Runner
	{
		m_runner = new Runner();
		add_platform(-200);
		add_platform(350);
		
		return m_runner;
	}
	
	public function update():Void
	{
		update_dbg_graphics_set();
		update_time();
	}
	
	public function set_graphics_set(index:Int):Void
	{
		switch(index)
		{
			case 1:
				Runner.GRAPHIC_PREFIX_PLATFORM = Runner.GRAPHIC_PREFIX_PLATFORM_V1;
				
			case 2:
				Runner.GRAPHIC_PREFIX_PLATFORM = Runner.GRAPHIC_PREFIX_PLATFORM_V1;
			
			case 3:
				Runner.GRAPHIC_PREFIX_PLATFORM = Runner.GRAPHIC_PREFIX_PLATFORM_V1;
		}
	}
	
	public function update_time():Void
	{
		m_elapsed_time += FlxG.elapsed;
		if (m_elapsed_time >= m_max_offset_time)
		{
			m_elapsed_time = 0;
			m_offset_time = Math.random() * m_max_offset_time;
			
			add_platform();
		}
	}
	
	public function add_platform(specific_spawn_x:Float = 0):Void
	{
		var pick_x:Float = FlxG.camera.target.x + m_platform_spawn_x;
		if (specific_spawn_x != 0)
			pick_x = FlxG.camera.target.x + specific_spawn_x;
			
		var pick_y:Float = m_range_platform_y - ((Math.random() - 1.0) * 2.0) * m_range_platform_y;
		
		var platform = new PlatformNormal(pick_x, pick_y, PlatformNormal.PlatformNormalType_Long);
		platform.add_spike();
		m_runner.add_platform(platform);
	}
	
	public function update_dbg_graphics_set():Void
	{
		if (FlxG.keys.anyPressed(["A"]))
		{
			set_graphics_set(1);
		}
		
		if (FlxG.keys.anyPressed(["S"]))
		{
			set_graphics_set(2);
		}
		
		if (FlxG.keys.anyPressed(["D"]))
		{
			set_graphics_set(3);
		}
	}
}