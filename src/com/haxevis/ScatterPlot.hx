package com.haxevis;
import com.haxevis.Grid;
import com.haxevis.DataSetItem;
import flash.geom.Point;

/**
 * ...
 * @author Yavor
 */

class ScatterPlot extends Grid
{
	@:isVar public var showLegend(get, set):Bool;
	function get_showLegend():Bool {
		return this.showLegend;
	}
	
	function set_showLegend(value:Bool):Bool {
		if (this.legend != null) {			
			this.legend.setValues(this.data);
		} else {
			this.legend = new Legend(this.data);
			this.legend.x = Grid.X + Grid.WIDTH + 20;
			this.legend.y = Grid.Y;
		}
		
		addChild(this.legend);
		return this.showLegend = value;
	}
	
	private var legend:Legend;
	private var data:DataSet;

	public function new(data:DataSet) {
		this.data = data;
		super(data.max(Axis.x) + 10, data.min(Axis.x) - 10, 10, data.max(Axis.y) + 10, data.min(Axis.y) - 10, 10);
		draw();
	}
	
	override private function draw():Void {
		super.draw();
		drawSet(this.data);
	}
	
	private function drawSet(data:DataSet):Void {
		for (item in data.items) {
			// Go deeper:
			//if (Std.is(item, DataSet)) {
				//drawSet(cast(item, DataSet));
				//continue;
			//}
			drawSetItem(item);
		}
	}
	
	private function drawSetItem(item:DataSetItem):Void {
		graphics.beginFill(item.color);
		
		var point:Point = new Point(item.x, item.y);
		point = toGridPoint(point);
		
		graphics.lineStyle(0.5);
		graphics.drawRect(point.x-2.5, point.y-2.5, 5,5);
	}
	
	
		
}