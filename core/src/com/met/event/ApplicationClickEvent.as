package com.met.event
{
	import flash.events.Event;

	public class ApplicationClickEvent extends Event
	{
		private var object:Object;
		public static var CLICK_WINDOW:String="CLICK_WINDOW";
		
		public function ApplicationClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
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