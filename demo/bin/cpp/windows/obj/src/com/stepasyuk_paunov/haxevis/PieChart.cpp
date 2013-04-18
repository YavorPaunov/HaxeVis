#include <hxcpp.h>

#ifndef INCLUDED_hxMath
#include <hxMath.h>
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
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_PieChart
#include <com/stepasyuk_paunov/haxevis/PieChart.h>
#endif
#ifndef INCLUDED_neash_display_DisplayObject
#include <neash/display/DisplayObject.h>
#endif
#ifndef INCLUDED_neash_display_DisplayObjectContainer
#include <neash/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_neash_display_Graphics
#include <neash/display/Graphics.h>
#endif
#ifndef INCLUDED_neash_display_IBitmapDrawable
#include <neash/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_neash_display_InteractiveObject
#include <neash/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_neash_display_Sprite
#include <neash/display/Sprite.h>
#endif
#ifndef INCLUDED_neash_events_EventDispatcher
#include <neash/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_neash_events_IEventDispatcher
#include <neash/events/IEventDispatcher.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void PieChart_obj::__construct(::com::stepasyuk_paunov::haxevis::DataSet data)
{
HX_STACK_PUSH("PieChart::new","com/stepasyuk_paunov/haxevis/PieChart.hx",23);
{
	HX_STACK_LINE(24)
	super::__construct();
	HX_STACK_LINE(25)
	this->_data = data;
	HX_STACK_LINE(26)
	this->_showLegend = false;
	HX_STACK_LINE(30)
	this->nmeSetCacheAsBitmap(true);
	HX_STACK_LINE(33)
	Array< Float > ratios = this->_data->getRatios();		HX_STACK_VAR(ratios,"ratios");
	HX_STACK_LINE(34)
	Float degrees = (int)0;		HX_STACK_VAR(degrees,"degrees");
	HX_STACK_LINE(36)
	{
		HX_STACK_LINE(36)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = ratios->length;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(36)
		while(((_g1 < _g))){
			HX_STACK_LINE(36)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(38)
			Float ratio = ratios->__get(i);		HX_STACK_VAR(ratio,"ratio");
			HX_STACK_LINE(39)
			::com::stepasyuk_paunov::haxevis::DataSetEntry entry = this->_data->get_entries()->__get(i);		HX_STACK_VAR(entry,"entry");
			HX_STACK_LINE(40)
			this->drawWedge((int)80,degrees,(degrees + (ratio * (int)360)),entry->get_color());
			HX_STACK_LINE(41)
			hx::AddEq(degrees,(ratio * (int)360));
		}
	}
}
;
	return null();
}

PieChart_obj::~PieChart_obj() { }

Dynamic PieChart_obj::__CreateEmpty() { return  new PieChart_obj; }
hx::ObjectPtr< PieChart_obj > PieChart_obj::__new(::com::stepasyuk_paunov::haxevis::DataSet data)
{  hx::ObjectPtr< PieChart_obj > result = new PieChart_obj();
	result->__construct(data);
	return result;}

Dynamic PieChart_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< PieChart_obj > result = new PieChart_obj();
	result->__construct(inArgs[0]);
	return result;}

bool PieChart_obj::set_showLegend( bool value){
	HX_STACK_PUSH("PieChart::set_showLegend","com/stepasyuk_paunov/haxevis/PieChart.hx",69);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(70)
	if (((this->_legend != null()))){
		HX_STACK_LINE(70)
		this->_legend->setValues(this->_data);
	}
	else{
		HX_STACK_LINE(73)
		this->_legend = ::com::stepasyuk_paunov::haxevis::Legend_obj::__new(this->_data);
		HX_STACK_LINE(74)
		this->_legend->nmeSetX((int)200);
	}
	HX_STACK_LINE(76)
	this->addChild(this->_legend);
	HX_STACK_LINE(77)
	return this->_showLegend = value;
}


HX_DEFINE_DYNAMIC_FUNC1(PieChart_obj,set_showLegend,return )

