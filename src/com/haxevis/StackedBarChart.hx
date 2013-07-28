package com.haxevis;
import com.haxevis.Grid;
import com.haxevis.DataSetItem;
import flash.geom.Point;


class StackedBarChart extends Grid implements IBars {

	public var vertical:Bool;
	
	public function new (data:DataSet) {
		super();
		this.data = data;
		this.vertical = false;
		
		calculateLimits();
	}

	override private function draw(){
		super.draw();
		
		for (j in 0...this.data.items.length) {
			var items:DataSet = cast this.data.items[j];
			
			for (i in 0...items.items.length) {
				var item:DataSetItem = items.items[i];
				var pos:Point = toGridPoint(new Point(item.x, item.y)); 
				
				var bottom:Point = toGridPoint(new Point(Math.max(this.xBottom, 0), Math.max(this.yBottom, 0)));
				
				graphics.lineStyle(this.chartGraphics.line.thickness, 0x1a1a1a, this.chartGraphics.line.alpha);
				graphics.beginFill(item.color, this.chartGraphics.fill.alpha);
				
				var height:Float;
				var width:Float;
				if (this.vertical) {
					height = pos.y - bottom.y;
					width = this.chartGraphics.fill.thickness;
					
					var ty:Float = bottom.y;
					for (k in 0...j) {
						ty -= cast(data.items[k], DataSet).items[i].y * this.ratio.y;
					}
					graphics.drawRect(pos.x - width / 2, ty, width, height);
					addLabel(item, new Point(pos.x, ty + height), this.vertical);
				} else {
					
					width = pos.x - bottom.x;
					height = this.chartGraphics.fill.thickness;
					
					var tx = bottom.x;
					for (k in 0...j) {
						tx += cast(data.items[k], DataSet).items[i].x * this.ratio.x;
					}
					
					graphics.drawRect(tx, pos.y - height / 2, width, height);
					addLabel(item, new Point(tx+width, pos.y), this.vertical);
				}
				graphics.endFill();
				
				
			}
		}
	}
	
	override private function calculateLimits():Void {
		super.calculateLimits();
		var sums:Array<Float> = [];
		for (i in 0...data.items.length) {
			var subData:DataSet = cast data.items[i];
			
			for (j in 0...subData.items.length) {
				var item = subData.items[j];
				if (sums.length <= j) {
					sums.push(0);
				}
				
				sums[j] += this.vertical ? item.y : item.x;
			}
		}
		
		var maxSum:Float = 0;
		for (sum in sums) {
			maxSum = Math.max(maxSum, sum);
		}
		
		var	gridMin:Point = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
		var	gridMax:Point;
		
		var firstSet:DataSet = cast data.items[0];
		
		if (this.vertical) {
			gridMax = new Point(this.data.max(Axis.x) + firstSet.items[0].x, maxSum + data.avg(Axis.y));
		} else {
			gridMax = new Point(maxSum + data.avg(Axis.x), this.data.max(Axis.y) + firstSet.items[0].y);
		}
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
	}

}