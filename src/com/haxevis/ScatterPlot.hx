package com.haxevis;
import com.haxevis.Grid;
import com.haxevis.DataSetItem;
import flash.geom.Point;

/**
 * ...
 * @author Yavor
 */
using ChartElement.ChartElementStates;
using ChartElement.ChartElementShape;
class ScatterPlot extends Grid
{
	public var pointShape:ChartElementShape;
	
	public function new(w:Float, h:Float, values:Array<Array<Float>>, labels:Array<Dynamic>, colors:Array<Int>, ?chartElementStates:ChartElementStates) {
		super(w,h);
		this.data = new DataSet();
		for (i in 0...values.length) {
			var value:Array<Float> = values[i];
			
			var itemx:Float = value[0];
			var itemy:Float = value[1];
			var itemz:Float = 0;
			if (value.length > 2) {
				itemz = value[2];
			}
			
			var label = labels[i % labels.length];
			var item:DataSetItem = new DataSetItem(itemx, itemy, itemz, label, colors[i % colors.length]);
				
			this.data.items.push(item);
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
					alpha:0.1
				},
				
				selected: {
					fillColor:item,
					strokeColor:item,
					strokeThickness:1,
					width:0.5,
					alpha:1
				},
				
				otherSelected: {
					fillColor:item,
					strokeColor:item,
					strokeThickness:1,
					width:0.5,
					alpha:0.5
				},
				
				otherHovered: {
					fillColor:item,
					strokeColor:item,
					strokeThickness:1,
					width:0.5,
					alpha:0.5
				}
			}
		} else {
			this.chartElementStates = chartElementStates;
		}
		
		this.gridGraphics.ticks.color = this.gridGraphics.gridlines.color;

		this.gridGraphics.ticks.alpha = 1;
		this.gridGraphics.ticks.thickness = 1;
		
		this.gridGraphics.gridlines.alpha = 1;
		this.gridGraphics.gridlines.thickness = 1;
		
		//this.gridGraphics.axislines.alpha = 1;
		//this.gridGraphics.axislines.thickness = 1;
		
		//this.showLabelsY = true;
		//this.showLabelsX = true;
		//
		//this.yLabelPosition = point;
		//this.yLabelText = value;
		
		this.xLabelPosition = point;
		this.xLabelText = value;
		
		this.pointShape = rect(5, 5);
		calculateLimits();
		
		distributeTicks(10, Axis.x);
		distributeTicks(10, Axis.y);
	}
	
	override private function draw():Void {
		super.draw();
		
		for (item in data.items) {
			drawItem(item);
		}
	}
	
	private function drawItem(item:DataSetItem):Void {		
		var point:Point = new Point(item.x, item.y);
		point = toGridPoint(point);
		
		var element:ChartElement = new ChartElement(chartElementStates, item.color, [this.pointShape]);
		element.x = point.x;
		element.y = point.y;
		addElement(element);
		
		var xrel:LabelRelativePosition, yrel:LabelRelativePosition;
		xrel = dist(-30, -20);
		yrel = dist(5, -20);
		addLabel(item, point, xrel, yrel);
	}
	
	override private function calculateLimits():Void {
		var gridMin:Point = new Point(data.min(Axis.x), Math.min(0, data.min(Axis.y)));
		var gridMax:Point = new Point(data.max(Axis.x), data.max(Axis.y) + this.data.min(Axis.y));
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
	}
	
	
		
}