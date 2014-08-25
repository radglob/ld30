package ;
import flixel.FlxSprite;
import flixel.util.FlxVector;

/**
 * ...
 * @author ...
 */
class PlatformNormal extends Platform
{
	public static var PlatformNormalType_Long:Int = 1;
	public static var PlatformNormalType_Medium:Int = 2;
	public static var PlatformNormalType_Short:Int = 3;
	public var m_type:Int = PlatformNormalType_Long;
	
	var m_graphic_top_left:String;
	var m_graphic_top_center:String;
	var m_graphic_top_right:String;
	var m_graphic_middle_left:String;
	var m_graphic_middle_center:String;
	var m_graphic_middle_right:String;
	var m_graphic_bottom_left:String;
	var m_graphic_bottom_center:String;
	var m_graphic_bottom_right:String;
	
	public function new(X:Float=0, Y:Float=0, type:Int = 1) 
	{
		super(X, Y);
		resolve_graphics();
		construct_platform();
	}
	
	function draw_min_max():Void
	{
		var smin:FlxSprite = new FlxSprite(m_min.x, m_min.y);
		smin.makeGraphic(16, 16);
		add(smin);
		
		var smax:FlxSprite = new FlxSprite(m_max.x, m_max.y);
		smax.makeGraphic(16, 16);
		add(smax);
	}
	
	function resolve_graphics():Void
	{
		m_graphic_top_left = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "topLeft.png";
		m_graphic_top_center = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "top.png";
		m_graphic_top_right = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "topRight.png";
		
		m_graphic_middle_left = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "left.png";
		m_graphic_middle_center = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "basic.png";
		m_graphic_middle_right = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "right.png";
		
		m_graphic_bottom_left = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "bottomLeft.png";
		m_graphic_bottom_center = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "bottom.png";
		m_graphic_bottom_right = PlayerSandbox.GRAPHIC_PREFIX_PLATFORM + "bottomRight.png";
	}
	
	function construct_platform():Void
	{
		switch(m_type)
		{
			case PlatformNormal.PlatformNormalType_Long:
				help_construct_platform(1, 12);
				
			case PlatformNormal.PlatformNormalType_Medium:
				help_construct_platform(1, 6);
				
			case PlatformNormal.PlatformNormalType_Short:
				help_construct_platform(1, 2);
		}
	}
	
	function help_construct_platform(height:Int = 1, length:Int = 3):Void
	{
		add_column_left(height, m_x, m_y);
		
		for (iCount in 1 ... length + 1)
			add_column_middle(height, m_x + Platform.TILE_SIZE * iCount, m_y);
			
		add_column_right(height, m_x + Platform.TILE_SIZE * length + 1, m_y);
		
		m_width = Platform.TILE_SIZE * (length + 1);
		m_height = Platform.TILE_SIZE * height * 2;
		
		m_min = new FlxVector();
		m_min.x = m_x;
		m_min.y = m_y + m_height;
		
		m_max = new FlxVector();
		m_max.x = m_x + m_width;
		m_max.y = m_y;
	}
	
	function add_column_left(height:Int = 1, X:Float = 0, Y:Float = 0):Void
	{
		var sprite:FlxSprite = new FlxSprite(X, Y, m_graphic_top_left);
		sprite.immovable = true;
		add(sprite);
		
		for (iCount in 1 ... height + 1)
		{
			sprite = new FlxSprite(X, Y + Platform.TILE_SIZE * iCount, m_graphic_middle_left);
			sprite.immovable = true;
			add(sprite);
		}
		
		sprite = new FlxSprite(X, Y + Platform.TILE_SIZE * height, m_graphic_bottom_left);
		sprite.immovable = true;
		add(sprite);
	}
	
	function add_column_middle(height:Int = 1, X:Float = 0, Y:Float = 0):Void
	{
		var sprite:FlxSprite = new FlxSprite(X, Y, m_graphic_top_center);
		sprite.immovable = true;
		add(sprite);
		
		for (iCount in 1 ... height + 1)
		{
			sprite = new FlxSprite(X, Y + Platform.TILE_SIZE * iCount, m_graphic_middle_center);
			sprite.immovable = true;
			add(sprite);
		}
		
		sprite = new FlxSprite(X, Y + Platform.TILE_SIZE * height, m_graphic_bottom_center);
		sprite.immovable = true;
		add(sprite);
	}
	
	function add_column_right(height:Int = 1, X:Float = 0, Y:Float = 0):Void
	{
		var sprite:FlxSprite = new FlxSprite(X, Y, m_graphic_top_right);
		sprite.immovable = true;
		add(sprite);
		
		for (iCount in 1 ... height + 1)
		{
			sprite = new FlxSprite(X, Y + Platform.TILE_SIZE * iCount, m_graphic_middle_right);
			sprite.immovable = true;
			add(sprite);
		}
		sprite = new FlxSprite(X, Y + Platform.TILE_SIZE * height, m_graphic_bottom_right);
		sprite.immovable = true;
		add(sprite);
	}
	
}