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
	/** This is the width of the glyph image's bounding box. It is independent of the layout direction. */
	public FT_Pos width;

	/** This is the height of the glyph image's bounding box. It is independent of the layout direction. Be careful not to confuse it with the ‘height’ field in the FT_Size_Metrics structure. */
	public FT_Pos height;

	/** For horizontal text layouts, this is the horizontal distance from the current cursor position to the leftmost border of the glyph image's bounding box. */
	public FT_Pos horiBearingX;

	/** For horizontal text layouts, this is the vertical distance from the current cursor position (on the baseline) to the topmost border of the glyph image's bounding box. */
	public FT_Pos horiBearingY;

	/** For horizontal text layouts, this is the horizontal distance to increment the pen position when the glyph is drawn as part of a string of text. */
	public FT_Pos horiAdvance;

	/** For vertical text layouts, this is the horizontal distance from the current cursor position to the leftmost border of the glyph image's bounding box. */
	public FT_Pos vertBearingX;

	/** For vertical text layouts, this is the vertical distance from the current cursor position (on the baseline) to the topmost border of the glyph image's bounding box. */
	public FT_Pos vertBearingY;

	/** For vertical text layouts, this is the vertical distance used to increment the pen position when the glyph is drawn as part of a string of text. */
	public FT_Pos vertAdvance;
}