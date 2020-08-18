package com.ajana.event
{
	import flash.events.Event;

	public class ApplicationCloseEvent extends Event
	{
		private var object:Object;
		public static var CLOSE_WINDOW:String="CLOSE_WINDOW";
		
		public function ApplicationCloseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
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