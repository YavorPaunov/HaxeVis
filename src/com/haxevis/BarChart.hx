package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

using com.haxevis.Grid;
class BarChart extends Grid implements IBars {
	
	public var vertical:Bool;
	
	public function new (data:DataSet) {
		super();
		
		this.data = data;
		this.vertical = false;
		
		calculateLimits();
	}

	override private function draw():Void {
		super.draw();
		for (i in 0...this.data.items.length) {
			
			var item:DataSetItem = this.data.items[i];
			var pos:Point = toGridPoint(new Point(item.x, item.y)); 
			
			var bottom:Point = toGridPoint(new Point(Math.max(this.xBottom, 0), Math.max(this.yBottom, 0)));
			if (chartGraphics.line.thickness > 0 && chartGraphics.line.alpha > 0) {
				graphics.lineStyle(chartGraphics.line.thickness, 0x1a1a1a, chartGraphics.line.alpha);				
			}
			
			graphics.beginFill(item.color, chartGraphics.fill.alpha);
			
			var height:Float;
			var width:Float;
			if (this.vertical) {				
				height = pos.y - bottom.y;
				width = chartGraphics.fill.thickness * ratio.x;
				
				graphics.drawRect(pos.x - width / 2, bottom.y, width, height);
			} else {
				height =chartGraphics.fill.thickness * ratio.y;
				width = pos.x - bottom.x;
				
				graphics.drawRect(Grid.X, pos.y - height / 2,  (bottom.x - Grid.X) + width, height);
			}
			graphics.endFill();
			
			var relPos:LabelRelativePosition;
			if (this.vertical) {
				relPos = top;
			} else {
				relPos = right;
			}
			
			addLabel(item, pos, relPos);
		}
	}
	
	override private function calculateTicks():Void {
		super.calculateTicks();
		
		for (i in 0...this.data.items.length) {
			var item:DataSetItem = this.data.items[i];
			ticksX.push(item.x);
			ticksY.push(item.y);
		}		
	}
	
	override private function calculateLimits():Void {
		super.calculateLimits();
		
		var	gridMin:Point;
		var	gridMax:Point;
		var	interval:Point;

		if (vertical) {
			gridMin = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
			gridMax = new Point(this.data.max(Axis.x), this.data.max(Axis.y));
			gridMax.x += data.items[0].x;
			gridMax.y += data.avg(Axis.y);
			
		} else {
			gridMin = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
			gridMax = new Point(this.data.max(Axis.x), this.data.max(Axis.y));
			gridMax.y += data.items[0].y;
			gridMax.x += data.avg(Axis.x);
		}
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
	}
		
}