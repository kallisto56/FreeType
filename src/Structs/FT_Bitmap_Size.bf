namespace FreeType;


using System;
using System.Interop;


/**
 * This structure models the metrics of a bitmap strike (i.e., a set of
 * glyphs for a given point size and resolution) in a bitmap font.  It is
 * used for the `available_sizes` field of @FT_Face.
 */
[CRepr]
struct FT_Bitmap_Size
{
	public FT_Short height;
	public FT_Short width;
	
	public FT_Pos size;
	
	public FT_Pos x_ppem;
	public FT_Pos y_ppem;
}