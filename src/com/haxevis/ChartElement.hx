package com.haxevis;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Point;

enum ChartElementColor {
	item;
	custom(color:Int);
}

typedef ChartElementState = {
	fillColor:ChartElementColor,
	strokeColor:ChartElementColor,
	strokeThickness:Float,
	width:Float,
	alpha:Float
}

typedef ChartElementStates = {
	normal:ChartElementState,
	hovered:ChartElementState,
	selected:ChartElementState,
	otherSelected:ChartElementState,
	otherHovered:ChartElementState
}

enum ChartElementShape {
	rect(w:Float, h:Float);
	polygon(vertices:Array<{x:Float, y:Float}>);
	circle(r:Float);
	circleSegment(r:Float, start:Float, end:Float);
	none;
}

class ChartElement extends Sprite {
	
	private var states:ChartElementStates;
	private var shapes:Array<ChartElementShape>;
	private var color:Int;
	
	public var onHover:ChartElement->Void;
	public var onHoverOut:ChartElement->Void;
	
	public var onSelect:ChartElement->Void;
	public var onSelectOut:ChartElement->Void;
	
	@:isVar public var selected(default, set):ChartElement;
	function set_selected(value:ChartElement):ChartElement {
		this.selected = value;
		if (this.selected == null) {
			deselect();
		} else if (this.selected != this) {
			deselect();
			setState(states.otherSelected);
		}
		return this.selected;
	}
	public function new(states:ChartElementStates, color:Int, shapes:Array<ChartElementShape>) {
		super();
		
		this.states = states;
		this.shapes = shapes;
		this.color = color;
		setState(this.states.normal);
		
		this.buttonMode = true;
		
		addEventListener(MouseEvent.ROLL_OVER, onHoverHandler, false, 0, true);
		addEventListener(MouseEvent.ROLL_OUT, onHoverOutHandler, false, 0, true);
		
		addEventListener(MouseEvent.CLICK, onClickHandler, false, 0 , true);
	}
	
	private function onHoverHandler(e:MouseEvent):Void {
		setState(this.states.hovered);
		if (onHover != null) {
			onHover(this);
		}
	}
	
	private function onHoverOutHandler(e:MouseEvent):Void {
		
		if (this.selected == this) {
			setState(this.states.selected);			
		} else if (this.selected != null) { 
			setState(this.states.otherSelected);
		} else {
			setState(this.states.normal);
		}
		
		if (onHoverOut != null) {
			onHoverOut(this);
		}
	}
	
	private function onClickHandler(e:MouseEvent):Void {
		setState(this.states.selected);
		this.selected = this;
		if(onSelect != null){
			onSelect(this);
		}
	}
	
	private function deselect():Void {
		setState(this.states.normal);
		if (onSelectOut != null) {
			onSelectOut(this);
		}
	}
	
	private function setState(state:ChartElementState):Void {
		this.alpha = state.alpha;
		graphics.clear();
		
		var strokeColor:Int = 0;
		switch(state.strokeColor) {
			case item:
				strokeColor = this.color;
			case custom(color):
				strokeColor = color;
		}
		
		var fillColor:Int = 0;
		switch(state.fillColor) {
			case item:
				fillColor = this.color;
			case custom(color):
				fillColor = color;
		}
		for(shape in this.shapes) {		
			switch(shape) {
				case rect(w, h):
					graphics.lineStyle(state.strokeThickness, strokeColor);
					graphics.beginFill(fillColor);
					graphics.drawRect(-w/2, -h/2, w, h);
					graphics.endFill();
				case polygon(vertices):
					graphics.beginFill(fillColor);
					graphics.lineStyle(state.strokeThickness, strokeColor);
					var p = vertices[0];
					graphics.moveTo(p.x, p.y);
					for (i in 1...vertices.length) {
						p = vertices[i];
						graphics.lineTo(p.x, p.y);
					}
					graphics.endFill();
					graphics.lineStyle();				
				case circle(r):
					graphics.lineStyle(state.strokeThickness, strokeColor);
					graphics.beginFill(fillColor);
					graphics.drawCircle(0, 0, r);
					graphics.endFill();
				case circleSegment(r, start, end): 
				case none:
					return;
			}
		}
	}
}