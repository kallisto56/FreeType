namespace FreeType;


using System;
using System.Interop;


/**
 * A structure used to describe a bitmap or pixmap to the raster. Note
 * that we now manage pixmaps of various depths through the `pixel_mode`
 * field.
 */
[CRepr]
struct FT_Bitmap
{
	public c_uint rows;
	public c_uint width;
	public int pitch;
	public c_uchar* buffer;
	public c_ushort num_grays;
	public c_uchar pixel_mode;
	public c_uchar palette_mode;
	public void* palette;
}