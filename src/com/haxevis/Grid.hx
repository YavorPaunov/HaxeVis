package com.haxevis;

import flash.display.Sprite;
import flash.errors.Error;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

using com.haxevis.DataSetItem;
/**
 * ...
 * @author Yavor
 */

typedef GridGraphicsElement = {
	thickness:Float,
	alpha:Float,
	color:Int
}

typedef GridGraphics = {
	ticks: GridGraphicsElement,
	gridlines: GridGraphicsElement,
	axislines: GridGraphicsElement,
	borders: GridGraphicsElement
}

enum LabelPosition {
	axis;
	point;
}

enum LabelText {
	value;
	name;
}

enum LabelRelativePosition {
	top;
	bottom;
	left;
	right;
	center;
	dist(x:Int, y:Int);
}
	
class Grid extends Chart {
		
	private var ticksXArea:Sprite;
	private var ticksYArea:Sprite;
	
	public var gridGraphics:GridGraphics;
	
	@:isVar public var ticksX(default, set):Array<Float>;
	
	function set_ticksX(value:Array<Float>):Array<Float> {
		if (autoRedraw) {
			draw();
		}
		return this.ticksX = value;
	}
	
	@:isVar public var ticksY(default, set):Array<Float>;
	
	function set_ticksY(value:Array<Float>):Array<Float> {
		if (autoRedraw) {
			draw();
		}
		return this.ticksY = value;
	}
	
	@:isVar public var autoTicks(default, set):Bool;
	
	function set_autoTicks(value:Bool):Bool {
		if (value) {
			calculateTicks();
		}
		return this.autoTicks = value;
	}
	
	@:isVar public var lineX(default, set):Float;
	
	function set_lineX(value:Float):Float {
		if (autoRedraw) {
			draw();
		}
		return this.lineX = value;
	}
	
	@:isVar public var lineY(default, set):Float;
	
	function set_lineY(value:Float):Float {
		if (autoRedraw) {
			draw();
		}
		return this.lineY = value;
	}
	
	@:isVar public var xTop(default, set):Float;
	
	function set_xTop(value:Float):Float {
		this.xTop = value;
		if (this.xTop < this.xBottom) {
			throw new Error("Top x cannot be lower than bottom x.");
		}
		if(autoRedraw) {
			draw();
		}
		return this.xTop;
	}
	
	@:isVar public var xBottom(default, set):Float;
	
	function set_xBottom(value:Float):Float {
		this.xBottom = value;
		if(autoRedraw) {
			draw();
		}
		return this.xBottom;
	}
		
	@:isVar public var yTop(default, set):Float;
	
	function set_yTop(value:Float):Float {
		this.yTop = value;
		if (this.yTop < this.yBottom) {
			throw new Error("Top y cannot be lower than bottom y.");			
		}
		if(autoRedraw) {
			draw();
		}
		return this.yTop;
	}
	
	@:isVar public var yBottom(default, set):Float;
	
	function set_yBottom(value:Float):Float {
		this.yBottom = value;
		if (this.yTop < this.yBottom) {
			throw new Error("Top y cannot be lower than bottom y.");			
		}
		if(autoRedraw) {
			draw();
		}
		return this.yBottom;
	}
			
	@:isVar public var showLabelsY(default, set):Bool;
	
	function set_showLabelsY(value:Bool):Bool {
		this.showLabelsY = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.showLabelsY;
	}
	
	@:isVar public var showLabelsX(default, set):Bool;
	
	function set_showLabelsX(value:Bool):Bool {
		this.showLabelsX = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.showLabelsX;
	}
	
	@:isVar public var showTicksY(default, set):Bool;
	
	function set_showTicksY(value:Bool):Bool {
		this.showTicksY = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.showTicksY;
	}
	
	@:isVar public var showTicksX(default, set):Bool;
	
	function set_showTicksX(value:Bool):Bool {
		this.showTicksX = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.showTicksX;
	}
	
