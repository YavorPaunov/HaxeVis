package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;

class StackedLineChart extends Grid {
	
	public function new (data:DataSet) {
		var	gridMin:Point = new Point(this.data.min(Axis.x), this.data.min(Axis.y));
		var	gridMax:Point = new Point(this.data.max(Axis.x) , this.data.max(Axis.y));
		var	interval:Point = new Point((gridMax.x - gridMin.x) / 5,  (gridMax.y - gridMin.y) / 5);
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
		
	}
	
	override private function calculateTicks():Void {
	}
	
	override private function draw():Void {
		super.draw();
		
		for (j in 0...this.data.items.
		for (i in 0...this.data.items.length) {
			var subData:DataSet = cast(this.data.items[i], DataSet);
			var startPoint:Point = toGridPoint(new Point(subData.items[0].x, subData.items[0].y));
			graphics.lineStyle(1, subData.color);
			graphics.moveTo(startPoint.x, startPoint.y);
			
			var pointTo:Point;
			// Draw lines
			for (item in subData.items){
				pointTo = toGridPoint(new Point(item.x, item.y));
				graphics.lineTo(pointTo.x, pointTo.y);
			}
			
			// Draw extra stuff
			for (item in subData.items) {
				pointTo = toGridPoint(new Point(item.x, item.y));
				graphics.beginFill(0xffffff);
				graphics.drawCircle(pointTo.x, pointTo.y, 3);
				graphics.endFill();
			}
		}
	}		
}