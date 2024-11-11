namespace FreeType;


/**
 * Excluded from fttypes.h:
 * - typedef FT_PtrDist
 * - typedef FT_UnitVector
 * - #define FT_MAKE_TAG
 * - #define FT_IS_EMPTY
 * - #define FT_BOOL
 * - #define FT_ERR_XCAT
 * - #define FT_ERR_CAT
 * - #define FT_ERR
 * - #define FT_ERROR_BASE
 * - #define FT_ERROR_MODULE
 * - #define FT_ERR_EQ
 * - #define FT_ERR_NEQ
 *
 * Excluded from integer-types.h:
 * - typedef FT_Fast
 * - typedef FT_UFast
 * - #define FT_INT64
 * - #define FT_UINT64
**/


using System;
using System.Interop;


/**
 * A typedef of unsigned char, used for simple booleans.  As usual,
 * values 1 and~0 represent true and false, respectively.
**/
[CRepr]
struct FT_Bool : c_uchar
{
	[Inline] static public implicit operator bool (FT_Bool v) => v == 1;
	[Inline] static public implicit operator FT_Bool (bool v) => v == true ? 1 : 0;
}


/**
 * A signed 16-bit integer used to store a distance in original font
 * units.
**/
typealias FT_FWord = c_short;


/**
 * An unsigned 16-bit integer used to store a distance in original font
 * units.
**/
typealias FT_UFWord = c_ushort;


/**
 * A simple typedef for the _signed_ char type.
**/
typealias FT_Char = c_char;


/**
 * A simple typedef for the _unsigned_ char type.
**/
typealias FT_Byte = c_uchar;


/**
 * A typedef for constant memory areas.
**/
typealias FT_Bytes = FT_Byte*;


/**
 * A typedef for 32-bit tags (as used in the SFNT format).
**/
typealias FT_Tag = FT_UInt32;


/**
 * A simple typedef for the char type, usually used for strings.
**/
typealias FT_String = c_char;


/**
 * A typedef for signed short.
**/
typealias FT_Short = c_short;


/**
 * A typedef for unsigned short.
**/
typealias FT_UShort = c_ushort;


/**
 * A typedef for the int type.
**/
typealias FT_Int = c_int;


/**
 * A typedef for the unsigned int type.
**/
typealias FT_UInt = c_uint;


/**
 * A typedef for the signed long type.
**/
typealias FT_Long = c_long;


/**
 * A typedef for the unsigned long type.
**/
typealias FT_ULong = c_ulong;


/**
 * A signed 2.14 fixed-point type used for unit vectors.
**/
typealias FT_F2Dot14 = c_short;


/**
 * A signed 26.6 fixed-point type used for vectorial pixel coordinates.
**/
typealias FT_F26Dot6 = c_long;


/**
 * This type is used to store 16.16 fixed-point values, like scaling
 * values or matrix coefficients.
**/
typealias FT_Fixed = c_long;


/**
 * A simple typedef for a typeless pointer.
**/
typealias FT_Pointer = void*;


/**
 * This is equivalent to the ANSI~C `size_t` type, i.e., the largest
 * _unsigned_ integer type used to express a file size or position, or a
 * memory block size.
**/
typealias FT_Offset = c_size;


/**
 * A typedef for a 16bit signed integer type.
**/
typealias FT_Int16 = c_short;


/**
 * A typedef for a 16bit unsigned integer type.
**/
typealias FT_UInt16 = c_ushort;


/**
 * A typedef for a 32bit signed integer type.
**/
typealias FT_Int32 = c_int;


/**
 * A typedef for a 32bit unsigned integer type.
**/
typealias FT_UInt32 = c_uint;


/**
 * The type FT_Pos is used to store vectorial coordinates.  Depending on
 * the context, these can represent distances in integer font units, or
 * 16.16, or 26.6 fixed-point pixel coordinates.
**/
typealias FT_Pos = c_long;