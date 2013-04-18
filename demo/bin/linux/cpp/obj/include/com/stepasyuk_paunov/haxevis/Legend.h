#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Legend
#define INCLUDED_com_stepasyuk_paunov_haxevis_Legend

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <native/display/Sprite.h>
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,DataSet)
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,Legend)
HX_DECLARE_CLASS2(native,display,DisplayObject)
HX_DECLARE_CLASS2(native,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(native,display,IBitmapDrawable)
HX_DECLARE_CLASS2(native,display,InteractiveObject)
HX_DECLARE_CLASS2(native,display,Sprite)
HX_DECLARE_CLASS2(native,events,EventDispatcher)
HX_DECLARE_CLASS2(native,events,IEventDispatcher)
HX_DECLARE_CLASS2(native,text,TextField)
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{


class Legend_obj : public ::native::display::Sprite_obj{
	public:
		typedef ::native::display::Sprite_obj super;
		typedef Legend_obj OBJ_;
		Legend_obj();
		Void __construct(::com::stepasyuk_paunov::haxevis::DataSet data);

	public:
		static hx::ObjectPtr< Legend_obj > __new(::com::stepasyuk_paunov::haxevis::DataSet data);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Legend_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Legend"); }

		virtual Void setValues( ::com::stepasyuk_paunov::haxevis::DataSet data);
		Dynamic setValues_dyn();

		Array< ::native::text::TextField > _textFields; /* REM */ 
		::com::stepasyuk_paunov::haxevis::DataSet _data; /* REM */ 
};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_Legend */ 
