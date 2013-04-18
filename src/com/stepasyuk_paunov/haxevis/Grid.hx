package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.Lib;

/**
 * ...
 * @author Yavor
 */

class Grid extends Sprite
{
	
	// Height is 160
	// Width is 160
	private static inline var HEIGHT:Float = 160;
	private static inline var WIDTH:Float = 220;
	
	private var _xTop:Float;
	private var _xBottom:Float;
	private var _xDelNum:Float; // Number of delimeters on the x axis
	private var _yTop:Float;
	private var _yBottom:Float;
	private var _yDelNum:Float; // Number of delimeters on the y axis
	
	public function new(xTop:Float, xBottom:Float, xDelNum:Float, yTop:Float, yBottom:Float, yDelNum:Float) 
	{
		super();
		
		_xTop = xTop;
		_xBottom = xBottom;
		_xDelNum = xDelNum; 
		_yTop = yTop;
		_yBottom = yBottom;
		_yDelNum = yDelNum;
		
		var xDif:Float = xTop - xBottom;
		var xRatio:Float = WIDTH/xDif;
		var xDelSize:Float = (xDif / xDelNum) * xRatio;
		
		var xZeroPos:Float;
		if (xBottom < 0) {
			xZeroPos = -xBottom * xRatio;
		} else {
			xZeroPos = 0;
		}
		
		var yDif:Float = yTop - yBottom;
		var yRatio:Float = HEIGHT / yDif;
		var yDelSize:Float = (yDif / yDelNum) * yRatio;
		
		var yZeroPos:Float;
		if (yBottom < 0) {
			yZeroPos = -yBottom * yRatio;
		} else {
			yZeroPos = 0;
		}
		
		graphics.beginFill(0);
		
		var xCurDel:Float = 0;
		while (xCurDel <= xDelNum) {
			Lib.trace(xCurDel * xDelSize);
			//graphics.drawCircle(xCurDel * xDelSize, HEIGHT - yZeroPos, 2);
			var targetX:Float = xCurDel * xDelSize;
			if (targetX != 0) {
				var targetY:Float = HEIGHT - yZeroPos;
				graphics.drawRect(targetX - 0.5, targetY - 3, 1, 6);
			}
			xCurDel++;
		}
		
		graphics.lineStyle(1, 0);
		graphics.moveTo(xZeroPos, HEIGHT );
		graphics.lineTo(xZeroPos, 0);
		
		var yCurDel:Float = 0;
		while (yCurDel <= yDelNum) {
			Lib.trace(yCurDel * yDelSize);
			var targetY:Float = HEIGHT - yCurDel * yDelSize;
			if (targetY != 0) {				
				var targetX:Float = xZeroPos;
				graphics.drawRect(targetX - 3, targetY - 0.5, 6, 1);
			}
			yCurDel++;
		}
		
		graphics.lineStyle(1, 0);
		graphics.moveTo(0, HEIGHT - yZeroPos);
		graphics.lineTo(WIDTH, HEIGHT - yZeroPos);
		
		
		
	}
	
}