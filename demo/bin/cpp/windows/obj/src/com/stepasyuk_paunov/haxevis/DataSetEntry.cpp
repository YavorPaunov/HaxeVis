#include <hxcpp.h>

#ifndef INCLUDED_hxMath
#include <hxMath.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void DataSetEntry_obj::__construct(::String name,Float value,hx::Null< int >  __o_color)
{
HX_STACK_PUSH("DataSetEntry::new","com/stepasyuk_paunov/haxevis/DataSetEntry.hx",16);
int color = __o_color.Default(-1);
{
	HX_STACK_LINE(17)
	this->_name = name;
	HX_STACK_LINE(18)
	this->_value = value;
	HX_STACK_LINE(19)
	if (((color == (int)-1))){
		HX_STACK_LINE(19)
		this->_color = ::Std_obj::_int(((int)10066329 + ((int)6710886 * ::Math_obj::random())));
	}
	else{
		HX_STACK_LINE(21)
		this->_color = color;
	}
}
;
	return null();
}

DataSetEntry_obj::~DataSetEntry_obj() { }

Dynamic DataSetEntry_obj::__CreateEmpty() { return  new DataSetEntry_obj; }
hx::ObjectPtr< DataSetEntry_obj > DataSetEntry_obj::__new(::String name,Float value,hx::Null< int >  __o_color)
{  hx::ObjectPtr< DataSetEntry_obj > result = new DataSetEntry_obj();
	result->__construct(name,value,__o_color);
	return result;}

Dynamic DataSetEntry_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< DataSetEntry_obj > result = new DataSetEntry_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return result;}

int DataSetEntry_obj::set_color( int value){
	HX_STACK_PUSH("DataSetEntry::set_color","com/stepasyuk_paunov/haxevis/DataSetEntry.hx",56);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(56)
	return this->_color = value;
}


HX_DEFINE_DYNAMIC_FUNC1(DataSetEntry_obj,set_color,return )

int DataSetEntry_obj::get_color( ){
	HX_STACK_PUSH("DataSetEntry::get_color","com/stepasyuk_paunov/haxevis/DataSetEntry.hx",51);
	HX_STACK_THIS(this);
	HX_STACK_LINE(51)
	return this->_color;
}


HX_DEFINE_DYNAMIC_FUNC0(DataSetEntry_obj,get_color,return )

Float DataSetEntry_obj::set_value( Float value){
	HX_STACK_PUSH("DataSetEntry::set_value","com/stepasyuk_paunov/haxevis/DataSetEntry.hx",44);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(44)
	return this->_value = value;
}


HX_DEFINE_DYNAMIC_FUNC1(DataSetEntry_obj,set_value,return )

Float DataSetEntry_obj::get_value( ){
	HX_STACK_PUSH("DataSetEntry::get_value","com/stepasyuk_paunov/haxevis/DataSetEntry.hx",39);
	HX_STACK_THIS(this);
	HX_STACK_LINE(39)
	return this->_value;
}


HX_DEFINE_DYNAMIC_FUNC0(DataSetEntry_obj,get_value,return )

::String DataSetEntry_obj::set_name( ::String value){
	HX_STACK_PUSH("DataSetEntry::set_name","com/stepasyuk_paunov/haxevis/DataSetEntry.hx",32);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(32)
	return this->_name = value;
}


HX_DEFINE_DYNAMIC_FUNC1(DataSetEntry_obj,set_name,return )

::String DataSetEntry_obj::get_name( ){
	HX_STACK_PUSH("DataSetEntry::get_name","com/stepasyuk_paunov/haxevis/DataSetEntry.hx",27);
	HX_STACK_THIS(this);
	HX_STACK_LINE(27)
	return this->_name;
}


HX_DEFINE_DYNAMIC_FUNC0(DataSetEntry_obj,get_name,return )


DataSetEntry_obj::DataSetEntry_obj()
{
}

void DataSetEntry_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(DataSetEntry);
	HX_MARK_MEMBER_NAME(color,"color");
	HX_MARK_MEMBER_NAME(value,"value");
	HX_MARK_MEMBER_NAME(name,"name");
	HX_MARK_MEMBER_NAME(_color,"_color");
	HX_MARK_MEMBER_NAME(_value,"_value");
	HX_MARK_MEMBER_NAME(_name,"_name");
	HX_MARK_END_CLASS();
}

void DataSetEntry_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(color,"color");
	HX_VISIT_MEMBER_NAME(value,"value");
	HX_VISIT_MEMBER_NAME(name,"name");
	HX_VISIT_MEMBER_NAME(_color,"_color");
	HX_VISIT_MEMBER_NAME(_value,"_value");
	HX_VISIT_MEMBER_NAME(_name,"_name");
}

Dynamic DataSetEntry_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { return inCallProp ? get_name() : name; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"color") ) { return inCallProp ? get_color() : color; }
		if (HX_FIELD_EQ(inName,"value") ) { return inCallProp ? get_value() : value; }
		if (HX_FIELD_EQ(inName,"_name") ) { return _name; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"_color") ) { return _color; }
		if (HX_FIELD_EQ(inName,"_value") ) { return _value; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"set_name") ) { return set_name_dyn(); }
		if (HX_FIELD_EQ(inName,"get_name") ) { return get_name_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"set_color") ) { return set_color_dyn(); }
		if (HX_FIELD_EQ(inName,"get_color") ) { return get_color_dyn(); }
		if (HX_FIELD_EQ(inName,"set_value") ) { return set_value_dyn(); }
		if (HX_FIELD_EQ(inName,"get_value") ) { return get_value_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic DataSetEntry_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 4:
		if (HX_FIELD_EQ(inName,"name") ) { if (inCallProp) return set_name(inValue);name=inValue.Cast< ::String >(); return inValue; }
		break;
	case 5:
		if (HX_FIELD_EQ(inName,"color") ) { if (inCallProp) return set_color(inValue);color=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"value") ) { if (inCallProp) return set_value(inValue);value=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_name") ) { _name=inValue.Cast< ::String >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"_color") ) { _color=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_value") ) { _value=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void DataSetEntry_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("color"));
	outFields->push(HX_CSTRING("value"));
	outFields->push(HX_CSTRING("name"));
	outFields->push(HX_CSTRING("_color"));
	outFields->push(HX_CSTRING("_value"));
	outFields->push(HX_CSTRING("_name"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("color"),
	HX_CSTRING("set_color"),
	HX_CSTRING("get_color"),
	HX_CSTRING("value"),
	HX_CSTRING("set_value"),
	HX_CSTRING("get_value"),
	HX_CSTRING("name"),
	HX_CSTRING("set_name"),
	HX_CSTRING("get_name"),
	HX_CSTRING("_color"),
	HX_CSTRING("_value"),
	HX_CSTRING("_name"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(DataSetEntry_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(DataSetEntry_obj::__mClass,"__mClass");
};

Class DataSetEntry_obj::__mClass;

void DataSetEntry_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.DataSetEntry"), hx::TCanCast< DataSetEntry_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void DataSetEntry_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
