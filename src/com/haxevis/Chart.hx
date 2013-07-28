package com.haxevis;
import flash.display.Sprite;

/**
 * ...
 * @author Yavor Paunov
 */
typedef ChartGraphics = {
	
	fill:{
		alpha:Float,
		thickness:Float
	},
	
	line:{
		alpha:Float,
		thickness:Float
	}

}
 
class Chart extends Sprite {
	
	public var w:Float;
	public var h:Float;
	
	public var chartGraphics:ChartGraphics;
	
	private var legend:Legend;
	private var data:DataSet;
	@:isVar public var showLegend(default, set):Bool;
	function set_showLegend(value:Bool):Bool {
		this.showLegend = value;
		return showLegend;
	}
	
	function new() {
		super();
		
		this.chartGraphics = {
			fill: {
				thickness: 5,
				alpha: 1
			},
			
			line: {
				thickness: 1,
				alpha: 1
			}
		};
	}
	
	private function draw():Void {}
	
	public function redraw():Void {
		draw();
	}
	
}