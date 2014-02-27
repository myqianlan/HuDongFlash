package  
{
	import com.greensock.plugins.BlurFilterPlugin;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	/**
	 * ...
	 * @author Linquan Tan
	 * date 2012.08.31
	 * 游戏画面
	 */
	public class MLinquanTan extends MovieClip
	{
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#BgColor_hm")]public var BgColor_hm:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Dbgy_dh")]public var Dbgy_dh:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Beiguang_dh")]public var Beiguang_dh:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Dengshu_dh")]public var Dengshu_dh:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Dishi_hm")]public var Dishi_hm:Class;
		[Embed(source = "../动画源文件及其swf/startGame.swf#Left_cloth")]public var Left_cloth:Class;
	    [Embed(source = "../动画源文件及其swf/startGame.swf#Right_cloth")]public var Right_cloth:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Defen_hm")]public var Defen_hm:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Jishi_hm")]public var Jishi_hm:Class;
	
		
		public function MLinquanTan() 
		{
			
			
			var bgColor_hm:Object = new BgColor_hm();
			var dbgy_dh:Object = new Dbgy_dh();
			var beiguang_dh:Object = new Beiguang_dh();
			var dengshu_dh:Object = new Dengshu_dh(); 
			var dishi_hm:Object = new Dishi_hm();
			var left_cloth:Object = new Left_cloth();
		    var right_cloth:Object = new Right_cloth();
			var defen_hm:Object = new Defen_hm();
			var jishi_hm:Object = new Jishi_hm();
			
			bgColor_hm.x = 512;
			bgColor_hm.y = 384;
			addChild(bgColor_hm as Sprite);
			dbgy_dh.x = 512;
			dbgy_dh.y = 644;
			addChild(dbgy_dh as Sprite);
			beiguang_dh.x = 512;
			beiguang_dh.y = 384;
			addChild(beiguang_dh as Sprite);
			dengshu_dh.x = 512;
			dengshu_dh.y = 384;
			addChild(dengshu_dh as Sprite);
			dishi_hm.x = 512;
			dishi_hm.y = 734;
			addChild(dishi_hm as Sprite);
			left_cloth.x = 101;
			left_cloth.y = 384;
			addChild(left_cloth as Sprite);
			
			right_cloth.x = 922;
			right_cloth.y = 384;
			addChild(right_cloth as Sprite);
			defen_hm.x = 200;
			defen_hm.y = 72;
			addChild(defen_hm as Sprite);
			jishi_hm.x = 828;
			jishi_hm.y = 72;
			addChild(jishi_hm as Sprite);
		
			
		}
		
	}

}