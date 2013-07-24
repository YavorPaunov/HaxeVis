package com.haxevis;
import com.haxevis.DataSetItem;
import flash.geom.Point;

class LineChart extends Grid {

	@:isVar public var showLegend(get, set):Bool;
	function get_showLegend():Bool {
		return this.showLegend;
	}
	
	function set_showLegend(value:Bool):Bool {
		this.showLegend = value;
		if(this.showLegend){
			if (this.legend != null) {		
				this.legend.setValues(this.data);
			} else {
				this.legend = new Legend(this.data);
				this.legend.x = Grid.X + Grid.WIDTH + 20;
				this.legend.y = Grid.Y;
			}
			addChild(this.legend);
		} else if (this.legend != null && this.legend.parent == this) {
			removeChild(legend);
		}
		return showLegend;
	}
	
	private var legend:Legend;
	private var data:DataSet;
		
	/**
	 * 
	 * @param  data A DataSet containing data for the 
	 * @param  minInd The lowest value of the independent variable (x in this case)
	 * @param  intervalInd The interval between the values of the independent variable
	 */
	public function new (data:DataSet, minInd:Float=1, intervalInd:Float=1) {
		this.data = data;

		for (item in data.items) {
			cast(item, DataSet).setInterval(Axis.x, intervalInd, minInd);
		}
		
		//this.lineAtZero = true;
		
		var gridMin:Point = new Point(data.min(Axis.x), data.min(Axis.y));
		var gridMax:Point = new Point(data.max(Axis.x), data.max(Axis.y));
		var interval:Point = new Point(intervalInd,  (gridMax.y - gridMin.y) / 10);
		
		super(gridMax.x, gridMin.x, interval.x, gridMax.y, gridMin.y, interval.y);
	}

	override private function draw():Void {
		super.draw();
		for (i in 0...this.data.items.length) {
			var subData:DataSet = cast(this.data.items[i], DataSet);
			var startPoint:Point = toGridPoint(new Point(subData.items[0].x, subData.items[0].y));
			graphics.lineStyle(1, subData.color);
			graphics.moveTo(startPoint.x, startPoint.y);
			var pointTo:Point;
			for (item in subData.items){
				pointTo = toGridPoint(new Point(item.x, item.y));
				graphics.lineTo(pointTo.x, pointTo.y);

			}
			for (item in subData.items) {
				pointTo = toGridPoint(new Point(item.x, item.y));
				graphics.beginFill(0xffffff);
				graphics.drawCircle(pointTo.x, pointTo.y, 3);
				graphics.endFill();
			}
		}
	}
	
	//override function set_xTop(value:Float):Float {
		//this.xTop = value;
		//draw();
		//return this.xTop;
	//}
	//
	//override function set_xBottom(value:Float):Float {
		//super.xBottom = value;
		//draw();
		//return super.xBottom;
	//}
	//
	//override function set_xDel(value:Float):Float {
		//super.xDel = value;
		//draw();
		//return super.xDel;
	//}
	//
	//override function set_yTop(value:Float):Float {
		//super.yTop = value;
		//draw();
		//return super.yTop;
	//}
		//
	//override function set_yBottom(value:Float):Float {
		//super.yBottom = value;
		//draw();
		//return super.yBottom;
	//}
		//
	//override function set_yDel(value:Float):Float {
		//super.yDel = value;
		//draw();
		//return super.yDel;
	//}
		//
	//override function set_lineAtZero(value:Bool):Bool {
		//super.lineAtZero = value;
		//draw();
		//return super.lineAtZero;
	//}
		//
	//override function set_alwaysShowZero(value:Bool):Bool {
		//super.alwaysShowZero = value;
		//draw();
		//return super.alwaysShowZero;
	//}

}