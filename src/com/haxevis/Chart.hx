package com.haxevis;
import flash.display.Sprite;

/**
 * ...
 * @author Yavor Paunov
 */


using ChartElement.ChartElementStates;
class Chart extends Sprite {
	
	public var paddingLeft:Float = 20;
	public var paddingTop:Float = 10;
	public var paddingRight:Float = 150;
	public var paddingBottom:Float = 20;
	
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
		if (autoRedraw) {
			draw();
		}
		return this.showLegend;
	}
	
	function new() {
		super();
	}
	
	private function draw():Void {
		graphics.clear();
		
		while (numChildren > 0) {
			removeChildAt(0);
		}
		
		addLegend();
	}
	
	public function redraw():Void {
		draw();
	}
	
	public function addLegend():Void {
		
		if(legend == null) {
			legend = new Legend(data);
		}
		
		legend.x = this.paddingLeft + this.w + 25;
		legend.y = this.paddingTop;
		addChild(legend);
	}
	
}