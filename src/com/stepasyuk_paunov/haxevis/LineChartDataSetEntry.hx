package com.stepasyuk_paunov.haxevis;
import com.stepasyuk_paunov.haxevis.DataSetEntry;

import nme.events.Event;
import nme.Lib;
/**
 * ...
 * @author Stepan
 */

class LineChartDataSetEntry extends DataSetEntry
{

	private var _valueSet:Array<Float>;
	
	public function new(name:String, valueSet:Array<Float>, color:Int, ?value:Float) 
	{
		super(name, value, color);

		_valueSet = valueSet;

	}
	
	private function get_valueSet():Array<Float>
	{
		return _valueSet;
	}
	
	public var valueSet(get_valueSet, set_valueSet):Array<Float>;

	private function set_valueSet(value:Array<Float>):Array<Float> 
	{
		return _valueSet = valueSet;
	}
		
}