#include <hxcpp.h>

#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_BarChart
#include <com/stepasyuk_paunov/haxevis/BarChart.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSet
#include <com/stepasyuk_paunov/haxevis/DataSet.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Legend
#include <com/stepasyuk_paunov/haxevis/Legend.h>
#endif
#ifndef INCLUDED_native_display_CapsStyle
#include <native/display/CapsStyle.h>
#endif
#ifndef INCLUDED_native_display_DisplayObject
#include <native/display/DisplayObject.h>
#endif
#ifndef INCLUDED_native_display_DisplayObjectContainer
#include <native/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_native_display_Graphics
#include <native/display/Graphics.h>
#endif
#ifndef INCLUDED_native_display_IBitmapDrawable
#include <native/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_native_display_InteractiveObject
#include <native/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_native_display_JointStyle
#include <native/display/JointStyle.h>
#endif
#ifndef INCLUDED_native_display_LineScaleMode
#include <native/display/LineScaleMode.h>
#endif
#ifndef INCLUDED_native_display_MovieClip
#include <native/display/MovieClip.h>
#endif
#ifndef INCLUDED_native_display_Sprite
#include <native/display/Sprite.h>
#endif
#ifndef INCLUDED_native_display_Stage
#include <native/display/Stage.h>
#endif
#ifndef INCLUDED_native_events_EventDispatcher
#include <native/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_native_events_IEventDispatcher
#include <native/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_nme_Lib
#include <nme/Lib.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void BarChart_obj::__construct(::com::stepasyuk_paunov::haxevis::DataSet data,bool vertical)
{
HX_STACK_PUSH("BarChart::new","com/stepasyuk_paunov/haxevis/BarChart.hx",15);
{
	HX_STACK_LINE(17)
	super::__construct();
	HX_STACK_LINE(18)
	this->_data = data;
	HX_STACK_LINE(19)
	this->_showLegend = false;
	HX_STACK_LINE(20)
	this->_vertical = vertical;
	HX_STACK_LINE(22)
	if ((vertical)){
		HX_STACK_LINE(22)
		this->drawVerticalBarChart(this->_data);
	}
	else{
		HX_STACK_LINE(24)
		this->drawHorizontalBarChart(this->_data);
	}
}
;
	return null();
}

BarChart_obj::~BarChart_obj() { }

Dynamic BarChart_obj::__CreateEmpty() { return  new BarChart_obj; }
hx::ObjectPtr< BarChart_obj > BarChart_obj::__new(::com::stepasyuk_paunov::haxevis::DataSet data,bool vertical)
{  hx::ObjectPtr< BarChart_obj > result = new BarChart_obj();
	result->__construct(data,vertical);
	return result;}

Dynamic BarChart_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< BarChart_obj > result = new BarChart_obj();
	result->__construct(inArgs[0],inArgs[1]);
	return result;}

bool BarChart_obj::set_showLegend( bool value){
	HX_STACK_PUSH("BarChart::set_showLegend","com/stepasyuk_paunov/haxevis/BarChart.hx",89);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(90)
	if (((this->_legend != null()))){
		HX_STACK_LINE(90)
		this->_legend->setValues(this->_data);
	}
	else{
		HX_STACK_LINE(93)
		this->_legend = ::com::stepasyuk_paunov::haxevis::Legend_obj::__new(this->_data);
		HX_STACK_LINE(94)
		this->_legend->set_x((int)200);
	}
	HX_STACK_LINE(96)
	this->addChild(this->_legend);
	HX_STACK_LINE(97)
	return this->_showLegend = value;
}


HX_DEFINE_DYNAMIC_FUNC1(BarChart_obj,set_showLegend,return )

bool BarChart_obj::get_showLegend( ){
	HX_STACK_PUSH("BarChart::get_showLegend","com/stepasyuk_paunov/haxevis/BarChart.hx",84);
	HX_STACK_THIS(this);
	HX_STACK_LINE(84)
	return this->_showLegend;
}


HX_DEFINE_DYNAMIC_FUNC0(BarChart_obj,get_showLegend,return )

