#include <hxcpp.h>

#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Grid
#include <com/stepasyuk_paunov/haxevis/Grid.h>
#endif
#ifndef INCLUDED_neash_display_CapsStyle
#include <neash/display/CapsStyle.h>
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
#ifndef INCLUDED_neash_display_JointStyle
#include <neash/display/JointStyle.h>
#endif
#ifndef INCLUDED_neash_display_LineScaleMode
#include <neash/display/LineScaleMode.h>
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
#ifndef INCLUDED_neash_text_TextField
#include <neash/text/TextField.h>
#endif
#ifndef INCLUDED_neash_text_TextFieldAutoSize
#include <neash/text/TextFieldAutoSize.h>
#endif
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{

Void Grid_obj::__construct(Float xTop,Float xBottom,Float xDelNum,Float yTop,Float yBottom,Float yDelNum)
{
HX_STACK_PUSH("Grid::new","com/stepasyuk_paunov/haxevis/Grid.hx",28);
{
	HX_STACK_LINE(29)
	super::__construct();
	HX_STACK_LINE(31)
	this->_xTop = xTop;
	HX_STACK_LINE(32)
	this->_xBottom = xBottom;
	HX_STACK_LINE(33)
	this->_xDelNum = xDelNum;
	HX_STACK_LINE(34)
	this->_yTop = yTop;
	HX_STACK_LINE(35)
	this->_yBottom = yBottom;
	HX_STACK_LINE(36)
	this->_yDelNum = yDelNum;
	HX_STACK_LINE(38)
	Float xDif = (xTop - xBottom);		HX_STACK_VAR(xDif,"xDif");
	HX_STACK_LINE(39)
	Float xRatio = (Float((int)220) / Float(xDif));		HX_STACK_VAR(xRatio,"xRatio");
	HX_STACK_LINE(40)
	Float xDelSize = (Float(xDif) / Float(xDelNum));		HX_STACK_VAR(xDelSize,"xDelSize");
	HX_STACK_LINE(42)
	Float xZeroPos;		HX_STACK_VAR(xZeroPos,"xZeroPos");
	HX_STACK_LINE(43)
	if (((xBottom < (int)0))){
		HX_STACK_LINE(43)
		xZeroPos = (-(xBottom) * xRatio);
	}
	else{
		HX_STACK_LINE(45)
		xZeroPos = (int)0;
	}
	HX_STACK_LINE(49)
	Float yDif = (yTop - yBottom);		HX_STACK_VAR(yDif,"yDif");
	HX_STACK_LINE(50)
	Float yRatio = (Float((int)160) / Float(yDif));		HX_STACK_VAR(yRatio,"yRatio");
	HX_STACK_LINE(51)
	Float yDelSize = (Float(yDif) / Float(yDelNum));		HX_STACK_VAR(yDelSize,"yDelSize");
	HX_STACK_LINE(53)
	Float yZeroPos;		HX_STACK_VAR(yZeroPos,"yZeroPos");
	HX_STACK_LINE(54)
	if (((yBottom < (int)0))){
		HX_STACK_LINE(54)
		yZeroPos = (-(yBottom) * yRatio);
	}
	else{
		HX_STACK_LINE(56)
		yZeroPos = (int)0;
	}
	HX_STACK_LINE(60)
	this->nmeGetGraphics()->beginFill((int)0,null());
	HX_STACK_LINE(62)
	Float xCurDel = (int)0;		HX_STACK_VAR(xCurDel,"xCurDel");
	HX_STACK_LINE(63)
	while(((xCurDel <= xDelNum))){
		HX_STACK_LINE(64)
		Float targetX = ((xCurDel * xDelSize) * xRatio);		HX_STACK_VAR(targetX,"targetX");
		HX_STACK_LINE(65)
		Float targetY = ((int)160 - yZeroPos);		HX_STACK_VAR(targetY,"targetY");
		HX_STACK_LINE(66)
		this->nmeGetGraphics()->drawRect((targetX - 0.5),(targetY - (int)3),(int)1,(int)6);
		HX_STACK_LINE(68)
		if ((((xBottom + (xCurDel * xDelSize)) != (int)0))){
			HX_STACK_LINE(69)
			::neash::text::TextField xValueField = ::neash::text::TextField_obj::__new();		HX_STACK_VAR(xValueField,"xValueField");
			HX_STACK_LINE(70)
			xValueField->nmeSetText(::Std_obj::string((xBottom + (xCurDel * xDelSize))));
			HX_STACK_LINE(71)
			xValueField->nmeSetX((targetX - (int)10));
			HX_STACK_LINE(72)
			xValueField->nmeSetAutoSize(::neash::text::TextFieldAutoSize_obj::LEFT_dyn());
			HX_STACK_LINE(73)
			xValueField->nmeSetY((((int)160 - yZeroPos) + (int)5));
			HX_STACK_LINE(74)
			xValueField->nmeSetSelectable(false);
			HX_STACK_LINE(75)
			this->addChild(xValueField);
		}
		HX_STACK_LINE(78)
		(xCurDel)++;
	}
	HX_STACK_LINE(81)
	Float yCurDel = (int)0;		HX_STACK_VAR(yCurDel,"yCurDel");
	HX_STACK_LINE(82)
	while(((yCurDel <= yDelNum))){
		HX_STACK_LINE(83)
		Float targetY = ((int)160 - ((yCurDel * yDelSize) * yRatio));		HX_STACK_VAR(targetY,"targetY");
		HX_STACK_LINE(84)
		Float targetX = xZeroPos;		HX_STACK_VAR(targetX,"targetX");
		HX_STACK_LINE(85)
		this->nmeGetGraphics()->drawRect((targetX - (int)3),(targetY - 0.5),(int)6,(int)1);
		HX_STACK_LINE(88)
		(yCurDel)++;
	}
	HX_STACK_LINE(91)
	this->nmeGetGraphics()->lineStyle((int)1,(int)0,null(),null(),null(),null(),null(),null());
	HX_STACK_LINE(92)
	this->nmeGetGraphics()->moveTo(xZeroPos,(int)160);
	HX_STACK_LINE(93)
	this->nmeGetGraphics()->lineTo(xZeroPos,(int)0);
	HX_STACK_LINE(95)
	this->nmeGetGraphics()->lineStyle((int)1,(int)0,null(),null(),null(),null(),null(),null());
	HX_STACK_LINE(96)
	this->nmeGetGraphics()->moveTo((int)0,((int)160 - yZeroPos));
	HX_STACK_LINE(97)
	this->nmeGetGraphics()->lineTo((int)220,((int)160 - yZeroPos));
}
;
	return null();
}

Grid_obj::~Grid_obj() { }

Dynamic Grid_obj::__CreateEmpty() { return  new Grid_obj; }
hx::ObjectPtr< Grid_obj > Grid_obj::__new(Float xTop,Float xBottom,Float xDelNum,Float yTop,Float yBottom,Float yDelNum)
{  hx::ObjectPtr< Grid_obj > result = new Grid_obj();
	result->__construct(xTop,xBottom,xDelNum,yTop,yBottom,yDelNum);
	return result;}

Dynamic Grid_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Grid_obj > result = new Grid_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5]);
	return result;}

