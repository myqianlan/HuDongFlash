package  
{
	import flash.display.MovieClip;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.*;
	/**
	 * ...
	 * @author Linquan Tan
	 * @date 2012.08.28
	 */
	public class ScoreBoard extends MovieClip
	{
		public var score:int = 0;
		private var SCORE:int;
		private var nowScore:TextField = new TextField();
		private var format:TextFormat = new TextFormat();

		public function ScoreBoard() 
		{
			init();

		}
		public function init():void {
			SCORE = score;
			format.size = 50;
			format.bold = true;
			format.color = 0x990000;
			nowScore.width = 300;
			

			

			nowScore.defaultTextFormat = format;
			addChild(nowScore);
			nowScore.text = String(SCORE);
			this.addEventListener(Event.ENTER_FRAME,changeScore);
		}
		private function changeScore(e:Event):void
		{
			if ((SCORE != score))
			{
				SCORE = score;
				nowScore.text = String(SCORE);
			}

		}
	}

}