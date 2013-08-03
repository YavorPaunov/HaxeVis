package com.haxevis;
import com.haxevis.Grid;
import com.haxevis.DataSetItem;
import flash.geom.Point;

using IBars.Orientation;
using ChartElement.ChartElementStates;
class StackedBarChart extends Grid implements IBars {
	
	public var orientation:Orientation;
	
	public function new (w:Float, h:Float, values:Array<Array<Float>>, labels:Array<Dynamic>, colors:Array<Int>, ?chartElementStates:ChartElementStates) {
		super(w, h);
		
		this.data = new DataSet();
		for (i in 0...values.length) {
			var items:Array<Float> = values[i];
			var set:DataSet = new DataSet();
			for (j in 0...items.length) {
				var item:Float = items[j];
				var itemx:Float = j + 1;
				
				var label = labels[i % labels.length];
				
				set.items.push(new DataSetItem(itemx, item, 0, Std.string(label), colors[i % colors.length]));
			}
			this.data.items.push(set);
		}
		
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
					alpha:0.5
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
		
		this.showLabelsY = true;
		this.yLabelPosition = point;
		this.yLabelText = value;
		
		this.showTicksX = false;
		
		this.showTicksY = true;
		this.gridGraphics.gridlines.alpha = 1;
		this.gridGraphics.gridlines.thickness = 1;
		
		this.gridGraphics.ticks.alpha = 1;
		this.gridGraphics.ticks.thickness = 1;
		
		calculateLimits();
		distributeTicksDist(data.min(Axis.y), Axis.y);
		distributeTicksDist(data.min(Axis.x), Axis.x, data.min(Axis.x)/2);
	}

	override private function draw(){
		super.draw();
		
		for (j in 0...this.data.items.length) {
			var items:DataSet = cast this.data.items[j];
			
			for (i in 0...items.items.length) {
				var item:DataSetItem = items.items[i];
				var pos:Point = toGridPoint(new Point(item.x, item.y)); 
				
				var bottom:Point = toGridPoint(new Point(Math.max(this.xBottom, 0), Math.max(this.yBottom, 0)));
					
				var height:Float;
				var width:Float;
				var element:ChartElement;
				
				if (orientation == HORIZONTAL) {
					height = pos.y - bottom.y;
					width = this.chartElementStates.normal.width * ratio.x;
					
					var ty:Float = bottom.y;
					for (k in 0...j) {
						ty -= cast(data.items[k], DataSet).items[i].y * this.ratio.y;
					}
					//graphics.drawRect(pos.x - width / 2, ty, width, height);
					
					var relPos:LabelRelativePosition = top;
					
					element = new ChartElement(chartElementStates, item.color, [rect(width, height)]);
					element.x = pos.x;
					element.y = ty + height / 2;
					
					
					
					addLabel(item, new Point(pos.x, ty + height), relPos, relPos);
				} else {
					
					width = pos.x - bottom.x;
					height = this.chartElementStates.normal.width * ratio.y;
					
					var tx = bottom.x;
					for (k in 0...j) {
						tx += cast(data.items[k], DataSet).items[i].x * this.ratio.x;
					}
										
					var relPos:LabelRelativePosition = right;
					
					element = new ChartElement(chartElementStates, item.color, [rect(width, height)]);
					element.x = tx + width/2;
					element.y = pos.y;
					
					addLabel(item, new Point(tx+width, pos.y), relPos, relPos);
				}
				
				addElement(element);
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
				
				sums[j] += (orientation==HORIZONTAL) ? item.y : item.x;
			}
		}
		
		var maxSum:Float = 0;
		for (sum in sums) {
			maxSum = Math.max(maxSum, sum);
		}
		
		var	gridMin:Point = new Point(Math.min(0, this.data.min(Axis.x)), Math.min(0, this.data.min(Axis.y)));
		var	gridMax:Point;
		
		var firstSet:DataSet = cast data.items[0];
		
		if (orientation == HORIZONTAL) {
			gridMax = new Point(this.data.max(Axis.x), maxSum );
			
			gridMax.x += this.data.min(Axis.x) - gridMin.x;
			gridMax.y += data.avg(Axis.y);
		} else {
			gridMax = new Point(maxSum + data.avg(Axis.x), this.data.max(Axis.y) + firstSet.items[0].y);
		}
		
		this.xTop = gridMax.x;
		this.yTop = gridMax.y;
		
		this.xBottom = gridMin.x;
		this.yBottom = gridMin.y;
	}

}