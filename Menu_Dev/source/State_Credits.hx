package ;
import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class State_Credits extends FlxState
{

	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		//
		add(new FlxText(250, 100, 400, "CREDITS",40));
		add(new FlxText(300, 250, 400, "person",20));
		add(new FlxText(300, 280, 400, "person",20));
		add(new FlxText(300, 300, 400, "person",20));
		
		//
		var m_button_back = new FlxButton(300, 400, "back", callback_back);
		
		//
		add(m_button_back);
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
	private function callback_back():Void
	{
		FlxG.switchState(new State_Title());
	}
}