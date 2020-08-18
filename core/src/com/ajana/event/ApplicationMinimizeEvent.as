package com.ajana.event
{
	import flash.events.Event;

	public class ApplicationMinimizeEvent extends Event
	{
		private var object:Object;
		public static var MINIMIZE_WINDOW:String="MINIMIZE_WINDOW";
		
		public function ApplicationMinimizeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function set windowObject(obj:Object):void {
			object=obj;
		}		
		
		public function get windowObject():Object {
			return object;
		}
		
	}
}