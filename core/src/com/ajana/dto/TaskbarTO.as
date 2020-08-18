package com.ajana.dto
{
	public class TaskbarTO
	{
		private var strName:String=new String();
		private var strAlpha:String=new String();
		private var strColor:String=new String();
		private var strID:String=new String();
		
		public function TaskbarTO(strName:String,strAlpha:String,strColor:String,strID:String)
		{
			this.strName=strName;
			this.strAlpha=strAlpha;
			this.strColor=strColor;
			this.strID=strID;
		}
		
		public function get name():String {
			return strName;
		}
		
		public function get alpha():String {
			return strAlpha;
		}
		
		public function set name(strName:String):void {
			this.strName=strName;
		}
		
		public function set alpha(strAlpha:String):void {
			this.strAlpha=strAlpha;
		}
		
		public function get color():String {
			return strColor;
		}
		
		public function set color(strColor:String):void {
			this.strColor=strColor;
		}
		
		public function get iCount():String {
			return strID;
		}
		
		public function set iCount(strID:String):void {
			this.strID=strID;
		}
		
	}
}