package com.stepasyuk_paunov.haxevis;
import haxe.remoting.FlashJsConnection;
import nme.Lib;

/**
 * ...
 * @author Yavor
 */

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
	public function sum(field:String):Float {
		var sum:Float = 0;
		for (item in _items) 
		{
			sum += cast(Reflect.getProperty(item, field), Float);
		}
		return sum;
	}
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function avg(field:String):Float {
		return sum(field) / items.length;
	}
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function min(field:String):Float {
		var min:Float = Math.POSITIVE_INFINITY;
		for (item in _items) 
		{
			if (Std.is(item, DataSet)) {
				var set:DataSet = cast(item, DataSet);
				min = Math.min(set.min(field), min);
			} else {
				min = Math.min(cast(Reflect.getProperty(item, field), Float), min);
			}
		}
		return min;
	}
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function max(field:String):Float {
		var max:Float = Math.NEGATIVE_INFINITY;
		for (item in _items) 
		{
			if (Std.is(item, DataSet)) {
				var set:DataSet = cast(item, DataSet);
				max = Math.max(set.max(field), max);
			} else {
				max = Math.max(cast(Reflect.getProperty(item, field), Float), max);
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
	public function setInterval(field:String, interval:Float, ?min:Float):Void {
		var current:Float;
		if (min == null) {
			current = interval;
		} else { 
			current = min;
		}
		for (item in _items) 
		{
			Reflect.setProperty(item, field, current);
			current += interval;
		}
	}
	
	/**
	 * 
	 * @param	field
	 * @return
	 */
	public function getRatios(field:String):Array<Float> {
		var ratios:Array<Float> = new Array();
		var sum:Float = sum(field);
		for (item in _items) 
		{
			var value:Float = cast(Reflect.getProperty(item, field), Float);
			ratios.push(value / sum);
		}
		return ratios;
	}
	
	/**
	 * 
	 * @param	field1
	 * @param	field2
	 */
	override public function flip(field1:String, field2:String):Void 
	{
		for (item in _items) 
		{
			item.flip(field1, field2);
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
		return avg(DataSetItem.X);
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
		return avg(DataSetItem.Y);
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
		return avg(DataSetItem.Z);
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