bool PieChart_obj::get_showLegend( ){
	HX_STACK_PUSH("PieChart::get_showLegend","com/stepasyuk_paunov/haxevis/PieChart.hx",64);
	HX_STACK_THIS(this);
	HX_STACK_LINE(64)
	return this->_showLegend;
}


HX_DEFINE_DYNAMIC_FUNC0(PieChart_obj,get_showLegend,return )

Void PieChart_obj::drawWedge( Float radius,Float start,Float end,int color){
{
		HX_STACK_PUSH("PieChart::drawWedge","com/stepasyuk_paunov/haxevis/PieChart.hx",46);
		HX_STACK_THIS(this);
		HX_STACK_ARG(radius,"radius");
		HX_STACK_ARG(start,"start");
		HX_STACK_ARG(end,"end");
		HX_STACK_ARG(color,"color");
		HX_STACK_LINE(47)
		Float degreesPerRadian = (Float(::Math_obj::PI) / Float((int)180));		HX_STACK_VAR(degreesPerRadian,"degreesPerRadian");
		HX_STACK_LINE(48)
		hx::MultEq(start,degreesPerRadian);
		HX_STACK_LINE(49)
		hx::MultEq(end,degreesPerRadian);
		HX_STACK_LINE(50)
		Float step = degreesPerRadian;		HX_STACK_VAR(step,"step");
		HX_STACK_LINE(52)
		this->nmeGetGraphics()->beginFill(color,null());
		HX_STACK_LINE(53)
		this->nmeGetGraphics()->moveTo(radius,radius);
		HX_STACK_LINE(54)
		Float theta = start;		HX_STACK_VAR(theta,"theta");
		HX_STACK_LINE(55)
		while(((theta < end))){
			HX_STACK_LINE(56)
			this->nmeGetGraphics()->lineTo(((this->nmeGetX() + (radius * ::Math_obj::cos(theta))) + radius),((this->nmeGetY() + (radius * ::Math_obj::sin(theta))) + radius));
			HX_STACK_LINE(57)
			hx::AddEq(theta,::Math_obj::min(step,(end - theta)));
		}
		HX_STACK_LINE(59)
		this->nmeGetGraphics()->lineTo(((this->nmeGetX() + (radius * ::Math_obj::cos(end))) + radius),((this->nmeGetY() + (radius * ::Math_obj::sin(end))) + radius));
		HX_STACK_LINE(60)
		this->nmeGetGraphics()->lineTo((this->nmeGetX() + radius),(this->nmeGetY() + radius));
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC4(PieChart_obj,drawWedge,(void))


PieChart_obj::PieChart_obj()
{
}

void PieChart_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(PieChart);
	HX_MARK_MEMBER_NAME(showLegend,"showLegend");
	HX_MARK_MEMBER_NAME(_data,"_data");
	HX_MARK_MEMBER_NAME(_legend,"_legend");
	HX_MARK_MEMBER_NAME(_showLegend,"_showLegend");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void PieChart_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(showLegend,"showLegend");
	HX_VISIT_MEMBER_NAME(_data,"_data");
	HX_VISIT_MEMBER_NAME(_legend,"_legend");
	HX_VISIT_MEMBER_NAME(_showLegend,"_showLegend");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic PieChart_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_data") ) { return _data; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"_legend") ) { return _legend; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"drawWedge") ) { return drawWedge_dyn(); }
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
	}
	return super::__Field(inName,inCallProp);
}

Dynamic PieChart_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
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

void PieChart_obj::__GetFields(Array< ::String> &outFields)
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
	HX_CSTRING("drawWedge"),
	HX_CSTRING("_data"),
	HX_CSTRING("_legend"),
	HX_CSTRING("_showLegend"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(PieChart_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(PieChart_obj::__mClass,"__mClass");
};

Class PieChart_obj::__mClass;

void PieChart_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.PieChart"), hx::TCanCast< PieChart_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void PieChart_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
