package com
{
	public class ChartData
	{
		
		public function ChartData(var1:String,var2:String)
		{
			_someVar=var1;
			_someVar1=var2;
		}
		
		private var _someVar:String;
		private var _someVar1:String;
	
	    public function get someVar():String {
	       return _someVar;
	    }
	
	    public function set someVar(newValue:String):void {
	       // do necessary checks for valid value
	       _someVar = newValue;
	    }
	    
	   	public function get someVar1():String {
	       return _someVar1;
	    }
	
	    public function set someVar1(newValue:String):void {
	       // do necessary checks for valid value
	       _someVar1 = newValue;
	    }
		
		public function setLabel(label:String):void {
			_someVar1=label;
		}
		
		public function setCount(label:String):void {
			_someVar=label;
		}
		
		public function getLabel(label:String):String {
			return _someVar1;
		}
		
		public function getCount(label:String):String {
			return _someVar;
		}
		
	}
}