package  
{



	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
     /**
	 * ...
	 * @author  Linquan Tan
	 * @date 2012.08.28
	 * 游戏开始画面
	 */
	 
	
	public class SLinquanTan extends Sprite
	{
		
	//导入
	[Embed(source = "../动画源文件及其swf/startGame.swf#Bottom")]public var Bottom:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#ImageBox")]public var ImageBox:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Left_cloth")]public var Left_cloth:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Right_cloth")]public var Right_cloth:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Red_background")]public var Red_background:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Start_btn")]public var Start_btn:Class;
	
	[Embed(source = "../动画源文件及其swf/startGame.swf#Caishenye")]public var Caishenye:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Rotate_bar")]public var Rotate_bar:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Yanhua")]public var Yanhua:Class;
	[Embed(source = "../动画源文件及其swf/startGame.swf#Xing")]public var Xing:Class;
	public var start_btn:Object = new Start_btn();	
	public function SLinquanTan()
		{
		   
		 
		  
		   var red_background:Object = new Red_background();
		   var rotate_bar:Object = new Rotate_bar();
		   var bottom:Object = new Bottom();
		   var caishenye:Object = new Caishenye();
		   
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
			
			caishenye.x = 549.15;
			caishenye.y = 272.70;
			addChild(caishenye as Sprite);
			
			start_btn.x = 538.30;
			start_btn.y = 628.35;
			addChild(start_btn as Sprite);
			
			
			imagebox.x = 544.30;
			imagebox.y = 408;
			addChild(imagebox as Sprite);
			
			yanhua.x = 285.35;
			yanhua.y = 175.35;
			addChild(yanhua as Sprite);
			
			xing1.x = 468.30;
			xing1.y = 390;
			addChild(xing1 as Sprite);
			
			xing2.x = 620.3;
			xing2.y = 392;
			addChild(xing2 as Sprite);
			
			
			
			
			left_cloth.x = 101;
			left_cloth.y = 384;
			addChild(left_cloth as Sprite);
			
			right_cloth.x = 922;
			right_cloth.y = 384;
			addChild(right_cloth as Sprite);
			
		
			
		}
		
		
	}
}
