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
		super(data.max(DataSetItem.X) + 10, data.min(DataSetItem.X) - 10, 10, data.max(DataSetItem.Y) + 10, data.min(DataSetItem.Y) - 10, 10);
		draw();
	}
	
	override private function draw():Void {
		super.draw();
		drawSet(_data);
	}
	
	private function drawSet(data:DataSet):Void {
		for (item in data.items) 
		{
			if (Std.is(item, DataSet)) {
				drawSet(cast(item, DataSet));
				continue;
			}
			drawSetItem(item);
		}
	}
	
	private function drawSetItem(item:DataSetItem):Void {
		graphics.beginFill(item.color);
		var point:Point = new Point(item.x, item.y);
		
		point = toGridPoint(point);
		graphics.lineStyle(0.5);
		graphics.drawRect(point.x-2.5, point.y-2.5, 5,5);
	}
	
	override private function set_xTop(value:Float):Float 
	{
		_xTop = value;
		draw();
		return _xTop;
	}
	
	override private function set_xBottom(value:Float):Float 
	{
		_xBottom = value;
		draw();
		return _xBottom;
	}
	
	override private function set_xDel(value:Float):Float 
	{
		_xDel = value;
		draw();
		return _xDel;
	}
	
	override private function set_yTop(value:Float):Float 
	{
		_yTop = value;
		draw();
		return _yTop;
	}
		
	override private function set_yBottom(value:Float):Float 
	{
		
		_yBottom = value;
		draw();
		return _yBottom;
	}
		
	override private function set_yDel(value:Float):Float 
	{
		_yDel = value;
		draw();
		return _yDel;
	}
		
	override private function set_lineAtZero(value:Bool):Bool 
	{
		_lineAtZero = value;
		draw();
		return _lineAtZero;
	}
		
	override private function set_alwaysShowZero(value:Bool):Bool 
	{
		_alwaysShowZero = value;
		draw();
		return _alwaysShowZero;
	}
	
	private function get_showLegend():Bool 
	{
		return _showLegend;
	}
	
	private function set_showLegend(value:Bool):Bool 
	{
		return _showLegend = value;
	}
	
	public var showLegend(get_showLegend, set_showLegend):Bool;
		
}