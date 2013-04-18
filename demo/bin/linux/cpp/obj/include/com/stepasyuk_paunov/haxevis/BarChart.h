#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_BarChart
#define INCLUDED_com_stepasyuk_paunov_haxevis_BarChart

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <native/display/Sprite.h>
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,BarChart)
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,DataSet)
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,Legend)
HX_DECLARE_CLASS2(native,display,DisplayObject)
HX_DECLARE_CLASS2(native,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(native,display,IBitmapDrawable)
HX_DECLARE_CLASS2(native,display,InteractiveObject)
HX_DECLARE_CLASS2(native,display,Sprite)
HX_DECLARE_CLASS2(native,events,EventDispatcher)
HX_DECLARE_CLASS2(native,events,IEventDispatcher)
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{


class BarChart_obj : public ::native::display::Sprite_obj{
	public:
		typedef ::native::display::Sprite_obj super;
		typedef BarChart_obj OBJ_;
		BarChart_obj();
		Void __construct(::com::stepasyuk_paunov::haxevis::DataSet data,bool vertical);

	public:
		static hx::ObjectPtr< BarChart_obj > __new(::com::stepasyuk_paunov::haxevis::DataSet data,bool vertical);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~BarChart_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("BarChart"); }

		bool showLegend; /* REM */ 
		virtual bool set_showLegend( bool value);
		Dynamic set_showLegend_dyn();

		virtual bool get_showLegend( );
		Dynamic get_showLegend_dyn();

		virtual Void drawHorizontalBarChart( ::com::stepasyuk_paunov::haxevis::DataSet bars);
		Dynamic drawHorizontalBarChart_dyn();

		virtual Void drawVerticalBarChart( ::com::stepasyuk_paunov::haxevis::DataSet bars);
		Dynamic drawVerticalBarChart_dyn();

		bool _vertical; /* REM */ 
		::com::stepasyuk_paunov::haxevis::DataSet _data; /* REM */ 
		::com::stepasyuk_paunov::haxevis::Legend _legend; /* REM */ 
		bool _showLegend; /* REM */ 
};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_BarChart */ 
