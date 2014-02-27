package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.*;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.Timer;
	import com.greensock.TweenLite;
	import com.greensock.easing.*;
	import com.BitmapHitTestPlus;//像素级碰撞检测类
	/**
	 * ...
	 * @author  Linquan Tan
	 * Date 2012.09.04
	 * 这是游戏主文件   此游戏文件还包扩ELinquanTan.as/MlinquanTan.as/ElinquanTan.as/scoreBoard.as
	 * 
	 */
	public class Main_LinquanTan extends MovieClip
	{
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Numbers_dh")]public var Numbers_dh:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Juese_dh")]public var Juese_dh:Class;
		[Embed(source="../动画源文件及其swf/游戏界面.swf#Bianpao_hm")]public var Bianpao_hm:Class;
        [Embed(source = "../动画源文件及其swf/游戏界面.swf#Yuanbao_hm")]public var Yuanbao_hm:Class;
        [Embed(source = "../动画源文件及其swf/游戏界面.swf#Baoshi_hm")]public var Baoshi_hm:Class;
        [Embed(source = "../动画源文件及其swf/游戏界面.swf#Zuanshi_hm")]public var Zuanshi_hm:Class;
        [Embed(source = "../动画源文件及其swf/游戏界面.swf#Qianbi_hm")]public var Qianbi_hm:Class;
        [Embed(source = "../动画源文件及其swf/游戏界面.swf#BianPao_dh")]public var BianPao_dh:Class;
		
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Music_Qianbi")]public var Music_Qianbi:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Music_Fire")]public var Music_Fire:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Music_Huakai")]public var Music_Huakai:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Music_Start")]public var Music_Start:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Music_BG2")]public var Music_BG2:Class;
		[Embed(source = "../动画源文件及其swf/游戏界面.swf#Music_Walk")]public var Music_Walk:Class;
		
		//////////////////////////////////////////////////////////////////////
		//游戏状态
		public static const STATE_START_GAME:int = 10;
		public static const STATE_PLAY:int = 20;
		public static const STATE_END_GAME:int = 30;
		public var gameState:int = 0;
		///////////////////////////////////////////////////////////////////////
		private var youXiJieMian:Object = new MLinquanTan();
		private var kaiShiJieMian:Object = new SLinquanTan();
		private var jieShuJieMian:Object = new ELinquanTan();
		private var jiFen:Object = new ScoreBoard();
		private var numbers_dh:Object;
		private var myPerson:Object ;
		private var bianpao_dh:Object;
		
		
		private var music_qianbi:Sound = new Music_Qianbi();
		private var music_bg2:Sound = new Music_BG2();
		private var music_fire:Sound = new Music_Fire();
		private var music_huakai:Sound = new Music_Huakai();
		private var music_start:Sound = new Music_Start();
		private var music_walk:Sound = new Music_Walk();
		private var sc:SoundChannel;
		private var sc_manmoving:SoundChannel;
		private var isworking:Boolean = false;
		
		
		//是否接受键盘事件
		private var isKey:Boolean = true;
		//是否生成物品
		private var isCreat:Boolean = true;
		private var counter:int = 0;
		//存放物品的数组
        private var objectArr:Array = new Array();
        //物品下落的速度
        private const SPEED:Number =5;
        //同时存在的物品数量
        private const TOTALNUMBER:uint=20;
        //随机数存放器
        private var randomNumber:uint;
        //分数累加器
        public var scoreContainer:int = 0;
        private var timer:Timer = new Timer(1000);
		
		public function Main_LinquanTan() 
		{
			this.addEventListener(Event.ENTER_FRAME, gameLoop);
			
			sc = music_start.play();
			sc.addEventListener(Event.SOUND_COMPLETE,sc_Complete)
			//游戏开始图案添加监听器
			kaiShiJieMian.start_btn.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			//显示游戏欢迎界面
			trace("成功显示游戏欢迎界面");
			addChild(kaiShiJieMian as Sprite);
		}
		
		private function sc_Complete(e:Event):void 
		{
			sc = music_start.play();
			sc.addEventListener(Event.SOUND_COMPLETE,sc_Complete)
		}
		
		//游戏主循环
		public function gameLoop(e:Event):void {
			switch (gameState)
			{
				case STATE_START_GAME :
					 initGame();
					break;
				case STATE_PLAY :
					playGame();
					break;
				case STATE_END_GAME :
					endGame();
					break;
			}
		}
		private function mouseDown(e:MouseEvent):void {
			trace("成功点击开始按钮，初始化游戏界面");
			//移除开始界面
			removeChild(kaiShiJieMian as Sprite);
			sc.stop()
			sc.removeEventListener(Event.SOUND_COMPLETE,sc_Complete)
			music_huakai.play();
			//变更游戏当前状态
			gameState = STATE_START_GAME;
			
		}
		private function mouseDownRepeat(e:MouseEvent):void {
			//移除结束界面
			trace("移除结束界面");
			removeChild(jieShuJieMian as Sprite);
			//变更游戏当前状态
			gameState = STATE_START_GAME;
		}
		private function endGame():void {
			   //给结束画面的财神爷添加鼠标监听
			   jieShuJieMian.caishenye.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownRepeat);
			   if (youXiJieMian.parent) { 
				   trace("移除游戏界面");
			    removeChild(youXiJieMian as Sprite);
			    removeChild(myPerson as MovieClip);
			    removeChild(jiFen as Sprite); 
			    removeChild(bianpao_dh as MovieClip);
				//清空数组容器
				for (var j:int = 0; j < objectArr.length; ) {
				removeChild(objectArr[j] as Sprite);
		        objectArr.splice(j, 1); }
				}
			if (!jieShuJieMian.parent) { 
				trace("结束界面成功显示");
				isKey = false;
			addChild(jieShuJieMian as Sprite);
			}
		}
		private function initGame():void {
			//分数累加器初始化
			scoreContainer = 0;
			isKey = true;
			
			
			
			if (!youXiJieMian.parent) { 
				trace("游戏界面成功显示");
			 myPerson = new Juese_dh();
			 myPerson.x =512;
             myPerson.y = 650;
			 jiFen.score = 0;	
			 jiFen.x = 200;
             jiFen.y = 40;
			 addChild(youXiJieMian as Sprite);
			 
			 addChild(myPerson as MovieClip);
			 addChild(jiFen as Sprite); 
		
			 bianpao_dh = new BianPao_dh();
			 bianpao_dh.width = 80;
			 bianpao_dh.height = 250;
			 bianpao_dh.x = 870;
			 bianpao_dh.y = 152;
			 addChild(bianpao_dh as MovieClip); 
		
			 sc.stop();
			 sc=music_bg2.play();
			 
			 
			 }
			
			 else {
				 trace("切换到游戏过程");
				 //变更游戏状态
				 gameState = STATE_PLAY;}
		}
		private function playGame():void {
			//trace(music_bg2.play());
			//显示分数
			jiFen.score = scoreContainer;
			//各类游戏中执行的函数
			personControl();
			makeObject();
			moveObject();
			testCollision();
		    testForEnd();
		}
		private function testForEnd():void {
			if (bianpao_dh.currentFrame == 720) {
				
				trace("游戏结束条件达成");
				//将游戏分数赋给结束界面予以显示
				jieShuJieMian.fins = scoreContainer;
				//变更游戏状态
				
			    gameState = STATE_END_GAME;
				 }
		}
		//人物控制
		private function personControl():void {
			if(myPerson.currentFrame==10)
			{
				myPerson.gotoAndPlay(1); }
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyBoardPress);
			//stage.addEventListener(KeyboardEvent.KEY_UP, keyBoardUp);
		}
		//键盘响应
	/*	private function keyBoardUp(e:KeyboardEvent):void {
			if(isKey){
	         if (e.keyCode == 37)
	         {trace(music_walk.play());
				 if (music_walk.play()!= null) {
					 trace("!!!!");
					 //sc = music_bg2.play();
					 sc_manmoving.stop();
					 isworking = false;
				 }
	         }
	              if (e.keyCode==39)
	         {
		       if (music_walk.play() != null) {
					 trace("!!!!");
					 //sc = music_bg2.play();
					 sc_manmoving.stop();
					 isworking = false;
				 }
	         }
	               }
		}*/
	    private function keyBoardPress(e:KeyboardEvent):void {
			//isKey用于判断键盘是否响应
	      if(isKey){
	         if (e.keyCode == 37)
	         {
		       if((myPerson.x-myPerson.width/2)>0){
		
		        myPerson.x -=  SPEED * 2;
				// sc.stop();
				if(!isworking){
				sc_manmoving = music_walk.play();
				isworking = true;
				sc_manmoving.addEventListener(Event.SOUND_COMPLETE,soundCompleteHandler)
				}
				 }
	         }
	              if (e.keyCode==39)
	         {
		       if((myPerson.x+myPerson.width/2)<1024){
		
		         myPerson.x +=  SPEED * 2;
				 if(!isworking){
				sc_manmoving = music_walk.play();
				isworking = true;
				sc_manmoving.addEventListener(Event.SOUND_COMPLETE,soundCompleteHandler)
				}}
	         }
	               }
        }
		
		private function soundCompleteHandler(e:Event):void 
		{
			isworking = false;
			sc_manmoving.removeEventListener(Event.SOUND_COMPLETE,soundCompleteHandler);
		}
      //碰撞检测
       private function testCollision():void {
	      
		   timer.addEventListener(TimerEvent.TIMER, timerHander);
		
        for(var j:int=0;j<objectArr.length;j++){
         if(isKey==true&&isCreat==true){
         // if(myPerson.hitTestObject(objectArr[j])){
		 //像素级碰撞检测
		 if(BitmapHitTestPlus.complexHitTestObject(myPerson as DisplayObject,objectArr[j])){
		 
		  var test:String;
		  test = objectArr[j];
	
	    if (test.search(/Zuanshi/i) != -1 || test.search(/Baoshi/i) != -1 || test.search(/Qianbi/i) != -1) {
			
			music_qianbi.play();
			  scoreContainer += 10;
		     removeChild(objectArr[j] as Sprite);
		     objectArr.splice(j,1);
		}
		else if(test.search(/Yuanbao/i) != -1){
	         scoreContainer += 50;
		     removeChild(objectArr[j] as Sprite);
		     objectArr.splice(j,1);
			
		}
		else if (test.search(/Bianpao/i) != -1) { 
			music_fire.play();
		
		      myPerson.gotoAndStop(11);
	
	
		
		      removeChild(objectArr[j] as Sprite);
		      objectArr.splice(j, 1);
		      isKey = false;
		      timer.start();
		}
	
		
	
		
	}
}	
}
}


     private function timerHander(e:TimerEvent):void 
	{
		counter++;
		if (counter == 2) {
			isKey = true;
			timer.stop();
			counter = 0;
			myPerson.gotoAndPlay(1);
			
		}
	}
	
	//控制物品的数量并随机生成物品
