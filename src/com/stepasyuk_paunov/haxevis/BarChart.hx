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
	
	





	
	
	public function new (data:DataSet, vertical:Bool) {

		_data = data;
		_showLegend = false;
		_vertical = vertical;

		/*GOTTA FIX THIS! GOTTA SWAP X AND Y IF DRAWING HORIZONTALLY*/
		super(data.max(DataSetItem.X) + 10, data.min(DataSetItem.X) - 10, 10, data.max(DataSetItem.Y) + 10, data.min(DataSetItem.Y) - 10, 10);
		
		

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
		var prevX:Float = 7.5;
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(prevX, item.y)); 
			var bottom:Point = toGridPoint(new Point(_xBottom, _yBottom));
			
			var height:Float = pos.y - bottom.y; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(pos.x, bottom.y, xDel*2, height); // 
			graphics.endFill();

			prevX +=7.5;
		}
	}

	public function drawHorizontalBarChart(bars:DataSet){
		
		var prevY:Float = 7.5;
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(item.y, prevY)); 
			var bottom:Point = toGridPoint(new Point(_xBottom, _yBottom));
			
			var height:Float = pos.x - bottom.x; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(bottom.x, pos.y, height, yDel*2);
			graphics.endFill();

			prevY +=7.5;
			}

//		barChartSprite.y = 10;
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