	@:isVar public var xLabelPosition(default, set):LabelPosition;
	
	function set_xLabelPosition(value:LabelPosition):LabelPosition {
		this.xLabelPosition = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.xLabelPosition;
	}
	
	@:isVar public var yLabelPosition(default, set):LabelPosition;
	
	function set_yLabelPosition(value:LabelPosition):LabelPosition {
		this.yLabelPosition = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.yLabelPosition;
	}
	
	@:isVar public var xLabelText(default, set):LabelText;
	
	function set_xLabelText(value:LabelText):LabelText {
		this.xLabelText = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.xLabelText;
	}
	
	@:isVar public var yLabelText(default, set):LabelText;
	
	function set_yLabelText(value:LabelText):LabelText {
		this.yLabelText = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.yLabelText;
	}
	
	@:isVar public var autoLimits(default, set):Bool;
	
	function set_autoLimits(value:Bool):Bool {
		this.autoLimits = value;
		if (this.autoLimits && this.autoRedraw) {
			draw();
		}
		return this.autoLimits;
	}
	
	private var ratio:Point;
	
	public function new(w:Float, h:Float) {
		super();
		
		cacheAsBitmap = true;
		
		this.w = w;
		this.h = h;
		
		// Establish default behaviour
		this.autoTicks = false;
				
		this.lineX = 0;
		this.lineY = 0;
		
		this.ticksX = [];
		this.ticksY = [];
		
		this.gridGraphics = {
			ticks: {
				thickness:0,
				alpha:0,
				color:0xAAAAAA
			},
			
			gridlines: {
				thickness:0,
				alpha:0,
				color:0xDEDEDE
			},
			
			axislines: {
				thickness:0,
				alpha:0,
				color:0x121212
			},
			
			borders: {
				thickness:0,
				alpha:0,
				color:0x9A9A9A
			}
		}
		
		this.ticksXArea = new Sprite();
		this.ticksYArea = new Sprite();
		
		this.showLabelsY = false;
		this.showLabelsX = false;
		
		this.showTicksX = true;
		this.showTicksY = true;
		
		this.xLabelPosition = LabelPosition.axis;
		this.yLabelPosition = LabelPosition.axis;
		
		this.xLabelText = LabelText.name;
		this.yLabelText = LabelText.name;
		
		this.autoLimits = true;
	}
	
