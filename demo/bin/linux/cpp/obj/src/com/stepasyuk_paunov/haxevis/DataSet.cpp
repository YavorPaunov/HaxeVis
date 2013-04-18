#include <hxcpp.h>

#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSet
#include <com/stepasyuk_paunov/haxevis/DataSet.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void DataSet_obj::__construct(Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > entries)
{
HX_STACK_PUSH("DataSet::new","com/stepasyuk_paunov/haxevis/DataSet.hx",13);
{
	HX_STACK_LINE(13)
	if (((entries != null()))){
		HX_STACK_LINE(14)
		this->_entries = entries;
	}
	else{
		HX_STACK_LINE(16)
		this->_entries = Array_obj< ::com::stepasyuk_paunov::haxevis::DataSetEntry >::__new();
	}
}
;
	return null();
}

DataSet_obj::~DataSet_obj() { }

Dynamic DataSet_obj::__CreateEmpty() { return  new DataSet_obj; }
hx::ObjectPtr< DataSet_obj > DataSet_obj::__new(Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > entries)
{  hx::ObjectPtr< DataSet_obj > result = new DataSet_obj();
	result->__construct(entries);
	return result;}

Dynamic DataSet_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< DataSet_obj > result = new DataSet_obj();
	result->__construct(inArgs[0]);
	return result;}

Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > DataSet_obj::get_entries( ){
	HX_STACK_PUSH("DataSet::get_entries","com/stepasyuk_paunov/haxevis/DataSet.hx",42);
	HX_STACK_THIS(this);
	HX_STACK_LINE(42)
	return this->_entries;
}


HX_DEFINE_DYNAMIC_FUNC0(DataSet_obj,get_entries,return )

Array< Float > DataSet_obj::getRatios( ){
	HX_STACK_PUSH("DataSet::getRatios","com/stepasyuk_paunov/haxevis/DataSet.hx",31);
	HX_STACK_THIS(this);
	HX_STACK_LINE(32)
	Array< Float > ratios = Array_obj< Float >::__new();		HX_STACK_VAR(ratios,"ratios");
	HX_STACK_LINE(33)
	Float sum = this->getSum();		HX_STACK_VAR(sum,"sum");
	HX_STACK_LINE(34)
	{
		HX_STACK_LINE(34)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > _g1 = this->_entries;		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(34)
		while(((_g < _g1->length))){
			HX_STACK_LINE(34)
			::com::stepasyuk_paunov::haxevis::DataSetEntry entry = _g1->__get(_g);		HX_STACK_VAR(entry,"entry");
			HX_STACK_LINE(34)
			++(_g);
			HX_STACK_LINE(36)
			ratios->push((Float(entry->get_value()) / Float(sum)));
		}
	}
	HX_STACK_LINE(38)
	return ratios;
}


HX_DEFINE_DYNAMIC_FUNC0(DataSet_obj,getRatios,return )

Float DataSet_obj::getSum( ){
	HX_STACK_PUSH("DataSet::getSum","com/stepasyuk_paunov/haxevis/DataSet.hx",22);
	HX_STACK_THIS(this);
	HX_STACK_LINE(23)
	Float sum = (int)0;		HX_STACK_VAR(sum,"sum");
	HX_STACK_LINE(24)
	{
		HX_STACK_LINE(24)
		int _g = (int)0;		HX_STACK_VAR(_g,"_g");
		Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > _g1 = this->_entries;		HX_STACK_VAR(_g1,"_g1");
		HX_STACK_LINE(24)
		while(((_g < _g1->length))){
			HX_STACK_LINE(24)
			::com::stepasyuk_paunov::haxevis::DataSetEntry entry = _g1->__get(_g);		HX_STACK_VAR(entry,"entry");
			HX_STACK_LINE(24)
			++(_g);
			HX_STACK_LINE(26)
			hx::AddEq(sum,entry->get_value());
		}
	}
	HX_STACK_LINE(28)
	return sum;
}


HX_DEFINE_DYNAMIC_FUNC0(DataSet_obj,getSum,return )


DataSet_obj::DataSet_obj()
{
}

void DataSet_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(DataSet);
	HX_MARK_MEMBER_NAME(entries,"entries");
	HX_MARK_MEMBER_NAME(_entries,"_entries");
	HX_MARK_END_CLASS();
}

void DataSet_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(entries,"entries");
	HX_VISIT_MEMBER_NAME(_entries,"_entries");
}

Dynamic DataSet_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 6:
		if (HX_FIELD_EQ(inName,"getSum") ) { return getSum_dyn(); }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"entries") ) { return inCallProp ? get_entries() : entries; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_entries") ) { return _entries; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"getRatios") ) { return getRatios_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"get_entries") ) { return get_entries_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic DataSet_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"entries") ) { entries=inValue.Cast< Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_entries") ) { _entries=inValue.Cast< Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void DataSet_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("entries"));
	outFields->push(HX_CSTRING("_entries"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("entries"),
	HX_CSTRING("get_entries"),
	HX_CSTRING("getRatios"),
	HX_CSTRING("getSum"),
	HX_CSTRING("_entries"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(DataSet_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(DataSet_obj::__mClass,"__mClass");
};

Class DataSet_obj::__mClass;

void DataSet_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.DataSet"), hx::TCanCast< DataSet_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void DataSet_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
