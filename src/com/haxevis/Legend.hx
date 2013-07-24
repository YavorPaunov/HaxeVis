package com.haxevis;
import com.haxevis.DataSet;
import flash.display.Sprite;
import flash.text.TextField;

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
		for (i in 0..._data.items.length) {
			var entry:DataSetItem = _data.items[i];
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
		// TODO: Format text
	}
	
	public function setValues(data:DataSet) 
	{
		_data = data;
		while (_data.items.length > _textFields.length) {
			_textFields.pop();
		}
		graphics.clear();
		
		for (i in 0..._data.items.length) {
			var entry:DataSetItem = _data.items[i];
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
		// TODO: Format text
	}
	
}