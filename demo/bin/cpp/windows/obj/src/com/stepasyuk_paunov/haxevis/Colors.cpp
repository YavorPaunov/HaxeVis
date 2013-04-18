#include <hxcpp.h>

#ifndef INCLUDED_hxMath
#include <hxMath.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Colors
#include <com/stepasyuk_paunov/haxevis/Colors.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void Colors_obj::__construct()
{
	return null();
}

Colors_obj::~Colors_obj() { }

Dynamic Colors_obj::__CreateEmpty() { return  new Colors_obj; }
hx::ObjectPtr< Colors_obj > Colors_obj::__new()
{  hx::ObjectPtr< Colors_obj > result = new Colors_obj();
	result->__construct();
	return result;}

Dynamic Colors_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Colors_obj > result = new Colors_obj();
	result->__construct();
	return result;}

int Colors_obj::random( ){
	HX_STACK_PUSH("Colors::random","com/stepasyuk_paunov/haxevis/Colors.hx",20);
	HX_STACK_LINE(20)
	return ::Std_obj::_int(((int)10066329 + ((int)6710886 * ::Math_obj::random())));
}


STATIC_HX_DEFINE_DYNAMIC_FUNC0(Colors_obj,random,return )


Colors_obj::Colors_obj()
{
}

void Colors_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Colors);
	HX_MARK_END_CLASS();
}

void Colors_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic Colors_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"random") ) { return random_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Colors_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void Colors_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("random"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Colors_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Colors_obj::__mClass,"__mClass");
};

Class Colors_obj::__mClass;

void Colors_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.Colors"), hx::TCanCast< Colors_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Colors_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
