namespace FreeType;


using System;
using System.Interop;


/**
 * A structure to model the metrics of a single glyph.  The values are
 * expressed in 26.6 fractional pixel format; if the flag
 * @FT_LOAD_NO_SCALE has been used while loading the glyph, values are
 * expressed in font units instead.
 */
[CRepr]
struct FT_Glyph_Metrics
{
	public FT_Pos width;
	public FT_Pos height;

	public FT_Pos horiBearingX;
	public FT_Pos horiBearingY;
	public FT_Pos horiAdvance;

	public FT_Pos vertBearingX;
	public FT_Pos vertBearingY;
	public FT_Pos vertAdvance;
}