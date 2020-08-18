package com.ajana.event
{
	import flash.events.Event;

	public class KillWindowEvent extends Event
	{
		public static var KILL_WINDOW:String="KILL_WINDOW";
		private var classToKill:String;
		
		public function KillWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		
		public function set className(classname:String):void {
			classToKill=classname;
		}		
		
		public function get className():String {
			return classToKill;
		}
	}
}