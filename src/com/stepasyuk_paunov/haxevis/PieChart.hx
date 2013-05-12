package com.stepasyuk_paunov.haxevis;
import haxe.Log;
import nme.display.Sprite;
import nme.Lib;
import com.stepasyuk_paunov.haxevis.DataSetItem;

/**
 * ...
 * @author Yavor
 */

class PieChart extends Sprite
{
	// Height is 160, unless legend is taller
	// Width is 160 + width of legend
	// TODO: Make constants for those values

	private var _showLegend:Bool;
	private var _legend:Legend;
	
	private var _data:DataSet;
	
	
	public function new(data:DataSet) 
	{
		super();
		_data = data;
		_showLegend = false;
		for (item in _data.items) 
		{
			if (item.x < 0) {
				Log.trace("Warning: Value of each item in PieChart must be negative.");
			}
		}
		#if cpp
		// necessary for antialias
		cacheAsBitmap = true;
		#end
		
		draw();
	}
	
	private function draw():Void {
		var ratios:Array<Float> = _data.getRatios(Axis.x);
		var degrees:Float = 0;
		
		for (i in 0...ratios.length) 
		{
			var ratio:Float = ratios[i];
			var entry:DataSetItem = _data.items[i];
			drawWedge(80, degrees, degrees + ratio * 360, entry.color);
			degrees += ratio * 360;
		}
	}
	
	private function drawWedge(radius:Float, start:Float, end:Float, color:Int):Void
	{		
		var degreesPerRadian:Float = Math.PI / 180;
		start *= degreesPerRadian;
		end *= degreesPerRadian;
		var step:Float = degreesPerRadian;
		
		graphics.beginFill(color);
		graphics.moveTo(radius, radius);
		var theta:Float = start;
		while (theta < end) {
			graphics.lineTo((x + radius * Math.cos(theta))+radius, (y + radius * Math.sin(theta))+radius);
			theta += Math.min(step, end - theta);
		}
		graphics.lineTo((x + radius * Math.cos(end))+radius, (y + radius * Math.sin(end))+radius);
		graphics.lineTo(x+radius, y+radius);
	}
	
	private function get_showLegend():Bool 
	{
		return _showLegend;
	}
	
	private function set_showLegend(value:Bool):Bool 
	{
		if (_legend != null) {			
			_legend.setValues(_data);
		} else {
			_legend = new Legend(_data);
			_legend.x = 200;
		}
		addChild(_legend);
		return _showLegend = value;
	}
	
	public var showLegend(get_showLegend, set_showLegend):Bool;
	
}