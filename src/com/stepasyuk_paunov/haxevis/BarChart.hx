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
		
		var step = 70;

		// barChartSprite.x = 30;
		// barChartSprite.y = stage.stageHeight - 30;
		// barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y);
		// addChild(barChartSprite);

			var i = 0;

			var prevX:Float=10;

			
			while (i < bars.items.length){

				var pointLinePos = new Point(prevX, 0);
				pointLinePos= toGridPoint(pointLinePos);
				graphics.moveTo(pointLinePos.x, pointLinePos.y);

				var pointTo:Point = new Point(prevX, bars.items[i].y);
				pointTo = toGridPoint(pointTo);

				graphics.lineStyle(1,0x1a1a1a);
				graphics.beginFill(bars.items[i].color);
//				barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y); 
				graphics.drawRect(pointLinePos.x, pointLinePos.y, 30, pointTo.y);
				graphics.endFill();
				prevX = prevX + 30;
				i++;

			}

		//barChartSprite.x = 10;
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