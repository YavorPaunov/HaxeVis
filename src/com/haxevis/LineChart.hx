package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;

class LineChart extends Grid {

	/**
	 * 
	 * @param  data A DataSet containing data for the 
	 * @param  minInd The lowest value of the independent variable (x in this case)
	 * @param  intervalInd The interval between the values of the independent variable
	 */
	public function new (data:DataSet) {
		super();
		
		this.data = data;
		
		calculateLimits();
	}

	override private function draw():Void {
		super.draw();
		for (j in 0...this.data.items.length) {
			var items:DataSet = cast this.data.items[j];
			for (i in 0...items.items.length) {
				var item = items.items[i];
				
				var startPoint:Point = toGridPoint(new Point(items.items[0].x, items.items[0].y));
				if (i > 0) {
					startPoint = toGridPoint(new Point(items.items[i - 1].x, items.items[i - 1].y));
				}
				
				graphics.lineStyle(1, items.color);
				graphics.moveTo(startPoint.x, startPoint.y);
				
				var pointTo:Point = toGridPoint(new Point(item.x, item.y));
				graphics.lineTo(pointTo.x, pointTo.y);
				
				graphics.beginFill(item.color);
				graphics.drawCircle(pointTo.x, pointTo.y, 3);
				graphics.endFill();
				
				addLabel(item, pointTo, top);
			}
			
		}
	}
	
	override private function calculateLimits():Void {
		super.calculateLimits();
		
		var gridMin:Point = new Point(data.min(Axis.x), Math.min(0, data.min(Axis.y)));
		var gridMax:Point = new Point(data.max(Axis.x), data.max(Axis.y) + this.data.avg(Axis.y));
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
	}

}