	override private function draw():Void {
		super.draw();
		
		
		var xDif:Float = this.xTop - this.xBottom;
		var yDif:Float = this.yTop - this.yBottom;

		var xRatio:Float = this.w / xDif;
		var yRatio:Float = this.h / yDif;

		this.ratio = new Point(xRatio, yRatio);
		
		var xZeroPos:Float;
		if (this.xBottom < 0) {
			xZeroPos = this.paddingLeft - this.xBottom * xRatio;
		} else {
			xZeroPos = this.paddingLeft;
		}

		var yZeroPos:Float;
		if (this.yBottom < 0) {
			yZeroPos = this.paddingTop + h + this.yBottom * yRatio;
		} else {
			yZeroPos = this.paddingTop + h;
		}
		
		
		for (tickX in this.ticksX) {
			var targetX:Float = tickX * this.ratio.x + xZeroPos; 
			var targetY:Float;
			targetY = this.paddingTop + h; //yZeroPos - lineY * this.ratio.y;
			
			// Add ticks			
			graphics.lineStyle(gridGraphics.ticks.thickness, gridGraphics.ticks.color, gridGraphics.ticks.alpha);
			graphics.moveTo(targetX, targetY);
			graphics.lineTo(targetX, targetY+4);
						
			graphics.lineStyle(gridGraphics.gridlines.thickness, gridGraphics.gridlines.color, gridGraphics.gridlines.alpha);
			graphics.moveTo(targetX, this.paddingTop);
			graphics.lineTo(targetX, this.paddingTop + h);
			
			graphics.lineStyle();
			if(this.showTicksX) {
				var valueStringRaw:String = Std.string(tickX);
				var floatingPointIndex:Int = valueStringRaw.indexOf(".");
				var valueString:String;

				if(floatingPointIndex >= 0){
					valueString = valueStringRaw.substr(0, floatingPointIndex + 3);
				} else {
					valueString = valueStringRaw;
				}
				
				var valueField:TextField = new TextField();
				valueField.selectable = false;
				valueField.text = valueString;
				valueField.autoSize = TextFieldAutoSize.LEFT;
				valueField.x = targetX - valueField.width / 2;
				valueField.y = targetY + 2;
				addChild(valueField);
			
			}
		}
		
		
		for (tickY in this.ticksY) {
			var targetX:Float;
			
			targetX = this.paddingLeft; //xZeroPos + lineX * this.ratio.x;
			
			// Add ticks
			var targetY:Float = yZeroPos - tickY * this.ratio.y;
			
			graphics.lineStyle(gridGraphics.ticks.thickness, gridGraphics.ticks.color, gridGraphics.ticks.alpha);
			graphics.moveTo(targetX, targetY);
			graphics.lineTo(targetX-4, targetY);
			graphics.lineStyle();
			
			graphics.lineStyle(gridGraphics.gridlines.thickness, gridGraphics.gridlines.color, gridGraphics.gridlines.alpha);
			graphics.moveTo(this.paddingLeft, targetY);
			graphics.lineTo(this.paddingLeft + w, targetY);
			
			if(showTicksY) {
				var valueString:String;
				var valueStringRaw:String = Std.string(tickY);
				var floatingPointIndex:Int = valueStringRaw.indexOf(".");
				if(floatingPointIndex >= 0){
					valueString = valueStringRaw.substr(0, floatingPointIndex + 3);
				} else {
					valueString = valueStringRaw;
				}
				
				var valueField:TextField = new TextField();
				valueField.selectable = false;
				
				valueField.text = valueString;
				valueField.autoSize = TextFieldAutoSize.LEFT;
				valueField.x = targetX - valueField.width - 5;
				valueField.y = targetY - valueField.height / 2;
				addChild(valueField);
			}
		}
		
		graphics.endFill();
		
		graphics.lineStyle(gridGraphics.axislines.thickness, gridGraphics.axislines.color, gridGraphics.axislines.alpha);
		
		graphics.moveTo(xZeroPos + lineX * this.ratio.x, this.paddingTop);
		graphics.lineTo(xZeroPos + lineX * this.ratio.x, this.paddingTop + h);
		
		graphics.moveTo(this.paddingLeft, yZeroPos - lineY * this.ratio.y);
		graphics.lineTo(this.paddingTop + w, yZeroPos - lineY * this.ratio.y);
		
		// Draw borders
		graphics.lineStyle(gridGraphics.borders.thickness, gridGraphics.borders.color, gridGraphics.borders.alpha);
		graphics.drawRect(0, 0, w + this.paddingRight + this.paddingLeft, h + this.paddingBottom + this.paddingTop);
		graphics.lineStyle();
	}
	
	
	//private function addTicks(axis:Axis):Void {
		//
		//this.ticksXArea.graphics.clear();
		//while (ticksXArea.numChildren > 0) {
			//ticksXArea.removeChildAt(0);
		//}
		//
		//this.ticksYArea.graphics.clear();
		//while (ticksYArea.numChildren > 0) {
			//ticksYArea.removeChildAt(0);
		//}
		//
		//switch(axis) {
			//case Axis.x:
				//if (this.showTicksX) {
					//
				//}
			//case Axis.y:
				//
			//default:
				//return;
		//}
	//}

