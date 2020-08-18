
package com.ajana.panel {
	import com.ajana.event.ApplicationClickEvent;
	import com.ajana.event.ApplicationCloseEvent;
	import com.ajana.event.ApplicationMinimizeEvent;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.system.System;
	
	import mx.containers.Panel;
	import mx.controls.Alert;
	import mx.controls.Button;
	import mx.core.Application;
	import mx.core.UIComponent;
	import mx.effects.Fade;
	import mx.effects.Move;
	import mx.effects.Parallel;
	import mx.effects.Resize;
	import mx.effects.Zoom;
	import mx.events.DragEvent;
	import mx.events.EffectEvent;
	import mx.managers.CursorManager;
	
	public class PanelWindow extends Panel {
		[Bindable] public var showClose:Boolean = true;
		
		[Bindable] public var showMax:Boolean = true;
		[Bindable] public var showMin:Boolean = true;
		
		[Bindable] public var enableResize:Boolean = false;
		
		[Bindable] public var bVisible:Boolean=new Boolean(true);
		
		[Bindable] public var enableZoom:Boolean = false;
		
		[Bindable] public var singleInstance:Boolean = false;
				
		[Embed(source="/assets/resizeCursor.png")]
		private static var resizeCursor:Class;
		
		private var	pTitleBar:UIComponent;
		public var oW:Number;
		public var oH:Number;
		public var oX:Number;
		public var oY:Number;
		private var normalMaxButton:Button	= new Button();
		private var closeButton:Button		= new Button();
		private var resizeHandler:Button	= new Button();
		private var minimizeButton:Button	= new Button();
		
		private var zoomInButton:Button		= new Button();
		private var zoomOutButton:Button	= new Button();
		
		private var oPoint:Point 			= new Point();
		private var resizeCur:Number		= 0;
		
		public var posInSideBar:int=0;
		public var zoom:Number=1.0;
		
		public var zoomObj:Zoom=new Zoom(this);
		
		public var strTitle:String;
		public var originalTitle:String;
				
		public function SuperPanel() {}

		override protected function createChildren():void {
			super.createChildren();
			this.pTitleBar = super.titleBar;
			
			this.doubleClickEnabled = true;
			
			if (enableResize) {
				this.resizeHandler.width     = 13;
				this.resizeHandler.height    = 13;
				this.resizeHandler.styleName = "resize";
				this.rawChildren.addChild(resizeHandler);
				this.initPos();
			}
			
			if(showMin) {
				this.minimizeButton.width     	= 21;
				this.minimizeButton.height    	= 21;
				this.minimizeButton.styleName 	= "minimizeButton";

				this.pTitleBar.addChild(this.minimizeButton);
			}
			
			if(showMax) {
				this.normalMaxButton.width     	= 21;
				this.normalMaxButton.height    	= 21;
				this.normalMaxButton.styleName 	= "maximizeButton";

				this.pTitleBar.addChild(this.normalMaxButton);
			}
			
			if (showClose) {
				this.closeButton.width     		= 21;
				this.closeButton.height    		= 21;
				this.closeButton.styleName 		= "closeButton";

				this.pTitleBar.addChild(this.closeButton);
			}
			
			if(enableZoom) {
				this.zoomInButton.width     		= 21;
				this.zoomInButton.height    		= 21;
				this.zoomInButton.styleName 		= "zoominButton";
				
				this.pTitleBar.addChild(this.zoomInButton);
				
				this.zoomOutButton.width     		= 21;
				this.zoomOutButton.height    		= 21;
				this.zoomOutButton.styleName 		= "zoomoutButton";
				
				this.pTitleBar.addChild(this.zoomOutButton);
			}
			
			
			this.positionChildren();	
			this.addListeners();
			
			strTitle=this.title;
			originalTitle=this.title;;
		}
		
		public function initPos():void {
			this.oW = this.width;
			this.oH = this.height;
			this.oX = this.x;
			this.oY = this.y;
		}
	
		public function positionChildren():void {
			
			var x:int=0;
			var offset:int=8;
			
			if(showClose) {
				
				x=this.closeButton.width;
				
				this.closeButton.buttonMode	   = true;
				this.closeButton.useHandCursor = true;
				this.closeButton.x = this.unscaledWidth - this.closeButton.width - offset;
				this.closeButton.y = 4;
			}
			
			if(showMax) {
				
				this.normalMaxButton.buttonMode    = true;
				this.normalMaxButton.useHandCursor = true;
				this.normalMaxButton.x = this.unscaledWidth - this.normalMaxButton.width - offset - x;
				this.normalMaxButton.y = 4;
				
				x=x+this.normalMaxButton.width;
			}
			
			
			if (showMin) {
				this.minimizeButton.buttonMode    = true;
				this.minimizeButton.useHandCursor = true;
				this.minimizeButton.x = this.unscaledWidth - this.minimizeButton.width - offset - x;
				this.minimizeButton.y = 4;
				
				x=x+this.minimizeButton.width;
			}
			
			if(enableZoom) {
				x=x+10;
				
				this.zoomInButton.buttonMode    = true;
				this.zoomInButton.useHandCursor = true;
				this.zoomInButton.x = this.unscaledWidth - this.zoomInButton.width - offset - x;
				this.zoomInButton.y = 4;
				
				x=x+this.zoomInButton.width;
				
				this.zoomOutButton.buttonMode    = true;
				this.zoomOutButton.useHandCursor = true;
				this.zoomOutButton.x = this.unscaledWidth - this.zoomOutButton.width - offset - x;
				this.zoomOutButton.y = 4;
				
			}
			
			
			if (enableResize) {
				this.resizeHandler.y = this.unscaledHeight - resizeHandler.height - 1;
				this.resizeHandler.x = this.unscaledWidth - resizeHandler.width - 1;
			}
		}
		
		public function addListeners():void {
			this.addEventListener(MouseEvent.CLICK, panelClickHandler);
			this.pTitleBar.addEventListener(MouseEvent.MOUSE_DOWN, titleBarDownHandler);
			this.pTitleBar.addEventListener(MouseEvent.DOUBLE_CLICK, titleBarDoubleClickHandler);
			
			if (showMin) {
				this.minimizeButton.addEventListener(MouseEvent.CLICK, minimizeClickHandler);
			}
			
			if(showMax) {
				this.normalMaxButton.addEventListener(MouseEvent.CLICK, normalMaxClickHandler);
			}
			
			if(showClose) {
				this.closeButton.addEventListener(MouseEvent.CLICK, closeClickHandler);
			}
			
			if(enableZoom){
				this.zoomInButton.addEventListener(MouseEvent.CLICK, zoomInClickHandler);
				this.zoomOutButton.addEventListener(MouseEvent.CLICK, zoomOutClickHandler);
					
			}
			
			
			if (enableResize) {
				this.resizeHandler.addEventListener(MouseEvent.MOUSE_OVER, resizeOverHandler);
				this.resizeHandler.addEventListener(MouseEvent.MOUSE_OUT, resizeOutHandler);
				this.resizeHandler.addEventListener(MouseEvent.MOUSE_DOWN, resizeDownHandler);
			}
		}
		
		
		public function zoomInClickHandler(event:MouseEvent):void {
			zoom=zoom+0.1;
			
			if(enableZoom)
				this.title=strTitle+" - "+(int)(zoom*100)+"%";
			zoomObj.duration=100;
			zoomObj.zoomHeightTo=zoom;
			zoomObj.zoomWidthTo=zoom;
			zoomObj.target=this;
			zoomObj.play();
		}
		
		public function zoomOutClickHandler(event:MouseEvent):void {
			zoom=zoom-0.1;
			
			if(enableZoom)
				this.title=strTitle+" - "+(int)(zoom*100)+"%";
			
			
			zoomObj.duration=100;
			zoomObj.zoomHeightTo=zoom;
			zoomObj.zoomWidthTo=zoom;
			zoomObj.target=this;
			zoomObj.play();
		}
		
		public function minimizeClickHandler(event:MouseEvent):void {
			var minimizeEvent:ApplicationMinimizeEvent=new ApplicationMinimizeEvent(ApplicationMinimizeEvent.MINIMIZE_WINDOW,true);
			minimizeEvent.windowObject=this;
		
			dispatchEvent(minimizeEvent);
			this.bVisible=false;
		}
		
		public function panelClickHandler(event:MouseEvent):void {
			if(this.bVisible==true) {
				if(this!=null && this.parent!=null)
				{
					this.pTitleBar.removeEventListener(MouseEvent.MOUSE_MOVE, titleBarMoveHandler);
					this.parent.setChildIndex(this, this.parent.numChildren - 1);
					this.panelFocusCheckHandler();
				
					var clickEvent:ApplicationClickEvent=new ApplicationClickEvent(ApplicationClickEvent.CLICK_WINDOW,true);
					clickEvent.windowObject=this;
		
					dispatchEvent(clickEvent);
				}
			}
		}
		
		
		
		public function titleBarDownHandler(event:MouseEvent):void {
			this.pTitleBar.addEventListener(MouseEvent.MOUSE_MOVE, titleBarMoveHandler);
		}
			
		public function titleBarMoveHandler(event:MouseEvent):void {
			if (this.width < screen.width) {
				Application.application.parent.addEventListener(MouseEvent.MOUSE_UP, titleBarDragDropHandler);
				this.pTitleBar.addEventListener(DragEvent.DRAG_DROP,titleBarDragDropHandler);
				this.parent.setChildIndex(this, this.parent.numChildren - 1);
				this.panelFocusCheckHandler();
				this.alpha = 0.1;
				this.startDrag(false, new Rectangle(0, 0, screen.width - this.width, screen.height - this.height));
			}
		}
		
		public function titleBarDragDropHandler(event:MouseEvent):void {
			this.pTitleBar.removeEventListener(MouseEvent.MOUSE_MOVE, titleBarMoveHandler);
			this.alpha = 1.0;
			this.stopDrag();
		}
		
		public function panelFocusCheckHandler():void {
			for (var i:int = 0; i < this.parent.numChildren; i++) {
				var child:UIComponent = UIComponent(this.parent.getChildAt(i));
				if (this.parent.getChildIndex(child) < this.parent.numChildren - 1) {
				} else if (this.parent.getChildIndex(child) == this.parent.numChildren - 1) {
				}
			}
		}
		
		public function titleBarDoubleClickHandler(event:MouseEvent):void {
			this.pTitleBar.removeEventListener(MouseEvent.MOUSE_MOVE, titleBarMoveHandler);
			Application.application.parent.removeEventListener(MouseEvent.MOUSE_UP, resizeUpHandler);
			normalMaxClickHandler(event);
		}
						
		public function endEffectEventHandler(event:EffectEvent):void {
			this.resizeHandler.visible = true;
		}

		public function normalMaxClickHandler(event:MouseEvent):void {
			
			if (this.normalMaxButton.styleName == "maximizeButton") {
				if (this.height > 28) {
					this.initPos();
					normalMaxButton.visible=false;
					closeButton.visible=false;
					resizeHandler.visible=false;
					minimizeButton.visible=false;
		
					zoomInButton.visible=false;
					zoomOutButton.visible=false;
					
					var animate:Parallel=new Parallel(this);
					animate.duration=0;
					
					var _move:Move=new Move();
					_move.target=this;
					_move.xFrom = this.x;
					_move.yFrom = this.y;
					_move.xTo = 0;
					_move.yTo = 0;
					
					animate.addChild(_move);
					
					var _resize:Resize=new Resize();
					_resize.target=this;
					_resize.widthFrom = this.width;
					_resize.heightFrom = this.height;
					
					_resize.widthTo = parent.width;
					_resize.heightTo = parent.height-52;
					
					animate.addChild(_resize);
					animate.addEventListener(EffectEvent.EFFECT_END,positionIcons);
					animate.play([_resize, _move]);

					this.normalMaxButton.styleName = "restoreButton";
				}
			} else {
				
				var animate:Parallel=new Parallel(this);
				animate.duration=300;
				
				var _move:Move=new Move();
				_move.target=this;
				_move.xFrom = this.x;
				_move.yFrom = this.y;
				_move.xTo = this.oX;
				_move.yTo = this.oY;
				
				animate.addChild(_move);
				
				var _resize:Resize=new Resize();
				_resize.target=this;
				_resize.widthFrom = this.width;
				_resize.heightFrom = this.height;
				
				_resize.widthTo = this.oW;
				_resize.heightTo = this.oH;
				
				animate.addChild(_resize);
				animate.addEventListener(EffectEvent.EFFECT_END,positionIcons);
				animate.play([_resize, _move]);

				this.normalMaxButton.styleName = "maximizeButton";
				
			}
		}
		
		private function positionIcons(event:EffectEvent){
			if(event.type==EffectEvent.EFFECT_END) {
				this.positionChildren();
				normalMaxButton.visible=true;
				closeButton.visible=true;
				resizeHandler.visible=true;
				minimizeButton.visible=true;
		
				zoomInButton.visible=true;
				zoomOutButton.visible=true;
			}	
		}
		
		
		public function closeClickHandler(event:MouseEvent):void {
			try {
				
				// Closing Effect
				var parallel:Parallel=new Parallel(this);
				
				var zoom:Zoom=new Zoom();
				zoom.zoomHeightTo=0.0;
				zoom.zoomWidthTo=0.0;
				zoom.duration=500;
				
				parallel.addChild(zoom);
				
				var fade:Fade=new Fade();
				fade.alphaTo=0.0;
				fade.duration=500;
				
				parallel.addChild(fade);
				
				parallel.target=this;
				parallel.addEventListener(EffectEvent.EFFECT_END,closeWindowEvent);
				parallel.play();
				
				
				
				
												
			}catch(e:Error) {
				Alert.show(e.message);
			}
		}
		
		
		private function closeWindowEvent(event:EffectEvent){
			if(event.type==EffectEvent.EFFECT_END) {
				var click:MouseEvent=new MouseEvent(MouseEvent.CLICK);
				try {
					//remove the listeners
					this.removeEventListener(MouseEvent.CLICK, panelClickHandler);
					dispatchEvent(click);
					
					//dispatch close event to parent
					var closeEvent:ApplicationCloseEvent=new ApplicationCloseEvent(ApplicationCloseEvent.CLOSE_WINDOW,true);
					closeEvent.windowObject=this;
					dispatchEvent(closeEvent);
					
					//remove the window
					this.parent.removeChild(this);
					click.stopImmediatePropagation();
					flash.system.System.gc();		
				}catch(e:Error) {
				//Alert.show(e.message);
				}
			}
		}
		
		public function resizeOverHandler(event:MouseEvent):void {
			
			this.resizeCur = CursorManager.setCursor(resizeCursor);
		}
		
		public function resizeOutHandler(event:MouseEvent):void {
			CursorManager.removeCursor(CursorManager.currentCursorID);
		}
		
		public function resizeDownHandler(event:MouseEvent):void {
			Application.application.parent.addEventListener(MouseEvent.MOUSE_MOVE, resizeMoveHandler);
			Application.application.parent.addEventListener(MouseEvent.MOUSE_UP, resizeUpHandler);
			this.resizeHandler.addEventListener(MouseEvent.MOUSE_OVER, resizeOverHandler);
			this.panelClickHandler(event);
			this.resizeCur = CursorManager.setCursor(resizeCursor);
			this.oPoint.x = mouseX;
			this.oPoint.y = mouseY;
			this.oPoint = this.localToGlobal(oPoint);		
		}
		
		public function resizeMoveHandler(event:MouseEvent):void {
			this.stopDragging();

			var xPlus:Number = Application.application.parent.mouseX - this.oPoint.x;			
			var yPlus:Number = Application.application.parent.mouseY - this.oPoint.y;
			
			if (this.oW + xPlus > 140) {
				this.width = this.oW + xPlus;
			}
			
			if (this.oH + yPlus > 80) {
				this.height = this.oH + yPlus;
			}
			this.positionChildren();
		}
		
		public function resizeUpHandler(event:MouseEvent):void {
			Application.application.parent.removeEventListener(MouseEvent.MOUSE_MOVE, resizeMoveHandler);
			Application.application.parent.removeEventListener(MouseEvent.MOUSE_UP, resizeUpHandler);
			CursorManager.removeCursor(CursorManager.currentCursorID);
			this.resizeHandler.addEventListener(MouseEvent.MOUSE_OVER, resizeOverHandler);
			this.initPos();
		}
		
		public function setData(obj:Object):void {
			
		}
		
	}
	
	
}