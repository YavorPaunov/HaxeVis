package com.haxevis;

import flash.display.Sprite;
import flash.errors.Error;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

/**
 * ...
 * @author Yavor
 */

class Grid extends Sprite {
	
	// Gap X and Y gaps between the edge of the sprite and the beginning of the chart. That is where the tick labels will be.
	// TODO: Calculate this dynamically.
	private static inline var X:Float = 15; 
	private static inline var Y:Float = 25;
	
	private static inline var HEIGHT:Float = 300;
	private static inline var WIDTH:Float = 300;
	
	@:isVar public var xTop(get, set):Float;
	private function get_xTop():Float {
		return this.xTop;
	}
	
	private function set_xTop(value:Float):Float {
		this.xTop = value;
		draw();
		return this.xTop;
	}
	
	@:isVar public var xBottom(get, set):Float;
	function get_xBottom():Float {
		return this.xBottom;
	}
	
	function set_xBottom(value:Float):Float {
		this.xBottom = value;
		draw();
		return this.xBottom;
	}
	
	@:isVar public var xDel(get, set):Float;
	function get_xDel():Float {
		return this.xDel;
	}
	
	function set_xDel(value:Float):Float 
	{
		this.xDel = value;
		draw();
		return this.xDel;
	}
	
	@:isVar public var yTop(get, set):Float;

	private function get_yTop():Float {
		return this.yTop;
	}
	
	private function set_yTop(value:Float):Float {
		this.yTop = value;
		draw();
		return this.yTop;
	}
	
	
	@:isVar public var yBottom(get, set):Float;
	
	function get_yBottom():Float {
		return this.yBottom;
	}
	
	function set_yBottom(value:Float):Float {
		this.yBottom = value;
		draw();
		return this.yBottom;
	}
	
	
	@:isVar public var yDel(get_yDel, set_yDel):Float;

	function get_yDel():Float {
		return this.yDel;
	}
	
	function set_yDel(value:Float):Float {
		this.yDel = value;
		draw();
		return this.yDel;
	}
	
	
	@:isVar public var lineAtZero(get, set):Bool;
	
	function get_lineAtZero():Bool {
		return this.lineAtZero;
	}
	
	function set_lineAtZero(value:Bool):Bool {
		this.lineAtZero = value;
		this.draw();
		return this.lineAtZero;
	}

	@:isVar public var alwaysShowZero(get, set):Bool;
	
	function get_alwaysShowZero():Bool {
		return this.alwaysShowZero;
	}
	
	function set_alwaysShowZero(value:Bool):Bool {
		this.alwaysShowZero = value;
		draw();
		return this.alwaysShowZero;
	}
	
	private var ratio:Point;
	public var showGridY:Bool;
	public var showGridX:Bool;
	
	public var gridXThickness:Float;
	public var gridYThickness:Float;
	
