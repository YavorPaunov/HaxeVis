package com.stepasyuk_paunov.haxevis;
import com.stepasyuk_paunov.haxevis.Grid;
import nme.geom.Point;
import nme.Lib;

/**
 * ...
 * @author Yavor
 */

class ScatterPlot extends Grid
{
	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;

	public function new(data:DataSet) 
	{
		_data = data;
		super(data.max(DataSetItem.X) + 10, data.min(DataSetItem.X) - 10, 20, data.max(DataSetItem.Y) + 10, data.min(DataSetItem.Y) - 10, 20);
		draw();
	}
	
	override private function draw():Void {
		super.draw();
		
		for (item in _data.items) 
		{
			graphics.beginFill(item.color);
			
			var point:Point = new Point(item.x, item.y);
			point = toGridPoint(point);
			//graphics.drawCircle(point.x, point.y, 2);
			graphics.lineStyle(0.5);
			graphics.drawRect(point.x-2.5, point.y-2.5, 5,5);
		}
	}
	
}