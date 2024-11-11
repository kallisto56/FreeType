namespace FreeType;


using System;
using System.Interop;


/**
 * An enumeration type used to describe the format of a given glyph
 * image. Note that this version of FreeType only supports two image
 * formats, even though future font drivers will be able to register
 * their own format.
 */
enum FT_Glyph_Format : FT_ULong
{
	FT_GLYPH_FORMAT_NONE = FT_IMAGE_TAG( 0, 0, 0, 0 ),

	FT_GLYPH_FORMAT_COMPOSITE = FT_IMAGE_TAG( 'c', 'o', 'm', 'p' ),
	FT_GLYPH_FORMAT_BITMAP = FT_IMAGE_TAG( 'b', 'i', 't', 's' ),
	FT_GLYPH_FORMAT_OUTLINE = FT_IMAGE_TAG( 'o', 'u', 't', 'l' ),
	FT_GLYPH_FORMAT_PLOTTER = FT_IMAGE_TAG( 'p', 'l', 'o', 't' ),
	FT_GLYPH_FORMAT_SVG = FT_IMAGE_TAG( 'S', 'V', 'G', ' ' )
}


/**
 * This macro converts four-letter tags to an unsigned long type.
 */
extension FT_Glyph_Format
{
	static public FT_ULong FT_IMAGE_TAG (char8 _x1, char8 _x2, char8 _x3, char8 _x4)
	{
	    return (FT_ULong(_x1) << 24) | (FT_ULong(_x2) << 16) | (FT_ULong(_x3) << 8)  | FT_ULong(_x4);
	}
}