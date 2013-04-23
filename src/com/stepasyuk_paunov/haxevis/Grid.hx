package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.errors.Error;
import nme.geom.Point;
import nme.Lib;
import nme.text.TextField;
import nme.text.TextFieldAutoSize;

/**
 * ...
 * @author Yavor
 */

class Grid extends Sprite
{
	
	// Height is 160
	// Width is 160
	private static inline var HEIGHT:Float = 300;
	private static inline var WIDTH:Float = 300;
	
	private static inline var X:Float = 10;
	private static inline var Y:Float = 10;
	
	// In:
	private var _xTop:Float;
	private var _xBottom:Float;
	private var _xDel:Float; // Number of delimeters on the x axis
	private var _yTop:Float;
	private var _yBottom:Float;
	private var _yDel:Float; // Number of delimeters on the y axis
	
	private var _ratio:Point;
	private var _xZeroPos:Float;
	private var _yZeroPos:Float;
	
	private var _lineAtZero:Bool;
	private var _alwaysShowZero:Bool;
	
	public function new(xTop:Float, xBottom:Float, xDel:Float, yTop:Float, yBottom:Float, yDel:Float) 
	{
		super();
		cacheAsBitmap = true;
		_lineAtZero = false;
		_alwaysShowZero = false;
		
		if (xTop <= _xBottom) {
			throw new Error("Top must be higher than bottom.");
		}
		
		if (_yTop <= _yBottom) {
			throw new Error("Top must be higher than bottom.");			
		}
		
		_xTop = xTop;
		_xBottom = xBottom;
		_xDel = xDel; 
		_yTop = yTop;
		_yBottom = yBottom;
		_yDel = yDel;
		
		draw();
	}
	
	private function draw():Void {
		graphics.clear();
		
		var xDif:Float = Math.max(_xTop - _xBottom, Math.max(_xTop, -_xBottom));
		var xRatio:Float = WIDTH / xDif;
		
		var yDif:Float = Math.max(_yTop - _yBottom, Math.max(_yTop, -_yBottom));
		var yRatio:Float = HEIGHT/yDif;
		_ratio = new Point(xRatio, yRatio);
		
		if (_xBottom < 0) {
			_xZeroPos = X - _xBottom * xRatio;
		} else {
			_xZeroPos = X;
		}
		
		if (_yBottom < 0) {
			_yZeroPos = Y+HEIGHT + _yBottom * yRatio;
		} else {
			_yZeroPos = Y+HEIGHT;
		}
		
		graphics.beginFill(0, 1);
		var xLowestDel:Float = Math.min(_xBottom - _xBottom % _xDel, 0);
		var xHighestDel:Float = Math.max(_xTop - _xTop % _xDel, 0);
		var xCurDel:Float = xLowestDel;
		while (xCurDel <= xHighestDel) {
			var targetX:Float = xCurDel * xRatio +_xZeroPos; 
			var targetY:Float;
			if (_lineAtZero) {
				targetY = _yZeroPos;
			} else {
				targetY = Y + HEIGHT;
			}
			graphics.drawRect(targetX - 0.5, targetY, 1, 4);
			
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
		
		var yLowestDel:Float = Math.min(_yBottom - _yBottom % _yDel, 0);
		var yHighestDel:Float = Math.max(_yTop - _yTop % _yDel, 0);
		var yCurDel:Float = yLowestDel;
		while (yCurDel <= yHighestDel) {
			var targetX:Float;
			if (_lineAtZero) {
				targetX = _xZeroPos;
			} else {
				targetX = X;
			}
			
			var targetY:Float =_yZeroPos - yCurDel * yRatio;
			graphics.drawRect(targetX - 4, targetY-0.5, 4, 1);
			
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
		
		
		Lib.trace(xLowestDel);
		Lib.trace(xHighestDel);
		
		graphics.lineStyle(1, 0);
		if(_lineAtZero){
			graphics.moveTo(_xZeroPos, Y);
			graphics.lineTo(_xZeroPos, Y + HEIGHT);
			
			graphics.moveTo(X,_yZeroPos);
			graphics.lineTo(X + WIDTH, _yZeroPos);
		} else {
			graphics.moveTo(X, Y);
			graphics.lineTo(X, Y + HEIGHT);
			
			graphics.moveTo(X, Y+HEIGHT);
			graphics.lineTo(X + WIDTH, Y+HEIGHT);
		}
		graphics.lineStyle();
	}
	
	private function toGridPoint(p:Point):Point {
		return new Point(_xZeroPos + p.x * _ratio.x, _yZeroPos - p.y * _ratio.y);
	}
}