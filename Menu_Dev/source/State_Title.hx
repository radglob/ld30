package ;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author ...
 */
class State_Title extends FlxState
{
	//
	private var m_button_play:FlxButton;
	private var m_button_credits:FlxButton;
	private var m_button_quit:FlxButton;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		//
		add(new FlxText(250, 200, 400, "GAME TITLE",20));
		
		//
		var px:Float = 300;
		m_button_play = new FlxButton(px, 300, "Play", callback_play);
		m_button_credits = new FlxButton(px, 340, "Credits", callback_credits);
		
		//
		add(m_button_play);
		add(m_button_credits);
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
	private function callback_play():Void
	{
		FlxG.switchState(new State_Playing());
	}
	private function callback_credits():Void
	{
		FlxG.switchState(new State_Credits());
	}
}