private function makeObject():void {
		
         if(objectArr.length<TOTALNUMBER){
	      if(isCreat){	
	      creatRandomObject();}
		
	    }   
    }

//物品下落
private function moveObject():void {
	for(var i:int=0;i<objectArr.length;i++){
		
		 var test:String;
		test = objectArr[i];
	
	 //不同物品赋予不同的下落速度
	    if (test.search(/Zuanshi/i) != -1 || test.search(/Baoshi/i) != -1 || test.search(/Qianbi/i) != -1) {
			objectArr[i].y += SPEED;
		
		}
		else if(test.search(/Yuanbao/i) != -1){
	     objectArr[i].y += 2*SPEED;
			
		}
		else if (test.search(/Bianpao/i) != -1) { 
		objectArr[i].y += 0.5 * SPEED;
		TweenLite.to(objectArr[i], 15, { rotation:Math.random() * 150 + 360, ease:Back.easeOut } );
		
		}
		 
		 
		 
		 
		 
		 
		// TweenLite.to(objectArr[i],15,{rotation:Math.random()*150+360,ease:Back.easeOut})
		// objectArr[i].rotation +=Math.random()* 3;
        
		
	//边界摧毁检测
	    if (objectArr[i].y >= 768) { 	
			
		  removeChild(objectArr[i] as Sprite);
		  objectArr.splice(i,1);
	  }
	}
}
//各类物品的单独生成函数
private function creatBianpao():void{
	var newBianpao:Object = new Bianpao_hm();
	
	//物品显示
	newBianpao.x = Math.random()*900+50;
	newBianpao.y = Math.random()*(-400);
	addChild(newBianpao as Sprite);
	objectArr.push(newBianpao );
	
	
}
private function creatYuanBao():void{
	var newYuanbao:Object = new Yuanbao_hm();
	//物品显示
	
	newYuanbao.x = Math.random()*900+50;
	newYuanbao.y = Math.random() * ( -400);
	newYuanbao.width = 120;
	newYuanbao.height = 80;
	addChild(newYuanbao as Sprite);
	objectArr.push(newYuanbao);
	
}
private function creatZuanshi():void{
	var newZuanshi:Object = new Zuanshi_hm();
	//物品显示
	
	newZuanshi.x = Math.random()*900+50;
	newZuanshi.y = Math.random()*(-400);
	addChild(newZuanshi as Sprite);
	objectArr.push(newZuanshi);
}
private function creatQianbi():void{
	var newQianbi:Object = new Qianbi_hm();
	//物品显示
	
	newQianbi.x = Math.random()*900+50;
	newQianbi.y = Math.random()*(-400);
	addChild(newQianbi as Sprite);
	objectArr.push(newQianbi);
	
}
private function creatBaoshi():void{
	var newBaoshi:Object = new Baoshi_hm();
	//物品显示
	
	newBaoshi.x = Math.random()*900+50;
	newBaoshi.y = Math.random()*(-400);
	addChild(newBaoshi as Sprite);
	objectArr.push(newBaoshi);
	
}
//随即生成物品
private function creatRandomObject():void{
	randomNumber=uint(Math.random()*20+1);

	if (randomNumber <=3) {
		creatYuanBao();
		
	}
	else if(randomNumber==5||randomNumber==4){
		creatBianpao();
		
	}
	else { 
	creatQianbi();
	creatZuanshi();
	creatBaoshi();
	}
		
	}
	}

}