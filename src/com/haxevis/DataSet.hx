package com.haxevis;

import com.haxevis.DataSetItem;

/**
 * ...
 * @author Yavor
 */
using com.haxevis.DataSetItem;
class DataSet extends DataSetItem
{
	
	private var _items:Array<DataSetItem>;
	
	/**
	 * 
	 * @param	?items
	 */
    public function new(?items:Array<DataSetItem>) {
		super();
		if (items != null) {
			_items = items;
		} else {
			_items = new Array();
		}
    }
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function sum(axis:DataSetItem.Axis):Float {
		var sum:Float = 0;
		for (item in _items) 
		{
			switch(axis) {
				case Axis.x: sum += item.x;
				case Axis.y: sum += item.y;
				case Axis.z: sum += item.z;
			}
		}
		return sum;
	}
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function avg(axis:DataSetItem.Axis):Float {
		return sum(axis) / items.length;
	}
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function min(axis:DataSetItem.Axis):Float {
		var min:Float = Math.POSITIVE_INFINITY;
		for (item in _items) 
		{
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
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function max(axis:DataSetItem.Axis):Float {
		var max:Float = Math.NEGATIVE_INFINITY;
		for (item in _items) 
		{
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
	
	/**
	 * 
	 * @param	field
	 * @param	interval
	 * @param	?min
	 */
	public function setInterval(axis:DataSetItem.Axis, interval:Float, ?min:Float):Void {
		var current:Float;
		if (min == null) {
			current = interval;
		} else { 
			current = min;
		}
		
		for (item in _items) 
		{
			switch(axis) {
				case Axis.x:item.x = current;
				case Axis.y:item.y = current;
				case Axis.z:item.z = current;
			}
			current += interval;
		}
	}
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function getRatios(axis:DataSetItem.Axis):Array<Float> {
		var ratios:Array<Float> = new Array();
		var sum:Float = sum(axis);
		for (item in _items) 
		{
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
	
	/**
	 * 
	 * @param	field1
	 * @param	field2
	 */
	override public function flip(axis1:DataSetItem.Axis, axis2:DataSetItem.Axis):Void 
	{
		for (item in _items) 
		{
			item.flip(axis1, axis2);
		}
	}
	
	
	// Getters and setters:
	private function get_items():Array<DataSetItem> 
	{
		return _items;
	}
	
	private function set_items(value:Array<DataSetItem>):Array<DataSetItem> 
	{
		return _items = value;
	}
	
	public var items(get_items, set_items):Array<DataSetItem>;
	
	override private function set_color(value:Int):Int {
		for (item in _items) 
		{
			item.color = value;
		}
		return value;
	}
	
	override private function get_color():Int {
		if (items.length > 0) {
			return items[0].color;
		}
		return -1;
	}
	
	override private function get_name():String 
	{
		if (items.length > 0) {
			return items[0].name;
		}
		return null;
	}
	
	override private function set_name(value:String):String 
	{
		for (item in _items) 
		{
			item.name = value;
		}
		return value;
	}
	
	override private function get_x():Float 
	{
		return avg(Axis.x);
	}
	
	override private function set_x(value:Float):Float 
	{
		for (item in _items) 
		{
			item.x = value;
		}
		return value;
	}
	
	override private function get_y():Float 
	{
		return avg(Axis.y);
	}
	
	override private function set_y(value:Float):Float 
	{
		for (item in _items) 
		{
			item.y = value;
		}
		return value;
	}
	
	override private function get_z():Float 
	{
		return avg(Axis.z);
	}
	
	override private function set_z(value:Float):Float 
	{
		for (item in _items) 
		{
			item.z = value;
		}
		return value;
	}
	
}