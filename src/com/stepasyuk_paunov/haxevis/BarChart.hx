package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.display.CapsStyle;
import nme.Lib;

class BarChart extends Sprite {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	private var _vertical:Bool;
	
	
	
	public function new (data:DataSet, vertical:Bool) {

		super();
		_data = data;
		_showLegend = false;
		_vertical = vertical;

		if (vertical){
			drawVerticalBarChart(_data);	
		} else {
			drawHorizontalBarChart(_data);
		}
		

	}

	public function drawVerticalBarChart(bars:DataSet){
		
		var step = 70;
		var stage = Lib.current.stage;

		var barChartSprite = new Sprite();

		barChartSprite.x = 30;
		barChartSprite.y = stage.stageHeight - 30;
		barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y);
		addChild(barChartSprite);

			var i = 0;
			while (i < bars.entries.length){

				barChartSprite.graphics.lineStyle(30,bars.entries[i].color,CapsStyle.SQUARE);
				barChartSprite.graphics.moveTo(barChartSprite.x, stage.stageHeight - 30); 
				barChartSprite.graphics.lineTo(barChartSprite.x, -(bars.entries[i].value));
				barChartSprite.x = barChartSprite.x + step;
				i++;

			}

		barChartSprite.x = 10;
	}

	public function drawHorizontalBarChart(bars:DataSet){
		
		var step = 70;
		var stage = Lib.current.stage;

		var barChartSprite = new Sprite();

		barChartSprite.x = 10;
		barChartSprite.y = 30;
		barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y);
		addChild(barChartSprite);

			var i = 0;
			while (i < bars.entries.length){

				barChartSprite.graphics.lineStyle(30,bars.entries[i].color,CapsStyle.SQUARE);
				barChartSprite.graphics.moveTo(barChartSprite.x, barChartSprite.y); 
				barChartSprite.graphics.lineTo(bars.entries[i].value, barChartSprite.y);
				barChartSprite.y = barChartSprite.y + step;
				i++;

			}

		barChartSprite.y = 10;
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