package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.group.FlxTypedGroup;

/**
 * A FlxState which can be used for the actual gameplay.
 * @author Wallace Brown
 */
class PlayState extends FlxState
{
	
	private var m_generator:RunnerGenerator;
	private var m_runner:Runner;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{	
		add(new DBG_InfiniteScroll());
		
		m_generator = new RunnerGenerator();
		m_generator.set_graphics_set(1);
		
		m_runner = m_generator.get_runner();
		add(m_runner);
		
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
		m_generator.update();
		
		m_runner.update();
	}	
}