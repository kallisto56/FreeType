namespace FreeType;


using System;
using System.Interop;


/**
 * The base charmap structure.
 */
[CRepr]
struct FT_CharMapRec
{
	public FT_Face face;
	public FT_Encoding encoding;
	public FT_UShort platform_id;
	public FT_UShort encoding_id;
}


/**
 * A handle to a character map (usually abbreviated to 'charmap').  A
 * charmap is used to translate character codes in a given encoding into
 * glyph indexes for its parent's face.  Some font formats may provide
 * several charmaps per font.
 */
typealias FT_CharMap = FT_CharMapRec*;