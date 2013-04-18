#include <hxcpp.h>

#ifndef INCLUDED_neash_utils_CompressionAlgorithm
#include <neash/utils/CompressionAlgorithm.h>
#endif
namespace neash{
namespace utils{

Void CompressionAlgorithm_obj::__construct()
{
	return null();
}

CompressionAlgorithm_obj::~CompressionAlgorithm_obj() { }

Dynamic CompressionAlgorithm_obj::__CreateEmpty() { return  new CompressionAlgorithm_obj; }
hx::ObjectPtr< CompressionAlgorithm_obj > CompressionAlgorithm_obj::__new()
{  hx::ObjectPtr< CompressionAlgorithm_obj > result = new CompressionAlgorithm_obj();
	result->__construct();
	return result;}

Dynamic CompressionAlgorithm_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< CompressionAlgorithm_obj > result = new CompressionAlgorithm_obj();
	result->__construct();
	return result;}

::String CompressionAlgorithm_obj::ZLIB;

::String CompressionAlgorithm_obj::DEFLATE;

::String CompressionAlgorithm_obj::GZIP;


CompressionAlgorithm_obj::CompressionAlgorithm_obj()
{
}

void CompressionAlgorithm_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(CompressionAlgorithm);
	HX_MARK_END_CLASS();
}

void CompressionAlgorithm_obj::__Visit(HX_VISIT_PARAMS)
{
}

Dynamic CompressionAlgorithm_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"ZLIB") ) { return ZLIB; }
		if (HX_FIELD_EQ(inName,"GZIP") ) { return GZIP; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"DEFLATE") ) { return DEFLATE; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic CompressionAlgorithm_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"ZLIB") ) { ZLIB=inValue.Cast< ::String >(); return inValue; }
		if (HX_FIELD_EQ(inName,"GZIP") ) { GZIP=inValue.Cast< ::String >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"DEFLATE") ) { DEFLATE=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void CompressionAlgorithm_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("ZLIB"),
	HX_CSTRING("DEFLATE"),
	HX_CSTRING("GZIP"),
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(CompressionAlgorithm_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(CompressionAlgorithm_obj::ZLIB,"ZLIB");
	HX_MARK_MEMBER_NAME(CompressionAlgorithm_obj::DEFLATE,"DEFLATE");
	HX_MARK_MEMBER_NAME(CompressionAlgorithm_obj::GZIP,"GZIP");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(CompressionAlgorithm_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(CompressionAlgorithm_obj::ZLIB,"ZLIB");
	HX_VISIT_MEMBER_NAME(CompressionAlgorithm_obj::DEFLATE,"DEFLATE");
	HX_VISIT_MEMBER_NAME(CompressionAlgorithm_obj::GZIP,"GZIP");
};

Class CompressionAlgorithm_obj::__mClass;

void CompressionAlgorithm_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("neash.utils.CompressionAlgorithm"), hx::TCanCast< CompressionAlgorithm_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void CompressionAlgorithm_obj::__boot()
{
	ZLIB= HX_CSTRING("zlib");
	DEFLATE= HX_CSTRING("deflate");
	GZIP= HX_CSTRING("gzip");
}

} // end namespace neash
} // end namespace utils
