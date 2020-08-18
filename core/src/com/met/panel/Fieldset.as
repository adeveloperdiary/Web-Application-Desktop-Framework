package com.met.panel
{
	import mx.containers.Panel;
	import mx.controls.Label;
	import mx.core.UIComponent;
	import mx.core.UITextField;

	public class Fieldset extends Panel {
		
		private var pTitleBar:UIComponent;
		private var t:UITextField = new UITextField();
		public var fieldsetLabel:String="";
		
		public function Fieldset() {
		}
		
			override protected function createChildren():void {
			super.createChildren();
			this.pTitleBar = super.titleBar;
			t.text = fieldsetLabel;
			t.background = true;
			t.backgroundColor = 0xD4D0C8;
			t.x=2;
			t.height=t.textHeight+2;
			t.width=t.textWidth+30;
			this.pTitleBar.addChild(t);
		
		}
	
	}
}