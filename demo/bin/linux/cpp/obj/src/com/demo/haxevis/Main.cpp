#include <hxcpp.h>

#ifndef INCLUDED_com_demo_haxevis_Main
#include <com/demo/haxevis/Main.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_BarChart
#include <com/stepasyuk_paunov/haxevis/BarChart.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSet
#include <com/stepasyuk_paunov/haxevis/DataSet.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_LineChart
#include <com/stepasyuk_paunov/haxevis/LineChart.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_LineChartDataSetEntry
#include <com/stepasyuk_paunov/haxevis/LineChartDataSetEntry.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_PieChart
#include <com/stepasyuk_paunov/haxevis/PieChart.h>
#endif
#ifndef INCLUDED_native_display_DisplayObject
#include <native/display/DisplayObject.h>
#endif
#ifndef INCLUDED_native_display_DisplayObjectContainer
#include <native/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_native_display_IBitmapDrawable
#include <native/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_native_display_InteractiveObject
#include <native/display/InteractiveObject.h>
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
#ifndef INCLUDED_native_display_StageAlign
#include <native/display/StageAlign.h>
#endif
#ifndef INCLUDED_native_display_StageScaleMode
#include <native/display/StageScaleMode.h>
#endif
#ifndef INCLUDED_native_events_Event
#include <native/events/Event.h>
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
namespace demo{
namespace haxevis{

Void Main_obj::__construct()
{
HX_STACK_PUSH("Main::new","com/demo/haxevis/Main.hx",22);
{
	HX_STACK_LINE(23)
	super::__construct();
	HX_STACK_LINE(27)
	this->addEventListener(::native::events::Event_obj::ADDED_TO_STAGE,this->init_dyn(),null(),null(),null());
}
;
	return null();
}

Main_obj::~Main_obj() { }

Dynamic Main_obj::__CreateEmpty() { return  new Main_obj; }
hx::ObjectPtr< Main_obj > Main_obj::__new()
{  hx::ObjectPtr< Main_obj > result = new Main_obj();
	result->__construct();
	return result;}

Dynamic Main_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Main_obj > result = new Main_obj();
	result->__construct();
	return result;}

Void Main_obj::init( Dynamic e){
{
		HX_STACK_PUSH("Main::init","com/demo/haxevis/Main.hx",32);
		HX_STACK_THIS(this);
		HX_STACK_ARG(e,"e");
		HX_STACK_LINE(35)
		::com::stepasyuk_paunov::haxevis::DataSet set = ::com::stepasyuk_paunov::haxevis::DataSet_obj::__new(Array_obj< ::com::stepasyuk_paunov::haxevis::DataSetEntry >::__new());		HX_STACK_VAR(set,"set");
		HX_STACK_LINE(36)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("First"),(int)130,(int)7192678));
		HX_STACK_LINE(37)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("Second"),(int)100,(int)3641576));
		HX_STACK_LINE(38)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("Third"),(int)150,(int)16711680));
		HX_STACK_LINE(39)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("Fourth"),(int)200,null()));
		HX_STACK_LINE(44)
		::com::stepasyuk_paunov::haxevis::DataSet set2 = ::com::stepasyuk_paunov::haxevis::DataSet_obj::__new(Array_obj< ::com::stepasyuk_paunov::haxevis::DataSetEntry >::__new());		HX_STACK_VAR(set2,"set2");
		HX_STACK_LINE(45)
		set2->get_entries()->push(::com::stepasyuk_paunov::haxevis::LineChartDataSetEntry_obj::__new(HX_CSTRING("First"),Array_obj< Float >::__new().Add((int)100).Add((int)120).Add((int)180).Add((int)200),(int)3641576,null()));
		HX_STACK_LINE(46)
		set2->get_entries()->push(::com::stepasyuk_paunov::haxevis::LineChartDataSetEntry_obj::__new(HX_CSTRING("Second"),Array_obj< Float >::__new().Add((int)150).Add((int)140).Add((int)135).Add((int)210),(int)7192678,null()));
		HX_STACK_LINE(48)
		::com::stepasyuk_paunov::haxevis::PieChart chart = ::com::stepasyuk_paunov::haxevis::PieChart_obj::__new(set);		HX_STACK_VAR(chart,"chart");
		HX_STACK_LINE(49)
		chart->set_x(chart->set_y((int)15));
		HX_STACK_LINE(51)
		chart->set_showLegend(true);
		HX_STACK_LINE(54)
		::com::stepasyuk_paunov::haxevis::LineChart lineChart = ::com::stepasyuk_paunov::haxevis::LineChart_obj::__new(set2);		HX_STACK_VAR(lineChart,"lineChart");
		HX_STACK_LINE(55)
		lineChart->set_showLegend(true);
		HX_STACK_LINE(58)
		::com::stepasyuk_paunov::haxevis::BarChart barChart = ::com::stepasyuk_paunov::haxevis::BarChart_obj::__new(set,true);		HX_STACK_VAR(barChart,"barChart");
		HX_STACK_LINE(59)
		barChart->set_showLegend(true);
		HX_STACK_LINE(60)
		this->addChild(barChart);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Main_obj,init,(void))

Void Main_obj::main( ){
{
		HX_STACK_PUSH("Main::main","com/demo/haxevis/Main.hx",64);
		HX_STACK_LINE(65)
		::native::display::Stage stage = ::nme::Lib_obj::get_current()->get_stage();		HX_STACK_VAR(stage,"stage");
		HX_STACK_LINE(66)
		stage->set_scaleMode(::native::display::StageScaleMode_obj::NO_SCALE_dyn());
		HX_STACK_LINE(67)
		stage->set_align(::native::display::StageAlign_obj::TOP_LEFT_dyn());
		HX_STACK_LINE(69)
		::nme::Lib_obj::get_current()->addChild(::com::demo::haxevis::Main_obj::__new());
	}
return null();
}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Main_obj,main,(void))


Main_obj::Main_obj()
{
}

void Main_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Main);
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Main_obj::__Visit(HX_VISIT_PARAMS)
{
	super::__Visit(HX_VISIT_ARG);
}

Dynamic Main_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"main") ) { return main_dyn(); }
		if (HX_FIELD_EQ(inName,"init") ) { return init_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Main_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void Main_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("main"),
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("init"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Main_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Main_obj::__mClass,"__mClass");
};

Class Main_obj::__mClass;

void Main_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.demo.haxevis.Main"), hx::TCanCast< Main_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Main_obj::__boot()
{
}

} // end namespace com
} // end namespace demo
} // end namespace haxevis
