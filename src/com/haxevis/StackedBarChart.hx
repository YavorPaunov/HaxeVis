package com.haxevis;
import com.haxevis.Grid;
import com.haxevis.DataSetItem;
import flash.geom.Point;


class StackedBarChart extends Grid implements IBars {

	public var vertical:Bool;
	public var barThickness:Float;
	
	public function new (data:DataSet) {

		this.data = data;
		
		this.vertical = false;
		this.barThickness = 1;
		
		var	gridMin:Point = new Point(this.data.min(Axis.x), this.data.min(Axis.y));
		var	gridMax:Point = new Point(this.data.max(Axis.x) , this.data.max(Axis.y));
		var	interval:Point = new Point((gridMax.x - gridMin.x) / 5,  (gridMax.y - gridMin.y) / 5);
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
	}

	override private function draw(){
		super.draw();
		
		for (j in 0...this.data.items.length) {
			var items:DataSet = cast this.data.items[j];
			for (i in 0...items.items.length) {
				
				var item:DataSetItem = items.items[i];
				var pos:Point = toGridPoint(new Point(item.x, item.y)); 
				
				var bottom:Point = toGridPoint(new Point(Math.max(this.xBottom, 0), Math.max(this.yBottom, 0)));
				
				graphics.lineStyle(1, 0x1a1a1a);
				graphics.beginFill(item.color);
				
				var height:Float;
				var width:Float;
				if (this.vertical) {
					
					height = pos.y - bottom.y;
					width = barThickness;
					
					var ty:Float = bottom.y;
					if (j > 0) {
						var prev:DataSet = cast this.data.items[j-1];
						var prevPos:Point = toGridPoint(new Point(prev.items[i].x, prev.items[i].y));
						ty = prevPos.y;
					}
					graphics.drawRect(pos.x - width/2, ty, width, height);
				} else {
					
					height = barThickness;
					width = pos.x - bottom.x;
					
					var tx:Float = bottom.x;
					if (j > 0) {
						var prev:DataSet = cast this.data.items[j-1];
						var prevPos:Point = toGridPoint(new Point(prev.items[i].x, prev.items[i].y));
						tx = prevPos.x;
					}
					graphics.drawRect(tx, pos.y - height / 2, width, height);
				}
				graphics.endFill();
				
			}
		}
		
	}

}