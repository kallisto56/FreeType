namespace FreeType;


using System;
using System.Interop;


static
{
	/**
	 * FreeType represents font metrics in 1/64th pixel units, so dividing by 64 gives us the value in pixels.
	 */
	public const int FT_FIXED_POINT_SCALE = 64;
}