	public function new(xTop:Float, xBottom:Float, xDel:Float, yTop:Float, yBottom:Float, yDel:Float) {
		super();
		
		cacheAsBitmap = true;
		
		this.lineAtZero = false;
		this.alwaysShowZero = false;
		this.showGridX = false;
		this.showGridY = false;
		
		this.xTop = xTop;
		this.xBottom = xBottom;
		this.xDel = xDel;
		
		this.yTop = yTop;
		this.yBottom = yBottom;
		this.yDel = yDel;
		
		if (this.xTop < this.xBottom) {
			throw new Error("Top x cannot be lower than bottom x.");
		}
		
		if (this.yTop < this.yBottom) {
			throw new Error("Top y cannot be lower than bottom y.");			
		}
		
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		while (numChildren > 0) {
			removeChildAt(0);
		}

		var xDif:Float = this.xTop - this.xBottom;
		var yDif:Float = this.yTop - this.yBottom;

		if (this.alwaysShowZero) {
			xDif = Math.max(xDif, Math.max(this.xTop, -this.xBottom));
			yDif = Math.max(yDif, Math.max(this.yTop, -this.yBottom));
		}

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


		//graphics.beginFill(0, 1);
		var xLowestDel:Float = this.xBottom - this.xBottom % this.xDel;
		var xHighestDel:Float = this.xTop - this.xTop % this.xDel;
		if (this.alwaysShowZero) {
			xLowestDel = Math.min(xLowestDel, 0);
			xHighestDel = Math.max(xHighestDel, 0);
		}
		var xCurDel:Float = xLowestDel;
		while (xCurDel <= xHighestDel) {
			// xCurDel or (xCurDel - xLowestDel)

			var targetX:Float = Math.min(xCurDel, xCurDel - xLowestDel) * xRatio +xZeroPos; 
			var targetY:Float;

			if (this.lineAtZero) {
				targetY = yZeroPos;
			} else {
				targetY = Y + HEIGHT;
			}

			graphics.beginFill(0, 1);
			graphics.drawRect(targetX - 0.5, targetY, 1, 4);
			graphics.endFill();

			if(this.showGridX) {
				graphics.beginFill(0, 0.1);
				graphics.drawRect(targetX - 0.5, Y, 1, HEIGHT);
				graphics.endFill();
			}

			if(xCurDel != 0 || !this.lineAtZero){
				var valueStringRaw:String = Std.string(xCurDel);
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
			xCurDel += this.xDel;

		}

		var yLowestDel:Float = this.yBottom - this.yBottom % this.yDel;
		var yHighestDel:Float =this.yTop - this.yTop % this.yDel;
		if (this.alwaysShowZero) {
			yLowestDel = Math.min(yLowestDel, 0);
			yHighestDel = Math.max(yHighestDel, 0);
		}
		var yCurDel:Float = yLowestDel;
		while (yCurDel <= yHighestDel) {
			var targetX:Float;
			if (this.lineAtZero) {
				targetX = xZeroPos;
			} else {
				targetX = X;
			}
			//Math.min(xCurDel, xCurDel - xLowestDel) * xRatio +xZeroPos; 
			var targetY:Float = yZeroPos - Math.min(yCurDel, yCurDel - yLowestDel) * yRatio;
			graphics.beginFill(0, 1);
			graphics.drawRect(targetX - 4, targetY-0.5, 4, 1);
			graphics.endFill();

			if(this.showGridY) {
				graphics.beginFill(0, 0.1);
				graphics.drawRect(X, targetY-0.5, WIDTH, 1);
				graphics.endFill();
			}
			if(yCurDel != 0 || !this.lineAtZero){
				var valueStringRaw:String = Std.string(yCurDel);
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
				valueField.x = targetX - valueField.width-5;// valueField.width / 2;
				valueField.y = targetY - valueField.height / 2;
				addChild(valueField);
			}
			yCurDel += this.yDel;
		}
		graphics.endFill();

		graphics.lineStyle(1, 0);
		if(this.lineAtZero){
			graphics.moveTo(xZeroPos, Y);
			graphics.lineTo(xZeroPos, Y + HEIGHT);

			graphics.moveTo(X,yZeroPos);
			graphics.lineTo(X + WIDTH, yZeroPos);
		} else {
			graphics.moveTo(X, Y);
			graphics.lineTo(X, Y + HEIGHT);

			graphics.moveTo(X, Y+HEIGHT);
			graphics.lineTo(X + WIDTH, Y+HEIGHT);
		}
		graphics.lineStyle();
	}

	private function toGridPoint(p:Point):Point {
		var x:Float, y:Float;
		if (this.alwaysShowZero) {
			if (this.xBottom >= 0) {
				x = X;
			} else if (this.xTop <= 0) {
				x = X + WIDTH;
			} else {
				x = X - this.xBottom * this.ratio.x;
			}
		} else {
			x = X - this.xBottom * this.ratio.x;
		}
		x += p.x * this.ratio.x;
		
		if (this.alwaysShowZero) {
			if (this.yBottom >= 0) {
				y = Y + HEIGHT;
			} else if (this.yTop <= 0) {
				y = Y;
			} else {
				y = Y + HEIGHT + this.yBottom * this.ratio.y;
			}
		} else {
			y = Y + HEIGHT + this.yBottom * this.ratio.y;
		}		
		y -= p.y * this.ratio.y;
		return new Point(x, y);
	}
}