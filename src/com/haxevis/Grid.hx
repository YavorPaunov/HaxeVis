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
	
class Grid extends Chart {
	
	// Gap X and Y gaps between the edge of the sprite and the beginning of the chart. That is where the tick labels will be.
	// TODO: Calculate this dynamically.
	private static inline var X:Float = 25; 
	private static inline var Y:Float = 25;
	
	private static inline var HEIGHT:Float = 300;
	private static inline var WIDTH:Float = 300;
	
	public var gridGraphics:GridGraphics;
	
	@:isVar public var ticksX(default, set):Array<Float>;
	private function set_ticksX(value:Array<Float>):Array<Float> {
		if (autoRedraw) {
			draw();			
		}
		return this.ticksX = value;
	}
	
	@:isVar public var ticksY(default, set):Array<Float>;
	private function set_ticksY(value:Array<Float>):Array<Float> {
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
	
	@:isVar public var xTop(get, set):Float;
	private function get_xTop():Float {
		return this.xTop;
	}
	
	private function set_xTop(value:Float):Float {
		this.xTop = value;
		if (this.xTop < this.xBottom) {
			throw new Error("Top x cannot be lower than bottom x.");
		}
		if(autoRedraw) {
			draw();
		}
		return this.xTop;
	}
	
	@:isVar public var xBottom(get, set):Float;
	function get_xBottom():Float {
		if (this.xTop < this.xBottom) {
			throw new Error("Top x cannot be lower than bottom x.");
		}
		return this.xBottom;
	}
	
	function set_xBottom(value:Float):Float {
		this.xBottom = value;
		if(autoRedraw) {
			draw();
		}
		return this.xBottom;
	}
		
	@:isVar public var yTop(get, set):Float;

	private function get_yTop():Float {
		return this.yTop;
	}
	
	private function set_yTop(value:Float):Float {
		this.yTop = value;
		if (this.yTop < this.yBottom) {
			throw new Error("Top y cannot be lower than bottom y.");			
		}
		if(autoRedraw) {
			draw();
		}
		return this.yTop;
	}
	
	@:isVar public var yBottom(get, set):Float;

	function get_yBottom():Float {
		return this.yBottom;
	}
	
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
		
	private var ratio:Point;
	@:isVar public var showGridY(default, set):Bool;
	function set_showGridY(value:Bool):Bool {
		this.showGridY = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.showGridY;
	}
	
	@:isVar public var showGridX(default, set):Bool;
	function set_showGridX(value:Bool):Bool {
		this.showGridX = value;
		if (this.autoRedraw) {
			draw();
		}
		return this.showGridX;
	}
	
	public var gridXThickness:Float;
	public var gridYThickness:Float;

	public var autoRedraw:Bool;
	
	public function new() {
		super();
		
		cacheAsBitmap = true;
		this.autoTicks = false;
		
		this.showGridX = false;
		this.showGridY = false;
		
		this.lineX = 0;
		this.lineY = 0;
		
		this.ticksX = [];
		this.ticksY = [];
		
		this.gridGraphics = {
			ticks: {
				thickness:1,
				alpha:1,
				color:0xAAAAAA
			},
			
			gridlines: {
				thickness:1,
				alpha:1,
				color:0xDEDEDE
			},
			
			axislines: {
				thickness:1,
				alpha:1,
				color:0x121212
			},
			
			borders: {
				thickness:1,
				alpha:1,
				color:0
			}
		}
		
	}
	
	override private function draw():Void {
		graphics.clear();
		
		
		
		
		while (numChildren > 0) {
			removeChildAt(0);
		}

		var xDif:Float = this.xTop - this.xBottom;
		var yDif:Float = this.yTop - this.yBottom;

		var xRatio:Float = WIDTH / xDif;
		var yRatio:Float = HEIGHT / yDif;

		this.ratio = new Point(xRatio, yRatio);
		
		var xZeroPos:Float;
		if (this.xBottom < 0) {
			xZeroPos = X - this.xBottom * xRatio;
		} else {
			xZeroPos = X;
		}

		var yZeroPos:Float;
		if (this.yBottom < 0) {
			yZeroPos = Y+HEIGHT + this.yBottom * yRatio;
		} else {
			yZeroPos = Y+HEIGHT;
		}

		for (tickX in this.ticksX) {
			
			var targetX:Float = tickX * this.ratio.x + xZeroPos; 
			var targetY:Float;
			targetY = Y + HEIGHT; //yZeroPos - lineY * this.ratio.y;
			
			// Add ticks			
			graphics.lineStyle(gridGraphics.ticks.thickness, gridGraphics.ticks.color, gridGraphics.ticks.alpha);
			graphics.moveTo(targetX, targetY);
			graphics.lineTo(targetX, targetY+4);
						
			if (this.showGridX) {
				graphics.lineStyle(gridGraphics.gridlines.thickness, gridGraphics.gridlines.color, gridGraphics.gridlines.alpha);
				graphics.moveTo(targetX, Y);
				graphics.lineTo(targetX, Y + HEIGHT);
			}
			graphics.lineStyle();
			
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
		
		for (tickY in this.ticksY) {
			var targetX:Float;
			
			targetX = X; //xZeroPos + lineX * this.ratio.x;
			
			// Add ticks
			var targetY:Float = yZeroPos - tickY * this.ratio.y;
			
			graphics.lineStyle(gridGraphics.ticks.thickness, gridGraphics.ticks.color, gridGraphics.ticks.alpha);
			graphics.moveTo(targetX, targetY);
			graphics.lineTo(targetX-4, targetY);
			graphics.lineStyle();
			
			if (this.showGridY) {
				graphics.lineStyle(gridGraphics.gridlines.thickness, gridGraphics.gridlines.color, gridGraphics.gridlines.alpha);
				graphics.moveTo(X, targetY);
				graphics.lineTo(X + WIDTH, targetY);				
			}
			
			var valueStringRaw:String = Std.string(tickY);
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
			valueField.x = targetX - valueField.width - 5;
			valueField.y = targetY - valueField.height / 2;
			addChild(valueField);
		}
		
		graphics.endFill();
		
		graphics.lineStyle(gridGraphics.axislines.thickness, gridGraphics.axislines.color, gridGraphics.axislines.alpha);
		
		graphics.moveTo(xZeroPos + lineX * this.ratio.x, Y);
		graphics.lineTo(xZeroPos + lineX * this.ratio.x, Y + HEIGHT);

		graphics.moveTo(X, yZeroPos - lineY * this.ratio.y);
		graphics.lineTo(X + WIDTH, yZeroPos - lineY * this.ratio.y);
		
		// Draw borders
		graphics.lineStyle(gridGraphics.borders.thickness, gridGraphics.borders.color, gridGraphics.borders.alpha);
		graphics.drawRect(X, Y, WIDTH, HEIGHT);
		graphics.lineStyle();
	}

	private function toGridPoint(p:Point):Point {
		var x:Float = X, y:Float = Y;
		
		x = X - this.xBottom * this.ratio.x;
		x += p.x * this.ratio.x;
		
		y = Y + HEIGHT + this.yBottom * this.ratio.y;
		y -= p.y * this.ratio.y;
		
		return new Point(x, y);
	}
	
	private function calculateTicks():Void {
		ticksX = [0];
		ticksY = [0];
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
	
}