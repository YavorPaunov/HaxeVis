package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

using com.haxevis.Grid;

using IBars.Orientation;
using ChartElement.ChartElementShape;
using ChartElement.ChartElementStates;
class BarChart extends Grid  implements IBars {
		
	public var orientation:Orientation;
	
	public function new (w:Float, h:Float, values:Array<Float>, labels:Array<Dynamic>, colors:Array<Int>, ?chartElementStates:ChartElementStates) {
		super(w, h);
		
		var data:DataSet;
		data = new DataSet();
		for (i in 0...values.length) {
			var item:DataSetItem;
			var itemx = i+1;
			if (Std.is(labels[i % labels.length], Float) || Std.is(labels[i % labels.length], Int)) {
				itemx = labels[i % labels.length];
			}
			
			item = new DataSetItem(itemx, values[i]);
			item.color = colors[i % colors.length]; // Re-use colors if colors.length < values.length
			item.name = labels[i % labels.length]; // Re-use labels
			data.items.push(item);
		}
		
		this.data = data;
		
		// Establish default behaviour
		this.orientation = HORIZONTAL;
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
		
		this.showLabelsX = true;
		this.xLabelPosition = point;
		
		this.showTicksY = true;
		this.gridGraphics.gridlines.alpha = 1;
		this.gridGraphics.gridlines.thickness = 1;
		
		this.gridGraphics.ticks.alpha = 1;
		this.gridGraphics.ticks.thickness = 1;
		
		
		calculateLimits();
		distributeTicksDist(data.min(Axis.y), Axis.y);
	}

	override private function draw():Void {
		super.draw();		
		for (item in this.data.items) {
			var pos:Point = toGridPoint(new Point(item.x, item.y)); 
			var element:ChartElement;
			
			var bottom:Point = toGridPoint(new Point(Math.max(this.xBottom, 0), Math.max(this.yBottom, 0)));
			
			var height:Float;
			var width:Float;
			if (this.orientation == HORIZONTAL) {				
				height = pos.y - bottom.y;
				width = this.chartElementStates.normal.width * ratio.x;
				
				element = new ChartElement(chartElementStates, item.color, ChartElementShape.rect(width, height));
				element.x = pos.x;
				element.y = bottom.y + height / 2;
			} else {
				height = this.chartElementStates.normal.width * ratio.y;
				width = pos.x - bottom.x;
				
				element = new ChartElement(chartElementStates, item.color, ChartElementShape.rect(width, height));
				element.x = this.paddingLeft + width/2;
				element.y = pos.y;
			}
			
			var xrel:LabelRelativePosition, yrel:LabelRelativePosition;
			switch(this.xLabelPosition) {
				case axis:
					xrel = LabelRelativePosition.bottom;
				case point:
					if (this.orientation == HORIZONTAL) {
						xrel = top;
					} else {
						xrel = right;
					}
			}
			
			switch(this.yLabelPosition) {
				case axis:
					yrel = LabelRelativePosition.left;
				case point:
					if (this.orientation == HORIZONTAL) {
						yrel = top;
					} else {
						yrel = right;
					}
			}
			
			addChild(element);
			addLabel(item, pos, xrel, yrel);
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

		if (this.orientation == HORIZONTAL) {
			gridMin = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
			gridMax = new Point(this.data.max(Axis.x), this.data.max(Axis.y));
			
			gridMax.x += this.data.min(Axis.x) - gridMin.x;
			gridMax.y += data.avg(Axis.y);
		} else {
			gridMin = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
			gridMax = new Point(this.data.max(Axis.x), this.data.max(Axis.y));
			
			gridMax.y += chartElementStates.normal.width;
			gridMax.x += data.avg(Axis.x);
		}
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
	}
		
}