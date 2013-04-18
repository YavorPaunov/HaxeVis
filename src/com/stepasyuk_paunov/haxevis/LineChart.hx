package com.stepasyuk_paunov.haxevis;
import nme.display.Sprite;
import nme.Lib;
import native.display.DisplayObject;
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

		for (i in _data.entries){

		drawLineChart(cast(i,LineChartDataSetEntry).valueSet, i.color);

		}

	}

	public function drawLineChart(values:Array<Float>, color:Int){
		
		var step = 100;
		var stage = Lib.current.stage;

		var lineChartSprite = new Sprite();

		lineChartSprite.x = 10;
		lineChartSprite.y = stage.stageHeight - 10;
		lineChartSprite.graphics.lineStyle(2,color);
		lineChartSprite.graphics.moveTo(lineChartSprite.x, -(values[0]));
		addChild(lineChartSprite);

			var i = 1;
			while (i < values.length){

				lineChartSprite.graphics.lineTo(lineChartSprite.x + step, -(values[i]));
				lineChartSprite.x = lineChartSprite.x + step;
				i++;

			}

		lineChartSprite.x = 10;
		lineChartSprite.graphics.lineStyle(2,color);

			var i = 1;
			while (i < values.length){

				lineChartSprite.graphics.beginFill(0xffffff);
				lineChartSprite.graphics.drawCircle(lineChartSprite.x + step, -(values[i]),4);
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