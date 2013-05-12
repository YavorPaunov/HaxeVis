package com.stepasyuk_paunov.haxevis;
/**
 * ...
 * @author Yavor
 */

enum Axis {
	x;
	y;
	z;
}
	
class DataSetItem
{
		
	private var _x:Float;
	private var _y:Float;
	private var _z:Float;
	
	private var _name:String;
	private var _color:Int;
	/**
	 * 
	 * @param	x
	 * @param	y
	 * @param	z
	 * @param	name
	 * @param	color
	 */
	public function new(x:Float=0, y:Float=0, z:Float=0, name:String="", color:Int=-1) 
	{
		_name = name;
		_color = color;
		
		_x = x;
		_y = y;
		_z = z;
	}
	
	/**
	 * 
	 * @param	field1
	 * @param	field2
	 */
	public function flip(axis1:Axis, axis2:Axis):Void {
		var field1:String;
		var field2:String;
		switch(axis1) {
			case Axis.x:
				field1 = "x";
			case Axis.y:
				field1 = "y";
			case Axis.z:
				field1 = "z";				
		}
		
		switch(axis2) {
			case Axis.x:
				field2 = "x";
			case Axis.y:
				field2 = "y";
			case Axis.z:
				field2 = "z";				
		}
		
		var newField1:Float = Reflect.getProperty(this, field2);
		var newField2:Float = Reflect.getProperty(this, field1);
		
		Reflect.setProperty(this, field1, newField1);
		Reflect.setProperty(this, field2, newField2);
	}
	
	private function get_x():Float 
	{
		return _x;
	}
	
	private function set_x(value:Float):Float 
	{
		return _x = value;
	}
	
	public var x(get_x, set_x):Float;
	
	private function get_y():Float 
	{
		return _y;
	}
	
	private function set_y(value:Float):Float 
	{
		return _y = value;
	}
	
	public var y(get_y, set_y):Float;
	
	private function get_z():Float 
	{
		return _z;
	}
	
	private function set_z(value:Float):Float 
	{
		return _z = value;
	}
	
	public var z(get_z, set_z):Float;
	
	private function get_name():String 
	{
		return _name;
	}
	
	private function set_name(value:String):String 
	{
		return _name = value;
	}
	
	public var name(get_name, set_name):String;
	
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