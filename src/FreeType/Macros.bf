namespace FreeType;


using System;
using System.Interop;


static
{
	/// FreeType stores most metrics in 26.6 fixed point (1/64 pixel units).
	/// Divide a FT_Pos / FT_F26Dot6 value by this to get pixels, or multiply to convert pixels back.
	public const int FT_FIXED_POINT_SCALE = 64;

	/// The angle pi expressed in FT_Angle units.
	public const FT_Angle FT_ANGLE_PI = 180 << 16;

	/// The angle 2*pi expressed in FT_Angle units.
	public const FT_Angle FT_ANGLE_2PI = FT_ANGLE_PI * 2;

	/// The angle pi/2 expressed in FT_Angle units.
	public const FT_Angle FT_ANGLE_PI2 = FT_ANGLE_PI / 2;

	/// The angle pi/4 expressed in FT_Angle units.
	public const FT_Angle FT_ANGLE_PI4 = FT_ANGLE_PI / 4;

	/// Number of taps (weights) used by FT_Library_SetLcdFilterWeights.
	public const c_int FT_LCD_FILTER_FIVE_TAPS = 5;

	/// Maximum number of contours / points in an outline.
	public const c_int FT_OUTLINE_CONTOURS_MAX = 65535;
	public const c_int FT_OUTLINE_POINTS_MAX = 65535;

	/// Maximum number of axes of a Type 1 multiple master font.
	public const c_int T1_MAX_MM_AXIS = 4;

	// ====================================================================
	// FT_LOAD_TARGET_ / FT_CURVE_TAG / FT_MAKE_TAG
	// ====================================================================

	/// Packs a render mode into the hinting-target bits of FT_Load_Flags (macro FT_LOAD_TARGET_).
	[Inline]
	public static FT_Load_Flags FT_LOAD_TARGET_(FT_Render_Mode x)
	{
		return (FT_Load_Flags)(((c_int)x & 15) << 16);
	}

	/// Return the FT_Render_Mode corresponding to a given
	/// FT_LOAD_TARGET_XXX value.
	[Inline]
	public static FT_Render_Mode FT_LOAD_TARGET_MODE(FT_Load_Flags x)
	{
		return (FT_Render_Mode)(((c_int)x >> 16) & 15);
	}

	/// Extracts the point type (ON / CONIC / CUBIC) from an outline tag byte (macro FT_CURVE_TAG).
	[Inline]
	public static FT_Curve_Tag FT_CURVE_TAG(FT_Curve_Tag flag)
	{
		return (FT_Curve_Tag)((c_uchar)flag & 7);
	}

	/// This macro converts four-letter tags that are used to label TrueType
	/// tables into an `FT_Tag` type, to be used within FreeType.
	///
	/// @note:
	///   The produced values **must** be 32-bit integers.  Don't redefine this
	///   macro.
	[Inline]
	public static FT_Tag FT_MAKE_TAG(char8 x1, char8 x2, char8 x3, char8 x4)
	{
		return ((FT_Tag)x1 << 24) | ((FT_Tag)x2 << 16) | ((FT_Tag)x3 << 8) | (FT_Tag)x4;
	}

	// ====================================================================
	// Face query macros
	// ====================================================================

	/// A macro that returns true whenever a face object contains horizontal
	/// metrics (this is true for all font formats though).
	///
	/// @also:
	///   FT_HAS_VERTICAL can be used to check for vertical metrics.
	[Inline]
	public static bool FT_HAS_HORIZONTAL(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_HORIZONTAL);
	}

	/// A macro that returns true whenever a face object contains real
	/// vertical metrics (and not only synthesized ones).
	[Inline]
	public static bool FT_HAS_VERTICAL(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_VERTICAL);
	}

	/// A macro that returns true whenever a face object contains kerning data
	/// that can be accessed with FT_Get_Kerning.
	[Inline]
	public static bool FT_HAS_KERNING(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_KERNING);
	}

	/// A macro that returns true whenever a face object contains some
	/// embedded bitmaps.  See the `available_sizes` field of the FT_FaceRec
	/// structure.
	[Inline]
	public static bool FT_HAS_FIXED_SIZES(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_FIXED_SIZES);
	}

	/// A macro that returns true whenever a face object contains some glyph
	/// names that can be accessed through FT_Get_Glyph_Name.
	[Inline]
	public static bool FT_HAS_GLYPH_NAMES(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_GLYPH_NAMES);
	}

	/// A macro that returns true whenever a face object contains some
	/// multiple masters.  The functions provided by FT_MULTIPLE_MASTERS_H
	/// are then available to choose the exact design you want.
	[Inline]
	public static bool FT_HAS_MULTIPLE_MASTERS(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_MULTIPLE_MASTERS);
	}

	/// A macro that returns true whenever a face object contains tables for
	/// color glyphs.
	///
	/// @since:
	///   2.5.1
	[Inline]
	public static bool FT_HAS_COLOR(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_COLOR);
	}

	/// A macro that returns true whenever a face object contains an 'SVG '
	/// OpenType table.
	///
	/// @since:
	///   2.12
	[Inline]
	public static bool FT_HAS_SVG(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_SVG);
	}

	/// A macro that returns true whenever a face object contains an 'sbix'
	/// OpenType table *and* outline glyphs.
	///
	/// Currently, FreeType only supports bitmap glyphs in PNG format for this
	/// table (i.e., JPEG and TIFF formats are unsupported, as are
	/// Apple-specific formats not part of the OpenType specification).
	///
	/// @note:
	///     For backward compatibility, a font with an 'sbix' table is treated as
	///     a bitmap-only face.  Using FT_Open_Face with
	///     FT_PARAM_TAG_IGNORE_SBIX, an application can switch off 'sbix'
	///     handling so that the face is treated as an ordinary outline font with
	///     scalable outlines.
	///
	///     Here is some pseudo code that roughly illustrates how to implement
	///     'sbix' handling according to the OpenType specification.
	///
	///   ```
	///     if ( FT_HAS_SBIX( face ) )
	///     {
	///       // open font as a scalable one without sbix handling
	///       FT_Face       face2;
	///       FT_Parameter  param = { FT_PARAM_TAG_IGNORE_SBIX, NULL };
	///       FT_Open_Args  args  = { FT_OPEN_PARAMS | ...,
	///                               ...,
	///                               1, &param };
	///
	///
	///       FT_Open_Face( library, &args, 0, &face2 );
	///
	///       <sort `face->available_size` as necessary into
	///        `preferred_sizes`[*]>
	///
	///       for ( i = 0; i < face->num_fixed_sizes; i++ )
	///       {
	///         size = preferred_sizes[i].size;
	///
	///         error = FT_Set_Pixel_Sizes( face, size, size );
	///         <error handling omitted>
	///
	///         // check whether we have a glyph in a bitmap strike
	///         error = FT_Load_Glyph( face,
	///                                glyph_index,
	///                                FT_LOAD_SBITS_ONLY          |
	///                                FT_LOAD_BITMAP_METRICS_ONLY );
	///         if ( error == FT_Err_Invalid_Argument )
	///           continue;
	///         else if ( error )
	///           <other error handling omitted>
	///         else
	///           break;
	///       }
	///
	///       if ( i != face->num_fixed_sizes )
	///         <load embedded bitmap with `FT_Load_Glyph`,
	///          scale it, display it, etc.>
	///
	///       if ( i == face->num_fixed_sizes  ||
	///            FT_HAS_SBIX_OVERLAY( face ) )
	///         <use `face2` to load outline glyph with `FT_Load_Glyph`,
	///          scale it, display it on top of the bitmap, etc.>
	///     }
	///   ```
	///
	///   [*] Assuming a target value of 400dpi and available strike sizes 100,
	///   200, 300, and 400dpi, a possible order might be [400, 200, 300, 100]:
	///   scaling 200dpi to 400dpi usually gives better results than scaling
	///   300dpi to 400dpi; it is also much faster.  However, scaling 100dpi to
	///   400dpi can yield a too pixelated result, thus the preference might be
	///   300dpi over 100dpi.
	///
	/// @since:
	///   2.12
	[Inline]
	public static bool FT_HAS_SBIX(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_SBIX);
	}

	/// A macro that returns true whenever a face object contains an 'sbix'
	/// OpenType table with bit 1 in its `flags` field set, instructing the
	/// application to overlay the bitmap strike with the corresponding
	/// outline glyph.  See FT_HAS_SBIX for pseudo code how to use it.
	///
	/// @since:
	///   2.12
	[Inline]
	public static bool FT_HAS_SBIX_OVERLAY(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_SBIX_OVERLAY);
	}

	/// Deprecated.
	[Inline]
	public static bool FT_HAS_FAST_GLYPHS(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_FAST_GLYPHS);
	}

	/// A macro that returns true whenever a face object contains a scalable
	/// font face (true for TrueType, Type 1, Type 42, CID, OpenType/CFF, and
	/// PFR font formats).
	[Inline]
	public static bool FT_IS_SCALABLE(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_SCALABLE);
	}

	/// A macro that returns true whenever a face object contains a font whose
	/// format is based on the SFNT storage scheme.  This usually means:
	/// TrueType fonts, OpenType fonts, as well as SFNT-based embedded bitmap
	/// fonts.
	///
	/// If this macro is true, all functions defined in FT_SFNT_NAMES_H and
	/// FT_TRUETYPE_TABLES_H are available.
	[Inline]
	public static bool FT_IS_SFNT(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_SFNT);
	}

	/// A macro that returns true whenever a face object contains a font face
	/// that contains fixed-width (or 'monospace', 'fixed-pitch', etc.)
	/// glyphs.
	[Inline]
	public static bool FT_IS_FIXED_WIDTH(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_FIXED_WIDTH);
	}

	/// A macro that returns true whenever a face object contains a CID-keyed
	/// font.  See the discussion of FT_FACE_FLAG_CID_KEYED for more details.
	///
	/// If this macro is true, all functions defined in FT_CID_H are
	/// available.
	[Inline]
	public static bool FT_IS_CID_KEYED(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_CID_KEYED);
	}

	/// A macro that returns true whenever a face represents a 'tricky' font.
	/// See the discussion of FT_FACE_FLAG_TRICKY for more details.
	[Inline]
	public static bool FT_IS_TRICKY(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_TRICKY);
	}

	/// A macro that returns true whenever a face object has been altered by
	/// FT_Set_MM_Design_Coordinates, FT_Set_Var_Design_Coordinates,
	/// FT_Set_Var_Blend_Coordinates, or FT_Set_MM_WeightVector.
	///
	/// @since:
	///   2.9
	[Inline]
	public static bool FT_IS_VARIATION(FT_Face face)
	{
		return face.face_flags.HasFlag(.FT_FACE_FLAG_VARIATION);
	}

	/// A macro that returns true whenever a face object is a named instance
	/// of a TrueType GX or OpenType Font Variations.
	///
	/// [Since 2.9] Changing the design coordinates with
	/// FT_Set_Var_Design_Coordinates or FT_Set_Var_Blend_Coordinates does
	/// not influence the return value of this macro (only
	/// FT_Set_Named_Instance does that).
	///
	/// @since:
	///   2.7
	[Inline]
	public static bool FT_IS_NAMED_INSTANCE(FT_Face face)
	{
		return (face.face_index & 0x7FFF0000) != 0;
	}
}