#include <hxcpp.h>

#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSet
#include <com/stepasyuk_paunov/haxevis/DataSet.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Legend
#include <com/stepasyuk_paunov/haxevis/Legend.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_LineChart
#include <com/stepasyuk_paunov/haxevis/LineChart.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_LineChartDataSetEntry
#include <com/stepasyuk_paunov/haxevis/LineChartDataSetEntry.h>
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

Void LineChart_obj::__construct(::com::stepasyuk_paunov::haxevis::DataSet data)
{
HX_STACK_PUSH("LineChart::new","com/stepasyuk_paunov/haxevis/LineChart.hx",16);
{
	HX_STACK_LINE(18)
	super::__construct();
	HX_STACK_LINE(19)
	this->_data = data;
	HX_STACK_LINE(20)
	this->_showLegend = false;
	HX_STACK_LINE(22)
	{
		HX_STACK_LINE(22)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > _g1 = this->_data->get_entries();		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(22)
		while(((_g < _g1->length))){
			HX_STACK_LINE(22)
			::com::stepasyuk_paunov::haxevis::DataSetEntry i = _g1->__get(_g);		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(22)
			++(_g);
			HX_STACK_LINE(24)
			this->drawLineChart((hx::TCast< com::stepasyuk_paunov::haxevis::LineChartDataSetEntry >::cast(i))->get_valueSet(),i->get_color());
		}
	}
}
;
	return null();
}

LineChart_obj::~LineChart_obj() { }

Dynamic LineChart_obj::__CreateEmpty() { return  new LineChart_obj; }
hx::ObjectPtr< LineChart_obj > LineChart_obj::__new(::com::stepasyuk_paunov::haxevis::DataSet data)
{  hx::ObjectPtr< LineChart_obj > result = new LineChart_obj();
	result->__construct(data);
	return result;}

Dynamic LineChart_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< LineChart_obj > result = new LineChart_obj();
	result->__construct(inArgs[0]);
	return result;}

bool LineChart_obj::set_showLegend( bool value){
	HX_STACK_PUSH("LineChart::set_showLegend","com/stepasyuk_paunov/haxevis/LineChart.hx",75);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(76)
	if (((this->_legend != null()))){
		HX_STACK_LINE(76)
		this->_legend->setValues(this->_data);
	}
	else{
		HX_STACK_LINE(79)
		this->_legend = ::com::stepasyuk_paunov::haxevis::Legend_obj::__new(this->_data);
		HX_STACK_LINE(80)
		this->_legend->set_x((int)200);
	}
	HX_STACK_LINE(82)
	this->addChild(this->_legend);
	HX_STACK_LINE(83)
	return this->_showLegend = value;
}


HX_DEFINE_DYNAMIC_FUNC1(LineChart_obj,set_showLegend,return )

bool LineChart_obj::get_showLegend( ){
	HX_STACK_PUSH("LineChart::get_showLegend","com/stepasyuk_paunov/haxevis/LineChart.hx",70);
	HX_STACK_THIS(this);
	HX_STACK_LINE(70)
	return this->_showLegend;
}


HX_DEFINE_DYNAMIC_FUNC0(LineChart_obj,get_showLegend,return )

