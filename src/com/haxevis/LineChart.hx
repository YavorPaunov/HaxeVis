package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;

class LineChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	
	
	/**
	 * 
	 * @param  data A DataSet containing data for the 
	 * @param  minInd The lowest value of the independent variable (x in this case)
	 * @param  intervalInd The interval between the values of the independent variable
	 */
	public function new (data:DataSet, minInd:Float=1, intervalInd:Float=1) {
		_data = data;
		
		for (item in data.items) 
		{
			cast(item, DataSet).setInterval(Axis.x, intervalInd, minInd);
		}
		
		var gridMin:Point = new Point(data.min(Axis.x), data.min(Axis.y));
		var gridMax:Point = new Point(data.max(Axis.x), data.max(Axis.y));
		var interval:Point = new Point(intervalInd,  (gridMax.y - gridMin.y) / 10);
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
	}

	override private function draw():Void {
		super.draw();
		for (i in 0..._data.items.length) {
			var subData:DataSet = cast(_data.items[i], DataSet);
			var startPoint:Point = toGridPoint(new Point(subData.items[0].x, subData.items[0].y));
			graphics.lineStyle(1, subData.color);
			graphics.moveTo(startPoint.x, startPoint.y);
			var pointTo:Point;
			for (item in subData.items){
				pointTo = toGridPoint(new Point(item.x, item.y));
				graphics.lineTo(pointTo.x, pointTo.y);
				
			}
			for (item in subData.items) {
				pointTo = toGridPoint(new Point(item.x, item.y));
				graphics.beginFill(0xffffff);
				graphics.drawCircle(pointTo.x, pointTo.y, 3);
				graphics.endFill();
			}
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
		if (_legend != null) {			
			_legend.setValues(_data);
		} else {
			_legend = new Legend(_data);
			_legend.x = Grid.X + Grid.WIDTH + 20;
			_legend.y = Grid.Y;
		}
		addChild(_legend);
		return _showLegend = value;
	}
	
	public var showLegend(get_showLegend, set_showLegend):Bool;
		
}