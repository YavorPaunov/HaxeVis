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
	private static inline var HEIGHT:Float = 600;
	private static inline var WIDTH:Float = 1000;
	
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
	private var _xZeroPos:Float;
	private var _yZeroPos:Float;
	
	public function new(xTop:Float, xBottom:Float, xDel:Float, yTop:Float, yBottom:Float, yDel:Float) 
	{
		super();
		cacheAsBitmap = true;
		
		if (xTop <= xBottom) {
			throw new Error("Top must be higher than bottom.");
		}
		
		if (yTop <= yBottom) {
			throw new Error("Top must be higher than bottom.");			
		}
		
		_xTop = xTop;
		_xBottom = xBottom;
		_xDel = xDel; 
		_yTop = yTop;
		_yBottom = yBottom;
		_yDel = yDel;
		
		// For debugging:
		//graphics.beginFill(0xAA0000, 0.1);
		//graphics.drawRect(X, Y, WIDTH, HEIGHT);
		//graphics.endFill();
		//
		//graphics.lineStyle(1, 0, 0.5);
		//graphics.drawRect(0, 0, X*2 + WIDTH, Y*2 + HEIGHT);
		// End
		
		var xDif:Float = Math.max(xTop - xBottom, Math.max(xTop, -xBottom));
		Lib.trace(xDif);
		var xRatio:Float = WIDTH / xDif;
		
		var yDif:Float = Math.max(yTop - yBottom, Math.max(yTop, -yBottom));
		var yRatio:Float = HEIGHT/yDif;
		_ratio = new Point(xRatio, yRatio);
		
		if (xBottom < 0) {
			_xZeroPos = X - xBottom * xRatio;
		} else {
			_xZeroPos = X;
		}
		
		if (yBottom < 0) {
			_yZeroPos = Y+HEIGHT + yBottom * yRatio;
		} else {
			_yZeroPos = Y+HEIGHT;
		}
		
		graphics.beginFill(0, 1);
		var xLowestDel:Float = Math.min(xBottom - xBottom % xDel, 0);
		var xHighestDel:Float = Math.max(xTop - xTop % xDel, 0);
		var xCurDel:Float = xLowestDel;
		while (xCurDel <= xHighestDel) {
			var targetX:Float = xCurDel * xRatio +_xZeroPos; 
			var targetY:Float =_yZeroPos;
			graphics.drawRect(targetX - 0.5, targetY-2, 1, 4);
			
			if(xCurDel != 0){
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
			xCurDel += xDel;
			
		}
		
		var yLowestDel:Float = Math.min(yBottom - yBottom % yDel, 0);
		var yHighestDel:Float = Math.max(yTop - yTop % yDel, 0);
		var yCurDel:Float = yLowestDel;
		while (yCurDel <= yHighestDel) {
			var targetX:Float =_xZeroPos; 
			var targetY:Float =_yZeroPos - yCurDel * yRatio;
			graphics.drawRect(targetX - 2, targetY-0.5, 4, 1);
			
			if(yCurDel != 0){
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
			yCurDel += yDel;
		}
		graphics.endFill();
		
		
		Lib.trace(xLowestDel);
		Lib.trace(xHighestDel);
		
		graphics.lineStyle(1, 0);
		graphics.moveTo(_xZeroPos, Y);
		graphics.lineTo(_xZeroPos, Y + HEIGHT);
		
		graphics.moveTo(X,_yZeroPos);
		graphics.lineTo(X + WIDTH,_yZeroPos);
		
	}
	
	private function toGridPoint(p:Point):Point {
		return new Point(_xZeroPos + p.x * _ratio.x, _yZeroPos - p.y * _ratio.y);
	}
}