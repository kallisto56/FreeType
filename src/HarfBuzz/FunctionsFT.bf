namespace HarfBuzz;


using System;
using System.Interop;
using FreeType;


static
{
	// ====================================================================
	// hb-ft.h
	// ====================================================================

	/// Creates an hb_face_t face object from the specified FT_Face.
	///
	/// Note that this is using the FT_Face object just to get at the underlying
	/// font data, and fonts created from the returned hb_face_t will use the native
	/// HarfBuzz font implementation, unless you call hb_ft_font_set_funcs() on them.
	///
	/// This variant of the function does not provide any life-cycle management.
	///
	/// Most client programs should use hb_ft_face_create_referenced()
	/// (or, perhaps, hb_ft_face_create_cached()) instead.
	///
	/// If you know you have valid reasons not to use hb_ft_face_create_referenced(),
	/// then it is the client program's responsibility to destroy @ft_face
	/// after the hb_face_t face object has been destroyed.
	///
	/// @ft_face: FT_Face to work upon
	/// @destroy: (nullable) (scope async): A callback to call when the face object is not needed anymore
	///
	/// Return value: (transfer full): the new hb_face_t face object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_ft_face_create(FT_Face ft_face, hb_destroy_func_t destroy);

	/// Creates an hb_face_t face object from the specified FT_Face.
	///
	/// Note that this is using the FT_Face object just to get at the underlying
	/// font data, and fonts created from the returned hb_face_t will use the native
	/// HarfBuzz font implementation, unless you call hb_ft_font_set_funcs() on them.
	///
	/// This variant of the function caches the newly created hb_face_t
	/// face object, using the @generic pointer of @ft_face. Subsequent function
	/// calls that are passed the same @ft_face parameter will have the same
	/// hb_face_t returned to them, and that hb_face_t will be correctly
	/// reference counted.
	///
	/// However, client programs are still responsible for destroying
	/// @ft_face after the last hb_face_t face object has been destroyed.
	///
	/// @ft_face: FT_Face to work upon
	///
	/// Return value: (transfer full): the new hb_face_t face object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_ft_face_create_cached(FT_Face ft_face);

	/// Creates an hb_face_t face object from the specified FT_Face.
	///
	/// Note that this is using the FT_Face object just to get at the underlying
	/// font data, and fonts created from the returned hb_face_t will use the native
	/// HarfBuzz font implementation, unless you call hb_ft_font_set_funcs() on them.
	///
	/// This is the preferred variant of the hb_ft_face_create*
	/// function family, because it calls FT_Reference_Face() on @ft_face,
	/// ensuring that @ft_face remains alive as long as the resulting
	/// hb_face_t face object remains alive. Also calls FT_Done_Face()
	/// when the hb_face_t face object is destroyed.
	///
	/// Use this version unless you know you have good reasons not to.
	///
	/// @ft_face: FT_Face to work upon
	///
	/// Return value: (transfer full): the new hb_face_t face object
	///
	/// Since: 0.9.38
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_ft_face_create_referenced(FT_Face ft_face);

	/// Creates an hb_face_t face object from the specified
	/// font file and face index.
	///
	/// This is similar in functionality to hb_face_create_from_file_or_fail(),
	/// but uses the FreeType library for loading the font file. This can
	/// be useful, for example, to load WOFF and WOFF2 font data.
	///
	/// @file_name: A font filename
	/// @index: The index of the face within the file
	///
	/// Return value: (transfer full): The new face object, or `NULL` if
	/// no face is found at the specified index or the file cannot be read.
	///
	/// Since: 10.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_ft_face_create_from_file_or_fail(c_char* file_name, c_uint index);

	/// Creates an hb_face_t face object from the specified
	/// font blob and face index.
	///
	/// This is similar in functionality to hb_face_create_or_fail(),
	/// but uses the FreeType library for loading the font blob. This can
	/// be useful, for example, to load WOFF and WOFF2 font data.
	///
	/// @blob: A blob
	/// @index: The index of the face within the blob
	///
	/// Return value: (transfer full): The new face object, or `NULL` if
	/// loading fails (eg. blob does not contain valid font data).
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_ft_face_create_from_blob_or_fail(hb_blob_t* blob, c_uint index);

	/// Creates an hb_font_t font object from the specified FT_Face.
	///
	/// <note>Note: You must set the face size on @ft_face before calling
	/// hb_ft_font_create() on it. HarfBuzz assumes size is always set and will
	/// access `size` member of FT_Face unconditionally.</note>
	///
	/// This variant of the function does not provide any life-cycle management.
	///
	/// Most client programs should use hb_ft_font_create_referenced()
	/// instead.
	///
	/// If you know you have valid reasons not to use hb_ft_font_create_referenced(),
	/// then it is the client program's responsibility to destroy @ft_face
	/// only after the hb_font_t font object has been destroyed.
	///
	/// HarfBuzz will use the @destroy callback on the hb_font_t font object
	/// if it is supplied when you use this function. However, even if @destroy
	/// is provided, it is the client program's responsibility to destroy @ft_face,
	/// and it is the client program's responsibility to ensure that @ft_face is
	/// destroyed only after the hb_font_t font object has been destroyed.
	///
	/// @ft_face: FT_Face to work upon
	/// @destroy: (nullable) (scope async): A callback to call when the font object is not needed anymore
	///
	/// Return value: (transfer full): the new hb_font_t font object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_t* hb_ft_font_create(FT_Face ft_face, hb_destroy_func_t destroy);

	/// Creates an hb_font_t font object from the specified FT_Face.
	///
	/// <note>Note: You must set the face size on @ft_face before calling
	/// hb_ft_font_create_referenced() on it. HarfBuzz assumes size is always set
	/// and will access `size` member of FT_Face unconditionally.</note>
	///
	/// This is the preferred variant of the hb_ft_font_create*
	/// function family, because it calls FT_Reference_Face() on @ft_face,
	/// ensuring that @ft_face remains alive as long as the resulting
	/// hb_font_t font object remains alive.
	///
	/// Use this version unless you know you have good reasons not to.
	///
	/// @ft_face: FT_Face to work upon
	///
	/// Return value: (transfer full): the new hb_font_t font object
	///
	/// Since: 0.9.38
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_t* hb_ft_font_create_referenced(FT_Face ft_face);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Face hb_ft_font_get_ft_face(hb_font_t* font);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Face hb_ft_font_lock_face(hb_font_t* font);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ft_font_unlock_face(hb_font_t* font);

	/// Sets the FT_Load_Glyph load flags for the specified hb_font_t.
	///
	/// For more information, see
	/// <https://freetype.org/freetype2/docs/reference/ft2-glyph_retrieval.htmlft_load_xxx>
	///
	/// This function works with hb_font_t objects created by
	/// hb_ft_font_create() or hb_ft_font_create_referenced().
	///
	/// @font: hb_font_t to work upon
	/// @load_flags: The FreeType load flags to set
	///
	/// Since: 1.0.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ft_font_set_load_flags(hb_font_t* font, FT_Load_Flags load_flags);

	/// Fetches the FT_Load_Glyph load flags of the specified hb_font_t.
	///
	/// For more information, see
	/// <https://freetype.org/freetype2/docs/reference/ft2-glyph_retrieval.htmlft_load_xxx>
	///
	/// This function works with hb_font_t objects created by
	/// hb_ft_font_create() or hb_ft_font_create_referenced().
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: FT_Load_Glyph flags found, or 0
	///
	/// Since: 1.0.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Load_Flags hb_ft_font_get_load_flags(hb_font_t* font);

	/// Refreshes the state of @font when the underlying FT_Face has changed.
	/// This function should be called after changing the size or
	/// variation-axis settings on the FT_Face.
	///
	/// @font: hb_font_t to work upon
	///
	/// Since: 1.0.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ft_font_changed(hb_font_t* font);

	/// Refreshes the state of the underlying FT_Face of @font when the hb_font_t
	/// @font has changed.
	/// This function should be called after changing the size or
	/// variation-axis settings on the @font.
	/// This call is fast if nothing has changed on @font.
	///
	/// Note that as of version 11.0.0, calling this function is not necessary,
	/// as HarfBuzz will automatically detect changes to the font and update
	/// the underlying FT_Face as needed.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: true if changed, false otherwise
	///
	/// Since: 4.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ft_hb_font_changed(hb_font_t* font);

	/// Configures the font-functions structure of the specified
	/// hb_font_t font object to use FreeType font functions.
	///
	/// In particular, you can use this function to configure an
	/// existing hb_face_t face object for use with FreeType font
	/// functions even if that hb_face_t face object was initially
	/// created with hb_face_create(), and therefore was not
	/// initially configured to use FreeType font functions.
	///
	/// An hb_font_t object created with hb_ft_font_create()
	/// is preconfigured for FreeType font functions and does not
	/// require this function to be used.
	///
	/// Note that if you modify the underlying hb_font_t after
	/// calling this function, you need to call hb_ft_hb_font_changed()
	/// to update the underlying FT_Face.
	///
	/// <note>Note: Internally, this function creates an FT_Face.
	/// </note>
	///
	/// @font: hb_font_t to work upon
	///
	/// Since: 1.0.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ft_font_set_funcs(hb_font_t* font);
}