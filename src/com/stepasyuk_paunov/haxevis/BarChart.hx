package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.display.CapsStyle;
import nme.Lib;
import nme.geom.Point;
import com.stepasyuk_paunov.haxevis.DataSetItem;

class BarChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	
	/**
	 * 
	 * @param  data A DataSet containing data for the 
	 * @param vertical A Bool value that specifies whether the bars are to be drawn vertically. If false, they will be drawn horizontally.
	 * @param  minInd The lowest value of the independent variable (x if vertical is true, y if vertical is false)
	 * @param  intervalInd The interval between the values of the independent variable
	 * @return a LineChart object
	 */
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
			_data.setInterval(Axis.x, intervalInd, minInd);
			gridMin = new Point(data.min(Axis.x) - intervalInd, data.min(Axis.y));
			gridMax = new Point(data.max(Axis.x) + intervalInd, data.max(Axis.y));
			interval = new Point(intervalInd,  (gridMax.y - gridMin.y) / 5);
		} else {
			_data.setInterval(Axis.y, intervalInd, minInd);
			gridMin = new Point(data.min(Axis.x), data.min(Axis.y) - intervalInd);
			gridMax = new Point(data.max(Axis.x) , data.max(Axis.y) + intervalInd);
			interval = new Point((gridMax.x - gridMin.x) / 5,  intervalInd);
		}
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
	}

	override private function draw():Void {
		super.draw();
		
		for (i in 0..._data.items.length) {
			var item:DataSetItem = _data.items[i];
			var pos:Point = toGridPoint(new Point(item.x, item.y)); 
			var bottom:Point;
			
			if(_alwaysShowZero){
				bottom = toGridPoint(new Point(0, 0));
			} else {
				bottom = toGridPoint(new Point(Math.max(_xBottom, 0), Math.max(_yBottom, 0)));
			}
			
			graphics.lineStyle(1, 0x1a1a1a);
			graphics.beginFill(item.color);
			
			var height:Float;
			var width:Float;
			if (_vertical) {
				height = pos.y - bottom.y;
				width = 15;
				graphics.drawRect(pos.x - width/2, bottom.y, width, height);
			} else {
				height = 15;
				width = pos.x - bottom.x;
				graphics.drawRect(bottom.x, pos.y - height / 2, width, height);
			}
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