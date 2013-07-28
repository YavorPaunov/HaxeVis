package com.haxevis;

import com.haxevis.DataSetItem;

class DataSet extends DataSetItem{
	
	public var items:Array<DataSetItem>;
	
    public function new(?items:Array<DataSetItem>) {
		super();
		if (items != null) {
			this.items = items;
		} else {
			this.items = new Array();
		}
    }
	
	public function sum(axis:Axis):Float {
		var sum:Float = 0;
		for (item in this.items) {
			switch(axis) {
				case Axis.x: sum += item.x;
				case Axis.y: sum += item.y;
				case Axis.z: sum += item.z;
			}
		}
		return sum;
	}
	
	public function avg(axis:Axis):Float {
		return sum(axis) / items.length;
	}
	
	public function min(axis:Axis):Float {
		var min:Float = Math.POSITIVE_INFINITY;
		for (item in this.items) {
			if (Std.is(item, DataSet)) {
				var set:DataSet = cast(item, DataSet);
				min = Math.min(set.min(axis), min);
			} else {
				switch(axis) {
					case Axis.x: min = Math.min(item.x, min);
					case Axis.y: min = Math.min(item.y, min);
					case Axis.z: min = Math.min(item.z, min);
				}
			}
		}
		return min;
	}

	public function max(axis:Axis):Float {
		var max:Float = Math.NEGATIVE_INFINITY;
		for (item in this.items) {
			if (Std.is(item, DataSet)) {
				var set:DataSet = cast(item, DataSet);
				max = Math.max(set.max(axis), max);
			} else {
				switch(axis) {
					case Axis.x: max = Math.max(item.x, max);
					case Axis.y: max = Math.max(item.y, max);
					case Axis.z: max = Math.max(item.z, max);
				}
			}
		}
		return max;
	}
	
	public function setInterval(axis:Axis, interval:Float, ?min:Float):Void {
		var current:Float;
		if (min == null) {
			current = interval;
		} else { 
			current = min;
		}
		
		for (item in this.items) {
			switch(axis) {
				case Axis.x:item.x = current;
				case Axis.y:item.y = current;
				case Axis.z:item.z = current;
			}
			current += interval;
		}
	}
	
	public function getRatios(axis:Axis):Array<Float> {
		var ratios:Array<Float> = new Array();
		var sum:Float = sum(axis);
		for (item in this.items) {
			var value:Float;
			switch(axis) {
				case Axis.x:value = item.x;
				case Axis.y:value = item.y;
				case Axis.z:value = item.z;
			}
			ratios.push(value / sum);
		}
		return ratios;
	}
	
	override public function flip(axis1:Axis, axis2:Axis):Void {
		if(this.items != null) {
			for (item in this.items) {
				item.flip(axis1, axis2);
			}
		}
	}
		
	override private function set_color(value:Int):Int {
		if (this.items != null) {			
			for (item in this.items) {
				item.color = value;
			}
		}
		return value;
	}
	
	override private function get_color():Int {
		if (this.items != null) {			
			if (items.length > 0) {
				return items[0].color;
			}
		}
		return this.color;
	}
	
	override private function get_name():String {
		if (this.items != null) {
			if (items.length > 0) {
				return items[0].name;
			}
		}
		return this.name;
	}
	
	override private function set_name(value:String):String {
		this.name = name;
		if (this.items != null) {
			for (item in this.items) {
				item.name = value;
			}
		}
		return value;
	}
	
	override private function get_x():Float {
		return avg(Axis.x);
	}
	
	override private function set_x(value:Float):Float {
		if(this.items != null){
			for (item in this.items) {
				item.x = value;
			}
		}
		return value;
	}
	
	override private function get_y():Float {
		return avg(Axis.y);
	}
	
	override private function set_y(value:Float):Float {
		if (this.items != null) {			
			for (item in this.items) {
				item.y = value;
			}
		}
		return value;
	}
	
	override private function get_z():Float {
		return avg(Axis.z);
	}
	
	override private function set_z(value:Float):Float {
		if (this.items != null) {
			for (item in this.items) {
				item.z = value;
			}
		}
		return value;
	}
	
	override public function toString():String {
		var str:String = super.toString();
		str += "\n[";
		for (item in this.items) {
			str += "\n\tx: " + item.x + " y: " + item.y + " z: " + item.z;
		}
		str += "\n]";
		return str;
	}
	
}