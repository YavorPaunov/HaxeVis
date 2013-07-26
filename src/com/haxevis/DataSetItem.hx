package com.haxevis;
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
	
	@:isVar public var x(get_x, set_x):Float;
	
	private function get_x():Float {
		return this.x;
	}
	
	private function set_x(value:Float):Float {
		return this.x = value;
	}
	
	@:isVar public var y(get_y, set_y):Float;
	
	private function get_y():Float {
		return this.y;
	}
	
	private function set_y(value:Float):Float {
		return this.y = value;
	}
	
	@:isVar public var z(get_z, set_z):Float;
	
	private function get_z():Float {
		return this.z;
	}
	
	private function set_z(value:Float):Float {
		return this.z = value;
	}
	
	@:isVar public var name(get_name, set_name):String;
	
	private function get_name():String {
		return this.name;
	}
	
	private function set_name(value:String):String {
		return this.name = value;
	}
	
	@:isVar public var color(get_color, set_color):Int;
	
	private function get_color():Int {
		return this.color;
	}
	
	private function set_color(value:Int):Int {
		return this.color = value;
	}
			
	/**
	 * 
	 * @param	x
	 * @param	y
	 * @param	z
	 * @param	name
	 * @param	color
	 */
	public function new(x:Float=0, y:Float=0, z:Float=0, name:String="", color:Int=-1) {
		this.name = name;
		this.color = color;
		
		this.x = x;
		this.y = y;
		this.z = z;
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
	
	
	
	
	
	
	public function toString():String {
		return "x: " + this.x + " y: " + this.y + " z: " + this.z;
	}
}