Float Grid_obj::HEIGHT;

Float Grid_obj::WIDTH;


Grid_obj::Grid_obj()
{
}

void Grid_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Grid);
	HX_MARK_MEMBER_NAME(_yDelNum,"_yDelNum");
	HX_MARK_MEMBER_NAME(_yBottom,"_yBottom");
	HX_MARK_MEMBER_NAME(_yTop,"_yTop");
	HX_MARK_MEMBER_NAME(_xDelNum,"_xDelNum");
	HX_MARK_MEMBER_NAME(_xBottom,"_xBottom");
	HX_MARK_MEMBER_NAME(_xTop,"_xTop");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Grid_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(_yDelNum,"_yDelNum");
	HX_VISIT_MEMBER_NAME(_yBottom,"_yBottom");
	HX_VISIT_MEMBER_NAME(_yTop,"_yTop");
	HX_VISIT_MEMBER_NAME(_xDelNum,"_xDelNum");
	HX_VISIT_MEMBER_NAME(_xBottom,"_xBottom");
	HX_VISIT_MEMBER_NAME(_xTop,"_xTop");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic Grid_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"WIDTH") ) { return WIDTH; }
		if (HX_FIELD_EQ(inName,"_yTop") ) { return _yTop; }
		if (HX_FIELD_EQ(inName,"_xTop") ) { return _xTop; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"HEIGHT") ) { return HEIGHT; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_yDelNum") ) { return _yDelNum; }
		if (HX_FIELD_EQ(inName,"_yBottom") ) { return _yBottom; }
		if (HX_FIELD_EQ(inName,"_xDelNum") ) { return _xDelNum; }
		if (HX_FIELD_EQ(inName,"_xBottom") ) { return _xBottom; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic Grid_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"WIDTH") ) { WIDTH=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_yTop") ) { _yTop=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_xTop") ) { _xTop=inValue.Cast< Float >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"HEIGHT") ) { HEIGHT=inValue.Cast< Float >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"_yDelNum") ) { _yDelNum=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_yBottom") ) { _yBottom=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_xDelNum") ) { _xDelNum=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"_xBottom") ) { _xBottom=inValue.Cast< Float >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void Grid_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("_yDelNum"));
	outFields->push(HX_CSTRING("_yBottom"));
	outFields->push(HX_CSTRING("_yTop"));
	outFields->push(HX_CSTRING("_xDelNum"));
	outFields->push(HX_CSTRING("_xBottom"));
	outFields->push(HX_CSTRING("_xTop"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("HEIGHT"),
	HX_CSTRING("WIDTH"),
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("_yDelNum"),
	HX_CSTRING("_yBottom"),
	HX_CSTRING("_yTop"),
	HX_CSTRING("_xDelNum"),
	HX_CSTRING("_xBottom"),
	HX_CSTRING("_xTop"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Grid_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(Grid_obj::HEIGHT,"HEIGHT");
	HX_MARK_MEMBER_NAME(Grid_obj::WIDTH,"WIDTH");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Grid_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(Grid_obj::HEIGHT,"HEIGHT");
	HX_VISIT_MEMBER_NAME(Grid_obj::WIDTH,"WIDTH");
};

Class Grid_obj::__mClass;

void Grid_obj::__register()
{
	Static(__mClass) = hx::RegisterClass(HX_CSTRING("com.stepasyuk_paunov.haxevis.Grid"), hx::TCanCast< Grid_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Grid_obj::__boot()
{
	HEIGHT= (int)160;
	WIDTH= (int)220;
}

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis
