namespace FreeType;


using System;


/**
 * An enumeration to specify the format of kerning values returned by
 * @FT_Get_Kerning.
 */
enum FT_Kerning_Mode : FT_UInt
{
	FT_KERNING_DEFAULT = 0,
	FT_KERNING_UNFITTED,
	FT_KERNING_UNSCALED
}