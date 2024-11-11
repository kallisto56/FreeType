namespace FreeType;


using System;
using System.Interop;


static
{
	/**
	 * Initialize a new FreeType library object. The set of modules that are
	 * registered by this function is determined at build time.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_Init_FreeType (out FT_Library alibrary);


	/**
	 * Destroy a given FreeType library object and all of its children,
	 * including resources, drivers, faces, sizes, etc.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_Done_FreeType (FT_Library library);


	/**
	 * Call @FT_Open_Face to open a font by its pathname.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_New_Face (FT_Library library, /*const*/c_char* filepathname, FT_Long face_index, out FT_Face aface);


	/**
	 * Call @FT_Request_Size to request the nominal size (in points).
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_Set_Char_Size (FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, FT_UInt horz_resolution, FT_UInt vert_resolution);


	/**
	 * Discard a given face object, as well as all of its child slots and
	 * sizes.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_Done_Face (FT_Face face);


	/**
	 * Return the glyph index of a given character code. This function uses
	 * the currently selected charmap to do the mapping.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_UInt FT_Get_Char_Index (FT_Face face, FT_ULong charcode);


	/**
	 * Load a glyph into the glyph slot of a face object, accessed by its
	 * character code.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_Load_Char (FT_Face face, FT_ULong char_code, FT_LOAD_XXX load_flags);


	/**
	 * Convert a given glyph image to a bitmap. It does so by inspecting the
	 * glyph image format, finding the relevant renderer, and invoking it.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_Render_Glyph (FT_GlyphSlot slot, FT_Render_Mode render_mode);


	/**
	 * Return the kerning vector between two glyphs of the same face.
	 */
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	static public extern FT_Err FT_Get_Kerning (FT_Face face, FT_UInt left_glyph, FT_UInt right_glyph, FT_Kerning_Mode kern_mode, out FT_Vector akerning);
}