package com.haxevis;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Point;
/**
 * ...
 * @author Yavor Paunov
 */


using Lambda;
using ChartElement.ChartElementStates;
class Chart extends Sprite {
	
	public var paddingLeft:Float = 20;
	public var paddingTop:Float = 10;
	public var paddingRight:Float = 150;
	public var paddingBottom:Float = 20;
	
	public var w:Float;
	public var h:Float;
		
	public var autoRedraw:Bool;
	
	private var legend:Legend;
	private var data:DataSet;
	
	private var elements:Array<ChartElement>;
	
	@:isVar public var chartElementStates(default, set):ChartElementStates;
	function set_chartElementStates(value:ChartElementStates):ChartElementStates {
		this.chartElementStates = value;
		if (autoRedraw) {
			draw();
		}
		return this.chartElementStates;
	}
	
	@:isVar public var showLegend(default, set):Bool;
	function set_showLegend(value:Bool):Bool {
		this.showLegend = value;
		if (autoRedraw) {
			draw();
		}
		return this.showLegend;
	}
	
	function new() {
		super();
		elements = [];
		addEventListener(Event.ADDED_TO_STAGE, added, false, 0, true);
	}
	
	private function added(e:Event):Void {
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(MouseEvent.CLICK, onClickHandler, false, 0, true);		
	}
	
	private function onClickHandler(e:MouseEvent):Void {
		var underMouse = stage.getObjectsUnderPoint(new Point(stage.mouseX, stage.mouseY));
		for (thing in underMouse) {
			if (Std.is(thing, ChartElement)) {
				return;
			}
		}
		onElementSelect(null);
	}
	
	private function draw():Void {
		graphics.clear();
		
		while (numChildren > 0) {
			removeChildAt(0);
		}
		
		addLegend();
	}
	
	public function redraw():Void {
		draw();
	}
	
	public function addLegend():Void {
		
		if(legend == null) {
			legend = new Legend(data);
		}
		
		legend.x = this.paddingLeft + this.w;
		legend.y = this.paddingTop;
		addChild(legend);
	}
	
	private function addElement(element:ChartElement):Void {
		addChildAt(element, 0);
		elements.push(element);
		element.onSelect = onElementSelect;
	}
	
	private function removeElement(element:ChartElement):Void {
		if (element.parent == this) {
			removeChild(element);
		}
		var index = elements.indexOf(element);
		if (index >= 0) {
			elements.splice(index, 1);
		}
	}
	
	private function onElementSelect(element:ChartElement) {
		for (e in elements) {
			e.selected = element;
		}
	}
	
}