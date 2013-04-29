package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.display.CapsStyle;
import nme.Lib;
import nme.geom.Point;

class BarChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	
	public function new (data:DataSet, vertical:Bool=true, minInd:Float=1, intervalInd:Float=1) {

		_data = data;
		_showLegend = false;
		_vertical = vertical;
		_lineAtZero = true;
		_alwaysShowZero = true;
		
		var gridMin:Point;
		var gridMax:Point;
		var interval:Point;
		
		if (_vertical) {
			_data.setInterval(DataSetItem.X, intervalInd, minInd);
			gridMin = new Point(data.min(DataSetItem.X) - intervalInd, data.min(DataSetItem.Y));
			gridMax = new Point(data.max(DataSetItem.X) + intervalInd, data.max(DataSetItem.Y));
			interval = new Point(intervalInd,  (gridMax.y - gridMin.y) / 5);
		} else {
			_data.setInterval(DataSetItem.Y, intervalInd, minInd);
			gridMin = new Point(data.min(DataSetItem.X), data.min(DataSetItem.Y) - intervalInd);
			gridMax = new Point(data.max(DataSetItem.X) , data.max(DataSetItem.Y) + intervalInd);
			interval = new Point((gridMax.x - gridMin.x) / 5,  intervalInd);
		}
		
		/*GOTTA FIX THIS! GOTTA SWAP X AND Y IF DRAWING HORIZONTALLY*/
		
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
	}

	override private function draw():Void {
		super.draw();
		
		if (_vertical){
			drawVerticalBarChart(_data);	
		} else {
			drawHorizontalBarChart(_data);
		}
	}



	public function drawVerticalBarChart(bars:DataSet){
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(item.x, item.y)); 
			var bottom:Point = toGridPoint(new Point(Math.max(_xBottom,0), Math.max(_yBottom,0)));
			
			var height:Float = pos.y - bottom.y;
			var width:Float = 5;
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(pos.x - width/2, bottom.y, width, height); 
			graphics.endFill();
		}
	}
	
	public function drawHorizontalBarChart(bars:DataSet){
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(item.x, item.y)); 
			var bottom:Point;
			if(_alwaysShowZero){
				bottom = toGridPoint(new Point(0, 0));
			} else {
				bottom = toGridPoint(new Point(Math.max(_xBottom, 0), Math.max(_yBottom, 0)));
			}
			var height:Float = 5;
			var width:Float = pos.x - bottom.x;
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(bottom.x, pos.y - height/2, width, height);
			graphics.endFill();
		}

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