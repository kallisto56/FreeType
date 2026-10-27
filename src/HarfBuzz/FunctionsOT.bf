namespace HarfBuzz;


using System;
using System.Interop;


static
{
	// ====================================================================
	// hb-ot-color.h
	// ====================================================================

	/// Tests whether a face includes a `CPAL` color-palette table.
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_has_palettes(hb_face_t* face);

	/// Fetches the number of color palettes in a face.
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: the number of palettes found
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_color_palette_get_count(hb_face_t* face);

	/// Fetches the `name` table Name ID that provides display names for
	/// a `CPAL` color palette.
	///
	/// Palette display names can be generic (e.g., "Default") or provide
	/// specific, themed names (e.g., "Spring", "Summer", "Fall", and "Winter").
	///
	/// @face: hb_face_t to work upon
	/// @palette_index: The index of the color palette
	///
	/// Return value: the Named ID found for the palette.
	/// If the requested palette has no name the result is HB_OT_NAME_ID_INVALID.
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_name_id_t hb_ot_color_palette_get_name_id(hb_face_t* face, c_uint palette_index);

	/// Fetches the `name` table Name ID that provides display names for
	/// the specified color in a face's `CPAL` color palette.
	///
	/// Display names can be generic (e.g., "Background") or specific
	/// (e.g., "Eye color").
	///
	/// @face: hb_face_t to work upon
	/// @color_index: The index of the color
	///
	/// Return value: the Name ID found for the color.
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_name_id_t hb_ot_color_palette_color_get_name_id(hb_face_t* face, c_uint color_index);

	/// Fetches the flags defined for a color palette.
	///
	/// @face: hb_face_t to work upon
	/// @palette_index: The index of the color palette
	///
	/// Return value: the hb_ot_color_palette_flags_t of the requested color palette
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_color_palette_flags_t hb_ot_color_palette_get_flags(hb_face_t* face, c_uint palette_index);

	/// Fetches a list of the colors in a color palette.
	///
	/// After calling this function, @colors will be filled with the palette
	/// colors. If @colors is NULL, the function will just return the number
	/// of total colors without storing any actual colors; this can be used
	/// for allocating a buffer of suitable size before calling
	/// hb_ot_color_palette_get_colors() a second time.
	///
	/// The RGBA values in the palette are unpremultiplied. See the
	/// OpenType spec [CPAL](https://learn.microsoft.com/en-us/typography/opentype/spec/cpal)
	/// section for details.
	///
	/// @face: hb_face_t to work upon
	/// @palette_index: the index of the color palette to query
	/// @start_offset: offset of the first color to retrieve
	/// @color_count: (inout) (optional): Input = the maximum number of colors to return;
	///     Output = the actual number of colors returned (may be zero)
	/// @colors: (out) (array length=color_count) (nullable): The array of hb_color_t records found
	///
	/// Return value: the total number of colors in the palette
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_color_palette_get_colors(hb_face_t* face, c_uint palette_index, c_uint start_offset, c_uint* color_count, hb_color_t* colors);

	/// Tests whether a face includes a `COLR` table
	/// with data according to COLRv0.
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_has_layers(hb_face_t* face);

	/// Fetches a list of all color layers for the specified glyph index in the specified
	/// face. The list returned will begin at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @glyph: The glyph index to query
	/// @start_offset: offset of the first layer to retrieve
	/// @layer_count: (inout) (optional): Input = the maximum number of layers to return;
	///     Output = the actual number of layers returned (may be zero)
	/// @layers: (out) (array length=layer_count) (nullable): The array of layers found
	///
	/// Return value: Total number of layers available for the glyph index queried
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_color_glyph_get_layers(hb_face_t* face, hb_codepoint_t glyph, c_uint start_offset, c_uint* layer_count, hb_ot_color_layer_t* layers);

	/// Tests where a face includes a `COLR` table
	/// with data according to COLRv1.
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_has_paint(hb_face_t* face);

	/// Tests where a face includes COLRv1 paint
	/// data for @glyph.
	///
	/// @face: hb_face_t to work upon
	/// @glyph: The glyph index to query
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_glyph_has_paint(hb_face_t* face, hb_codepoint_t glyph);

	/// Tests whether a face includes any `SVG` glyph images.
	///
	/// @face: hb_face_t to work upon.
	///
	/// Return value: `true` if data found, `false` otherwise.
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_has_svg(hb_face_t* face);

	/// Gets the number of SVG documents in the face `SVG` table.
	///
	/// @face: hb_face_t to work upon.
	///
	/// Return value: number of SVG documents in the face.
	///
	/// Since: 12.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_color_get_svg_document_count(hb_face_t* face);

	/// Gets the `SVG`-table document index associated with a glyph.
	///
	/// @face: hb_face_t to work upon.
	/// @glyph: glyph ID to query.
	/// @svg_document_index: (out) (nullable): output SVG document index.
	///
	/// Return value: `true` if @glyph maps to an SVG document, `false` otherwise.
	///
	/// Since: 12.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_glyph_get_svg_document_index(hb_face_t* face, hb_codepoint_t glyph, c_uint* svg_document_index);

	/// Gets the glyph range covered by an `SVG`-table document index.
	///
	/// @face: hb_face_t to work upon.
	/// @svg_document_index: SVG document index.
	/// @start_glyph_id: (out) (nullable): output start glyph ID.
	/// @end_glyph_id: (out) (nullable): output end glyph ID.
	///
	/// Return value: `true` if @svg_document_index is valid, `false` otherwise.
	///
	/// Since: 13.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_get_svg_document_glyph_range(hb_face_t* face, c_uint svg_document_index, hb_codepoint_t* start_glyph_id, hb_codepoint_t* end_glyph_id);

	/// Fetches the SVG document for a glyph. The blob may be either plain text or gzip-encoded.
	///
	/// If the glyph has no SVG document, the singleton empty blob is returned.
	///
	/// @face: hb_face_t to work upon
	/// @glyph: a svg glyph index
	///
	/// Return value: (transfer full): An hb_blob_t containing the SVG document of the glyph, if available
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_ot_color_glyph_reference_svg(hb_face_t* face, hb_codepoint_t glyph);

	/// Tests whether a face has PNG glyph images (either in `CBDT` or `sbix` tables).
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_color_has_png(hb_face_t* face);

	/// Fetches the PNG image for a glyph. This function takes a font object, not a face object,
	/// as input. To get an optimally sized PNG blob, the PPEM values must be set on the @font
	/// object. If PPEM is unset, the blob returned will be the largest PNG available.
	///
	/// If the glyph has no PNG image, the singleton empty blob is returned.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: a glyph index
	///
	/// Return value: (transfer full): An hb_blob_t containing the PNG image for the glyph, if available
	///
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_ot_color_glyph_reference_png(hb_font_t* font, hb_codepoint_t glyph);

	// ====================================================================
	// hb-ot-font.h
	// ====================================================================

	/// Sets the font functions to use when working with @font to
	/// the HarfBuzz's native implementation. This is the default
	/// for fonts newly created.
	///
	/// @font: hb_font_t to work upon
	///
	/// Since: 0.9.28
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_font_set_funcs(hb_font_t* font);

	// ====================================================================
	// hb-ot-layout.h
	// ====================================================================

	/// Converts an hb_script_t and an hb_language_t to script and language tags.
	///
	/// @script: an hb_script_t to convert.
	/// @language: (nullable): an hb_language_t to convert.
	/// @script_count: (inout) (optional): maximum number of script tags to retrieve (IN)
	///     and actual number of script tags retrieved (OUT)
	/// @script_tags: (out) (optional): array of size at least @script_count to store the
	///     script tag results
	/// @language_count: (inout) (optional): maximum number of language tags to retrieve
	///     (IN) and actual number of language tags retrieved (OUT)
	/// @language_tags: (out) (optional): array of size at least @language_count to store
	///     the language tag results
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_tags_from_script_and_language(hb_script_t script, hb_language_t language, c_uint* script_count, hb_tag_t* script_tags, c_uint* language_count, hb_tag_t* language_tags);

	/// Converts a script tag to an hb_script_t.
	///
	/// @tag: a script tag
	///
	/// Return value: The hb_script_t corresponding to @tag.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_script_t hb_ot_tag_to_script(hb_tag_t tag);

	/// Converts a language tag to an hb_language_t.
	///
	/// @tag: an language tag
	///
	/// Return value: (transfer none) (nullable):
	/// The hb_language_t corresponding to @tag.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_language_t hb_ot_tag_to_language(hb_tag_t tag);

	/// Converts a script tag and a language tag to an hb_script_t and an
	/// hb_language_t.
	///
	/// @script_tag: a script tag
	/// @language_tag: a language tag
	/// @script: (out) (optional): the hb_script_t corresponding to @script_tag.
	/// @language: (out) (optional): the hb_language_t corresponding to @script_tag and
	///     @language_tag.
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_tags_to_script_and_language(hb_tag_t script_tag, hb_tag_t language_tag, hb_script_t* script, hb_language_t* language);

	/// Tests whether a face has any glyph classes defined in its GDEF table.
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_has_glyph_classes(hb_face_t* face);

	/// Fetches the GDEF class of the requested glyph in the specified face.
	///
	/// @face: The hb_face_t to work on
	/// @glyph: The hb_codepoint_t code point to query
	///
	/// Return value: The hb_ot_layout_glyph_class_t glyph class of the given code
	/// point in the GDEF table of the face.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_layout_glyph_class_t hb_ot_layout_get_glyph_class(hb_face_t* face, hb_codepoint_t glyph);

	/// Retrieves the set of all glyphs from the face that belong to the requested
	/// glyph class in the face's GDEF table.
	///
	/// @face: The hb_face_t to work on
	/// @klass: The hb_ot_layout_glyph_class_t GDEF class to retrieve
	/// @glyphs: (out): The hb_set_t set of all glyphs belonging to the requested
	///     class.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_get_glyphs_in_class(hb_face_t* face, hb_ot_layout_glyph_class_t klass, hb_set_t* glyphs);

	/// Fetches a list of all attachment points for the specified glyph in the GDEF
	/// table of the face. The list returned will begin at the offset provided.
	///
	/// Useful if the client program wishes to cache the list.
	///
	/// @face: The hb_face_t to work on
	/// @glyph: The hb_codepoint_t code point to query
	/// @start_offset: offset of the first attachment point to retrieve
	/// @point_count: (inout) (nullable): Input = the maximum number of attachment points to return;
	///     Output = the actual number of attachment points returned (may be zero)
	/// @point_array: (out) (array length=point_count) (nullable): The array of attachment points found for the query
	///
	/// Return value: Total number of attachment points for @glyph.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_get_attach_points(hb_face_t* face, hb_codepoint_t glyph, c_uint start_offset, c_uint* point_count, c_uint* point_array);

	/// Fetches a list of the caret positions defined for a ligature glyph in the GDEF
	/// table of the font. The list returned will begin at the offset provided.
	///
	/// Note that a ligature that is formed from n characters will have n-1
	/// caret positions. The first character is not represented in the array,
	/// since its caret position is the glyph position.
	///
	/// The positions returned by this function are 'unshaped', and will have to
	/// be fixed up for kerning that may be applied to the ligature glyph.
	///
	/// @font: The hb_font_t to work on
	/// @direction: The hb_direction_t text direction to use
	/// @glyph: The hb_codepoint_t code point to query
	/// @start_offset: offset of the first caret position to retrieve
	/// @caret_count: (inout) (nullable): Input = the maximum number of caret positions to return;
	///     Output = the actual number of caret positions returned (may be zero)
	/// @caret_array: (out) (array length=caret_count) (nullable): The array of caret positions found for the query
	///
	/// Return value: Total number of ligature caret positions for @glyph.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_get_ligature_carets(hb_font_t* font, hb_direction_t direction, hb_codepoint_t glyph, c_uint start_offset, c_uint* caret_count, hb_position_t* caret_array);

	/// Fetches a list of all scripts enumerated in the specified face's GSUB table
	/// or GPOS table. The list returned will begin at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @start_offset: offset of the first script tag to retrieve
	/// @script_count: (inout) (nullable): Input = the maximum number of script tags to return;
	///     Output = the actual number of script tags returned (may be zero)
	/// @script_tags: (out) (array length=script_count) (nullable): The array of hb_tag_t script tags found for the query
	///
	/// Return value: Total number of script tags.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_table_get_script_tags(hb_face_t* face, hb_tag_t table_tag, c_uint start_offset, c_uint* script_count, hb_tag_t* script_tags);

	/// Fetches the index if a given script tag in the specified face's GSUB table
	/// or GPOS table.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_tag: hb_tag_t of the script tag requested
	/// @script_index: (out): The index of the requested script tag
	///
	/// Return value: `true` if the script is found, `false` otherwise
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_table_find_script(hb_face_t* face, hb_tag_t table_tag, hb_tag_t script_tag, out c_uint script_index);

	/// Selects an OpenType script for @table_tag from the @script_tags array.
	///
	/// If the table does not have any of the requested scripts, then `DFLT`,
	/// `dflt`, and `latn` tags are tried in that order. If the table still does not
	/// have any of these scripts, @script_index is set to
	/// HB_OT_LAYOUT_NO_SCRIPT_INDEX and @chosen_script is set to HB_TAG_NONE.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_count: Number of script tags in the array
	/// @script_tags: Array of hb_tag_t script tags
	/// @script_index: (out) (nullable): The index of the requested script
	/// @chosen_script: (out) (nullable): hb_tag_t of the requested script
	///
	/// Return value:
	/// `true` if one of the requested scripts is selected, `false` if a fallback
	/// script is selected or if no scripts are selected.
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_table_select_script(hb_face_t* face, hb_tag_t table_tag, c_uint script_count, hb_tag_t* script_tags, c_uint* script_index, hb_tag_t* chosen_script);

	/// Fetches a list of all feature tags in the given face's GSUB or GPOS table.
	/// Note that there might be duplicate feature tags, belonging to different
	/// script/language-system pairs of the table.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @start_offset: offset of the first feature tag to retrieve
	/// @feature_count: (inout) (nullable): Input = the maximum number of feature tags to return;
	///     Output = the actual number of feature tags returned (may be zero)
	/// @feature_tags: (out) (array length=feature_count) (nullable): Array of feature tags found in the table
	///
	/// Return value: Total number of feature tags.
	///
	/// Since: 0.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_table_get_feature_tags(hb_face_t* face, hb_tag_t table_tag, c_uint start_offset, c_uint* feature_count, hb_tag_t* feature_tags);

	/// Fetches a list of language tags in the given face's GSUB or GPOS table, underneath
	/// the specified script index. The list returned will begin at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @start_offset: offset of the first language tag to retrieve
	/// @language_count: (inout) (nullable): Input = the maximum number of language tags to return;
	///     Output = the actual number of language tags returned (may be zero)
	/// @language_tags: (out) (array length=language_count) (nullable): Array of language tags found in the table
	///
	/// Return value: Total number of language tags.
	///
	/// Since: 0.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_script_get_language_tags(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint start_offset, c_uint* language_count, hb_tag_t* language_tags);

	/// Fetches the index of the first language tag fom @language_tags that is present
	/// in the specified face's GSUB or GPOS table, underneath the specified script
	/// index.
	///
	/// If none of the given language tags is found, `false` is returned and
	/// @language_index is set to the default language index.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_count: The number of languages in the specified script
	/// @language_tags: The array of language tags
	/// @language_index: (out): The index of the requested language
	///
	/// Return value: `true` if one of the given language tags is found, `false` otherwise
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_script_select_language(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_count, hb_tag_t* language_tags, out c_uint language_index);

	/// Fetches the index of the first language tag fom @language_tags that is present
	/// in the specified face's GSUB or GPOS table, underneath the specified script
	/// index.
	///
	/// If none of the given language tags is found, `false` is returned and
	/// @language_index is set to HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX and
	/// @chosen_language is set to HB_TAG_NONE.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_count: The number of languages in the specified script
	/// @language_tags: The array of language tags
	/// @language_index: (out): The index of the chosen language
	/// @chosen_language: (out): hb_tag_t of the chosen language
	///
	/// Return value: `true` if one of the given language tags is found, `false` otherwise
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_script_select_language2(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_count, hb_tag_t* language_tags, out c_uint language_index, out hb_tag_t chosen_language);

	/// Fetches the index of a requested feature in the given face's GSUB or GPOS table,
	/// underneath the specified script and language.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_index: The index of the requested language tag
	/// @feature_index: (out): The index of the requested feature
	///
	/// Return value: `true` if the feature is found, `false` otherwise
	///
	/// Since: 0.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_language_get_required_feature_index(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_index, out c_uint feature_index);

	/// Fetches the tag of a requested feature index in the given face's GSUB or GPOS table,
	/// underneath the specified script and language.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_index: The index of the requested language tag
	/// @feature_index: (out): The index of the requested feature
	/// @feature_tag: (out): The hb_tag_t of the requested feature
	///
	/// Return value: `true` if the feature is found, `false` otherwise
	///
	/// Since: 0.9.30
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_language_get_required_feature(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_index, out c_uint feature_index, out hb_tag_t feature_tag);

	/// Fetches a list of all features in the specified face's GSUB table
	/// or GPOS table, underneath the specified script and language. The list
	/// returned will begin at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_index: The index of the requested language tag
	/// @start_offset: offset of the first feature tag to retrieve
	/// @feature_count: (inout) (nullable): Input = the maximum number of feature tags to return;
	///     Output: the actual number of feature tags returned (may be zero)
	/// @feature_indexes: (out) (array length=feature_count) (nullable): The array of feature indexes found for the query
	///
	/// Return value: Total number of features.
	///
	/// Since: 0.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_language_get_feature_indexes(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_index, c_uint start_offset, c_uint* feature_count, c_uint* feature_indexes);

	/// Fetches a list of all features in the specified face's GSUB table
	/// or GPOS table, underneath the specified script and language. The list
	/// returned will begin at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_index: The index of the requested language tag
	/// @start_offset: offset of the first feature tag to retrieve
	/// @feature_count: (inout) (nullable): Input = the maximum number of feature tags to return;
	///     Output = the actual number of feature tags returned (may be zero)
	/// @feature_tags: (out) (array length=feature_count) (nullable): The array of hb_tag_t feature tags found for the query
	///
	/// Return value: Total number of feature tags.
	///
	/// Since: 0.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_language_get_feature_tags(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_index, c_uint start_offset, c_uint* feature_count, hb_tag_t* feature_tags);

	/// Fetches the index of a given feature tag in the specified face's GSUB table
	/// or GPOS table, underneath the specified script and language.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_index: The index of the requested language tag
	/// @feature_tag: hb_tag_t of the feature tag requested
	/// @feature_index: (out): The index of the requested feature
	///
	/// Return value: `true` if the feature is found, `false` otherwise
	///
	/// Since: 0.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_language_find_feature(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_index, hb_tag_t feature_tag, out c_uint feature_index);

	/// Fetches a list of all lookups enumerated for the specified feature, in
	/// the specified face's GSUB table or GPOS table. The list returned will
	/// begin at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @feature_index: The index of the requested feature
	/// @start_offset: offset of the first lookup to retrieve
	/// @lookup_count: (inout) (nullable): Input = the maximum number of lookups to return;
	///     Output = the actual number of lookups returned (may be zero)
	/// @lookup_indexes: (out) (array length=lookup_count) (nullable): The array of lookup indexes found for the query
	///
	/// Return value: Total number of lookups.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_feature_get_lookups(hb_face_t* face, hb_tag_t table_tag, c_uint feature_index, c_uint start_offset, c_uint* lookup_count, c_uint* lookup_indexes);

	/// Fetches the total number of lookups enumerated in the specified
	/// face's GSUB table or GPOS table.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	///
	/// Return value: Total number of lookups.
	///
	/// Since: 0.9.22
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_table_get_lookup_count(hb_face_t* face, hb_tag_t table_tag);

	/// Fetches a list of all feature indexes in the specified face's GSUB table
	/// or GPOS table, underneath the specified scripts, languages, and features.
	/// If no list of scripts is provided, all scripts will be queried. If no list
	/// of languages is provided, all languages will be queried. If no list of
	/// features is provided, all features will be queried.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @scripts: (nullable) (array zero-terminated=1): The array of scripts to collect features for,
	///     terminated by HB_TAG_NONE
	/// @languages: (nullable) (array zero-terminated=1): The array of languages to collect features for,
	///     terminated by HB_TAG_NONE
	/// @features: (nullable) (array zero-terminated=1): The array of features to collect,
	///     terminated by HB_TAG_NONE
	/// @feature_indexes: (out): The set of feature indexes found for the query
	///
	/// Since: 1.8.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_collect_features(hb_face_t* face, hb_tag_t table_tag, hb_tag_t* scripts, hb_tag_t* languages, hb_tag_t* features, hb_set_t* feature_indexes);

	/// Fetches the mapping from feature tags to feature indexes for
	/// the specified script and language.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @script_index: The index of the requested script tag
	/// @language_index: The index of the requested language tag
	/// @feature_map: (out): The map of feature tag to feature index.
	///
	/// Since: 8.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_collect_features_map(hb_face_t* face, hb_tag_t table_tag, c_uint script_index, c_uint language_index, hb_map_t* feature_map);

	/// Fetches a list of all feature-lookup indexes in the specified face's GSUB
	/// table or GPOS table, underneath the specified scripts, languages, and
	/// features. If no list of scripts is provided, all scripts will be queried.
	/// If no list of languages is provided, all languages will be queried. If no
	/// list of features is provided, all features will be queried.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @scripts: (nullable) (array zero-terminated=1): The array of scripts to collect lookups for,
	///     terminated by HB_TAG_NONE
	/// @languages: (nullable) (array zero-terminated=1): The array of languages to collect lookups for,
	///     terminated by HB_TAG_NONE
	/// @features: (nullable) (array zero-terminated=1): The array of features to collect lookups for,
	///     terminated by HB_TAG_NONE
	/// @lookup_indexes: (out): The array of lookup indexes found for the query
	///
	/// Since: 0.9.8
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_collect_lookups(hb_face_t* face, hb_tag_t table_tag, hb_tag_t* scripts, hb_tag_t* languages, hb_tag_t* features, hb_set_t* lookup_indexes);

	/// Fetches a list of all glyphs affected by the specified lookup in the
	/// specified face's GSUB table or GPOS table.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @lookup_index: The index of the feature lookup to query
	/// @glyphs_before: (out) (nullable): Array of glyphs preceding the substitution range
	/// @glyphs_input: (out) (nullable): Array of input glyphs that would be substituted by the lookup
	/// @glyphs_after: (out) (nullable): Array of glyphs following the substitution range
	/// @glyphs_output: (out) (nullable): Array of glyphs that would be the substituted output of the lookup
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_lookup_collect_glyphs(hb_face_t* face, hb_tag_t table_tag, c_uint lookup_index, hb_set_t* glyphs_before, hb_set_t* glyphs_input, hb_set_t* glyphs_after, hb_set_t* glyphs_output);

	/// Fetches a list of feature variations in the specified face's GSUB table
	/// or GPOS table, at the specified variation coordinates.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @coords: The variation coordinates to query
	/// @num_coords: The number of variation coordinates
	/// @variations_index: (out): The array of feature variations found for the query
	///
	/// Return value: `true` if feature variations were found, `false` otherwise.
	///
	/// Since: 1.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_table_find_feature_variations(hb_face_t* face, hb_tag_t table_tag, c_int* coords, c_uint num_coords, out c_uint variations_index);

	/// Fetches a list of all lookups enumerated for the specified feature, in
	/// the specified face's GSUB table or GPOS table, enabled at the specified
	/// variations index. The list returned will begin at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: HB_OT_TAG_GSUB or HB_OT_TAG_GPOS
	/// @feature_index: The index of the feature to query
	/// @variations_index: The index of the feature variation to query
	/// @start_offset: offset of the first lookup to retrieve
	/// @lookup_count: (inout) (nullable): Input = the maximum number of lookups to return;
	///     Output = the actual number of lookups returned (may be zero)
	/// @lookup_indexes: (out) (array length=lookup_count) (nullable): The array of lookups found for the query
	///
	/// Return value: Total number of lookups.
	///
	/// Since: 1.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_feature_with_variations_get_lookups(hb_face_t* face, hb_tag_t table_tag, c_uint feature_index, c_uint variations_index, c_uint start_offset, c_uint* lookup_count, c_uint* lookup_indexes);

	/// Tests whether the specified face includes any GSUB substitutions.
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_has_substitution(hb_face_t* face);

	/// Fetches alternates of a glyph from a given GSUB lookup index. Note that for one-to-one GSUB
	/// glyph substitutions, this function fetches the substituted glyph.
	///
	/// @face: a face.
	/// @lookup_index: index of the feature lookup to query.
	/// @glyph: a glyph id.
	/// @start_offset: starting offset.
	/// @alternate_count: (inout) (nullable): Input = the maximum number of alternate glyphs to return;
	///     Output = the actual number of alternate glyphs returned (may be zero).
	/// @alternate_glyphs: (out caller-allocates) (array length=alternate_count) (nullable): A glyphs buffer.
	///     Alternate glyphs associated with the glyph id.
	///
	/// Return value: Total number of alternates found in the specific lookup index for the given glyph id.
	///
	/// Since: 2.6.8
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_lookup_get_glyph_alternates(hb_face_t* face, c_uint lookup_index, hb_codepoint_t glyph, c_uint start_offset, c_uint* alternate_count, hb_codepoint_t* alternate_glyphs);

	/// Collects alternates of glyphs from a given GSUB lookup index.
	///
	/// For one-to-one GSUB glyph substitutions, this function collects the
	/// substituted glyph.
	///
	/// For lookups that assign multiple alternates to a glyph, all alternate glyphs are collected.
	///
	/// For other lookup types, nothing is performed and `false` is returned.
	///
	/// The `alternate_count` mapping will contain the number of alternates for each glyph id.
	/// Upon entry, this mapping should contain the glyph ids as keys, and the number of alternates
	/// currently known for each glyph id as values.
	///
	/// The `alternate_glyphs` mapping will contain the alternate glyph ids for each glyph id.
	/// The mapping is encoded in the following way, upon entry and after processing:
	/// If G is the glyph id, and A0, A1, ..., A(n-1) are the alternate glyph ids,
	/// the mapping will contain the following entries: (G + (i << 24)) -> A(i)
	/// for i = 0, 1, ..., n-1 where n is the number of alternates for G as per `alternate_count`.
	///
	/// @face: a face.
	/// @lookup_index: index of the feature lookup to query.
	/// @alternate_count: (inout): mapping from glyph index to number of alternates for that glyph.
	/// @alternate_glyphs: (inout): mapping from encoded glyph index and alternate index, to alternate glyph ids.
	///
	/// Return value: `true` if alternates were collected, `false` otherwise.
	/// Since: 12.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_lookup_collect_glyph_alternates(hb_face_t* face, c_uint lookup_index, hb_map_t* alternate_count, hb_map_t* alternate_glyphs);

	/// Tests whether a specified lookup in the specified face would
	/// trigger a substitution on the given glyph sequence.
	///
	/// @face: hb_face_t to work upon
	/// @lookup_index: The index of the lookup to query
	/// @glyphs: The sequence of glyphs to query for substitution
	/// @glyphs_length: The length of the glyph sequence
	/// @zero_context: hb_bool_t indicating whether pre-/post-context are disallowed
	///     in substitutions
	///
	/// Return value: `true` if a substitution would be triggered, `false` otherwise
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_lookup_would_substitute(hb_face_t* face, c_uint lookup_index, hb_codepoint_t* glyphs, c_uint glyphs_length, hb_bool_t zero_context);

	/// Compute the transitive closure of glyphs needed for a
	/// specified lookup.
	///
	/// @face: hb_face_t to work upon
	/// @lookup_index: index of the feature lookup to query
	/// @glyphs: (out): Array of glyphs comprising the transitive closure of the lookup
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_lookup_substitute_closure(hb_face_t* face, c_uint lookup_index, hb_set_t* glyphs);

	/// Compute the transitive closure of glyphs needed for all of the
	/// provided lookups.
	///
	/// @face: hb_face_t to work upon
	/// @lookups: The set of lookups to query
	/// @glyphs: (out): Array of glyphs comprising the transitive closure of the lookups
	///
	/// Since: 1.8.1
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_lookups_substitute_closure(hb_face_t* face, hb_set_t* lookups, hb_set_t* glyphs);

	/// Tests whether the specified face includes any GPOS positioning.
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if the face has GPOS data, `false` otherwise
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_has_positioning(hb_face_t* face);

	/// Fetches optical-size feature data (i.e., the `size` feature from GPOS). Note that
	/// the subfamily_id and the subfamily name string (accessible via the subfamily_name_id)
	/// as used here are defined as pertaining only to fonts within a font family that differ
	/// specifically in their respective size ranges; other ways to differentiate fonts within
	/// a subfamily are not covered by the `size` feature.
	///
	/// For more information on this distinction, see the [`size` feature documentation](
	/// https://docs.microsoft.com/en-us/typography/opentype/spec/features_pttag-size).
	///
	/// @face: hb_face_t to work upon
	/// @design_size: (out): The design size of the face
	/// @subfamily_id: (out): The identifier of the face within the font subfamily
	/// @subfamily_name_id: (out): The ‘name’ table name ID of the face within the font subfamily
	/// @range_start: (out): The minimum size of the recommended size range for the face
	/// @range_end: (out): The maximum size of the recommended size range for the face
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_get_size_params(hb_face_t* face, out c_uint design_size, out c_uint subfamily_id, out hb_ot_name_id_t subfamily_name_id, out c_uint range_start, out c_uint range_end);

	/// Fetches the optical bound of a glyph positioned at the margin of text.
	/// The direction identifies which edge of the glyph to query.
	///
	/// @font: a font.
	/// @lookup_index: index of the feature lookup to query.
	/// @direction: edge of the glyph to query.
	/// @glyph: a glyph id.
	///
	/// Return value: Adjustment value. Negative values mean the glyph will stick out of the margin.
	///
	/// Since: 5.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_layout_lookup_get_optical_bound(hb_font_t* font, c_uint lookup_index, hb_direction_t direction, hb_codepoint_t glyph);

	/// Fetches name indices from feature parameters for "Stylistic Set" ('ssXX') or
	/// "Character Variant" ('cvXX') features.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: table tag to query, "GSUB" or "GPOS".
	/// @feature_index: index of feature to query.
	/// @label_id: (out) (nullable): The ‘name’ table name ID that specifies a string
	///     for a user-interface label for this feature.
	/// @tooltip_id: (out) (nullable): The ‘name’ table name ID that specifies a string
	///     that an application can use for tooltip text for this
	///     feature.
	/// @sample_id: (out) (nullable): The ‘name’ table name ID that specifies sample text
	///     that illustrates the effect of this feature.
	/// @num_named_parameters: (out) (nullable):  Number of named parameters.
	/// @first_param_id: (out) (nullable): The first ‘name’ table name ID used to specify
	///     strings for user-interface labels for the feature
	///     parameters. (Must be zero if numParameters is zero.)
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_feature_get_name_ids(hb_face_t* face, hb_tag_t table_tag, c_uint feature_index, hb_ot_name_id_t* label_id, hb_ot_name_id_t* tooltip_id, hb_ot_name_id_t* sample_id, c_uint* num_named_parameters, hb_ot_name_id_t* first_param_id);

	/// Fetches a list of the characters defined as having a variant under the specified
	/// "Character Variant" ("cvXX") feature tag.
	///
	/// @face: hb_face_t to work upon
	/// @table_tag: table tag to query, "GSUB" or "GPOS".
	/// @feature_index: index of feature to query.
	/// @start_offset: offset of the first character to retrieve
	/// @char_count: (inout) (nullable): Input = the maximum number of characters to return;
	///     Output = the actual number of characters returned (may be zero)
	/// @characters: (out caller-allocates) (array length=char_count) (nullable): A buffer pointer.
	///     The Unicode codepoints of the characters for which this feature provides
	///     glyph variants.
	///
	/// Return value: Number of total sample characters in the cvXX feature.
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_layout_feature_get_characters(hb_face_t* face, hb_tag_t table_tag, c_uint feature_index, c_uint start_offset, c_uint* char_count, hb_codepoint_t* characters);

	/// Fetches script/language-specific font extents.  These values are
	/// looked up in the `BASE` table's `MinMax` records.
	///
	/// If no such extents are found, the default extents for the font are
	/// fetched. As such, the return value of this function can for the
	/// most part be ignored.  Note that the per-script/language extents
	/// do not have a line-gap value, and the line-gap is set to zero in
	/// that case.
	///
	/// @font: a font
	/// @direction: text direction.
	/// @script_tag:  script tag.
	/// @language_tag: language tag.
	/// @extents: (out) (nullable): font extents if found.
	///
	/// Return value: `true` if found script/language-specific font extents.
	///
	/// Since: 8.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_get_font_extents(hb_font_t* font, hb_direction_t direction, hb_tag_t script_tag, hb_tag_t language_tag, hb_font_extents_t* extents);

	/// Fetches script/language-specific font extents.  These values are
	/// looked up in the `BASE` table's `MinMax` records.
	///
	/// If no such extents are found, the default extents for the font are
	/// fetched. As such, the return value of this function can for the
	/// most part be ignored.  Note that the per-script/language extents
	/// do not have a line-gap value, and the line-gap is set to zero in
	/// that case.
	///
	/// This function is like hb_ot_layout_get_font_extents() but takes
	/// hb_script_t and hb_language_t instead of OpenType hb_tag_t.
	///
	/// @font: a font
	/// @direction: text direction.
	/// @script:  script.
	/// @language: (nullable): language.
	/// @extents: (out) (nullable): font extents if found.
	///
	/// Return value: `true` if found script/language-specific font extents.
	///
	/// Since: 8.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_get_font_extents2(hb_font_t* font, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_font_extents_t* extents);

	/// Fetches the dominant horizontal baseline tag used by @script.
	///
	/// @script: a script tag.
	///
	/// Return value: dominant baseline tag for the @script.
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_layout_baseline_tag_t hb_ot_layout_get_horizontal_baseline_tag_for_script(hb_script_t script);

	/// Fetches a baseline value from the font.
	///
	/// @font: a font
	/// @baseline_tag: a baseline tag
	/// @direction: text direction.
	/// @script_tag:  script tag.
	/// @language_tag: language tag, currently unused.
	/// @coord: (out) (nullable): baseline value if found.
	///
	/// Return value: `true` if found baseline value in the font.
	///
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_get_baseline(hb_font_t* font, hb_ot_layout_baseline_tag_t baseline_tag, hb_direction_t direction, hb_tag_t script_tag, hb_tag_t language_tag, hb_position_t* coord);

	/// Fetches a baseline value from the font.
	///
	/// This function is like hb_ot_layout_get_baseline() but takes
	/// hb_script_t and hb_language_t instead of OpenType hb_tag_t.
	///
	/// @font: a font
	/// @baseline_tag: a baseline tag
	/// @direction: text direction.
	/// @script:  script.
	/// @language: (nullable): language, currently unused.
	/// @coord: (out) (nullable): baseline value if found.
	///
	/// Return value: `true` if found baseline value in the font.
	///
	/// Since: 8.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_layout_get_baseline2(hb_font_t* font, hb_ot_layout_baseline_tag_t baseline_tag, hb_direction_t direction, hb_script_t script, hb_language_t language, hb_position_t* coord);

	/// Fetches a baseline value from the font, and synthesizes
	/// it if the font does not have it.
	///
	/// @font: a font
	/// @baseline_tag: a baseline tag
	/// @direction: text direction.
	/// @script_tag:  script tag.
	/// @language_tag: language tag, currently unused.
	/// @coord: (out): baseline value if found.
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_get_baseline_with_fallback(hb_font_t* font, hb_ot_layout_baseline_tag_t baseline_tag, hb_direction_t direction, hb_tag_t script_tag, hb_tag_t language_tag, out hb_position_t coord);

	/// Fetches a baseline value from the font, and synthesizes
	/// it if the font does not have it.
	///
	/// This function is like hb_ot_layout_get_baseline_with_fallback() but takes
	/// hb_script_t and hb_language_t instead of OpenType hb_tag_t.
	///
	/// @font: a font
	/// @baseline_tag: a baseline tag
	/// @direction: text direction.
	/// @script:  script.
	/// @language: (nullable): language, currently unused.
	/// @coord: (out): baseline value if found.
	///
	/// Since: 8.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_layout_get_baseline_with_fallback2(hb_font_t* font, hb_ot_layout_baseline_tag_t baseline_tag, hb_direction_t direction, hb_script_t script, hb_language_t language, out hb_position_t coord);

	// ====================================================================
	// hb-ot-math.h
	// ====================================================================

	/// Tests whether a face has a `MATH` table.
	///
	/// @face: hb_face_t to test
	///
	/// Return value: `true` if the table is found, `false` otherwise
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_math_has_data(hb_face_t* face);

	/// Fetches the specified math constant. For most constants, the value returned
	/// is an hb_position_t.
	///
	/// However, if the requested constant is HB_OT_MATH_CONSTANT_SCRIPT_PERCENT_SCALE_DOWN,
	/// HB_OT_MATH_CONSTANT_SCRIPT_SCRIPT_PERCENT_SCALE_DOWN or
	/// HB_OT_MATH_CONSTANT_RADICAL_DEGREE_BOTTOM_RAISE_PERCENT, then the return value is
	/// an integer between 0 and 100 representing that percentage.
	///
	/// @font: hb_font_t to work upon
	/// @constant: hb_ot_math_constant_t the constant to retrieve
	///
	/// Return value: the requested constant or zero
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_math_get_constant(hb_font_t* font, hb_ot_math_constant_t constant);

	/// Fetches an italics-correction value (if one exists) for the specified
	/// glyph index.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph index from which to retrieve the value
	///
	/// Return value: the italics correction of the glyph or zero
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_math_get_glyph_italics_correction(hb_font_t* font, hb_codepoint_t glyph);

	/// Fetches a top-accent-attachment value (if one exists) for the specified
	/// glyph index.
	///
	/// For any glyph that does not have a top-accent-attachment value - that is,
	/// a glyph not covered by the `MathTopAccentAttachment` table (or, when
	/// @font has no `MathTopAccentAttachment` table or no `MATH` table, any
	/// glyph) - the function synthesizes a value, returning the position at
	/// one-half the glyph's advance width.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph index from which to retrieve the value
	///
	/// Return value: the top accent attachment of the glyph or 0.5 * the advance
	///               width of @glyph
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_math_get_glyph_top_accent_attachment(hb_font_t* font, hb_codepoint_t glyph);

	/// Tests whether the given glyph index is an extended shape in the face.
	///
	/// @face: hb_face_t to work upon
	/// @glyph: The glyph index to test
	///
	/// Return value: `true` if the glyph is an extended shape, `false` otherwise
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_math_is_glyph_extended_shape(hb_face_t* face, hb_codepoint_t glyph);

	/// Fetches the math kerning (cut-ins) value for the specified font, glyph index, and
	/// @kern.
	///
	/// If the MathKern table is found, the function examines it to find a height
	/// value that is greater or equal to @correction_height. If such a height
	/// value is found, corresponding kerning value from the table is returned. If
	/// no such height value is found, the last kerning value is returned.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph index from which to retrieve the value
	/// @kern: The hb_ot_math_kern_t from which to retrieve the value
	/// @correction_height: the correction height to use to determine the kerning.
	///
	/// Return value: requested kerning value or zero
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_math_get_glyph_kerning(hb_font_t* font, hb_codepoint_t glyph, hb_ot_math_kern_t kern, hb_position_t correction_height);

	/// Fetches the raw MathKern (cut-in) data for the specified font, glyph index,
	/// and @kern. The corresponding list of kern values and correction heights is
	/// returned as a list of hb_ot_math_kern_entry_t structs.
	///
	/// See also hb_ot_math_get_glyph_kerning, which handles selecting the
	/// appropriate kern value for a given correction height.
	///
	/// <note>For a glyph with @n defined kern values (where @n > 0), there are only
	/// @n−1 defined correction heights, as each correction height defines a boundary
	/// past which the next kern value should be selected. Therefore, only the
	/// hb_ot_math_kern_entry_t.kern_value of the uppermost hb_ot_math_kern_entry_t
	/// actually comes from the font; its corresponding
	/// hb_ot_math_kern_entry_t.max_correction_height is always set to
	/// <code>INT32_MAX</code>.</note>
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph index from which to retrieve the kernings
	/// @kern: The hb_ot_math_kern_t from which to retrieve the kernings
	/// @start_offset: offset of the first kern entry to retrieve
	/// @entries_count: (inout) (optional): Input = the maximum number of kern entries to return;
	///     Output = the actual number of kern entries returned
	/// @kern_entries: (out caller-allocates) (array length=entries_count) (nullable): array of kern entries returned
	///
	/// Return value: the total number of kern values available or zero
	///
	/// Since: 3.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_math_get_glyph_kernings(hb_font_t* font, hb_codepoint_t glyph, hb_ot_math_kern_t kern, c_uint start_offset, c_uint* entries_count, hb_ot_math_kern_entry_t* kern_entries);

	/// Fetches the MathGlyphConstruction for the specified font, glyph index, and
	/// direction. The corresponding list of size variants is returned as a list of
	/// hb_ot_math_glyph_variant_t structs.
	///
	/// <note>The @direction parameter is only used to select between horizontal
	/// or vertical directions for the construction. Even though all hb_direction_t
	/// values are accepted, only the result of HB_DIRECTION_IS_HORIZONTAL is
	/// considered.</note>
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The index of the glyph to stretch
	/// @direction: The direction of the stretching (horizontal or vertical)
	/// @start_offset: offset of the first variant to retrieve
	/// @variants_count: (inout): Input = the maximum number of variants to return;
	///     Output = the actual number of variants returned
	/// @variants: (out) (array length=variants_count) (nullable): array of variants returned
	///
	/// Return value: the total number of size variants available or zero
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_math_get_glyph_variants(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, c_uint start_offset, c_uint* variants_count, hb_ot_math_glyph_variant_t* variants);

	/// Fetches the MathVariants table for the specified font and returns the
	/// minimum overlap of connecting glyphs that are required to draw a glyph
	/// assembly in the specified direction.
	///
	/// <note>The @direction parameter is only used to select between horizontal
	/// or vertical directions for the construction. Even though all hb_direction_t
	/// values are accepted, only the result of HB_DIRECTION_IS_HORIZONTAL is
	/// considered.</note>
	///
	/// @font: hb_font_t to work upon
	/// @direction: direction of the stretching (horizontal or vertical)
	///
	/// Return value: requested minimum connector overlap or zero
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_math_get_min_connector_overlap(hb_font_t* font, hb_direction_t direction);

	/// Fetches the GlyphAssembly for the specified font, glyph index, and direction.
	/// Returned are a list of hb_ot_math_glyph_part_t glyph parts that can be
	/// used to draw the glyph and an italics-correction value (if one is defined
	/// in the font).
	///
	/// <note>The @direction parameter is only used to select between horizontal
	/// or vertical directions for the construction. Even though all hb_direction_t
	/// values are accepted, only the result of HB_DIRECTION_IS_HORIZONTAL is
	/// considered.</note>
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The index of the glyph to stretch
	/// @direction: direction of the stretching (horizontal or vertical)
	/// @start_offset: offset of the first glyph part to retrieve
	/// @parts_count: (inout): Input = maximum number of glyph parts to return;
	///     Output = actual number of parts returned
	/// @parts: (out) (array length=parts_count) (nullable): the glyph parts returned
	/// @italics_correction: (out): italics correction of the glyph assembly
	///
	/// Return value: the total number of parts in the glyph assembly
	///
	/// Since: 1.3.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_math_get_glyph_assembly(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, c_uint start_offset, c_uint* parts_count, hb_ot_math_glyph_part_t* parts, out hb_position_t italics_correction);

	// ====================================================================
	// hb-ot-meta.h
	// ====================================================================

	/// Fetches all available feature types.
	///
	/// @face: a face object
	/// @start_offset: iteration's start offset
	/// @entries_count: (inout) (optional): buffer size as input, filled size as output
	/// @entries: (out caller-allocates) (array length=entries_count) (nullable): entries tags buffer
	///
	/// Return value: Number of all available feature types.
	///
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_meta_get_entry_tags(hb_face_t* face, c_uint start_offset, c_uint* entries_count, hb_ot_meta_tag_t* entries);

	/// It fetches metadata entry of a given tag from a font.
	///
	/// @face: a hb_face_t object.
	/// @meta_tag: tag of metadata you like to have.
	///
	/// Returns: (transfer full): A blob containing the blob.
	///
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_ot_meta_reference_entry(hb_face_t* face, hb_ot_meta_tag_t meta_tag);

	// ====================================================================
	// hb-ot-metrics.h
	// ====================================================================

	/// Fetches metrics value corresponding to @metrics_tag from @font.
	///
	/// @font: an hb_font_t object.
	/// @metrics_tag: tag of metrics value you like to fetch.
	/// @position: (out) (optional): result of metrics value from the font.
	///
	/// Returns: Whether found the requested metrics in the font.
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_metrics_get_position(hb_font_t* font, hb_ot_metrics_tag_t metrics_tag, hb_position_t* position);

	/// Fetches metrics value corresponding to @metrics_tag from @font,
	/// and synthesizes a value if it the value is missing in the font.
	///
	/// @font: an hb_font_t object.
	/// @metrics_tag: tag of metrics value you like to fetch.
	/// @position: (out) (optional): result of metrics value from the font.
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_metrics_get_position_with_fallback(hb_font_t* font, hb_ot_metrics_tag_t metrics_tag, hb_position_t* position);

	/// Fetches metrics value corresponding to @metrics_tag from @font with the
	/// current font variation settings applied.
	///
	/// @font: an hb_font_t object.
	/// @metrics_tag: tag of metrics value you like to fetch.
	///
	/// Returns: The requested metric value.
	///
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern float hb_ot_metrics_get_variation(hb_font_t* font, hb_ot_metrics_tag_t metrics_tag);

	/// Fetches horizontal metrics value corresponding to @metrics_tag from @font
	/// with the current font variation settings applied.
	///
	/// @font: an hb_font_t object.
	/// @metrics_tag: tag of metrics value you like to fetch.
	///
	/// Returns: The requested metric value.
	///
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_metrics_get_x_variation(hb_font_t* font, hb_ot_metrics_tag_t metrics_tag);

	/// Fetches vertical metrics value corresponding to @metrics_tag from @font with
	/// the current font variation settings applied.
	///
	/// @font: an hb_font_t object.
	/// @metrics_tag: tag of metrics value you like to fetch.
	///
	/// Returns: The requested metric value.
	///
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_ot_metrics_get_y_variation(hb_font_t* font, hb_ot_metrics_tag_t metrics_tag);

	// ====================================================================
	// hb-ot-name.h
	// ====================================================================

	/// Enumerates all available name IDs and language combinations. Returned
	/// array is owned by the @face and should not be modified.  It can be
	/// used as long as @face is alive.
	///
	/// @face: font face.
	/// @num_entries: (out) (optional): number of returned entries.
	///
	/// Returns: (transfer none) (array length=num_entries): Array of available name entries.
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_name_entry_t* hb_ot_name_list_names(hb_face_t* face, c_uint* num_entries);

	/// Fetches a font name from the OpenType 'name' table.
	/// If @language is HB_LANGUAGE_INVALID, English ("en") is assumed.
	/// Returns string in UTF-8 encoding. A NUL terminator is always written
	/// for convenience, and isn't included in the output @text_size.
	///
	/// @face: font face.
	/// @name_id: OpenType name identifier to fetch.
	/// @language: language to fetch the name for.
	/// @text_size: (inout) (optional): input size of @text buffer, and output size of
	///     text written to buffer.
	/// @text: (out caller-allocates) (array length=text_size): buffer to write fetched name into.
	///
	/// Returns: full length of the requested string, or 0 if not found.
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_name_get_utf8(hb_face_t* face, hb_ot_name_id_t name_id, hb_language_t language, c_uint* text_size, c_char* text);

	/// Fetches a font name from the OpenType 'name' table.
	/// If @language is HB_LANGUAGE_INVALID, English ("en") is assumed.
	/// Returns string in UTF-16 encoding. A NUL terminator is always written
	/// for convenience, and isn't included in the output @text_size.
	///
	/// @face: font face.
	/// @name_id: OpenType name identifier to fetch.
	/// @language: language to fetch the name for.
	/// @text_size: (inout) (optional): input size of @text buffer, and output size of
	///     text written to buffer.
	/// @text: (out caller-allocates) (array length=text_size): buffer to write fetched name into.
	///
	/// Returns: full length of the requested string, or 0 if not found.
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_name_get_utf16(hb_face_t* face, hb_ot_name_id_t name_id, hb_language_t language, c_uint* text_size, uint16* text);

	/// Fetches a font name from the OpenType 'name' table.
	/// If @language is HB_LANGUAGE_INVALID, English ("en") is assumed.
	/// Returns string in UTF-32 encoding. A NUL terminator is always written
	/// for convenience, and isn't included in the output @text_size.
	///
	/// @face: font face.
	/// @name_id: OpenType name identifier to fetch.
	/// @language: language to fetch the name for.
	/// @text_size: (inout) (optional): input size of @text buffer, and output size of
	///     text written to buffer.
	/// @text: (out caller-allocates) (array length=text_size): buffer to write fetched name into.
	///
	/// Returns: full length of the requested string, or 0 if not found.
	/// Since: 2.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_name_get_utf32(hb_face_t* face, hb_ot_name_id_t name_id, hb_language_t language, c_uint* text_size, uint32* text);

	// ====================================================================
	// hb-ot-shape.h
	// ====================================================================

	/// Computes the transitive closure of glyphs needed for a specified
	/// input buffer under the given font and feature list. The closure is
	/// computed as a set, not as a list.
	///
	/// @font: hb_font_t to work upon
	/// @buffer: The input buffer to compute from
	/// @features: (array length=num_features): The features enabled on the buffer
	/// @num_features: The number of features enabled on the buffer
	/// @glyphs: (out): The hb_set_t set of glyphs comprising the transitive closure of the query
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_shape_glyphs_closure(hb_font_t* font, hb_buffer_t* buffer, hb_feature_t* features, c_uint num_features, hb_set_t* glyphs);

	/// Computes the complete set of GSUB or GPOS lookups that are applicable
	/// under a given @shape_plan.
	///
	/// @shape_plan: hb_shape_plan_t to query
	/// @table_tag: GSUB or GPOS
	/// @lookup_indexes: (out): The hb_set_t set of lookups returned
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_shape_plan_collect_lookups(hb_shape_plan_t* shape_plan, hb_tag_t table_tag, hb_set_t* lookup_indexes);

	/// Fetches the list of OpenType feature tags enabled for a shaping plan, if possible.
	///
	/// @shape_plan: A shaping plan
	/// @start_offset: The index of first feature to retrieve
	/// @tag_count: (inout): Input = the maximum number of features to return;
	///     Output = the actual number of features returned (may be zero)
	/// @tags: (out) (array length=tag_count): The array of enabled feature
	///
	/// Return value: Total number of feature tagss.
	///
	/// Since: 10.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_shape_plan_get_feature_tags(hb_shape_plan_t* shape_plan, c_uint start_offset, c_uint* tag_count, hb_tag_t* tags);

	/// Returns the serial number of the current internal buffer format.
	/// See HB_OT_SHAPE_BUFFER_FORMAT_SERIAL for more information.
	///
	/// Return value: The current buffer-format serial number.
	///
	/// Since: 13.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_shape_get_buffer_format_serial();

	// ====================================================================
	// hb-ot-var.h
	// ====================================================================

	/// Tests whether a face includes any OpenType variation data in the `fvar` table.
	///
	/// @face: The hb_face_t to work on
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_var_has_data(hb_face_t* face);

	/// Fetches the number of OpenType variation axes included in the face.
	///
	/// @face: The hb_face_t to work on
	///
	/// Return value: the number of variation axes defined
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_var_get_axis_count(hb_face_t* face);

	/// Fetches a list of all variation axes in the specified face. The list returned will begin
	/// at the offset provided.
	///
	/// @face: hb_face_t to work upon
	/// @start_offset: offset of the first lookup to retrieve
	/// @axes_count: (inout) (optional): Input = the maximum number of variation axes to return;
	///     Output = the actual number of variation axes returned (may be zero)
	/// @axes_array: (out caller-allocates) (array length=axes_count) (nullable): The array of variation axes found
	///
	/// Return value: the number of variation axes in the face
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_var_get_axis_infos(hb_face_t* face, c_uint start_offset, c_uint* axes_count, hb_ot_var_axis_info_t* axes_array);

	/// Fetches the variation-axis information corresponding to the specified axis tag
	/// in the specified face.
	///
	/// @face: hb_face_t to work upon
	/// @axis_tag: The hb_tag_t of the variation axis to query
	/// @axis_info: (out): The hb_ot_var_axis_info_t of the axis tag queried
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_ot_var_find_axis_info(hb_face_t* face, hb_tag_t axis_tag, out hb_ot_var_axis_info_t axis_info);

	/// Fetches the number of named instances included in the face.
	///
	/// @face: The hb_face_t to work on
	///
	/// Return value: the number of named instances defined
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_var_get_named_instance_count(hb_face_t* face);

	/// Fetches the `name` table Name ID that provides display names for
	/// the "Subfamily name" defined for the given named instance in the face.
	///
	/// @face: The hb_face_t to work on
	/// @instance_index: The index of the named instance to query
	///
	/// Return value: the Name ID found for the Subfamily name
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_name_id_t hb_ot_var_named_instance_get_subfamily_name_id(hb_face_t* face, c_uint instance_index);

	/// Fetches the `name` table Name ID that provides display names for
	/// the "PostScript name" defined for the given named instance in the face.
	///
	/// @face: The hb_face_t to work on
	/// @instance_index: The index of the named instance to query
	///
	/// Return value: the Name ID found for the PostScript name
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_name_id_t hb_ot_var_named_instance_get_postscript_name_id(hb_face_t* face, c_uint instance_index);

	/// Fetches the design-space coordinates corresponding to the given
	/// named instance in the face.
	///
	/// @face: The hb_face_t to work on
	/// @instance_index: The index of the named instance to query
	/// @coords_length: (inout) (optional): Input = the maximum number of coordinates to return;
	///     Output = the actual number of coordinates returned (may be zero)
	/// @coords: (out) (array length=coords_length) (nullable): The array of coordinates found for the query
	///
	/// Return value: the number of variation axes in the face
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_ot_var_named_instance_get_design_coords(hb_face_t* face, c_uint instance_index, c_uint* coords_length, float* coords);

	/// Normalizes all of the coordinates in the given list of variation axes.
	///
	/// @face: The hb_face_t to work on
	/// @variations: The array of variations to normalize
	/// @variations_length: The number of variations to normalize
	/// @coords: (out) (array length=coords_length): The array of normalized coordinates
	/// @coords_length: The length of the coordinate array
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_var_normalize_variations(hb_face_t* face, hb_variation_t* variations, c_uint variations_length, c_int* coords, c_uint coords_length);

	/// Normalizes the given design-space coordinates. The minimum and maximum
	/// values for the axis are mapped to the interval [-1,1], with the default
	/// axis value mapped to 0.
	///
	/// The normalized values have 14 bits of fixed-point sub-integer precision as per
	/// OpenType specification.
	///
	/// Any additional scaling defined in the face's `avar` table is also
	/// applied, as described at https://docs.microsoft.com/en-us/typography/opentype/spec/avar
	///
	/// Note: @coords_length must be the same as the number of axes in the face, as
	/// for example returned by hb_ot_var_get_axis_count().
	/// Otherwise, the behavior is undefined.
	///
	/// @face: The hb_face_t to work on
	/// @coords_length: The length of the coordinate array
	/// @design_coords: The design-space coordinates to normalize
	/// @normalized_coords: (out): The normalized coordinates
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_ot_var_normalize_coords(hb_face_t* face, c_uint coords_length, float* design_coords, out c_int normalized_coords);

	// ====================================================================
	// hb-aat-layout.h
	// ====================================================================

	/// Fetches a list of the AAT feature types included in the specified face.
	///
	/// @face: hb_face_t to work upon
	/// @start_offset: offset of the first feature type to retrieve
	/// @feature_count: (inout) (optional): Input = the maximum number of feature types to return;
	///     Output = the actual number of feature types returned (may be zero)
	/// @features: (out caller-allocates) (array length=feature_count) (nullable): Array of feature types found
	///
	/// Return value: Number of all available feature types.
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_aat_layout_get_feature_types(hb_face_t* face, c_uint start_offset, c_uint* feature_count, hb_aat_layout_feature_type_t* features);

	/// Fetches the name identifier of the specified feature type in the face's `name` table.
	///
	/// @face: hb_face_t to work upon
	/// @feature_type: The hb_aat_layout_feature_type_t of the requested feature type
	///
	/// Return value: Name identifier of the requested feature type
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_ot_name_id_t hb_aat_layout_feature_type_get_name_id(hb_face_t* face, hb_aat_layout_feature_type_t feature_type);

	/// Fetches a list of the selectors available for the specified feature in the given face.
	///
	/// If upon return, @default_index is set to HB_AAT_LAYOUT_NO_SELECTOR_INDEX, then
	/// the feature type is non-exclusive.  Otherwise, @default_index is the index of
	/// the selector that is selected by default.
	///
	/// @face: hb_face_t to work upon
	/// @feature_type: The hb_aat_layout_feature_type_t of the requested feature type
	/// @start_offset: offset of the first feature type to retrieve
	/// @selector_count: (inout) (optional): Input = the maximum number of selectors to return;
	///     Output = the actual number of selectors returned (may be zero)
	/// @selectors: (out caller-allocates) (array length=selector_count) (optional):
	///     A buffer pointer. The selectors available for the feature type queries.
	/// @default_index: (out) (optional): The index of the feature's default selector, if any
	///
	/// Return value: Number of all available feature selectors
	///
	/// Since: 2.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_aat_layout_feature_type_get_selector_infos(hb_face_t* face, hb_aat_layout_feature_type_t feature_type, c_uint start_offset, c_uint* selector_count, hb_aat_layout_feature_selector_info_t* selectors, c_uint* default_index);

	/// Tests whether the specified face includes any substitutions in the
	/// `morx` or `mort` tables.
	///
	/// <note>Note: does not examine the `GSUB` table.</note>
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_aat_layout_has_substitution(hb_face_t* face);

	/// Tests whether the specified face includes any positioning information
	/// in the `kerx` table.
	///
	/// <note>Note: does not examine the `GPOS` table.</note>
	///
	/// @face: hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_aat_layout_has_positioning(hb_face_t* face);

	/// Tests whether the specified face includes any tracking information
	/// in the `trak` table.
	///
	/// @face: : hb_face_t to work upon
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 2.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_aat_layout_has_tracking(hb_face_t* face);
}