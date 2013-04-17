package com.stepasyuk_paunov.haxevis;

/**
 * ...
 * @author Yavor
 */

class DataSetEntry
{

	private var _name:String;
	private var _value:Float;
	
	public function new(name:String, value:Float) 
	{
		_name = name;
		_value = value;
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
	
	private function set_value(value:Float):Float 
	{
		return _value = value;
	}
	
	public var value(get_value, set_value):Float;
	
	
	
}