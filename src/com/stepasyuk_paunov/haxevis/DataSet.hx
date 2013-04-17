package com.stepasyuk_paunov.haxevis;

/**
 * ...
 * @author Yavor
 */

class DataSet
{
	
	private var _entries:Array<DataSetEntry>;
	
    public function new(? entries:Array<DataSetEntry> ) {
		if (entries != null) {
			_entries = entries;
		} else {
			_entries = new Array();
		}
    }
	
	public function getSum():Float {
		var sum:Float = 0;
		for (entry in _entries) 
		{
			sum += entry.value;
		}
		return sum;
	}
	
	public function getRatios():Array<Float> {
		var ratios:Array<Float> = new Array();
		var sum:Float = getSum();
		for (entry in _entries) 
		{
			ratios.push(entry.value / sum);
		}
		return ratios;
	}
	
	private function get_entries():Array<DataSetEntry> 
	{
		return _entries;
	}
	
	public var entries(get_entries, null):Array<DataSetEntry>;

}