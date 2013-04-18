#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry
#define INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,DataSetEntry)
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{


class DataSetEntry_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef DataSetEntry_obj OBJ_;
		DataSetEntry_obj();
		Void __construct(::String name,Float value,hx::Null< int >  __o_color);

	public:
		static hx::ObjectPtr< DataSetEntry_obj > __new(::String name,Float value,hx::Null< int >  __o_color);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~DataSetEntry_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("DataSetEntry"); }

		int color; /* REM */ 
		virtual int set_color( int value);
		Dynamic set_color_dyn();

		virtual int get_color( );
		Dynamic get_color_dyn();

		Float value; /* REM */ 
		virtual Float set_value( Float value);
		Dynamic set_value_dyn();

		virtual Float get_value( );
		Dynamic get_value_dyn();

		::String name; /* REM */ 
		virtual ::String set_name( ::String value);
		Dynamic set_name_dyn();

		virtual ::String get_name( );
		Dynamic get_name_dyn();

		int _color; /* REM */ 
		Float _value; /* REM */ 
		::String _name; /* REM */ 
};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_DataSetEntry */ 
