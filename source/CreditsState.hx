package ;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.util.FlxDestroyUtil;

/**
 * ...
 * @author ...
 */
class CreditsState extends FlxState
{
	private var _credits:FlxText;
	private var _backButton:FlxButton;

	override public function create():Void
	{
		_credits = new FlxText(0, 0, 400, "Credits\n\n", 14);
		_credits.text += "Jeremy Neal - Programming, Bad Music\n\n";
		_credits.text += "Matthew Fishel - Art\n\n";
		_credits.text += "Wallace Brown - Programming, Good Music\n\n";
		_credits.setPosition((FlxG.width - _credits.width) / 2, 50);
		_credits.alignment = "center";
		add(_credits);
		
		_backButton = new FlxButton(0, 0, "Main Menu", goToMenu);
		_backButton.setPosition((FlxG.width - _backButton.width) / 2, FlxG.height - 100);
		add(_backButton);
		super.create();
	}
	
	override public function update():Void
	{
		super.update();
	}
	
	override public function destroy():Void 
	{
		_credits = FlxDestroyUtil.destroy(_credits);
		_backButton = FlxDestroyUtil.destroy(_backButton);
		super.destroy();
	}
	
	private function goToMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
}