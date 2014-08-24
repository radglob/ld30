package ;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class State_Dead extends FlxState
{

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		//
		add(new FlxText(250, 100, 400, "SUPER DEAD", 40));
		
		//
		var m_button_retry = new FlxButton(300, 400, "retry", callback_retry);
		add(m_button_retry);
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
		
	}	
	
	//
	private function callback_retry():Void
	{
		FlxG.switchState(new State_Playing());
	}
}