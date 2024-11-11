namespace FreeType;


using System;
using System.Interop;


/**
 * The size metrics structure gives the metrics of a size object.
 */
[CRepr]
struct FT_Size_Metrics
{
	public FT_UShort x_ppem;      /* horizontal pixels per EM               */
	public FT_UShort y_ppem;      /* vertical pixels per EM                 */

	public FT_Fixed x_scale;     /* scaling values used to convert font    */
	public FT_Fixed y_scale;     /* units to 26.6 fractional pixels        */

	public FT_Pos ascender;    /* ascender in 26.6 frac. pixels          */
	public FT_Pos descender;   /* descender in 26.6 frac. pixels         */
	public FT_Pos height;      /* text height in 26.6 frac. pixels       */
	public FT_Pos max_advance; /* max horizontal advance, in 26.6 pixels */
}