package com.haxevis;
import flash.display.Sprite;

/**
 * ...
 * @author Yavor Paunov
 */


using ChartElement.ChartElementStates;
class Chart extends Sprite {
	
	public var w:Float;
	public var h:Float;
		
	public var autoRedraw:Bool;
	
	private var legend:Legend;
	private var data:DataSet;
	
	@:isVar public var chartElementStates(default, set):ChartElementStates;
	function set_chartElementStates(value:ChartElementStates):ChartElementStates {
		this.chartElementStates = value;
		if (autoRedraw) {
			draw();
		}
		return this.chartElementStates;
	}
	
	@:isVar public var showLegend(default, set):Bool;
	function set_showLegend(value:Bool):Bool {
		this.showLegend = value;
		return this.showLegend;
	}
	
	function new() {
		super();
	}
	
	private function draw():Void {}
	
	public function redraw():Void {
		draw();
	}
	
}