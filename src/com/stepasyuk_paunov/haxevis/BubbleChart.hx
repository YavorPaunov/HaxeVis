package com.stepasyuk_paunov.haxevis;
import com.stepasyuk_paunov.haxevis.DataSetItem;
import nme.geom.Point;

/**
 * ...
 * @author Yavor
 */

class BubbleChart extends ScatterPlot
{

	public function new(data:DataSet) 
	{
		super(data);
	}
	
	override private function drawSetItem(item:DataSetItem):Void 
	{
		graphics.beginFill(item.color, 0.5);
		var point:Point = new Point(item.x, item.y);
		//var size:Float = item.z * _ratio.;
		point = toGridPoint(point);
		//graphics.lineStyle(0.5);
		graphics.drawCircle(point.x, point.y, item.z);
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
}