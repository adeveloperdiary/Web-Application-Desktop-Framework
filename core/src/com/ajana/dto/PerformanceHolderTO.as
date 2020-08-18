package com.ajana.dto
{
	public class PerformanceHolderTO
	{
		private var iTime:int=0;
		private var iMemory:Number=0;
		
		public function PerformanceHolderTO(time:int,memory:Number)
		{
			iTime=time;
			iMemory=memory;
			
		}
		
		public function get time():int {
			return iTime;
		}
		
		public function set time(time:int):void {
			this.iTime=time;
		}
		
		public function get memory():Number {
			return iMemory;
		}
		
		public function set memory(memory:Number):void {
			this.iMemory=memory;
		}
	}
}