package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.Lib;
import nme.display.DisplayObject;
import nme.text.TextField;
import nme.text.TextFormat;

class LineChart extends Sprite {

	private var _showLegend:Bool;
	private var _legend:Legend;
	private var _data:DataSet;
	
	
	
	public function new (data:DataSet) {

		super();
		_data = data;
		_showLegend = false;

		for (i in data.items){
	//	drawLineChart(data);
		drawLineChart(cast(i,DataSet));

		}

	}

	public function drawLineChart(data:DataSet){
		
		var step = 100;
		var stage = Lib.current.stage;

		var lineChartSprite = new Sprite();

		lineChartSprite.x = 10;
		lineChartSprite.y = stage.stageHeight - 10;
		
		lineChartSprite.graphics.moveTo(lineChartSprite.x, -(data.items[0].y));
		addChild(lineChartSprite);

			var i = 1;
			while (i < data.items.length){
				lineChartSprite.graphics.lineStyle(2,data.items[i].color);
				lineChartSprite.graphics.lineTo(lineChartSprite.x + step, -(data.items[i].y));
				lineChartSprite.x = lineChartSprite.x + step;
				i++;

			}

		lineChartSprite.x = 10;
		//lineChartSprite.graphics.lineStyle(2,color);

			var i = 1;
			while (i < data.items.length){
				lineChartSprite.graphics.lineStyle(2,data.items[i].color);
				lineChartSprite.graphics.beginFill(0xffffff);
				lineChartSprite.graphics.drawCircle(lineChartSprite.x + step, -(data.items[i].y),4);
				lineChartSprite.graphics.endFill();
				lineChartSprite.x = lineChartSprite.x + step;
				i++;

			}

		lineChartSprite.x = 10;
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