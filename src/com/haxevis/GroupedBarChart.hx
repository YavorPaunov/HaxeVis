package com.haxevis;
import flash.display.Sprite;
import flash.geom.Point;
import flash.display.CapsStyle;
import flash.display.DisplayObject;
import flash.text.TextField;
import flash.text.TextFormat;
import com.haxevis.Grid;
import com.haxevis.DataSetItem;


class GroupedBarChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	private var _step:Float;
	private var _intervalInd:Float;
	
	public function new (data:DataSet, vertical:Bool, minInd:Float=1, intervalInd:Float=1) {
		_data = data;
		_showLegend = false;
		_vertical = vertical;
		_intervalInd = intervalInd;
		
		var gridMin:Point;
		var gridMax:Point;
		var interval:Point;
		
		if (_vertical) {
			_data.setInterval(Axis.x, intervalInd, minInd);
			gridMin = new Point(data.min(Axis.x) - intervalInd, data.min(Axis.y));
			gridMax = new Point(cast(_data.items[0],DataSet).items.length * _data.items.length, data.max(Axis.y));
			interval = new Point(intervalInd,  (gridMax.y - gridMin.y) / 5);
		} else {
			_data.setInterval(Axis.y, intervalInd, minInd);
			gridMin = new Point(data.min(Axis.x), data.min(Axis.y) - intervalInd);
			gridMax = new Point(cast(_data.items[0],DataSet).max(Axis.y), cast(_data.items[0],DataSet).items.length * _data.items.length);
			interval = new Point((gridMax.x - gridMin.x) / 5,  intervalInd);
		}
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
		

	}

	override private function draw(){

		super.draw();
		_step = 1;
		if (_vertical){
			
			for (i in _data.items){
			//	Sys.print("in if");
				drawVerticalGroupedBarChart(cast(i,DataSet), _step);
				//_step += 10 * cast(_data.items[0],DataSet).items.length-1;
				_step +=  (cast(_data.items[0],DataSet).items.length) * _intervalInd  ;
			}
			//drawVerticalBarChart(_data);	
		} else {
			for (i in _data.items){
				drawHorizontalGroupedBarChart(cast(i,DataSet), _step);
				_step+=(cast(_data.items[0],DataSet).items.length) * _intervalInd  ;
			}
	
		}


	}

	public function drawVerticalGroupedBarChart(bars:DataSet, startingX:Float){
		
		var prevX:Float = 0;
		var bottom:Point = toGridPoint(new Point(0, 0));



		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			// Sys.print("x is: "+startingX+prevX+"\n");
			// Sys.print("startingX is: "+startingX+"\n");
			// Sys.print("prevX is: "+prevX+"\n");
			
			var pos:Point = toGridPoint(new Point(startingX, item.y)); 
					
			var height:Float = pos.y - bottom.y; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(pos.x+prevX, bottom.y, 15, height); // 
			graphics.endFill();

			prevX += 16 + _intervalInd;

			
		}
	}

	public function drawHorizontalGroupedBarChart(bars:DataSet, startingY:Float){
		
		var prevY:Float = 0;
		var bottom:Point = toGridPoint(new Point(_xBottom, _yBottom));
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(item.y, startingY)); 
			
			
			var width:Float = pos.x - bottom.x; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(bottom.x, pos.y-prevY, width, 15);
			graphics.endFill();

			prevY += 16 + _intervalInd;
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