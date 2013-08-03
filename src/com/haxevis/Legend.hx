package com.haxevis;
import com.haxevis.DataSet;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;

/**
 * ...
 * @author Yavor
 */

class Legend extends Sprite
{
	private var data:DataSet;
	private var buttons:Array<LegendButton>;
	
	public function new(data:DataSet) 
	{
		super();
		setValues(data);
	}
	
	public function setValues(data:DataSet) 
	{
		this.data = data;
		if(this.buttons != null){
			while (this.data.items.length > this.buttons.length) {
				this.buttons.pop();
			}
		} else {
			this.buttons = [];
		}
		graphics.clear();
		
		for (i in 0...this.data.items.length) {
			var entry:DataSetItem = this.data.items[i];
			var button:LegendButton;
			// Add field, or reuse one already existing
			if(this.buttons != null && i < this.buttons.length){
				button = this.buttons[i];
			} else {
				if (Std.is(entry, DataSet)) {
					button = new LegendButton(entry.name, entry.color, cast entry);
				} else {
					button = new LegendButton(entry.name, entry.color);
				}
				button.x = 30;
				this.buttons.push(button);
				addChild(button);
				
				button.addEventListener(MouseEvent.CLICK, onButtonClick, false, 0, true);
			}
		}
		arrangeButtons();
	}
	
	private function onButtonClick(e:MouseEvent):Void {
		var button:LegendButton = cast e.currentTarget;
		if(!button.expanded) {
			button.expand();
		} else {
			button.collapse();
		}
		for (b in buttons) {
			if (b != button) {
				b.collapse();
			}
		}
		arrangeButtons();
	}
	
	private function arrangeButtons():Void {
		var by:Float = 0;
		for (b in buttons) {
			b.y = by;
			by += b.height;
		}
	}
}

class LegendButton extends Sprite {
	
	private var fields:Array<TextField>;
	
	private var field:TextField;
	@:isVar public var text(default, set):String;
	function set_text(value:String):String {
		this.text = value;
		this.field.text = this.text;
		return this.text;
	}
	
	@:isVar public var color(default, set):Int;
	function set_color(value:Int):Int {
		this.color = value;
		drawColor();
		return this.color;
	}
	
	public var expanded(default, null):Bool;
	public var data:DataSet;
	
	function new(text:String, color:Int, ?data:DataSet) {
		super();
		this.buttonMode = true;
		
		this.field = new TextField();
		this.field.selectable = false;
		this.field.x = 30;
		this.field.text = text;
		this.field.autoSize = TextFieldAutoSize.LEFT;
		addChild(this.field);
		
		this.color = color;
		this.fields = [];
		
		if(data != null){
			this.data = data;
		}
		
		drawColor();
	}
	
	private function drawColor():Void {
		
		// Draw color
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawRect(0, 6, 20, 8);
		graphics.endFill();
		
	}
	
	public function expand():Void {
		if (data == null) {
			return;
		}
		expanded = true;
		// Show sub-data
		for (i in 0...data.items.length) {
			var field:TextField;
			if (i < fields.length) {
				field = fields[i];
			} else {
				field = new TextField();
				field.selectable = false;
				//field.x = 30;
				field.y = this.field.textHeight + 22 * i;
				field.autoSize = TextFieldAutoSize.LEFT;
				fields.push(field);
			}
			field.text = '${data.items[i].x}   ${data.items[i].y}';
			addChild(field);
		}
	}
	
	public function collapse():Void {
		if (data == null) {
			return;
		}
		expanded = false;
		for (i in 0...this.fields.length) {
			var field:TextField = this.fields[i];
			if(field.parent == this) {
				removeChild(field);
			}
		}
	}
	
	
}