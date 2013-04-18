#include <hxcpp.h>

#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_LineChartDataSetEntry
#include <com/stepasyuk_paunov/haxevis/LineChartDataSetEntry.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void LineChartDataSetEntry_obj::__construct(::String name,Array< Float > valueSet,int color,Dynamic value)
{
HX_STACK_PUSH("LineChartDataSetEntry::new","com/stepasyuk_paunov/haxevis/LineChartDataSetEntry.hx",17);
{
	HX_STACK_LINE(18)
	super::__construct(name,value,color);
	HX_STACK_LINE(20)
	this->_valueSet = valueSet;
}
;
	return null();
}

LineChartDataSetEntry_obj::~LineChartDataSetEntry_obj() { }

Dynamic LineChartDataSetEntry_obj::__CreateEmpty() { return  new LineChartDataSetEntry_obj; }
hx::ObjectPtr< LineChartDataSetEntry_obj > LineChartDataSetEntry_obj::__new(::String name,Array< Float > valueSet,int color,Dynamic value)
{  hx::ObjectPtr< LineChartDataSetEntry_obj > result = new LineChartDataSetEntry_obj();
	result->__construct(name,valueSet,color,value);
	return result;}

Dynamic LineChartDataSetEntry_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< LineChartDataSetEntry_obj > result = new LineChartDataSetEntry_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return result;}

Array< Float > LineChartDataSetEntry_obj::set_valueSet( Array< Float > value){
	HX_STACK_PUSH("LineChartDataSetEntry::set_valueSet","com/stepasyuk_paunov/haxevis/LineChartDataSetEntry.hx",32);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(32)
	return this->_valueSet = this->get_valueSet();
}


HX_DEFINE_DYNAMIC_FUNC1(LineChartDataSetEntry_obj,set_valueSet,return )

Array< Float > LineChartDataSetEntry_obj::get_valueSet( ){
	HX_STACK_PUSH("LineChartDataSetEntry::get_valueSet","com/stepasyuk_paunov/haxevis/LineChartDataSetEntry.hx",25);
	HX_STACK_THIS(this);
	HX_STACK_LINE(25)
	return this->_valueSet;
}


HX_DEFINE_DYNAMIC_FUNC0(LineChartDataSetEntry_obj,get_valueSet,return )


LineChartDataSetEntry_obj::LineChartDataSetEntry_obj()
{
}

void LineChartDataSetEntry_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(LineChartDataSetEntry);
	HX_MARK_MEMBER_NAME(valueSet,"valueSet");
	HX_MARK_MEMBER_NAME(_valueSet,"_valueSet");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void LineChartDataSetEntry_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(valueSet,"valueSet");
	HX_VISIT_MEMBER_NAME(_valueSet,"_valueSet");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic LineChartDataSetEntry_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"valueSet") ) { return inCallProp ? get_valueSet() : valueSet; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"_valueSet") ) { return _valueSet; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"set_valueSet") ) { return set_valueSet_dyn(); }
		if (HX_FIELD_EQ(inName,"get_valueSet") ) { return get_valueSet_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic LineChartDataSetEntry_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 8:
		if (HX_FIELD_EQ(inName,"valueSet") ) { if (inCallProp) return set_valueSet(inValue);valueSet=inValue.Cast< Array< Float > >(); return inValue; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"_valueSet") ) { _valueSet=inValue.Cast< Array< Float > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void LineChartDataSetEntry_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("valueSet"));
	outFields->push(HX_CSTRING("_valueSet"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("set_valueSet"),
	HX_CSTRING("valueSet"),
	HX_CSTRING("get_valueSet"),
	HX_CSTRING("_valueSet"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(LineChartDataSetEntry_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(LineChartDataSetEntry_obj::__mClass,"__mClass");
};

Class LineChartDataSetEntry_obj::__mClass;

void LineChartDataSetEntry_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.LineChartDataSetEntry"), hx::TCanCast< LineChartDataSetEntry_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void LineChartDataSetEntry_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
