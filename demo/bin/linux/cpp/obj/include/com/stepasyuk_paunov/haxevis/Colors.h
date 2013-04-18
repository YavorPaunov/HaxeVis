#ifndef INCLUDED_com_stepasyuk_paunov_haxevis_Colors
#define INCLUDED_com_stepasyuk_paunov_haxevis_Colors

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(com,stepasyuk_paunov,haxevis,Colors)
namespace com{
namespace stepasyuk_paunov{
namespace haxevis{


class Colors_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef Colors_obj OBJ_;
		Colors_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< Colors_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~Colors_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("Colors"); }

		static int random( );
		static Dynamic random_dyn();

};

} // end namespace com
} // end namespace stepasyuk_paunov
} // end namespace haxevis

#endif /* INCLUDED_com_stepasyuk_paunov_haxevis_Colors */ 
