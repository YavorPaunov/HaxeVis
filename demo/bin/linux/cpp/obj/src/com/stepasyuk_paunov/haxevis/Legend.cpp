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
#ifndef INCLUDED_native_display_Sprite
#include <native/display/Sprite.h>
#endif
#ifndef INCLUDED_native_events_EventDispatcher
#include <native/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_native_events_IEventDispatcher
#include <native/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_native_text_TextField
#include <native/text/TextField.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void Legend_obj::__construct(::com::stepasyuk_paunov::haxevis::DataSet data)
{
HX_STACK_PUSH("Legend::new","com/stepasyuk_paunov/haxevis/Legend.hx",17);
{
	HX_STACK_LINE(18)
	super::__construct();
	HX_STACK_LINE(19)
	this->_data = data;
	HX_STACK_LINE(20)
	this->_textFields = Array_obj< ::native::text::TextField >::__new();
	HX_STACK_LINE(21)
	{
		HX_STACK_LINE(21)
		int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
		int _g = this->_data->get_entries()->length;		HX_STACK_VAR(_g,"_g");
		HX_STACK_LINE(21)
		while(((_g1 < _g))){
			HX_STACK_LINE(21)
			int i = (_g1)++;		HX_STACK_VAR(i,"i");
			HX_STACK_LINE(22)
			::com::stepasyuk_paunov::haxevis::DataSetEntry entry = this->_data->get_entries()->__get(i);		HX_STACK_VAR(entry,"entry");
			HX_STACK_LINE(24)
			::native::text::TextField field = ::native::text::TextField_obj::__new();		HX_STACK_VAR(field,"field");
			HX_STACK_LINE(25)
			field->set_text(entry->get_name());
			HX_STACK_LINE(26)
			field->set_selectable(false);
			HX_STACK_LINE(27)
			field->set_y((i * (int)20));
			HX_STACK_LINE(28)
			field->set_x((int)30);
			HX_STACK_LINE(29)
			this->addChild(field);
			HX_STACK_LINE(30)
			this->_textFields->push(field);
			HX_STACK_LINE(33)
			this->get_graphics()->beginFill(entry->get_color(),null());
			HX_STACK_LINE(34)
			this->get_graphics()->drawRect((int)0,((i * (int)20) + (int)6),(int)20,(int)8);
			HX_STACK_LINE(35)
			this->get_graphics()->endFill();
		}
	}
}
;
	return null();
}

Legend_obj::~Legend_obj() { }

Dynamic Legend_obj::__CreateEmpty() { return  new Legend_obj; }
hx::ObjectPtr< Legend_obj > Legend_obj::__new(::com::stepasyuk_paunov::haxevis::DataSet data)
{  hx::ObjectPtr< Legend_obj > result = new Legend_obj();
	result->__construct(data);
	return result;}

Dynamic Legend_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Legend_obj > result = new Legend_obj();
	result->__construct(inArgs[0]);
	return result;}

Void Legend_obj::setValues( ::com::stepasyuk_paunov::haxevis::DataSet data){
{
		HX_STACK_PUSH("Legend::setValues","com/stepasyuk_paunov/haxevis/Legend.hx",41);
		HX_STACK_THIS(this);
		HX_STACK_ARG(data,"data");
		HX_STACK_LINE(42)
		this->_data = data;
		HX_STACK_LINE(43)
		while(((this->_data->get_entries()->length > this->_textFields->length))){
			HX_STACK_LINE(43)
			this->_textFields->pop();
		}
		HX_STACK_LINE(46)
		this->get_graphics()->clear();
		HX_STACK_LINE(48)
		{
			HX_STACK_LINE(48)
			int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
			int _g = this->_data->get_entries()->length;		HX_STACK_VAR(_g,"_g");
			HX_STACK_LINE(48)
			while(((_g1 < _g))){
				HX_STACK_LINE(48)
				int i = (_g1)++;		HX_STACK_VAR(i,"i");
				HX_STACK_LINE(49)
				::com::stepasyuk_paunov::haxevis::DataSetEntry entry = this->_data->get_entries()->__get(i);		HX_STACK_VAR(entry,"entry");
				HX_STACK_LINE(50)
				::native::text::TextField field;		HX_STACK_VAR(field,"field");
				HX_STACK_LINE(52)
				if (((this->_textFields->__get(i) != null()))){
					HX_STACK_LINE(52)
					field = this->_textFields->__get(i);
				}
				else{
					HX_STACK_LINE(55)
					field = ::native::text::TextField_obj::__new();
					HX_STACK_LINE(56)
					field->set_selectable(false);
					HX_STACK_LINE(57)
					field->set_y((i * (int)20));
					HX_STACK_LINE(58)
					field->set_x((int)30);
					HX_STACK_LINE(59)
					this->_textFields->push(field);
					HX_STACK_LINE(60)
					this->addChild(field);
				}
				HX_STACK_LINE(62)
				field->set_text(entry->get_name());
				HX_STACK_LINE(65)
				this->get_graphics()->beginFill(entry->get_color(),null());
				HX_STACK_LINE(66)
				this->get_graphics()->drawRect((int)0,((i * (int)20) + (int)6),(int)20,(int)8);
				HX_STACK_LINE(67)
				this->get_graphics()->endFill();
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(Legend_obj,setValues,(void))


Legend_obj::Legend_obj()
{
}

void Legend_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Legend);
	HX_MARK_MEMBER_NAME(_textFields,"_textFields");
	HX_MARK_MEMBER_NAME(_data,"_data");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Legend_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_textFields,"_textFields");
	HX_VISIT_MEMBER_NAME(_data,"_data");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic Legend_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_data") ) { return _data; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"setValues") ) { return setValues_dyn(); }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_textFields") ) { return _textFields; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Legend_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"_data") ) { _data=inValue.Cast< ::com::stepasyuk_paunov::haxevis::DataSet >(); return inValue; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"_textFields") ) { _textFields=inValue.Cast< Array< ::native::text::TextField > >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Legend_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("_textFields"));
	outFields->push(HX_CSTRING("_data"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("setValues"),
	HX_CSTRING("_textFields"),
	HX_CSTRING("_data"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Legend_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Legend_obj::__mClass,"__mClass");
};

Class Legend_obj::__mClass;

void Legend_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.Legend"), hx::TCanCast< Legend_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Legend_obj::__boot()
{
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
