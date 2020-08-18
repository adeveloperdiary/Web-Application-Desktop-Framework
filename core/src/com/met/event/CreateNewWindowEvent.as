package com.met.event
{
	import flash.events.Event;

	public class CreateNewWindowEvent extends Event
	{
		private var classToLoad:String;
		public static var CREATE_WINDOW:String="CREATE_WINDOW";
		private var objectToPass:Object;
		
		public function CreateNewWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		public function set className(classname:String):void {
			classToLoad=classname;
		}		
		
		public function get className():String {
			return classToLoad;
		}
		
		public function set object(obj:Object):void {
			objectToPass=obj;
		}		
		
		public function get object():Object {
			return objectToPass;
		}
		
	}
}