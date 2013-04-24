package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.Lib;
import nme.display.DisplayObject;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.geom.Point;

class LineChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	
	
	
	public function new (data:DataSet) {

		_data = data;
		_showLegend = false;
		super(data.max(DataSetItem.X) + 10, data.min(DataSetItem.X) - 10, 10, data.max(DataSetItem.Y) + 10, data.min(DataSetItem.Y) - 10, 10);
		
		
		

		}

	

	override private function draw():Void {
		super.draw();
		for (i in _data.items){
	//	drawLineChart(data);
		drawLineChart(cast(i,DataSet));
	}

}
	public function drawLineChart(data:DataSet){
		
		var step = 30;
		//var stage = Lib.current.stage;

		// var lineChartSprite = new Sprite();

		// lineChartSprite.x = 10;
		// lineChartSprite.y = stage.stageHeight - 10;
		
		// lineChartSprite.graphics.moveTo(lineChartSprite.x, -(data.items[0].y));
		// addChild(lineChartSprite);
			var prevX:Float=0;

			var pointLinePos = new Point(prevX, data.items[0].y);
				pointLinePos= toGridPoint(pointLinePos);
				graphics.moveTo(pointLinePos.x, pointLinePos.y);

			var i = 1;
			while (i < data.items.length){

				var pointTo:Point = new Point(prevX+step, data.items[i].y);
				pointTo = toGridPoint(pointTo);
				//graphics.moveTo(prevX, point.y);
				graphics.lineStyle(2,data.items[i].color);
				graphics.lineTo(pointTo.x, pointTo.y);
				prevX = prevX + 30;
				i++;

			}

		//lineChartSprite.x = 10;
		//lineChartSprite.graphics.lineStyle(2,color);

			prevX=0;
			var pointDotPos = new Point(prevX, data.items[0].y);
				pointDotPos= toGridPoint(pointDotPos);
				graphics.moveTo(pointDotPos.x, pointDotPos.y);

			var i = 1;
			while (i < data.items.length){

				var point:Point = new Point(prevX+step, data.items[i].y);
				point = toGridPoint(point);
				graphics.moveTo(point.x, point.y);
				graphics.lineStyle(2,data.items[i].color);
				graphics.beginFill(0xffffff);
				graphics.drawCircle(point.x, point.y,4);
				graphics.endFill();
				prevX = prevX + 30;
				i++;

			}

		// lineChartSprite.x = 10;
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