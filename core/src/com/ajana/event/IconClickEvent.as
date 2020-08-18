package com.ajana.event
{
	import flash.events.Event;

	public class IconClickEvent extends Event
	{
		private var strAppName:String;
		private var object:Object;
		public static var ICON_CLICK:String="ICON_CLICK";
		
		
		public function IconClickEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function set applicationName(obj:String):void {
			strAppName=obj;
		}		
		
		public function get applicationName():String {
			return strAppName;
		}
		
	}
}