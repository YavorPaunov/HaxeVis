#ifndef INCLUDED_neash_utils_CompressionAlgorithm
#define INCLUDED_neash_utils_CompressionAlgorithm

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(neash,utils,CompressionAlgorithm)
namespace neash{
namespace utils{


class CompressionAlgorithm_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef CompressionAlgorithm_obj OBJ_;
		CompressionAlgorithm_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< CompressionAlgorithm_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~CompressionAlgorithm_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("CompressionAlgorithm"); }

		static ::String ZLIB; /* REM */ 
		static ::String DEFLATE; /* REM */ 
		static ::String GZIP; /* REM */ 
};

} // end namespace neash
} // end namespace utils

#endif /* INCLUDED_neash_utils_CompressionAlgorithm */ 
