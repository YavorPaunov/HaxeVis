#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Grid
#define INCLUDED_com_stepasyuk_paunov_haxevis_Grid

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <neash/display/Sprite.h>
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,Grid)
HX_DECLARE_CLASS2(neash,display,DisplayObject)
HX_DECLARE_CLASS2(neash,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(neash,display,IBitmapDrawable)
HX_DECLARE_CLASS2(neash,display,InteractiveObject)
HX_DECLARE_CLASS2(neash,display,Sprite)
HX_DECLARE_CLASS2(neash,events,EventDispatcher)
HX_DECLARE_CLASS2(neash,events,IEventDispatcher)
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{


class Grid_obj : public ::neash::display::Sprite_obj{
	public:
		typedef ::neash::display::Sprite_obj super;
		typedef Grid_obj OBJ_;
		Grid_obj();
		Void __construct(Float xTop,Float xBottom,Float xDelNum,Float yTop,Float yBottom,Float yDelNum);

	public:
		static hx::ObjectPtr< Grid_obj > __new(Float xTop,Float xBottom,Float xDelNum,Float yTop,Float yBottom,Float yDelNum);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Grid_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Grid"); }

		Float _yDelNum; /* REM */ 
		Float _yBottom; /* REM */ 
		Float _yTop; /* REM */ 
		Float _xDelNum; /* REM */ 
		Float _xBottom; /* REM */ 
		Float _xTop; /* REM */ 
		static Float HEIGHT; /* REM */ 
		static Float WIDTH; /* REM */ 
};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_Grid */ 
