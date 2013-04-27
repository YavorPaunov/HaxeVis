package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.geom.Point;
import nme.display.CapsStyle;
import nme.Lib;
import nme.display.DisplayObject;
import nme.text.TextField;
import nme.text.TextFormat;
import com.stepasyuk_paunov.haxevis.Grid;


class GroupedBarChart extends Grid {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	private var _step:Float;
	
	
	
	public function new (data:DataSet, vertical:Bool) {

		_data = data;
		_showLegend = false;
		_vertical = vertical;
		_step = 10;
		
		super(data.max(DataSetItem.X) + 10, data.min(DataSetItem.X) - 10, 10, data.max(DataSetItem.Y) + 10, data.min(DataSetItem.Y) - 10, 10);
		

	}

	override private function draw(){

		super.draw();

		if (_vertical){
			
			for (i in _data.items){
				drawVerticalGroupedBarChart(cast(i,DataSet), _step);
				_step += xDel * 2 * (_data.items.length - 1);
			}
			//drawVerticalBarChart(_data);	
		} else {
			for (i in _data.items){
				drawHorizontalGroupedBarChart(cast(i,DataSet), _step);
				_step+=10;
			}
	
		}

	}

	public function drawVerticalGroupedBarChart(bars:DataSet, startingX:Float){
		
		var prevX:Float = 0;
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(startingX, item.y)); 
			var bottom:Point = toGridPoint(new Point(_xBottom, _yBottom));
			
			var height:Float = pos.y - bottom.y; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(pos.x+prevX, bottom.y, 20, height); // 
			graphics.endFill();

			prevX += prevX+20;
		}
	}

	public function drawHorizontalGroupedBarChart(bars:DataSet, startingY:Float){
		
		var prevY:Float = 0;
		for (i in 0...bars.items.length) {
			var item:DataSetItem = bars.items[i];
			var pos:Point = toGridPoint(new Point(item.y, startingY)); 
			var bottom:Point = toGridPoint(new Point(_xBottom, _yBottom));
			
			var width:Float = pos.x - bottom.x; //used to be bottom.y - bottom.y which led to height being 0
			graphics.lineStyle(1,0x1a1a1a);
			graphics.beginFill(item.color);
			graphics.drawRect(bottom.x, pos.y+prevY, width, 20);
			graphics.endFill();

			prevY += prevY + 20;
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