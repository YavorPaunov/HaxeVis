package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;

class StackedLineChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _newData:DataSet;
	
	public function new (data:DataSet, minInd:Float=1, intervalInd:Float=1) {
		_data = data;
		
		if (_data.items.length > 1){
			var lastLineIndex = _data.items.length-2;
			while(lastLineIndex >= 0){
				for (j in 0...cast(_data.items[lastLineIndex],DataSet).items.length) {
					cast(_data.items[lastLineIndex],DataSet).items[j].y += cast(_data.items[lastLineIndex+1],DataSet).items[j].y;
				}
				lastLineIndex--;
			}
		}
		

		var subData:DataSet = cast(_data.items[0],DataSet); 
		for (item in _data.items) {
			cast(item, DataSet).setInterval(Axis.x, intervalInd, minInd);
		}
		var gridMin:Point = new Point(_data.min(Axis.x), _data.min(Axis.y));
		var gridMax:Point = new Point(_data.max(Axis.x), _data.max(Axis.y));
		var interval:Point = new Point(intervalInd,  (gridMax.y - gridMin.y) / 10);
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
		
		

		}

	

	override private function draw():Void {
		super.draw();
		
		for (i in 0..._data.items.length){
			
			var subData:DataSet = cast(_data.items[i], DataSet);
			var startPoint:Point = toGridPoint(new Point(subData.items[0].x, subData.items[0].y));
			graphics.lineStyle(2,subData.items[0].color);
			graphics.beginFill(subData.items[0].color);
			graphics.moveTo(startPoint.x, startPoint.y);
			var pointTo:Point;
			var pointCounter = 0;
			for (item in subData.items){
				pointTo = toGridPoint(new Point(item.x, item.y));
				graphics.lineTo(pointTo.x, pointTo.y);

				if (pointCounter == subData.items.length - 1){
					var fillingPoint = toGridPoint(new Point(item.x, 0));
					graphics.lineTo(fillingPoint.x, fillingPoint.y);
					
					fillingPoint = toGridPoint(new Point(subData.items[0].x, 0));
					graphics.lineTo(fillingPoint.x, fillingPoint.y);
					
					fillingPoint = toGridPoint(new Point(subData.items[0].x, subData.items[0].y));
					graphics.lineTo(fillingPoint.x, fillingPoint.y);
				}
				pointCounter++;
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