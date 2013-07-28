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
		
		var	gridMin:Point;
		var	gridMax:Point;
		var	interval:Point;

		if (vertical) {
			gridMin = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
			gridMax = new Point(this.data.max(Axis.x), this.data.max(Axis.y));
			interval = new Point((gridMax.x - gridMin.x) / data.items.length,  gridMax.y - gridMin.y);
			
			gridMax.x += interval.x / 2;
		} else {
			gridMin = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
			gridMax = new Point(this.data.max(Axis.x), this.data.max(Axis.y));
			interval = new Point((gridMax.x - gridMin.x), (gridMax.y - gridMin.y) / data.items.length);
			gridMax.y += interval.y / 2;
		}
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
		
		
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
			
			// Add label
			if (showLabelsX) {
				var label:TextField = new TextField();
				label.selectable = false;
				
				switch(this.xLabelText) {
					case LabelText.name:
						label.text = item.name;
					case LabelText.value:
						label.text = Std.string(item.x);
				}
				
				label.autoSize = TextFieldAutoSize.LEFT;
				label.x = pos.x - label.width/2;
				
				switch(this.xLabelPosition) {
					case LabelPosition.axis:
						label.y = Grid.Y + Grid.HEIGHT;
					case LabelPosition.point:
						label.y = pos.y;
				}
				
				
				addChild(label);
			} if (showLabelsY) {
				var label:TextField = new TextField();
				label.selectable = false;
				
				switch(this.yLabelText) {
					case LabelText.name:
						label.text = item.name;
					case LabelText.value:
						label.text = Std.string(item.y);
				}
				
				label.autoSize = TextFieldAutoSize.LEFT;
				
				
				switch(this.yLabelPosition) {
					case LabelPosition.axis:
						label.x = Grid.X - label.width;
						label.y = pos.y - label.height / 2;
					case LabelPosition.point:
						label.x = pos.x - label.width / 2;
						label.y = pos.y - label.height;
				}
				
				addChild(label);
			}
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
		
}