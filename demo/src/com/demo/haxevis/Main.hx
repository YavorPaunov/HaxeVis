package com.demo.haxevis;

import com.stepasyuk_paunov.haxevis.DataSet;
import com.stepasyuk_paunov.haxevis.DataSetEntry;
import com.stepasyuk_paunov.haxevis.Grid;
import com.stepasyuk_paunov.haxevis.PieChart;
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
		
		var set:DataSet = new DataSet(new Array());
		set.entries.push(new DataSetEntry("First", 13));
		set.entries.push(new DataSetEntry("Second", 10));
		set.entries.push(new DataSetEntry("Third", 15));
		set.entries.push(new DataSetEntry("Fourth", 20));
		//set.entries.push(new DataSetEntry("Fifth", 5));
		//set.entries.push(new DataSetEntry("Sixth", 8));
		//set.entries.push(new DataSetEntry("Seventh", 15));
		
		var chart:PieChart = new PieChart(set);
		chart.x = chart.y = 15;
		chart.showLegend = true;
		addChild(chart);
		
		var grid:Grid = new Grid(30, -25, 8, 10, -40, 10);
		grid.x = 16;
		grid.y = chart.y + chart.height + 20;
		addChild(grid);
		
		
	}
	
	static public function main() 
	{
		var stage = Lib.current.stage;
		stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		stage.align = nme.display.StageAlign.TOP_LEFT;
		
		Lib.current.addChild(new Main());
	}
	
}
