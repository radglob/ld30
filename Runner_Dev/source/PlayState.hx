package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxDestroyUtil;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	//
	var m_generator:RunnerGenerator;
	var m_runner:Runner;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		//	Move our camera.
		//
		add( new DBG_InfiniteScroll() );
		
		//	Create our generator and set our graphics set.
		//
		m_generator = new RunnerGenerator();
		m_generator.set_graphics_set(1);
		
		//	Get/add our runner.
		//
		m_runner = m_generator.get_runner();
		add(m_runner);
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
		super.update();
		
		//
		m_generator.update();
		
		//
		m_runner.manual_update();
	}	
}