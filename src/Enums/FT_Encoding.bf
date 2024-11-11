namespace FreeType;


using System;
using System.Interop;


/**
 * An enumeration to specify character sets supported by charmaps. Used
 * in the @FT_Select_Charmap API function.
 */
[AllowDuplicates]
enum FT_Encoding : System.Interop.c_uint
{
	FT_ENCODING_NONE = FT_ENC_TAG( 0, 0, 0, 0 ),

	FT_ENCODING_MS_SYMBOL = FT_ENC_TAG( 's', 'y', 'm', 'b' ),
	FT_ENCODING_UNICODE = FT_ENC_TAG( 'u', 'n', 'i', 'c' ),

	FT_ENCODING_SJIS = FT_ENC_TAG( 's', 'j', 'i', 's' ),
	FT_ENCODING_PRC = FT_ENC_TAG( 'g', 'b', ' ', ' ' ),
	FT_ENCODING_BIG5 = FT_ENC_TAG( 'b', 'i', 'g', '5' ),
	FT_ENCODING_WANSUNG = FT_ENC_TAG( 'w', 'a', 'n', 's' ),
	FT_ENCODING_JOHAB = FT_ENC_TAG( 'j', 'o', 'h', 'a' ),

	/* for backward compatibility */
	FT_ENCODING_GB2312 = FT_ENCODING_PRC,
	FT_ENCODING_MS_SJIS = FT_ENCODING_SJIS,
	FT_ENCODING_MS_GB2312 = FT_ENCODING_PRC,
	FT_ENCODING_MS_BIG5 = FT_ENCODING_BIG5,
	FT_ENCODING_MS_WANSUNG = FT_ENCODING_WANSUNG,
	FT_ENCODING_MS_JOHAB = FT_ENCODING_JOHAB,

	FT_ENCODING_ADOBE_STANDARD = FT_ENC_TAG( 'A', 'D', 'O', 'B' ),
	FT_ENCODING_ADOBE_EXPERT = FT_ENC_TAG( 'A', 'D', 'B', 'E' ),
	FT_ENCODING_ADOBE_CUSTOM = FT_ENC_TAG( 'A', 'D', 'B', 'C' ),
	FT_ENCODING_ADOBE_LATIN_1 = FT_ENC_TAG( 'l', 'a', 't', '1' ),

	FT_ENCODING_OLD_LATIN_2 = FT_ENC_TAG( 'l', 'a', 't', '2' ),

	FT_ENCODING_APPLE_ROMAN = FT_ENC_TAG( 'a', 'r', 'm', 'n' )
}


extension FT_Encoding
{
	/**
	 * This macro converts four-letter tags into an unsigned long. It is
	 * used to define 'encoding' identifiers (see @FT_Encoding).
	 */
	static FT_UInt32 FT_ENC_TAG (char8 a, char8 b, char8 c, char8 d)
	{
	    return (FT_UInt32(a) << 24) | (FT_UInt32(b) << 16) | (FT_UInt32(c) << 8)  | FT_UInt32(d);
	}
}