Void BarChart_obj::drawHorizontalBarChart( ::com::stepasyuk_paunov::haxevis::DataSet bars){
{
		HX_STACK_PUSH("BarChart::drawHorizontalBarChart","com/stepasyuk_paunov/haxevis/BarChart.hx",57);
		HX_STACK_THIS(this);
		HX_STACK_ARG(bars,"bars");
		HX_STACK_LINE(59)
		int step = (int)70;		HX_STACK_VAR(step,"step");
		HX_STACK_LINE(60)
		::native::display::Stage stage = ::nme::Lib_obj::get_current()->get_stage();		HX_STACK_VAR(stage,"stage");
		HX_STACK_LINE(62)
		::native::display::Sprite barChartSprite = ::native::display::Sprite_obj::__new();		HX_STACK_VAR(barChartSprite,"barChartSprite");
		HX_STACK_LINE(64)
		barChartSprite->set_x((int)10);
		HX_STACK_LINE(65)
		barChartSprite->set_y((int)30);
		HX_STACK_LINE(66)
		barChartSprite->get_graphics()->moveTo(barChartSprite->get_x(),barChartSprite->get_y());
		HX_STACK_LINE(67)
		this->addChild(barChartSprite);
		HX_STACK_LINE(69)
		int i = (int)0;		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(70)
		while(((i < bars->get_entries()->length))){
			HX_STACK_LINE(72)
			barChartSprite->get_graphics()->lineStyle((int)30,bars->get_entries()->__get(i)->get_color(),null(),null(),null(),::native::display::CapsStyle_obj::SQUARE_dyn(),null(),null());
			HX_STACK_LINE(73)
			barChartSprite->get_graphics()->moveTo(barChartSprite->get_x(),barChartSprite->get_y());
			HX_STACK_LINE(74)
			barChartSprite->get_graphics()->lineTo(bars->get_entries()->__get(i)->get_value(),barChartSprite->get_y());
			HX_STACK_LINE(75)
			barChartSprite->set_y((barChartSprite->get_y() + step));
			HX_STACK_LINE(76)
			(i)++;
		}
		HX_STACK_LINE(80)
		barChartSprite->set_y((int)10);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(BarChart_obj,drawHorizontalBarChart,(void))

Void BarChart_obj::drawVerticalBarChart( ::com::stepasyuk_paunov::haxevis::DataSet bars){
{
		HX_STACK_PUSH("BarChart::drawVerticalBarChart","com/stepasyuk_paunov/haxevis/BarChart.hx",31);
		HX_STACK_THIS(this);
		HX_STACK_ARG(bars,"bars");
		HX_STACK_LINE(33)
		int step = (int)70;		HX_STACK_VAR(step,"step");
		HX_STACK_LINE(34)
		::native::display::Stage stage = ::nme::Lib_obj::get_current()->get_stage();		HX_STACK_VAR(stage,"stage");
		HX_STACK_LINE(36)
		::native::display::Sprite barChartSprite = ::native::display::Sprite_obj::__new();		HX_STACK_VAR(barChartSprite,"barChartSprite");
		HX_STACK_LINE(38)
		barChartSprite->set_x((int)30);
		HX_STACK_LINE(39)
		barChartSprite->set_y((stage->get_stageHeight() - (int)30));
		HX_STACK_LINE(40)
		barChartSprite->get_graphics()->moveTo(barChartSprite->get_x(),barChartSprite->get_y());
		HX_STACK_LINE(41)
		this->addChild(barChartSprite);
		HX_STACK_LINE(43)
		int i = (int)0;		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(44)
		while(((i < bars->get_entries()->length))){
			HX_STACK_LINE(46)
			barChartSprite->get_graphics()->lineStyle((int)30,bars->get_entries()->__get(i)->get_color(),null(),null(),null(),::native::display::CapsStyle_obj::SQUARE_dyn(),null(),null());
			HX_STACK_LINE(47)
			barChartSprite->get_graphics()->moveTo(barChartSprite->get_x(),(stage->get_stageHeight() - (int)30));
			HX_STACK_LINE(48)
			barChartSprite->get_graphics()->lineTo(barChartSprite->get_x(),-(bars->get_entries()->__get(i)->get_value()));
			HX_STACK_LINE(49)
			barChartSprite->set_x((barChartSprite->get_x() + step));
			HX_STACK_LINE(50)
			(i)++;
		}
		HX_STACK_LINE(54)
		barChartSprite->set_x((int)10);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(BarChart_obj,drawVerticalBarChart,(void))


BarChart_obj::BarChart_obj()
{
}

void BarChart_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(BarChart);
	HX_MARK_MEMBER_NAME(showLegend,"showLegend");
	HX_MARK_MEMBER_NAME(_vertical,"_vertical");
	HX_MARK_MEMBER_NAME(_data,"_data");
	HX_MARK_MEMBER_NAME(_legend,"_legend");
	HX_MARK_MEMBER_NAME(_showLegend,"_showLegend");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void BarChart_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(showLegend,"showLegend");
	HX_VISIT_MEMBER_NAME(_vertical,"_vertical");
	HX_VISIT_MEMBER_NAME(_data,"_data");
	HX_VISIT_MEMBER_NAME(_legend,"_legend");
	HX_VISIT_MEMBER_NAME(_showLegend,"_showLegend");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic BarChart_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_data") ) { return _data; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"_legend") ) { return _legend; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"_vertical") ) { return _vertical; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"showLegend") ) { return inCallProp ? get_showLegend() : showLegend; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_showLegend") ) { return _showLegend; }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"set_showLegend") ) { return set_showLegend_dyn(); }
		if (HX_FIELD_EQ(inName,"get_showLegend") ) { return get_showLegend_dyn(); }
		break;
	case 20:
		if (HX_FIELD_EQ(inName,"drawVerticalBarChart") ) { return drawVerticalBarChart_dyn(); }
		break;
	case 22:
		if (HX_FIELD_EQ(inName,"drawHorizontalBarChart") ) { return drawHorizontalBarChart_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic BarChart_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_data") ) { _data=inValue.Cast< ::com::stepasyuk_paunov::haxevis::DataSet >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"_legend") ) { _legend=inValue.Cast< ::com::stepasyuk_paunov::haxevis::Legend >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"_vertical") ) { _vertical=inValue.Cast< bool >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"showLegend") ) { if (inCallProp) return set_showLegend(inValue);showLegend=inValue.Cast< bool >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_showLegend") ) { _showLegend=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void BarChart_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("showLegend"));
	outFields->push(HX_CSTRING("_vertical"));
	outFields->push(HX_CSTRING("_data"));
	outFields->push(HX_CSTRING("_legend"));
	outFields->push(HX_CSTRING("_showLegend"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("showLegend"),
	HX_CSTRING("set_showLegend"),
	HX_CSTRING("get_showLegend"),
	HX_CSTRING("drawHorizontalBarChart"),
	HX_CSTRING("drawVerticalBarChart"),
	HX_CSTRING("_vertical"),
	HX_CSTRING("_data"),
	HX_CSTRING("_legend"),
	HX_CSTRING("_showLegend"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(BarChart_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(BarChart_obj::__mClass,"__mClass");
};

Class BarChart_obj::__mClass;

void BarChart_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.BarChart"), hx::TCanCast< BarChart_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void BarChart_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
