package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.geom.Point;
import nme.display.CapsStyle;
import nme.Lib;
import nme.display.DisplayObject;
import nme.text.TextField;
import nme.text.TextFormat;
import com.stepasyuk_paunov.haxevis.Grid;


class StackedBarChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	private var _step:Int;
	
	
	
	public function new (data:DataSet, vertical:Bool) {

		_data = data;
		_showLegend = false;
		_vertical = vertical;
		_step = 30;
		
		super(data.max(DataSetItem.X) + 10, data.min(DataSetItem.X) - 10, 10, data.max(DataSetItem.Y) + 10, data.min(DataSetItem.Y) - 10, 10);
		

	}

	override private function draw(){

		super.draw();

		if (_vertical){
			
			for (i in _data.items){
				drawVerticalStackedBarChart(cast(i,DataSet), _step);
				_step+=30;
			}
			//drawVerticalBarChart(_data);	
		} else {
			for (i in _data.items){
				drawHorizontalStackedBarChart(cast(i,DataSet), _step);
				_step+=30;
			}
	
		}

	}

	public function drawVerticalStackedBarChart(bars:DataSet, startingX:Int){
		
		//var stage = Lib.current.stage;

		//var barChartSprite = new Sprite();

		//barChartSprite.x = startingX;
		//barChartSprite.y = stage.stageHeight - 30;
		//barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y);
		//addChild(barChartSprite);

			var i = 0;
			var prevY:Float=0;
			var pointDotPos = new Point(0, 0);
				pointDotPos= toGridPoint(pointDotPos);
				graphics.moveTo(pointDotPos.x, pointDotPos.y);

			while (i < bars.items.length){

				var pointPos:Point = new Point(bars.items[i].x, prevY + bars.items[i].y);
				var pointSize:Point = new Point(30, bars.items[i].y);
				pointPos = toGridPoint(pointPos);
				pointSize = toGridPoint(pointSize);
				
				graphics.lineStyle(1,0x1a1a1a);
				graphics.beginFill(bars.items[i].color);
//				barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y); 
				graphics.drawRect(pointPos.x, pointPos.y, pointSize.x, pointSize.y);
				graphics.endFill();
				//prevY=prevY + point.y;
				i++;

			}

//		barChartSprite.y = 10 + 30;
	}

	public function drawHorizontalStackedBarChart(bars:DataSet, startingY:Float){
		
		var step = 70;
		var stage = Lib.current.stage;

		var barChartSprite = new Sprite();

		barChartSprite.x = 10;
		barChartSprite.y = startingY;
		barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y);
		addChild(barChartSprite);

			var i = 0;
			while (i < bars.items.length){

				barChartSprite.graphics.lineStyle(30,bars.items[i].color,CapsStyle.SQUARE);
				barChartSprite.graphics.moveTo(barChartSprite.x + 30, barChartSprite.y); 
				barChartSprite.graphics.lineTo(barChartSprite.x + bars.items[i].y, barChartSprite.y);
				barChartSprite.x = barChartSprite.x + bars.items[i].y;
				i++;

			}

		barChartSprite.x = 10 - 30;

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