	private function addLabel(item:DataSetItem, pos:Point, xrel:LabelRelativePosition, yrel:LabelRelativePosition):Void {
		// Add label
		if (this.showLabelsX) {
			var label:TextField = new TextField();
			label.selectable = false;
			
			switch(this.xLabelText) {
				case LabelText.name:
					label.text = item.name;
				case LabelText.value:
					label.text = Std.string(item.x);
			}
			
			label.autoSize = TextFieldAutoSize.LEFT;
			
			switch(xrel) {
				case top:
					label.x = -label.width / 2;
					label.y = -label.height;
				case bottom:
					label.x = -label.width / 2;
					label.y = 0;
				case left:
					label.x = -label.width;
					label.y = -label.height / 2;
				case right:
					label.x = 0;
					label.y = -label.height / 2;
				case center:
					label.x = -label.width / 2;
					label.y = -label.height / 2;
				case dist(x, y):
					label.x = x;
					label.y = y;
			}
			
			label.x += pos.x;
			//label.y += pos.y;
			
			switch(this.xLabelPosition) {
				case LabelPosition.axis: // Done
					//label.x += Grid.X;
					label.y += this.paddingTop + h;
				case LabelPosition.point:
					//label.x += pos.x;
					label.y += pos.y;
			}
			addChild(label);
			
		} if (this.showLabelsY) {
			var label:TextField = new TextField();
			label.selectable = false;
			
			switch(this.yLabelText) {
				case LabelText.name:
					label.text = item.name;
				case LabelText.value:
					label.text = Std.string(item.y);
			}
			
			label.autoSize = TextFieldAutoSize.LEFT;
			
			switch(yrel) {
				case top:
					label.x = -label.width / 2;
					label.y = -label.height;
				case bottom:
					label.x = -label.width / 2;
					label.y = 0;
				case left:
					label.x = -label.width;
					label.y = -label.height / 2;
				case right:
					label.x = 0;
					label.y = -label.height / 2;
				case center:
					label.x = -label.width / 2;
					label.y = -label.height / 2;
				case dist(x, y):
					label.x = x;
					label.y = y;
			}
			
			//label.x += pos.x;
			label.y += pos.y;
			
			switch(this.yLabelPosition) {
				case LabelPosition.axis:
					label.x += this.paddingLeft;
					//label.y += pos.y;
				case LabelPosition.point:
					label.x += pos.x;
					//label.y += pos.y;
			}
			
			addChild(label);
		}
	}
	
	private function toGridPoint(p:Point):Point {
		var x:Float = this.paddingLeft, y:Float = this.paddingTop;
		
		x = this.paddingLeft - this.xBottom * this.ratio.x;
		x += p.x * this.ratio.x;
		
		y = this.paddingTop + h + this.yBottom * this.ratio.y;
		y -= p.y * this.ratio.y;
		
		return new Point(x, y);
	}
	
	private function calculateTicks():Void {
		ticksX = [];
		ticksY = [];
	}
	
	public function distributeTicks(numTicks:Int, axis:Axis):Void {
		var distance:Float;
		var min:Float, max:Float;
		switch(axis) {
			case Axis.x:
				distance = (this.xTop - this.xBottom) / (numTicks-1);
			case Axis.y:
				distance = (this.yTop - this.yBottom) / (numTicks-1);
			case Axis.z:
				return;
		}
		distributeTicksDist(distance, axis);
	}
	
	public function distributeTicksDist(distance:Float, axis:Axis, ?first:Float):Void {
		var max:Float;
		
		switch(axis) {
			case Axis.x:
				max = this.xTop;
				if (first == null) {
					first = this.xBottom;
				}
			case Axis.y:
				max = this.yTop;	
				if (first == null) {
					first = this.yBottom;
				}
			case Axis.z:
				return;
		}
		
		var ticks:Array<Float> = [];
		var current = first;
		
		while (Std.int(current) <= max) {
			trace(current, max);
			ticks.push(current);
			current += distance;
		}
		
		switch(axis) {
			case Axis.x:
				ticksX = ticks;
			case Axis.y:
				ticksY = ticks;
			case Axis.z:
				return;
		}
	}
	
	private function calculateLimits():Void { }	
}