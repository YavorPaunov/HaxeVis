#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSet
#define INCLUDED_com_stepasyuk_paunov_haxevis_DataSet

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,DataSet)
HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,DataSetEntry)
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{


class DataSet_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef DataSet_obj OBJ_;
		DataSet_obj();
		Void __construct(Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > entries);

	public:
		static hx::ObjectPtr< DataSet_obj > __new(Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > entries);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~DataSet_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("DataSet"); }

		Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > entries; /* REM */ 
		virtual Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > get_entries( );
		Dynamic get_entries_dyn();

		virtual Array< Float > getRatios( );
		Dynamic getRatios_dyn();

		virtual Float getSum( );
		Dynamic getSum_dyn();

		Array< ::com::stepasyuk_paunov::haxevis::DataSetEntry > _entries; /* REM */ 
};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_DataSet */ 
