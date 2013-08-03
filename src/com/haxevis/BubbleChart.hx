package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;

/**
 * ...
 * @author Yavor
 */
using ChartElement.ChartElementStates;
using Grid.LabelRelativePosition;
using Grid.LabelPosition;
class BubbleChart extends ScatterPlot
{

	public function new(w:Float, h:Float, values:Array<Array<Float>>, labels:Array<Dynamic>, colors:Array<Int>, ?chartElementStates:ChartElementStates) 
	{
		super(w, h, values, labels, colors, chartElementStates);
		
		showLabelsX = false;
		showLabelsY = false;
		
		showLabelsZ = true;
		zLabelPosition = point;
		zLabelText = value;
	}
	
	override private function drawItem(item:DataSetItem):Void {
		var point:Point = new Point(item.x, item.y);
		point = toGridPoint(point);
		
		var element:ChartElement = new ChartElement(chartElementStates, item.color, [circle(item.z* (ratio.x + ratio.y) / 2)]);
		element.x = point.x;
		element.y = point.y;
		addElement(element);
		
		var xrel:LabelRelativePosition, yrel:LabelRelativePosition;
		xrel = center;
		yrel = center;
		
		addLabel(item, point, xrel, yrel);
	}
	
	override private function calculateLimits():Void {
		super.calculateLimits();
		
		this.xTop += data.max(Axis.z);
		this.yTop += data.max(Axis.z);
		
		this.xBottom -= data.max(Axis.z);
		this.yBottom -= data.max(Axis.z);
	}
		
}