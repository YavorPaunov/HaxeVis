#include <hxcpp.h>

#ifndef INCLUDED_com_demo_haxevis_Main
#include <com/demo/haxevis/Main.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSet
#include <com/stepasyuk_paunov/haxevis/DataSet.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Grid
#include <com/stepasyuk_paunov/haxevis/Grid.h>
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
#ifndef INCLUDED_neash_display_IBitmapDrawable
#include <neash/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_neash_display_InteractiveObject
#include <neash/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_neash_display_MovieClip
#include <neash/display/MovieClip.h>
#endif
#ifndef INCLUDED_neash_display_Sprite
#include <neash/display/Sprite.h>
#endif
#ifndef INCLUDED_neash_display_Stage
#include <neash/display/Stage.h>
#endif
#ifndef INCLUDED_neash_display_StageAlign
#include <neash/display/StageAlign.h>
#endif
#ifndef INCLUDED_neash_display_StageScaleMode
#include <neash/display/StageScaleMode.h>
#endif
#ifndef INCLUDED_neash_events_Event
#include <neash/events/Event.h>
#endif
#ifndef INCLUDED_neash_events_EventDispatcher
#include <neash/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_neash_events_IEventDispatcher
#include <neash/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_nme_Lib
#include <nme/Lib.h>
#endif
namespace com{
namespace demo{
namespace haxevis{

Void Main_obj::__construct()
{
HX_STACK_PUSH("Main::new","com/demo/haxevis/Main.hx",20);
{
	HX_STACK_LINE(21)
	super::__construct();
	HX_STACK_LINE(25)
	this->addEventListener(::neash::events::Event_obj::ADDED_TO_STAGE,this->init_dyn(),null(),null(),null());
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
		HX_STACK_PUSH("Main::init","com/demo/haxevis/Main.hx",30);
		HX_STACK_THIS(this);
		HX_STACK_ARG(e,"e");
		HX_STACK_LINE(32)
		::com::stepasyuk_paunov::haxevis::DataSet set = ::com::stepasyuk_paunov::haxevis::DataSet_obj::__new(Array_obj< ::com::stepasyuk_paunov::haxevis::DataSetEntry >::__new());		HX_STACK_VAR(set,"set");
		HX_STACK_LINE(33)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("First"),(int)13,null()));
		HX_STACK_LINE(34)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("Second"),(int)10,null()));
		HX_STACK_LINE(35)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("Third"),(int)15,null()));
		HX_STACK_LINE(36)
		set->get_entries()->push(::com::stepasyuk_paunov::haxevis::DataSetEntry_obj::__new(HX_CSTRING("Fourth"),(int)20,null()));
		HX_STACK_LINE(41)
		::com::stepasyuk_paunov::haxevis::PieChart chart = ::com::stepasyuk_paunov::haxevis::PieChart_obj::__new(set);		HX_STACK_VAR(chart,"chart");
		HX_STACK_LINE(42)
		chart->nmeSetX(chart->nmeSetY((int)15));
		HX_STACK_LINE(43)
		chart->set_showLegend(true);
		HX_STACK_LINE(44)
		this->addChild(chart);
		HX_STACK_LINE(45)
		::nme::Lib_obj::trace(chart->nmeGetHeight());
		HX_STACK_LINE(47)
		::com::stepasyuk_paunov::haxevis::Grid grid = ::com::stepasyuk_paunov::haxevis::Grid_obj::__new((int)80,(int)-20,(int)5,(int)50,(int)-10,(int)6);		HX_STACK_VAR(grid,"grid");
		HX_STACK_LINE(48)
		grid->nmeSetX((int)15);
		HX_STACK_LINE(49)
		grid->nmeSetY(((chart->nmeGetY() + chart->nmeGetHeight()) + (int)20));
		HX_STACK_LINE(50)
		this->addChild(grid);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Main_obj,init,(void))

Void Main_obj::main( ){
{
		HX_STACK_PUSH("Main::main","com/demo/haxevis/Main.hx",54);
		HX_STACK_LINE(55)
		::neash::display::Stage stage = ::nme::Lib_obj::nmeGetCurrent()->nmeGetStage();		HX_STACK_VAR(stage,"stage");
		HX_STACK_LINE(56)
		stage->nmeSetScaleMode(::neash::display::StageScaleMode_obj::NO_SCALE_dyn());
		HX_STACK_LINE(57)
		stage->nmeSetAlign(::neash::display::StageAlign_obj::TOP_LEFT_dyn());
		HX_STACK_LINE(59)
		::nme::Lib_obj::nmeGetCurrent()->addChild(::com::demo::haxevis::Main_obj::__new());
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