Void LineChart_obj::drawLineChart( Array< Float > values,int color){
{
		HX_STACK_PUSH("LineChart::drawLineChart","com/stepasyuk_paunov/haxevis/LineChart.hx",30);
		HX_STACK_THIS(this);
		HX_STACK_ARG(values,"values");
		HX_STACK_ARG(color,"color");
		HX_STACK_LINE(32)
		int step = (int)100;		HX_STACK_VAR(step,"step");
		HX_STACK_LINE(33)
		::native::display::Stage stage = ::nme::Lib_obj::get_current()->get_stage();		HX_STACK_VAR(stage,"stage");
		HX_STACK_LINE(35)
		::native::display::Sprite lineChartSprite = ::native::display::Sprite_obj::__new();		HX_STACK_VAR(lineChartSprite,"lineChartSprite");
		HX_STACK_LINE(37)
		lineChartSprite->set_x((int)10);
		HX_STACK_LINE(38)
		lineChartSprite->set_y((stage->get_stageHeight() - (int)10));
		HX_STACK_LINE(39)
		lineChartSprite->get_graphics()->lineStyle((int)2,color,null(),null(),null(),null(),null(),null());
		HX_STACK_LINE(40)
		lineChartSprite->get_graphics()->moveTo(lineChartSprite->get_x(),-(values->__get((int)0)));
		HX_STACK_LINE(41)
		this->addChild(lineChartSprite);
		HX_STACK_LINE(43)
		int i = (int)1;		HX_STACK_VAR(i,"i");
		HX_STACK_LINE(44)
		while(((i < values->length))){
			HX_STACK_LINE(46)
			lineChartSprite->get_graphics()->lineTo((lineChartSprite->get_x() + step),-(values->__get(i)));
			HX_STACK_LINE(47)
			lineChartSprite->set_x((lineChartSprite->get_x() + step));
			HX_STACK_LINE(48)
			(i)++;
		}
		HX_STACK_LINE(52)
		lineChartSprite->set_x((int)10);
		HX_STACK_LINE(53)
		lineChartSprite->get_graphics()->lineStyle((int)2,color,null(),null(),null(),null(),null(),null());
		HX_STACK_LINE(55)
		int i1 = (int)1;		HX_STACK_VAR(i1,"i1");
		HX_STACK_LINE(56)
		while(((i1 < values->length))){
			HX_STACK_LINE(58)
			lineChartSprite->get_graphics()->beginFill((int)16777215,null());
			HX_STACK_LINE(59)
			lineChartSprite->get_graphics()->drawCircle((lineChartSprite->get_x() + step),-(values->__get(i1)),(int)4);
			HX_STACK_LINE(60)
			lineChartSprite->get_graphics()->endFill();
			HX_STACK_LINE(61)
			lineChartSprite->set_x((lineChartSprite->get_x() + step));
			HX_STACK_LINE(62)
			(i1)++;
		}
		HX_STACK_LINE(66)
		lineChartSprite->set_x((int)10);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC2(LineChart_obj,drawLineChart,(void))


LineChart_obj::LineChart_obj()
{
}

void LineChart_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(LineChart);
	HX_MARK_MEMBER_NAME(showLegend,"showLegend");
	HX_MARK_MEMBER_NAME(_data,"_data");
	HX_MARK_MEMBER_NAME(_legend,"_legend");
	HX_MARK_MEMBER_NAME(_showLegend,"_showLegend");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void LineChart_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(showLegend,"showLegend");
	HX_VISIT_MEMBER_NAME(_data,"_data");
	HX_VISIT_MEMBER_NAME(_legend,"_legend");
	HX_VISIT_MEMBER_NAME(_showLegend,"_showLegend");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic LineChart_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_data") ) { return _data; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"_legend") ) { return _legend; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"showLegend") ) { return inCallProp ? get_showLegend() : showLegend; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_showLegend") ) { return _showLegend; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"drawLineChart") ) { return drawLineChart_dyn(); }
		break;
	case 14:
		if (HX_FIELD_EQ(inName,"set_showLegend") ) { return set_showLegend_dyn(); }
		if (HX_FIELD_EQ(inName,"get_showLegend") ) { return get_showLegend_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic LineChart_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_data") ) { _data=inValue.Cast< ::com::stepasyuk_paunov::haxevis::DataSet >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"_legend") ) { _legend=inValue.Cast< ::com::stepasyuk_paunov::haxevis::Legend >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"showLegend") ) { if (inCallProp) return set_showLegend(inValue);showLegend=inValue.Cast< bool >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_showLegend") ) { _showLegend=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void LineChart_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("showLegend"));
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
	HX_CSTRING("drawLineChart"),
	HX_CSTRING("_data"),
	HX_CSTRING("_legend"),
	HX_CSTRING("_showLegend"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(LineChart_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(LineChart_obj::__mClass,"__mClass");
};

Class LineChart_obj::__mClass;

void LineChart_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.LineChart"), hx::TCanCast< LineChart_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void LineChart_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
