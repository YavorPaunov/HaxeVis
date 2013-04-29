package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.Lib;
import nme.display.DisplayObject;
import nme.text.TextField;
import nme.text.TextFormat;
import nme.geom.Point;

class StackedLineChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _newData:DataSet;
	
	
	
	public function new (data:DataSet) {

		_data = data;
		_showLegend = false;

		var lastLineIndex = _data.items.length-2;

		while(lastLineIndex >= 0){

			for (j in 0...cast(_data.items[lastLineIndex],DataSet).items.length){

				cast(_data.items[lastLineIndex],DataSet).items[j].y += cast(_data.items[lastLineIndex+1],DataSet).items[j].y;

 			}

			lastLineIndex--;

		}
	super(data.max(DataSetItem.X) + 10, data.min(DataSetItem.X) - 10, 10, data.max(DataSetItem.Y) + 10, data.min(DataSetItem.Y) - 10, 10);
		
		
		

		}

	

	override private function draw():Void {

		super.draw();

		//var i = _data.items.length-1;
		for (i in 0..._data.items.length){
			drawStackedLineChart(cast(_data.items[i],DataSet));


	}
}

	public function drawStackedLineChart(data:DataSet){
		
		var step = 10;
		
			var prevX:Float=0;

			var pointLinePos = new Point(prevX, data.items[0].y);
				pointLinePos= toGridPoint(pointLinePos);
				graphics.moveTo(pointLinePos.x, pointLinePos.y);
				graphics.lineStyle(2,data.items[0].color);
				graphics.beginFill(data.items[0].color);


			var i = 1;
			
			while (i < data.items.length){

				var pointTo:Point = new Point(prevX+step, data.items[i].y);
				pointTo = toGridPoint(pointTo);
				//graphics.moveTo(prevX, point.y);
			
				
				graphics.lineTo(pointTo.x, pointTo.y);

				if (i == data.items.length - 1){



					var fillingPoint = toGridPoint(new Point(prevX+step, _yBottom));
					graphics.lineTo(fillingPoint.x, fillingPoint.y);

					fillingPoint = toGridPoint(new Point(_xBottom, _yBottom));
					graphics.lineTo(fillingPoint.x, fillingPoint.y);

					fillingPoint = toGridPoint(new Point(_xBottom, data.items[0].y));
					graphics.lineTo(fillingPoint.x, fillingPoint.y);
				
						

				}
				
				prevX = prevX + 10;
				i++;

			}
			graphics.endFill();

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