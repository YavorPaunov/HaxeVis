package com.demo.haxevis;

import com.stepasyuk_paunov.haxevis.DataSet;
import com.stepasyuk_paunov.haxevis.DataSetEntry;
import com.stepasyuk_paunov.haxevis.LineChartDataSetEntry;
import com.stepasyuk_paunov.haxevis.PieChart;
import com.stepasyuk_paunov.haxevis.LineChart;
import com.stepasyuk_paunov.haxevis.BarChart;
import nme.display.Sprite;
import nme.events.Event;
import nme.Lib;

/**
 * ...
 * @author Yavor
 */

class Main extends Sprite 
{
	
	public function new() 
	{
		super();
		#if iphone
		Lib.current.stage.addEventListener(Event.RESIZE, init);
		#else
		addEventListener(Event.ADDED_TO_STAGE, init);
		#end
	}

	private function init(e) 
	{
		
		//var set:DataSet = new DataSet(new Array());
		var set:DataSet = new DataSet(new Array());
		set.entries.push(new DataSetEntry("First", 130, 0x6dc066));
		set.entries.push(new DataSetEntry("Second", 100, 0x3790E8));
		set.entries.push(new DataSetEntry("Third", 150, 0xff0000));
		set.entries.push(new DataSetEntry("Fourth", 200));
		//set.entries.push(new DataSetEntry("Fifth", 5));
		//set.entries.push(new DataSetEntry("Sixth", 8));
		//set.entries.push(new DataSetEntry("Seventh", 15));

		var set2:DataSet = new DataSet(new Array());
		set2.entries.push(new LineChartDataSetEntry("First", [100,120,180,200],0x3790E8));
		set2.entries.push(new LineChartDataSetEntry("Second", [150,140,135,210],0x6dc066));
		
		var chart:PieChart = new PieChart(set);
		chart.x = chart.y = 15;
		
		chart.showLegend = true;
		//addChild(chart);

		var lineChart:LineChart = new LineChart(set2);
		lineChart.showLegend = true;
		//addChild(lineChart);

		var barChart:BarChart = new BarChart(set, true);
		barChart.showLegend = true;
		addChild(barChart);
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
