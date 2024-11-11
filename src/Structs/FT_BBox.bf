namespace FreeType;


using System;
using System.Interop;


/**
 * A structure used to hold an outline's bounding box, i.e., the
 * coordinates of its extrema in the horizontal and vertical directions.
 */
[CRepr]
struct FT_BBox
{
	public FT_Pos xMin, yMin;
	public FT_Pos xMax, yMax;
}