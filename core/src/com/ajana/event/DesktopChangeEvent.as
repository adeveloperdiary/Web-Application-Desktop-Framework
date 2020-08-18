package com.ajana.event
{
	import flash.events.Event;

	public class DesktopChangeEvent extends Event
	{
		private var iSelectedNumber:int;
		public static var DESKTOP_CHANGE:String="DESKTOP_CHANGE";
		
		public function DesktopChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function set desktopNumber(i:int):void {
			iSelectedNumber=i;
		}		
		
		public function get desktopNumber():int {
			return iSelectedNumber;
		}
		
	}
}