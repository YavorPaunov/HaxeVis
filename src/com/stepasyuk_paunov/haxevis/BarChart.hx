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
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(item.x, item.y));
			var bottom:Point = toGridPoint(new Point(_xBottom, _yBottom));
			
			var height:Float = bottom.y - bottom.y;
			
			graphics.beginFill(item.color);
			graphics.drawRect(pos.x, pos.y, 5, height);
			graphics.endFill();
		}
	}

	public function drawHorizontalBarChart(bars:DataSet){
		
		var step = 70;
		
			var i = 0;
			while (i < bars.items.length){

				// graphics.lineStyle(30,bars.items[i].color,CapsStyle.SQUARE);
				// graphics.moveTo(barChartSprite.x, barChartSprite.y); 
				// graphics.lineTo(bars.items[i].y, barChartSprite.y);
				//y = barChartSprite.y + step;
				i++;

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