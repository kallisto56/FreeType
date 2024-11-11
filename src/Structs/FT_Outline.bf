namespace FreeType;


using System;
using System.Interop;


/**
 * This structure is used to describe an outline to the scan-line
 * converter.
 */
[CRepr]
struct FT_Outline
{
	public c_ushort n_contours; /* number of contours in glyph */
	public c_ushort n_points; /* number of points in the glyph */

	public FT_Vector* points; /* the outline's points */
	public c_uchar* tags; /* the points flags */
	public c_ushort* contours; /* the contour end points */

	public int flags; /* outline masks */
}