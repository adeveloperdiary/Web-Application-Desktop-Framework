package com.ajana.event
{
	import flash.events.Event;

	public class TaskbarRightClickEvent extends Event
	{
		
		public static var TASKBAR_RIGHT_CLICK:String="TASKBAR_RIGHT_CLICK";
		private var iCount:int;
		
		public function TaskbarRightClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function set pos(iCount:int):void {
			this.iCount=iCount;
		}		
		
		public function get pos():int {
			return iCount;
		}
		
	}
}