#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_LineChartDataSetEntry
#define INCLUDED_com_stepasyuk_paunov_haxevis_LineChartDataSetEntry

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <com/stepasyuk_paunov/haxevis/DataSetEntry.h>
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,DataSetEntry)
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,LineChartDataSetEntry)
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{


class LineChartDataSetEntry_obj : public ::com::stepasyuk_paunov::haxevis::DataSetEntry_obj{
	public:
		typedef ::com::stepasyuk_paunov::haxevis::DataSetEntry_obj super;
		typedef LineChartDataSetEntry_obj OBJ_;
		LineChartDataSetEntry_obj();
		Void __construct(::String name,Array< Float > valueSet,int color,Dynamic value);

	public:
		static hx::ObjectPtr< LineChartDataSetEntry_obj > __new(::String name,Array< Float > valueSet,int color,Dynamic value);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~LineChartDataSetEntry_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("LineChartDataSetEntry"); }

		virtual Array< Float > set_valueSet( Array< Float > value);
		Dynamic set_valueSet_dyn();

		Array< Float > valueSet; /* REM */ 
		virtual Array< Float > get_valueSet( );
		Dynamic get_valueSet_dyn();

		Array< Float > _valueSet; /* REM */ 
};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_LineChartDataSetEntry */ 
