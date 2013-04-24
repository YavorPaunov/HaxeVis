package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.display.CapsStyle;
import nme.Lib;
import nme.display.DisplayObject;
import nme.text.TextField;
import nme.text.TextFormat;


class StackedBarChart extends Sprite {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	private var _step:Int;
	
	
	
	public function new (data:DataSet, vertical:Bool) {

		super();
		_data = data;
		_showLegend = false;
		_vertical = vertical;
		_step = 30;

		if (vertical){
			
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
		
		var step = 70;
		var stage = Lib.current.stage;

		var barChartSprite = new Sprite();

		barChartSprite.x = startingX;
		barChartSprite.y = stage.stageHeight - 30;
		barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y);
		addChild(barChartSprite);

			var i = 0;
			while (i < bars.items.length){

				barChartSprite.graphics.lineStyle(30,bars.items[i].color,CapsStyle.SQUARE);
				barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y - 30); 
				barChartSprite.graphics.lineTo(barChartSprite.x, barChartSprite.y -bars.items[i].y);
				barChartSprite.y = barChartSprite.y - bars.items[i].y;
				i++;

			}

		barChartSprite.y = 10 + 30;
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

	private function get_showLegend():Bool 
	{
		return _showLegend;
	}
	
	private function set_showLegend(value:Bool):Bool 
	{
		if (_legend != null) {			
			_legend.setValues(_data);
		} else {
			_legend = new Legend(_data);
			_legend.x = 200;
		}
		addChild(_legend);
		return _showLegend = value;
	}
	
	public var showLegend(get_showLegend, set_showLegend):Bool;

}	