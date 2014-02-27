package  
{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.text.TextField;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Linquan Tan
	 * @date  2012.08.28
	 * 游戏结束画面
	 */
	public class ELinquanTan extends Sprite
	{//导入
	
	
	[Embed(source = "../动画源文件及其swf/startGame.swf#Bottom")]public var Bottom:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#ImageBox")]public var ImageBox:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Left_cloth")]public var Left_cloth:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Right_cloth")]public var Right_cloth:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Red_background")]public var Red_background:Class;
	[Embed(source = "../动画源文件及其swf/EndGame.swf#Final_score")]public var Final_score:Class;
	[Embed(source = "../动画源文件及其swf/EndGame.swf#ScoreNumber")]public var ScoreNumber:Class;
	[Embed(source = "../动画源文件及其swf/jieshu_caishenye.swf#End_caishenye")]public var End_caishenye:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Rotate_bar")]public var Rotate_bar:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Yanhua")]public var Yanhua:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Xing")]public var Xing:Class;
	public var fin:TextField = new TextField();	
	private var fmt:TextFormat = new TextFormat();
	public var fins:int;
	public var caishenye:Object = new End_caishenye();
	public function ELinquanTan() 
		{
			
	
		
		  
		
		  
		   var red_background:Object = new Red_background();
		   var rotate_bar:Object = new Rotate_bar();
		   var bottom:Object = new Bottom();
		   
		   var final_score:Object = new Final_score();
		   
		   var scorenumber:Object = new ScoreNumber();
		   var imagebox:Object = new ImageBox();
		   var yanhua:Object = new Yanhua();
		   var xing1:Object = new Xing();
		   var xing2:Object = new Xing();
		   var left_cloth:Object = new Left_cloth();
		   var right_cloth:Object = new Right_cloth();
		  
		   
		    red_background.x = 512;
			red_background.y = 384;
			addChild(red_background as Sprite);
		   	
			rotate_bar.x = 512;
			rotate_bar.y = 384;
			addChild(rotate_bar as Sprite);
			
			bottom.x = 512;
			bottom.y = 692.10;
			addChild(bottom as Sprite);
			
			caishenye.x = 700.15;
			caishenye.y = 350.70;
			addChild(caishenye as Sprite);
			
			scorenumber.x = 100.35;
			scorenumber.y = 321.80;
			scorenumber.width = 421;
			scorenumber.height = 280;
			addChild(scorenumber as Sprite);
			
			
			final_score.x = 170.30;
			final_score.y = 250;
			addChild(final_score as Sprite);
			
			yanhua.x = -170.35;
			yanhua.y = 175.35;
			addChild(yanhua as Sprite);
			
			xing1.x = 170;
			xing1.y = 250;
			addChild(xing1 as Sprite);
			
			xing2.x = 280.3;
			xing2.y = 450;
			addChild(xing2 as Sprite);
			
			
			
			
			left_cloth.x = 101;
			left_cloth.y = 384;
			addChild(left_cloth as Sprite);
			
			right_cloth.x = 922;
			right_cloth.y = 384;
			addChild(right_cloth as Sprite);
			
			
			addEventListener(Event.ENTER_FRAME,onE);
		
		}
		private function onE(e:Event):void {
			fin.text = String(fins);
			fin.x = 250;
			fin.y = 400;
			fin.width = 300;
			fmt.size = 100;
			fmt.bold = true;
			fmt.color = 0x000000;
			fin.defaultTextFormat = fmt;
		
			addChild(fin);
			
		}
	}

}