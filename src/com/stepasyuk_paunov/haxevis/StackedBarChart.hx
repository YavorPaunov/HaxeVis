package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.geom.Point;
import nme.display.CapsStyle;
import nme.Lib;
import nme.display.DisplayObject;
import nme.text.TextField;
import nme.text.TextFormat;
import com.stepasyuk_paunov.haxevis.Grid;
import com.stepasyuk_paunov.haxevis.DataSetItem;


class StackedBarChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	private var _step:Int;
	
	
	
	public function new (data:DataSet, vertical:Bool, minInd:Float=1, intervalInd:Float=10) {

		_data = data;
		_vertical = vertical;
		
		//_data.flip(Axis.x, Axis.y);

		var gridMin:Point = new Point(_data.min(Axis.x), _data.min(Axis.y));
		var gridMax:Point;
		if (_vertical){
			gridMax = new Point(_data.max(Axis.y), cast(_data.items[0],DataSet).sum(Axis.y));
		}else{
			gridMax = new Point(cast(_data.items[0],DataSet).sum(Axis.y), _data.max(Axis.y));
		}
		var interval:Point = new Point(intervalInd,  (gridMax.y - gridMin.y) / 10);

		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
		

	}

	override private function draw(){

		super.draw();

		//_data.flip(Axis.x, Axis.y);
		_step = 2;

		if (_vertical){
			
			for (i in _data.items){
				drawVerticalStackedBarChart(cast(i,DataSet), _step);
				_step+=2;
			}
	
		} else {
			for (i in _data.items){
				drawHorizontalStackedBarChart(cast(i,DataSet), _step);
				_step+=2;
			}
	
		}

	}

	public function drawVerticalStackedBarChart(bars:DataSet, startingX:Int){
		
		var prevY:Float = 0;
		var bottom:Point = toGridPoint(new Point(0,0));
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(startingX, item.y)); 
			
			
			var height:Float = pos.y - bottom.y; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(pos.x, bottom.y + prevY, 10, height); // 
			graphics.endFill();

			prevY +=height;
			}

//		barChartSprite.y = 10 + 30;
	}

	public function drawHorizontalStackedBarChart(bars:DataSet, startingY:Float){
		
		var prevX:Float = 0;
		var bottom:Point = toGridPoint(new Point(_xBottom, _yBottom));
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(item.y, startingY)); 
			
			
			var width:Float = pos.x - bottom.x; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			//graphics.drawRect(pos.x, bottom.y + prevY, xDel*2, height);
			graphics.drawRect(bottom.x + prevX, pos.y, width, 10);
			graphics.endFill();

			prevX +=width;
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