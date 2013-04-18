package com.stepasyuk_paunov.haxevis;
import com.stepasyuk_paunov.haxevis.LineChartDataSetEntry;
/**
 * ...
 * @author Yavor
 */

class DataSetEntry
{

	private var _name:String;
	private var _value:Float;
	private var _color:Int;
	
	public function new(name:String, value:Float, color:Int = -1) 
	{
		_name = name;
		_value = value;
		if (color == -1) {
			_color = Colors.random();
		} else {
			_color = color;
		}
	}
	
	private function get_name():String 
	{
		return _name;
	}
	
	private function set_name(value:String):String 
	{
		return _name = value;
	}
	
	public var name(get_name, set_name):String;
	
	private function get_value():Float 
	{
		return _value;
	}
	
	public var value(get_value, set_value):Float;

	private function set_value(value:Float):Float 
	{
		return _value = value;
	}
	
	private function get_color():Int 
	{
		return _color;
	}
	
	private function set_color(value:Int):Int 
	{
		return _color = value;
	}
	
	public var color(get_color, set_color):Int;
	
	
	
}