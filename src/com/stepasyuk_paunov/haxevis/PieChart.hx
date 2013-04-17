package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.Lib;

/**
 * ...
 * @author Yavor
 */

class PieChart extends Sprite
{

	public function new(dataSet:DataSet) 
	{
		super();
		
		var ratios:Array<Float> = dataSet.getRatios();
		var degrees:Float = 0;
		
		//graphics.lineStyle(1);
		for (ratio in ratios) 
		{
			//if(degrees < 120)
			drawWedge(150, degrees, degrees + ratio * 360, 0xEEEEEE);
			degrees += ratio * 360;
		}
	}
	
	function drawWedge(radius:Float, start:Float, end:Float, color:Int):Void
	{		
		var degreesPerRadian:Float = Math.PI / 180;
		start *= degreesPerRadian;
		end *= degreesPerRadian;
		var step:Float = degreesPerRadian;
		
		graphics.beginFill(Std.int(0xDDDDDD * Math.random()));
		graphics.moveTo(0, 0);
		var theta:Float = start;
		while (theta < end) {
			graphics.lineTo(x + radius * Math.cos(theta), y + radius * Math.sin(theta));
			theta += Math.min(step, end - theta);
		}
		graphics.lineTo(x + radius * Math.cos(end), y + radius * Math.sin(end));
		graphics.lineTo(x, y);
		
		
		//ax = x - Math.cos(angle) * radius;
		//ay = y - Math.sin(angle) * radius;
		// increment our angle
		//angle += theta;
		// find the angle halfway between the last angle and the new
		//angleMid = angle - (theta / 2);
		// calculate our end point
		//bx = ax + Math.cos(angle) * radius;
		//by = ay + Math.sin(angle) * yRadius;
		// calculate our control point
		//cx = ax + Math.cos(angleMid) * (radius / Math.cos(theta / 2));
		//cy = ay + Math.sin(angleMid) * (yRadius / Math.cos(theta / 2));
		// draw the arc segment
		//target.curveTo(cx, cy, bx, by);
	}
	
}