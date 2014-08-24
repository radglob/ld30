package ;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxDestroyUtil;
import flixel.FlxG;

using flixel.util.FlxSpriteUtil;
/**
 * ...
 * @author ...
 */
class GameOverState extends FlxState
{
	private var lossText:FlxText;
	private var replayButton:FlxButton;
	private var quitButton:FlxButton;
	
	override public function create():Void
	{
		lossText = new FlxText(0, 0, FlxG.width * 3 / 4, "The captain will dies quietly, his last wish unfulfilled.", 12);
		lossText.alignment = "center";
		lossText.screenCenter();
		add(lossText);
		
		replayButton = new FlxButton(0, 0, "Try Again", replay);
		replayButton.setPosition(FlxG.width / 2 - replayButton.width, FlxG.height / 2 + replayButton.height * 2);
		add(replayButton);
		
		quitButton = new FlxButton(0, 0, "Main Menu", goToMenu);
		quitButton.setPosition(FlxG.width / 2 + quitButton.width, FlxG.height / 2 + quitButton.height * 2);
		add(quitButton);
		
		super.create();
	}
	
	override public function update():Void
	{
		super.update();
	}
	
	override public function destroy():Void
	{
		lossText = FlxDestroyUtil.destroy(lossText);
		replayButton = FlxDestroyUtil.destroy(replayButton);
		quitButton = FlxDestroyUtil.destroy(quitButton);
		super.destroy();
	}
	
	private function replay():Void
	{
		FlxG.switchState(new PlayerSandbox());
	}
	
	private function goToMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
	
}