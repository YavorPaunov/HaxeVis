package com.stepasyuk_paunov.haxevis;
import com.stepasyuk_paunov.haxevis.DataSet;
import nme.display.Sprite;
import nme.text.TextField;

/**
 * ...
 * @author Yavor
 */

class Legend extends Sprite
{
	private var _data:DataSet;
	private var _textFields:Array<TextField>;
	
	public function new(data:DataSet) 
	{
		super();
		_data = data;
		_textFields = new Array();
		for (i in 0..._data.entries.length) {
			var entry:DataSetEntry = _data.entries[i];
			// Add field
			var field:TextField = new TextField();
			field.text = entry.name;
			field.selectable = false;
			field.y = i * 20;
			field.x = 30;
			addChild(field);
			_textFields.push(field);
			
			// Draw color
			graphics.beginFill(entry.color);
			graphics.drawRect(0, i * 20 + 6, 20, 8);
			graphics.endFill();
		}
		
	}
	
	public function setValues(data:DataSet) 
	{
		_data = data;
		while (_data.entries.length > _textFields.length) {
			_textFields.pop();
		}
		graphics.clear();
		
		for (i in 0..._data.entries.length) {
			var entry:DataSetEntry = _data.entries[i];
			var field:TextField;
			// Add field, or reuse one already existing
			if(_textFields[i] != null){
				field = _textFields[i];
			} else {
				field = new TextField();
				field.selectable = false;
				field.y = i * 20;
				field.x = 30;
				_textFields.push(field);
				addChild(field);
			}
			field.text = entry.name;
			
			// Draw color
			graphics.beginFill(entry.color);
			graphics.drawRect(0, i * 20 + 6, 20, 8);
			graphics.endFill();
		}
	}
	
}