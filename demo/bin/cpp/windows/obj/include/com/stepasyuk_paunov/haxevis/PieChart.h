#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_PieChart
#define INCLUDED_com_stepasyuk_paunov_haxevis_PieChart

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <neash/display/Sprite.h>
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,DataSet)
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,Legend)
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,PieChart)
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


class PieChart_obj : public ::neash::display::Sprite_obj{
	public:
		typedef ::neash::display::Sprite_obj super;
		typedef PieChart_obj OBJ_;
		PieChart_obj();
		Void __construct(::com::stepasyuk_paunov::haxevis::DataSet data);

	public:
		static hx::ObjectPtr< PieChart_obj > __new(::com::stepasyuk_paunov::haxevis::DataSet data);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~PieChart_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("PieChart"); }

		bool showLegend; /* REM */ 
		virtual bool set_showLegend( bool value);
		Dynamic set_showLegend_dyn();

		virtual bool get_showLegend( );
		Dynamic get_showLegend_dyn();

		virtual Void drawWedge( Float radius,Float start,Float end,int color);
		Dynamic drawWedge_dyn();

		::com::stepasyuk_paunov::haxevis::DataSet _data; /* REM */ 
		::com::stepasyuk_paunov::haxevis::Legend _legend; /* REM */ 
		bool _showLegend; /* REM */ 
};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_PieChart */ 
