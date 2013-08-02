package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;

using com.haxevis.Grid;
using ChartElement.ChartElementStates;
class LineChart extends Grid {

	private var defaultColors:Array<Int>;
	
	public function new (w:Float, h:Float, values:Array<Array<Float>>, labels:Array<Dynamic>, colors:Array<Int>, ?chartElementStates:ChartElementStates) {
		super(w, h);
		
		this.data = new DataSet();
		for (i in 0...values.length) {
			var items:Array<Float> = values[i];
			var set:DataSet = new DataSet();
			for (j in 0...items.length) {
				var item:Float = items[j];
				var itemx:Float = j;
				
				var label = labels[i % labels.length];
				
				set.items.push(new DataSetItem(itemx, item, 0, Std.string(label), colors[i % colors.length]));
			}
			this.data.items.push(set);
		}
		
		// Establish default behaviour
		if (chartElementStates == null) {
			this.chartElementStates = {
				normal: {
					fillColor:item,
					strokeColor:item,
					strokeThickness:1,
					width:0.5,
					alpha:1
				},
				
				hovered: { 
					fillColor:item,
					strokeColor:item,
					strokeThickness:1,
					width:0.5,
					alpha:1
				},
				
				selected: {
					fillColor:item,
					strokeColor:item,
					strokeThickness:1,
					width:0.5,
					alpha:1
				}
			}
		} else {
			this.chartElementStates = chartElementStates;
		}
				
		this.showTicksY = false;
		this.gridGraphics.ticks.alpha = 1;
		this.gridGraphics.ticks.thickness = 1;
		
		this.gridGraphics.gridlines.alpha = 1;
		this.gridGraphics.gridlines.thickness = 1;
		
		this.gridGraphics.borders.alpha = 1;
		this.gridGraphics.borders.thickness = 1;
		
		this.showLabelsY = true;
		
		this.yLabelPosition = point;
		this.yLabelText = value;
		
		calculateLimits();
		distributeTicksDist(data.min(Axis.y), Axis.y);
		distributeTicks(values.length, Axis.x);
	}

	override private function draw():Void {
		super.draw();
		
		if (autoLimits) {
			calculateLimits();
		}
		
		for (j in 0...this.data.items.length) {
			var items:DataSet = cast this.data.items[j];
			for (i in 0...items.items.length) {
				var item = items.items[i];
				
				var startPoint:Point = toGridPoint(new Point(items.items[0].x, items.items[0].y));
				if (i > 0) {
					startPoint = toGridPoint(new Point(items.items[i - 1].x, items.items[i - 1].y));
				}
				
				graphics.lineStyle(this.chartElementStates.normal.strokeThickness, items.color);
				graphics.moveTo(startPoint.x, startPoint.y);
				
				var pointTo:Point = toGridPoint(new Point(item.x, item.y));
				graphics.lineTo(pointTo.x, pointTo.y);
				
				var element:ChartElement = new ChartElement(this.chartElementStates, item.color, circle(3));
				element.x = pointTo.x;
				element.y = pointTo.y;
				addChild(element);
				
				var xrel:LabelRelativePosition, yrel:LabelRelativePosition;
				switch(this.xLabelPosition) {
					case LabelPosition.axis:
						xrel = bottom;
					case LabelPosition.point:
						xrel = top;
				}
				
				switch(this.yLabelPosition) {
					case LabelPosition.axis:
						yrel = left;
					case LabelPosition.point:
						yrel = top;
				}
				
				addLabel(item, pointTo, xrel, yrel);
			}
			
		}
	}
	
	override private function calculateLimits():Void {
		super.calculateLimits();
		
		var gridMin:Point = new Point(data.min(Axis.x), Math.min(0, data.min(Axis.y)));
		var gridMax:Point = new Point(data.max(Axis.x), data.max(Axis.y) + this.data.min(Axis.y));
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
	}

}