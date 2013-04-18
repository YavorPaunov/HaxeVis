package com.stepasyuk_paunov.haxevis;

/**
 * ...
 * @author Yavor
 */

class Colors 
{

	//public static inline GREEN:Int = 0x66E380;
	//public static inline BLUE:Int = 0x79A0D0;
	//public static inline RED:Int = 0xFF5757;
	//public static inline GRAY:Int = 0xBDBDBD;
	//public static inline PINK:Int = 0xF898D1;
	//public static inline PURPLE:Int = 0xCD4180;
	//public static inline ORANGE:Int = 0xFCA88B;
	//public static inline YELLOW:Int = 0xF0F592;
		
	public inline static function random():Int {
		return Std.int(0x999999 + 0x666666 * Math.random());
	}
}