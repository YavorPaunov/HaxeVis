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

class Grid extends Sprite
{
	private static inline var HEIGHT:Float = 300;
	private static inline var WIDTH:Float = 300;

	private static inline var X:Float = 100;
	private static inline var Y:Float = 100;
	
	// In:
	private var _xTop:Float;
	private var _xBottom:Float;
	private var _xDel:Float; // Number of delimeters on the x axis
	
	private var _yTop:Float;
	private var _yBottom:Float;
	private var _yDel:Float; // Number of delimeters on the y axis
	
	private var _ratio:Point;
	
	private var _lineAtZero:Bool;
	private var _alwaysShowZero:Bool;
	private var _showGrid:Bool;
	
	public function new(xTop:Float, xBottom:Float, xDel:Float, yTop:Float, yBottom:Float, yDel:Float) 
	{
		super();
		
		cacheAsBitmap = true;
		_lineAtZero = false;
		_alwaysShowZero = false;
		_showGrid = true;
		
		_xTop = xTop;
		_xBottom = xBottom;
		_xDel = xDel;
		
		_yTop = yTop;
		_yBottom = yBottom;
		_yDel = yDel;
		
		if (_xTop < _xBottom) {
			throw new Error("Top x cannot be lower than bottom x.");
		}
		
		if (_yTop < _yBottom) {
			throw new Error("Top y cannot be lower than bottom y.");			
		}
		
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		while (numChildren > 0) {
			removeChildAt(0);
		}
		
		var xDif:Float = _xTop - _xBottom;
		var yDif:Float = _yTop - _yBottom;
		
		if (_alwaysShowZero) {
			xDif = Math.max(xDif, Math.max(_xTop, -_xBottom));
			yDif = Math.max(yDif, Math.max(_yTop, -_yBottom));
		}
		
		var xRatio:Float = WIDTH / xDif;
		var yRatio:Float = HEIGHT / yDif;
		
		_ratio = new Point(xRatio, yRatio);
		var xZeroPos:Float;
		if (_xBottom < 0) {
			xZeroPos = X - _xBottom * xRatio;
		} else {
			xZeroPos = X;
		}
		
		var yZeroPos:Float;
		if (_yBottom < 0) {
			yZeroPos = Y+HEIGHT + _yBottom * yRatio;
		} else {
			yZeroPos = Y+HEIGHT;
		}
		
		
		//graphics.beginFill(0, 1);
		var xLowestDel:Float = _xBottom - _xBottom % _xDel;
		var xHighestDel:Float = _xTop - _xTop % _xDel;
		if (_alwaysShowZero) {
			xLowestDel = Math.min(xLowestDel, 0);
			xHighestDel = Math.max(xHighestDel, 0);
		}
		var xCurDel:Float = xLowestDel;
		while (xCurDel <= xHighestDel) {
			// xCurDel or (xCurDel - xLowestDel)
			
			var targetX:Float = Math.min(xCurDel, xCurDel - xLowestDel) * xRatio +xZeroPos; 
			var targetY:Float;
			
			if (_lineAtZero) {
				targetY = yZeroPos;
			} else {
				targetY = Y + HEIGHT;
			}
			
			graphics.beginFill(0, 1);
			graphics.drawRect(targetX - 0.5, targetY, 1, 4);
			graphics.endFill();
			
			if(_showGrid) {
				graphics.beginFill(0, 0.1);
				graphics.drawRect(targetX - 0.5, Y, 1, HEIGHT);
				graphics.endFill();
			}
			
			if(xCurDel != 0 || !_lineAtZero){
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
			xCurDel += _xDel;
			
		}
		
		var yLowestDel:Float = _yBottom - _yBottom % _yDel;
		var yHighestDel:Float =_yTop - _yTop % _yDel;
		if (_alwaysShowZero) {
			yLowestDel = Math.min(yLowestDel, 0);
			yHighestDel = Math.max(yHighestDel, 0);
		}
		var yCurDel:Float = yLowestDel;
		while (yCurDel <= yHighestDel) {
			var targetX:Float;
			if (_lineAtZero) {
				targetX = xZeroPos;
			} else {
				targetX = X;
			}
			//Math.min(xCurDel, xCurDel - xLowestDel) * xRatio +xZeroPos; 
			var targetY:Float = yZeroPos - Math.min(yCurDel, yCurDel - yLowestDel) * yRatio;
			graphics.beginFill(0, 1);
			graphics.drawRect(targetX - 4, targetY-0.5, 4, 1);
			graphics.endFill();
			
			if(_showGrid) {
				graphics.beginFill(0, 0.1);
				graphics.drawRect(X, targetY-0.5, WIDTH, 1);
				graphics.endFill();
			}
			if(yCurDel != 0 || !_lineAtZero){
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
			yCurDel += _yDel;
		}
		graphics.endFill();
		
		graphics.lineStyle(1, 0);
		if(_lineAtZero){
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
		if (_alwaysShowZero) {
			if (_xBottom >= 0) {
				x = X;
			} else if (_xTop <= 0) {
				x = X + WIDTH;
			} else {
				x = X - _xBottom * _ratio.x;
			}
		} else {
			x = X - _xBottom * _ratio.x;
		}
		if (_alwaysShowZero) {
			if (_yBottom >= 0) {
				y = Y + HEIGHT;
			} else if (_yTop <= 0) {
				y = Y;
			} else {
				y = Y + HEIGHT + _yBottom * _ratio.y;
			}
		} else {
			y = Y + HEIGHT + _yBottom * _ratio.y;
		}		
		y -= p.y * _ratio.y;
		return new Point(x, y);
	}
	
	private function get_xTop():Float 
	{
		return _xTop;
	}
	
	private function set_xTop(value:Float):Float 
	{
		_xTop = value;
		draw();
		return _xTop;
	}
	
	public var xTop(get_xTop, set_xTop):Float;
	
	private function get_xBottom():Float 
	{
		return _xBottom;
	}
	
	private function set_xBottom(value:Float):Float 
	{
		_xBottom = value;
		draw();
		return _xBottom;
	}
	
	public var xBottom(get_xBottom, set_xBottom):Float;
	
	private function get_xDel():Float 
	{
		return _xDel;
	}
	
	private function set_xDel(value:Float):Float 
	{
		_xDel = value;
		draw();
		return _xDel;
	}
	
	public var xDel(get_xDel, set_xDel):Float;
	
	private function get_yTop():Float 
	{
		return _yTop;
	}
	
	private function set_yTop(value:Float):Float 
	{
		_yTop = value;
		draw();
		return _yTop;
	}
	
	public var yTop(get_yTop, set_yTop):Float;
	
	private function get_yBottom():Float 
	{
		return _yBottom;
	}
	
	private function set_yBottom(value:Float):Float 
	{
		
		_yBottom = value;
		draw();
		return _yBottom;
	}
	
	public var yBottom(get_yBottom, set_yBottom):Float;
	
	private function get_yDel():Float 
	{
		return _yDel;
	}
	
	private function set_yDel(value:Float):Float 
	{
		_yDel = value;
		draw();
		return _yDel;
	}
	
	public var yDel(get_yDel, set_yDel):Float;
	
	private function get_lineAtZero():Bool 
	{
		return _lineAtZero;
	}
	
	private function set_lineAtZero(value:Bool):Bool 
	{
		_lineAtZero = value;
		this.draw();
		return _lineAtZero;
	}
	
	public var lineAtZero(get_lineAtZero, set_lineAtZero):Bool;
	
	private function get_alwaysShowZero():Bool 
	{
		return _alwaysShowZero;
	}
	
	private function set_alwaysShowZero(value:Bool):Bool 
	{
		_alwaysShowZero = value;
		draw();
		return _alwaysShowZero;
	}
	
	public var alwaysShowZero(get_alwaysShowZero, set_alwaysShowZero):Bool;
	
}