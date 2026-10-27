namespace HarfBuzz;


using System;
using System.Interop;


// ====================================================================
// Typedefs
// ====================================================================

/// Data type for booleans.
public typealias hb_bool_t = c_int;

/// Data type for holding Unicode codepoints. Also
/// used to hold glyph IDs.
public typealias hb_codepoint_t = uint32;

/// Data type for holding a single coordinate value.
/// Contour points and other multi-dimensional data are
/// stored as tuples of hb_position_t's.
public typealias hb_position_t = int32;

/// Data type for bitmasks.
public typealias hb_mask_t = uint32;

/// Data type for tag identifiers. Tags are four
/// byte integers, each byte representing a character.
///
/// Tags are used to identify tables, design-variation axes,
/// scripts, languages, font features, and baselines with
/// human-readable names.
public typealias hb_tag_t = uint32;

/// Data type for languages. Each hb_language_t corresponds to a BCP 47
/// language tag.
public typealias hb_language_t = hb_language_impl_t*;

/// Data type for holding color values. Colors are eight bits per
/// channel RGB plus alpha transparency.
///
/// Since: 2.1.0
public typealias hb_color_t = uint32;

/// An integral type representing an OpenType 'name' table name identifier.
/// There are predefined name IDs, as well as name IDs return from other
/// API.  These can be used to fetch name strings from a font face.
///
/// Since: 2.0.0
public typealias hb_ot_name_id_t = c_uint;

// ====================================================================
// Opaque types (used through pointers)
// ====================================================================

public struct hb_language_impl_t { }

/// Data type for holding fonts.
public struct hb_font_t { }

/// Data type for blobs. A blob wraps a chunk of binary
/// data and facilitates its lifecycle management between
/// a client program and HarfBuzz.
public struct hb_blob_t { }

/// The main structure holding the input text and its properties before shaping,
/// and output glyphs and their information after shaping.
public struct hb_buffer_t { }

/// Glyph draw callbacks.
///
/// hb_draw_move_to_func_t, hb_draw_line_to_func_t and
/// hb_draw_cubic_to_func_t calls are necessary to be defined but we translate
/// hb_draw_quadratic_to_func_t calls to hb_draw_cubic_to_func_t if the
/// callback isn't defined.
///
/// Since: 4.0.0
public struct hb_draw_funcs_t { }

/// Data type for holding font faces.
public struct hb_face_t { }

/// Data type containing a set of virtual methods used for
/// working on hb_font_t font objects.
///
/// HarfBuzz provides a lightweight default function for each of
/// the methods in hb_font_funcs_t. Client programs can implement
/// their own replacements for the individual font functions, as
/// needed, and replace the default by calling the setter for a
/// method.
public struct hb_font_funcs_t { }

/// Data type for holding integer-to-integer hash maps.
public struct hb_map_t { }

/// Glyph paint callbacks.
///
/// The callbacks assume that the caller maintains a stack
/// of current transforms, clips and intermediate surfaces,
/// as evidenced by the pairs of push/pop callbacks. The
/// push/pop calls will be properly nested, so it is fine
/// to store the different kinds of object on a single stack.
///
/// Not all callbacks are required for all kinds of glyphs.
/// For rendering COLRv0 or non-color outline glyphs, the
/// gradient callbacks are not needed, and the composite
/// callback only needs to handle simple alpha compositing
/// (HB_PAINT_COMPOSITE_MODE_SRC_OVER).
///
/// The paint-image callback is only needed for glyphs
/// with image blobs in the CBDT, sbix or SVG tables.
///
/// The custom-palette-color callback is only necessary if
/// you want to override colors from the font palette with
/// custom colors.
///
/// Since: 7.0.0
public struct hb_paint_funcs_t { }

/// A struct containing color information for a gradient.
///
/// Since: 7.0.0
public struct hb_color_line_t { }

/// Data type for holding a set of integers. hb_set_t's are
/// used to gather and contain glyph IDs, Unicode code
/// points, and various other collections of discrete
/// values.
public struct hb_set_t { }

/// Data type for holding a shaping plan.
///
/// Shape plans contain information about how HarfBuzz will shape a
/// particular text segment, based on the segment's properties and the
/// capabilities in the font face in use.
///
/// Shape plans can be queried about how shaping will perform, given a set
/// of specific input parameters (script, language, direction, features,
/// etc.).
public struct hb_shape_plan_t { }

/// Data type containing a set of virtual methods used for
/// accessing various Unicode character properties.
///
/// HarfBuzz provides a default function for each of the
/// methods in hb_unicode_funcs_t. Client programs can implement
/// their own replacements for the individual Unicode functions, as
/// needed, and replace the default by calling the setter for a
/// method.
public struct hb_unicode_funcs_t { }

// ====================================================================
// Structs and unions
// ====================================================================

[CRepr, Union]
public struct hb_var_int_t
{
	public uint32 u32;
	public int32 i32;
	public uint16[2] u16;
	public int16[2] i16;
	public uint8[4] u8;
	public int8[4] i8;
}

[CRepr, Union]
public struct hb_var_num_t
{
	public float f;
	public uint32 u32;
	public int32 i32;
	public uint16[2] u16;
	public int16[2] i16;
	public uint8[4] u8;
	public int8[4] i8;
}

/// Data structure for holding user-data keys.
[CRepr]
public struct hb_user_data_key_t
{
	public c_char unused;
}

/// The hb_feature_t is the structure that holds information about requested
/// feature application. The feature will be applied with the given value to all
/// glyphs which are in clusters between @start (inclusive) and @end (exclusive).
/// Setting start to HB_FEATURE_GLOBAL_START and end to HB_FEATURE_GLOBAL_END
/// specifies that the feature always applies to the entire buffer.
[CRepr]
public struct hb_feature_t
{
	/// The hb_tag_t tag of the feature
	public hb_tag_t tag;

	/// The value of the feature. 0 disables the feature, non-zero (usually
	/// 1) enables the feature.  For features implemented as lookup type 3 (like
	/// 'salt') the @value is a one based index into the alternates.
	public uint32 value;

	/// the cluster to start applying this feature setting (inclusive).
	public c_uint start;

	/// the cluster to end applying this feature setting (exclusive).
	public c_uint end;
}

/// Data type for holding variation data. Registered OpenType
/// variation-axis tags are listed in
/// [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
///
/// Since: 1.4.2
[CRepr]
public struct hb_variation_t
{
	/// The hb_tag_t tag of the variation-axis name
	public hb_tag_t tag;

	/// The value of the variation axis
	public float value;
}

/// Glyph extent values, measured in font units.
///
/// Note that @height is negative, in coordinate systems that grow up.
[CRepr]
public struct hb_glyph_extents_t
{
	/// Distance from the x-origin to the left extremum of the glyph.
	public hb_position_t x_bearing;

	/// Distance from the top extremum of the glyph to the y-origin.
	public hb_position_t y_bearing;

	/// Distance from the left extremum of the glyph to the right extremum.
	public hb_position_t width;

	/// Distance from the top extremum of the glyph to the bottom extremum.
	public hb_position_t height;
}

/// The hb_glyph_info_t is the structure that holds information about the
/// glyphs and their relation to input text.
[CRepr]
public struct hb_glyph_info_t
{
	/// either a Unicode code point (before shaping) or a glyph index
	/// (after shaping).
	public hb_codepoint_t codepoint;

	public hb_mask_t mask;
	/// the index of the character in the original text that corresponds
	/// to this hb_glyph_info_t, or whatever the client passes to
	/// hb_buffer_add(). More than one hb_glyph_info_t can have the same
	/// @cluster value, if they resulted from the same character (e.g. one
	/// to many glyph substitution), and when more than one character gets
	/// merged in the same glyph (e.g. many to one glyph substitution) the
	/// hb_glyph_info_t will have the smallest cluster value of them.
	/// By default some characters are merged into the same cluster
	/// (e.g. combining marks have the same cluster as their bases)
	/// even if they are separate glyphs, hb_buffer_set_cluster_level()
	/// allow selecting more fine-grained cluster handling.
	public uint32 cluster;

	public hb_var_int_t var1;
	public hb_var_int_t var2;
}

/// The hb_glyph_position_t is the structure that holds the positions of the
/// glyph in both horizontal and vertical directions. All positions in
/// hb_glyph_position_t are relative to the current point.
[CRepr]
public struct hb_glyph_position_t
{
	/// how much the line advances after drawing this glyph when setting
	/// text in horizontal direction.
	public hb_position_t x_advance;

	/// how much the line advances after drawing this glyph when setting
	/// text in vertical direction.
	public hb_position_t y_advance;

	/// how much the glyph moves on the X-axis before drawing it, this
	/// should not affect how much the line advances.
	public hb_position_t x_offset;

	/// how much the glyph moves on the Y-axis before drawing it, this
	/// should not affect how much the line advances.
	public hb_position_t y_offset;

	public hb_var_int_t @var;
}

/// The structure that holds various text properties of an hb_buffer_t. Can be
/// set and retrieved using hb_buffer_set_segment_properties() and
/// hb_buffer_get_segment_properties(), respectively.
[CRepr]
public struct hb_segment_properties_t
{
	/// the hb_direction_t of the buffer, see hb_buffer_set_direction().
	public hb_direction_t direction;

	/// the hb_script_t of the buffer, see hb_buffer_set_script().
	public hb_script_t script;

	/// the hb_language_t of the buffer, see hb_buffer_set_language().
	public hb_language_t language;

	public void* reserved1;
	public void* reserved2;
}

[CRepr]
public struct hb_draw_state_t
{
	public hb_bool_t path_open;
	public float path_start_x;
	public float path_start_y;
	public float current_x;
	public float current_y;
	public hb_var_num_t reserved1;
	public hb_var_num_t reserved2;
	public hb_var_num_t reserved3;
	public hb_var_num_t reserved4;
	public hb_var_num_t reserved5;
	public hb_var_num_t reserved6;
	public hb_var_num_t reserved7;
}

/// Font-wide extent values, measured in scaled units.
///
/// Note that typically @ascender is positive and @descender
/// negative, in coordinate systems that grow up.
[CRepr]
public struct hb_font_extents_t
{
	/// The height of typographic ascenders.
	public hb_position_t ascender;

	/// The depth of typographic descenders.
	public hb_position_t descender;

	/// The suggested line-spacing gap.
	public hb_position_t line_gap;

	public hb_position_t reserved9;
	public hb_position_t reserved8;
	public hb_position_t reserved7;
	public hb_position_t reserved6;
	public hb_position_t reserved5;
	public hb_position_t reserved4;
	public hb_position_t reserved3;
	public hb_position_t reserved2;
	public hb_position_t reserved1;
}

/// Information about a color stop on a color line.
///
/// Color lines typically have offsets ranging between 0 and 1,
/// but that is not required.
///
/// The @is_foreground and @color fields have the same semantics
/// as in hb_paint_color_func_t.
///
/// Note: despite @color being unpremultiplied here, interpolation in
/// gradients shall happen in premultiplied space. See the OpenType spec
/// [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
/// section for details.
///
/// Since: 7.0.0
[CRepr]
public struct hb_color_stop_t
{
	/// the offset of the color stop
	public float offset;

	/// whether the color is the foreground
	public hb_bool_t is_foreground;

	/// the color, unpremultiplied
	public hb_color_t color;
}

/// Pairs of glyph and color index.
///
/// A color index of 0xFFFF does not refer to a palette
/// color, but indicates that the foreground color should
/// be used.
///
/// Since: 2.1.0
[CRepr]
public struct hb_ot_color_layer_t
{
	/// the glyph ID of the layer
	public hb_codepoint_t glyph;

	/// the palette color index of the layer
	public c_uint color_index;
}

/// Data type to hold math kerning (cut-in) information for a glyph.
///
/// Since: 3.4.0
[CRepr]
public struct hb_ot_math_kern_entry_t
{
	/// The maximum height at which this entry should be used
	public hb_position_t max_correction_height;

	/// The kern value of the entry
	public hb_position_t kern_value;
}

/// Data type to hold math-variant information for a glyph.
///
/// Since: 1.3.3
[CRepr]
public struct hb_ot_math_glyph_variant_t
{
	/// The glyph index of the variant
	public hb_codepoint_t glyph;

	/// The advance width of the variant
	public hb_position_t advance;
}

/// Data type to hold information for a "part" component of a math-variant glyph.
/// Large variants for stretchable math glyphs (such as parentheses) can be constructed
/// on the fly from parts.
///
/// Since: 1.3.3
[CRepr]
public struct hb_ot_math_glyph_part_t
{
	/// The glyph index of the variant part
	public hb_codepoint_t glyph;

	/// The length of the connector on the starting side of the variant part
	public hb_position_t start_connector_length;

	/// The length of the connector on the ending side of the variant part
	public hb_position_t end_connector_length;

	/// The total advance of the part
	public hb_position_t full_advance;

	/// hb_ot_math_glyph_part_flags_t flags for the part
	public hb_ot_math_glyph_part_flags_t flags;
}

/// Structure representing a name ID in a particular language.
///
/// Since: 2.1.0
[CRepr]
public struct hb_ot_name_entry_t
{
	/// name ID
	public hb_ot_name_id_t name_id;

	public hb_var_int_t @var;
	/// language
	public hb_language_t language;
}

/// Data type for holding variation-axis values.
///
/// The minimum, default, and maximum values are in un-normalized, user scales.
///
/// <note>Note: at present, the only flag defined for @flags is
/// HB_OT_VAR_AXIS_FLAG_HIDDEN.</note>
///
/// Since: 2.2.0
[CRepr]
public struct hb_ot_var_axis_info_t
{
	/// Index of the axis in the variation-axis array
	public c_uint axis_index;

	/// The hb_tag_t tag identifying the design variation of the axis
	public hb_tag_t tag;

	/// The `name` table Name ID that provides display names for the axis
	public hb_ot_name_id_t name_id;

	/// The hb_ot_var_axis_flags_t flags for the axis
	public hb_ot_var_axis_flags_t flags;

	/// The minimum value on the variation axis that the font covers
	public float min_value;

	/// The position on the variation axis corresponding to the font's defaults
	public float default_value;

	/// The maximum value on the variation axis that the font covers
	public float max_value;

	public c_uint reserved;
}

/// Structure representing a setting for an hb_aat_layout_feature_type_t.
[CRepr]
public struct hb_aat_layout_feature_selector_info_t
{
	/// The selector's name identifier
	public hb_ot_name_id_t name_id;

	/// The value to turn the selector on
	public hb_aat_layout_feature_selector_t enable;

	/// The value to turn the selector off
	public hb_aat_layout_feature_selector_t disable;

	public c_uint reserved;
}

// ====================================================================
// Callback types
// ====================================================================

/// A virtual method for destroy user-data callbacks.
///
/// @user_data: the data to be destroyed
public function void hb_destroy_func_t(void* user_data);

/// A callback method for hb_buffer_t. The method gets called with the
/// hb_buffer_t it was set on, the hb_font_t the buffer is shaped with and a
/// message describing what step of the shaping process will be performed.
/// Returning `false` from this method will skip this shaping step and move to
/// the next one.
///
/// @buffer: An hb_buffer_t to work upon
/// @font: The hb_font_t the @buffer is shaped with
/// @message: `NULL`-terminated message passed to the function
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` to perform the shaping step, `false` to skip it.
///
/// Since: 1.1.3
public function hb_bool_t hb_buffer_message_func_t(hb_buffer_t* buffer, hb_font_t* font, c_char* message, void* user_data);

/// A virtual method for the hb_draw_funcs_t to perform a "move-to" draw
/// operation.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
/// @st: current draw state
/// @to_x: X component of target point
/// @to_y: Y component of target point
/// @user_data: User data pointer passed to hb_draw_funcs_set_move_to_func()
///
/// Since: 4.0.0
public function void hb_draw_move_to_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float to_x, float to_y, void* user_data);

/// A virtual method for the hb_draw_funcs_t to perform a "line-to" draw
/// operation.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
/// @st: current draw state
/// @to_x: X component of target point
/// @to_y: Y component of target point
/// @user_data: User data pointer passed to hb_draw_funcs_set_line_to_func()
///
/// Since: 4.0.0
public function void hb_draw_line_to_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float to_x, float to_y, void* user_data);

/// A virtual method for the hb_draw_funcs_t to perform a "quadratic-to" draw
/// operation.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
/// @st: current draw state
/// @control_x: X component of control point
/// @control_y: Y component of control point
/// @to_x: X component of target point
/// @to_y: Y component of target point
/// @user_data: User data pointer passed to hb_draw_funcs_set_quadratic_to_func()
///
/// Since: 4.0.0
public function void hb_draw_quadratic_to_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float control_x, float control_y, float to_x, float to_y, void* user_data);

/// A virtual method for the hb_draw_funcs_t to perform a "cubic-to" draw
/// operation.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
/// @st: current draw state
/// @control1_x: X component of first control point
/// @control1_y: Y component of first control point
/// @control2_x: X component of second control point
/// @control2_y: Y component of second control point
/// @to_x: X component of target point
/// @to_y: Y component of target point
/// @user_data: User data pointer passed to hb_draw_funcs_set_cubic_to_func()
///
/// Since: 4.0.0
public function void hb_draw_cubic_to_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float control1_x, float control1_y, float control2_x, float control2_y, float to_x, float to_y, void* user_data);

/// A virtual method for the hb_draw_funcs_t to perform a "close-path" draw
/// operation.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
/// @st: current draw state
/// @user_data: User data pointer passed to hb_draw_funcs_set_close_path_func()
///
/// Since: 4.0.0
public function void hb_draw_close_path_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, void* user_data);

/// Sets the work-budget policy and recharges the live work budget. @budget is
/// HB_BUDGET_DEFAULT, HB_BUDGET_UNLIMITED, or a non-negative concrete value.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions
/// @budget: the new work-budget policy
/// @user_data: User data pointer passed to hb_draw_funcs_set_set_budget_func()
///
/// Return value: `true` if the budget was set, `false` if unsupported
///
/// Since: 14.5.0
public function hb_bool_t hb_draw_set_budget_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, int64 budget, void* user_data);

/// Fetches the configured work-budget policy.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions
/// @user_data: User data pointer passed to hb_draw_funcs_set_get_budget_func()
///
/// Return value: the configured work-budget policy
///
/// Since: 14.5.0
public function int64 hb_draw_get_budget_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, void* user_data);

/// Fetches the address of the live work budget. The returned address must stay
/// valid while @draw_data is used with @dfuncs. The live value must be concrete;
/// it must not contain HB_BUDGET_DEFAULT.
///
/// @dfuncs: draw functions object
/// @draw_data: The data accompanying the draw functions
/// @user_data: User data pointer passed to
///     hb_draw_funcs_set_get_budget_remaining_func()
///
/// Return value: (nullable) (transfer none): the live work budget, or `NULL` if
///   live budget accounting is unsupported
///
/// Since: 14.5.0
public function int64* hb_draw_get_budget_remaining_func_t(hb_draw_funcs_t* dfuncs, void* draw_data, void* user_data);

/// Callback function for hb_face_create_for_tables(). The @tag is the tag of the
/// table to reference, and the special tag HB_TAG_NONE is used to reference the
/// blob of the face itself. If referencing the face blob is not possible, it is
/// recommended to set hb_get_table_tags_func_t on the @face to allow
/// hb_face_reference_blob() to create a face blob out of individual table blobs.
///
/// @face: an hb_face_t to reference table for
/// @tag: the tag of the table to reference
/// @user_data: User data pointer passed by the caller
///
/// Return value: (transfer full): A pointer to the @tag table within @face or
/// `NULL` if the table is not found or cannot be referenced.
///
/// Since: 0.9.2
public function hb_blob_t* hb_reference_table_func_t(hb_face_t* face, hb_tag_t tag, void* user_data);

/// Callback function for hb_face_get_table_tags().
///
/// @face: A face object
/// @start_offset: The index of first table tag to retrieve
/// @table_count: (inout): Input = the maximum number of table tags to return;
///     Output = the actual number of table tags returned (may be zero)
/// @table_tags: (out) (array length=table_count) (nullable): The array of table tags found
/// @user_data: User data pointer passed by the caller
///
/// Return value: Total number of tables, or zero if it is not possible to list
///
/// Since: 10.0.0
public function c_uint hb_get_table_tags_func_t(hb_face_t* face, c_uint start_offset, c_uint* table_count, hb_tag_t* table_tags, void* user_data);

/// This method should retrieve the extents for a font.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @extents: (out): The font extents retrieved
/// @user_data: User data pointer passed by the caller
public function hb_bool_t hb_font_get_font_extents_func_t(hb_font_t* font, void* font_data, hb_font_extents_t* extents, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the nominal glyph ID for a specified Unicode code
/// point. Glyph IDs must be returned in a hb_codepoint_t output parameter.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @unicode: The Unicode code point to query
/// @glyph: (out): The glyph ID retrieved
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
public function hb_bool_t hb_font_get_nominal_glyph_func_t(hb_font_t* font, void* font_data, hb_codepoint_t unicode, hb_codepoint_t* glyph, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the glyph ID for a specified Unicode code point
/// followed by a specified Variation Selector code point. Glyph IDs must be
/// returned in a hb_codepoint_t output parameter.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @unicode: The Unicode code point to query
/// @variation_selector: The  variation-selector code point to query
/// @glyph: (out): The glyph ID retrieved
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
public function hb_bool_t hb_font_get_variation_glyph_func_t(hb_font_t* font, void* font_data, hb_codepoint_t unicode, hb_codepoint_t variation_selector, hb_codepoint_t* glyph, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the nominal glyph IDs for a sequence of
/// Unicode code points. Glyph IDs must be returned in a hb_codepoint_t
/// output parameter.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @count: number of code points to query
/// @first_unicode: The first Unicode code point to query
/// @unicode_stride: The stride between successive code points
/// @first_glyph: (out): The first glyph ID retrieved
/// @glyph_stride: The stride between successive glyph IDs
/// @user_data: User data pointer passed by the caller
///
/// Return value: the number of code points processed
public function c_uint hb_font_get_nominal_glyphs_func_t(hb_font_t* font, void* font_data, c_uint count, hb_codepoint_t* first_unicode, c_uint unicode_stride, hb_codepoint_t* first_glyph, c_uint glyph_stride, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the advance for a specified glyph. The
/// method must return an hb_position_t.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @glyph: The glyph ID to query
/// @user_data: User data pointer passed by the caller
///
/// Return value: The advance of @glyph within @font
public function hb_position_t hb_font_get_glyph_advance_func_t(hb_font_t* font, void* font_data, hb_codepoint_t glyph, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the advances for a sequence of glyphs.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @count: The number of glyph IDs in the sequence queried
/// @first_glyph: The first glyph ID to query
/// @glyph_stride: The stride between successive glyph IDs
/// @first_advance: (out): The first advance retrieved
/// @advance_stride: The stride between successive advances
/// @user_data: User data pointer passed by the caller
public function void hb_font_get_glyph_advances_func_t(hb_font_t* font, void* font_data, c_uint count, hb_codepoint_t* first_glyph, c_uint glyph_stride, hb_position_t* first_advance, c_uint advance_stride, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the (X,Y) coordinates (in scaled units) of the
/// origin for a glyph. Each coordinate must be returned in an hb_position_t
/// output parameter.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @glyph: The glyph ID to query
/// @x: (out): The X coordinate of the origin
/// @y: (out): The Y coordinate of the origin
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
public function hb_bool_t hb_font_get_glyph_origin_func_t(hb_font_t* font, void* font_data, hb_codepoint_t glyph, hb_position_t* x, hb_position_t* y, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the (X,Y) coordinates (in scaled units) of the
/// origin for each requested glyph. Each coordinate value must be returned in
/// an hb_position_t in the two output parameters.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @first_glyph: The first glyph ID to query
/// @count: number of glyphs to query
/// @glyph_stride: The stride between successive glyph IDs
/// @first_x: (out): The first origin X coordinate retrieved
/// @x_stride: The stride between successive origin X coordinates
/// @first_y: (out): The first origin Y coordinate retrieved
/// @y_stride: The stride between successive origin Y coordinates
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
///
/// Since: 11.3.0
public function hb_bool_t hb_font_get_glyph_origins_func_t(hb_font_t* font, void* font_data, c_uint count, hb_codepoint_t* first_glyph, c_uint glyph_stride, hb_position_t* first_x, c_uint x_stride, hb_position_t* first_y, c_uint y_stride, void* user_data);

/// This method should retrieve the kerning-adjustment value for a glyph-pair in
/// the specified font, for horizontal text segments.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @first_glyph: The glyph ID of the first glyph in the glyph pair
/// @second_glyph: The glyph ID of the second glyph in the glyph pair
/// @user_data: User data pointer passed by the caller
public function hb_position_t hb_font_get_glyph_kerning_func_t(hb_font_t* font, void* font_data, hb_codepoint_t first_glyph, hb_codepoint_t second_glyph, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the extents for a specified glyph. Extents must be
/// returned in an hb_glyph_extents output parameter.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @glyph: The glyph ID to query
/// @extents: (out): The hb_glyph_extents_t retrieved
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
public function hb_bool_t hb_font_get_glyph_extents_func_t(hb_font_t* font, void* font_data, hb_codepoint_t glyph, hb_glyph_extents_t* extents, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the (X,Y) coordinates (in scaled units) for a
/// specified contour point in a glyph. Each coordinate must be returned as
/// an hb_position_t output parameter.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @glyph: The glyph ID to query
/// @point_index: The contour-point index to query
/// @x: (out): The X value retrieved for the contour point
/// @y: (out): The Y value retrieved for the contour point
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
public function hb_bool_t hb_font_get_glyph_contour_point_func_t(hb_font_t* font, void* font_data, hb_codepoint_t glyph, c_uint point_index, hb_position_t* x, hb_position_t* y, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the glyph name that corresponds to a
/// glyph ID. The name should be returned in a string output parameter.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @glyph: The glyph ID to query
/// @name: (out) (array length=size): Name string retrieved for the glyph ID
/// @size: Length of the glyph-name string retrieved
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
public function hb_bool_t hb_font_get_glyph_name_func_t(hb_font_t* font, void* font_data, hb_codepoint_t glyph, c_char* name, c_uint size, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the glyph ID that corresponds to a glyph-name
/// string.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @name: (array length=len): The name string to query
/// @len: The length of the name queried
/// @glyph: (out): The glyph ID retrieved
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if data found, `false` otherwise
public function hb_bool_t hb_font_get_glyph_from_name_func_t(hb_font_t* font, void* font_data, c_char* name, c_int len, hb_codepoint_t* glyph, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @glyph: The glyph ID to query
/// @draw_funcs: The draw functions to send the shape data to
/// @draw_data: The data accompanying the draw functions
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if glyph was drawn, `false` otherwise
///
/// Since: 11.2.0
public function hb_bool_t hb_font_draw_glyph_or_fail_func_t(hb_font_t* font, void* font_data, hb_codepoint_t glyph, hb_draw_funcs_t* draw_funcs, void* draw_data, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// @font: hb_font_t to work upon
/// @font_data: @font user data pointer
/// @glyph: The glyph ID to query
/// @paint_funcs: The paint functions to use
/// @paint_data: The data accompanying the paint functions
/// @palette_index: The color palette to use
/// @foreground: The foreground color
/// @user_data: User data pointer passed by the caller
///
/// Return value: `true` if glyph was painted, `false` otherwise
///
/// Since: 11.2.0
public function hb_bool_t hb_font_paint_glyph_or_fail_func_t(hb_font_t* font, void* font_data, hb_codepoint_t glyph, hb_paint_funcs_t* paint_funcs, void* paint_data, c_uint palette_index, hb_color_t foreground, void* user_data);

/// Sets the work-budget policy and recharges the live work budget. @budget is
/// HB_BUDGET_DEFAULT, HB_BUDGET_UNLIMITED, or a non-negative concrete value.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions
/// @budget: the new work-budget policy
/// @user_data: User data pointer passed to hb_paint_funcs_set_set_budget_func()
///
/// Return value: `true` if the budget was set, `false` if unsupported
///
/// Since: 14.5.0
public function hb_bool_t hb_paint_set_budget_func_t(hb_paint_funcs_t* funcs, void* paint_data, int64 budget, void* user_data);

/// Fetches the configured work-budget policy.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions
/// @user_data: User data pointer passed to hb_paint_funcs_set_get_budget_func()
///
/// Return value: the configured work-budget policy
///
/// Since: 14.5.0
public function int64 hb_paint_get_budget_func_t(hb_paint_funcs_t* funcs, void* paint_data, void* user_data);

/// Fetches the address of the live work budget. The returned address must stay
/// valid while @paint_data is used with @funcs. The live value must be concrete;
/// it must not contain HB_BUDGET_DEFAULT.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions
/// @user_data: User data pointer passed to
///     hb_paint_funcs_set_get_budget_remaining_func()
///
/// Return value: (nullable) (transfer none): the live work budget, or `NULL` if
///   live budget accounting is unsupported
///
/// Since: 14.5.0
public function int64* hb_paint_get_budget_remaining_func_t(hb_paint_funcs_t* funcs, void* paint_data, void* user_data);

/// A virtual method for the hb_paint_funcs_t to apply
/// a transform to subsequent paint calls.
///
/// This transform is applied after the current transform,
/// and remains in effect until a matching call to
/// the hb_paint_funcs_pop_transform_func_t vfunc.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @xx: xx component of the transform matrix
/// @yx: yx component of the transform matrix
/// @xy: xy component of the transform matrix
/// @yy: yy component of the transform matrix
/// @dx: dx component of the transform matrix
/// @dy: dy component of the transform matrix
/// @user_data: User data pointer passed to hb_paint_funcs_set_push_transform_func()
///
/// Since: 7.0.0
public function void hb_paint_push_transform_func_t(hb_paint_funcs_t* funcs, void* paint_data, float xx, float yx, float xy, float yy, float dx, float dy, void* user_data);

/// A virtual method for the hb_paint_funcs_t to undo
/// the effect of a prior call to the hb_paint_funcs_push_transform_func_t
/// vfunc.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @user_data: User data pointer passed to hb_paint_funcs_set_pop_transform_func()
///
/// Since: 7.0.0
public function void hb_paint_pop_transform_func_t(hb_paint_funcs_t* funcs, void* paint_data, void* user_data);

/// A virtual method for the hb_paint_funcs_t to render a color glyph by glyph index.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @glyph: the glyph ID
/// @font: the font
/// @user_data: User data pointer passed to hb_paint_funcs_set_color_glyph_func()
///
/// Return value: `true` if the glyph was painted, `false` otherwise.
///
/// Since: 8.2.0
public function hb_bool_t hb_paint_color_glyph_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_codepoint_t glyph, hb_font_t* font, void* user_data);

/// A virtual method for the hb_paint_funcs_t to fill a glyph's shape with
/// a solid color. If not implemented, a sequence of "push-clip-glyph",
/// "color", "pop-clip" paint operations, in that order, will be emitted
/// instead.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @glyph: the glyph ID
/// @font: the font
/// @is_foreground: whether the color is the foreground
/// @color: The color to use, unpremultiplied
/// @user_data: User data pointer passed to hb_paint_funcs_set_fill_glyph_func()
///
/// Since: 14.3.0
public function void hb_paint_fill_glyph_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_codepoint_t glyph, hb_font_t* font, hb_bool_t is_foreground, hb_color_t color, void* user_data);

/// A virtual method for the hb_paint_funcs_t to clip
/// subsequent paint calls to the outline of a glyph.
///
/// The coordinates of the glyph outline are expected in the
/// current @font scale (ie. the results of calling
/// hb_font_draw_glyph() with @font). The outline is
/// transformed by the current transform.
///
/// This clip is applied in addition to the current clip,
/// and remains in effect until a matching call to
/// the hb_paint_funcs_pop_clip_func_t vfunc.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @glyph: the glyph ID
/// @font: the font
/// @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_glyph_func()
///
/// Since: 7.0.0
public function void hb_paint_push_clip_glyph_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_codepoint_t glyph, hb_font_t* font, void* user_data);

/// A virtual method for the hb_paint_funcs_t to clip
/// subsequent paint calls to a rectangle.
///
/// The coordinates of the rectangle are interpreted according
/// to the current transform.
///
/// This clip is applied in addition to the current clip,
/// and remains in effect until a matching call to
/// the hb_paint_funcs_pop_clip_func_t vfunc.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @xmin: min X for the rectangle
/// @ymin: min Y for the rectangle
/// @xmax: max X for the rectangle
/// @ymax: max Y for the rectangle
/// @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_rectangle_func()
///
/// Since: 7.0.0
public function void hb_paint_push_clip_rectangle_func_t(hb_paint_funcs_t* funcs, void* paint_data, float xmin, float ymin, float xmax, float ymax, void* user_data);

/// A virtual method for the hb_paint_funcs_t to begin clipping
/// to an arbitrary path.  The backend returns an
/// hb_draw_funcs_t it owns (the caller must not free it)
/// that the caller feeds the clip outline to via hb_draw_*()
/// calls, plus a @draw_data value to pass alongside those
/// calls.  Both are only valid until the matching
/// hb_paint_push_clip_path_end_func_t call; no other paint
/// calls should be made in between.  The clip remains
/// in effect until a later hb_paint_pop_clip_func_t call.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @draw_data: (out): location to store the draw data the caller should
///     pass alongside the returned draw funcs.
/// @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_path_start_func()
///
/// Return value: (transfer none): draw funcs that accumulate
///   the clip path, or `NULL` if arbitrary-path clipping is not
///   supported.
///
/// Since: 14.2.0
public function hb_draw_funcs_t* hb_paint_push_clip_path_start_func_t(hb_paint_funcs_t* funcs, void* paint_data, void** draw_data, void* user_data);

/// A virtual method for the hb_paint_funcs_t to close the
/// clip path started by the hb_paint_push_clip_path_start_func_t
/// vfunc.  The emitted path is now active as a clip; subsequent
/// paint ops are masked by it until a matching
/// hb_paint_pop_clip_func_t call.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_path_end_func()
///
/// Since: 14.2.0
public function void hb_paint_push_clip_path_end_func_t(hb_paint_funcs_t* funcs, void* paint_data, void* user_data);

/// A virtual method for the hb_paint_funcs_t to undo
/// the effect of a prior call to the hb_paint_funcs_push_clip_glyph_func_t,
/// hb_paint_funcs_push_clip_rectangle_func_t, or
/// hb_paint_funcs_push_clip_path_end_func_t vfuncs.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @user_data: User data pointer passed to hb_paint_funcs_set_pop_clip_func()
///
/// Since: 7.0.0
public function void hb_paint_pop_clip_func_t(hb_paint_funcs_t* funcs, void* paint_data, void* user_data);

/// A virtual method for the hb_paint_funcs_t to paint a
/// color everywhere within the current clip.
///
/// When @is_foreground is true, this color originates from the
/// foreground-color sentinel in the font's color data.  The
/// @color parameter still carries a fully resolved RGBA value
/// (with any paint-tree alpha already applied), so backends
/// that do not need to distinguish the foreground can simply
/// use @color directly.
///
/// Backends that defer foreground resolution (e.g. to honor a
/// CSS `currentColor` or a runtime uniform) should substitute
/// their own foreground RGB when @is_foreground is true, but
/// must combine the alpha from @color with their foreground
/// alpha, since it encodes additional modulation from the
/// paint tree.  For this mode to work correctly, the caller
/// should pass a fully-opaque foreground color to
/// hb_font_paint_glyph(), so that the alpha in @color
/// reflects only the paint-tree contribution.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @is_foreground: whether the color is the foreground
/// @color: The color to use, unpremultiplied
/// @user_data: User data pointer passed to hb_paint_funcs_set_color_func()
///
/// Since: 7.0.0
public function void hb_paint_color_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_bool_t is_foreground, hb_color_t color, void* user_data);

/// A virtual method for the hb_paint_funcs_t to paint a glyph image.
///
/// This method is called for glyphs with image blobs in the CBDT,
/// sbix or SVG tables. The @format identifies the kind of data that
/// is contained in @image. Possible values include HB_PAINT_IMAGE_FORMAT_PNG,
/// HB_PAINT_IMAGE_FORMAT_SVG and HB_PAINT_IMAGE_FORMAT_BGRA.
///
/// The image dimensions and glyph extents are provided if available,
/// and should be used to size and position the image.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @image: the image data
/// @width: width of the raster image in pixels, or 0
/// @height: height of the raster image in pixels, or 0
/// @format: the image format as a tag
/// @slant: Deprecated. Always set to 0.0.
/// @extents: (nullable): glyph extents for desired rendering
/// @user_data: User data pointer passed to hb_paint_funcs_set_image_func()
///
/// Return value: Whether the operation was successful.
///
/// Since: 7.0.0
public function hb_bool_t hb_paint_image_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_blob_t* image, c_uint width, c_uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents, void* user_data);

/// A virtual method for the hb_color_line_t to fetch color stops.
///
/// @color_line: a hb_color_line_t object
/// @color_line_data: the data accompanying @color_line
/// @start: the index of the first color stop to return
/// @count: (inout) (optional): Input = the maximum number of feature tags to return;
///     Output = the actual number of feature tags returned (may be zero)
/// @color_stops: (out) (array length=count) (optional): Array of hb_color_stop_t to populate
/// @user_data: the data accompanying this method
///
/// Return value: the total number of color stops in @color_line
///
/// Since: 7.0.0
public function c_uint hb_color_line_get_color_stops_func_t(hb_color_line_t* color_line, void* color_line_data, c_uint start, c_uint* count, hb_color_stop_t* color_stops, void* user_data);

/// A virtual method for the @hb_color_line_t to fetches the extend mode.
///
/// @color_line: a hb_color_line_t object
/// @color_line_data: the data accompanying @color_line
/// @user_data: the data accompanying this method
///
/// Return value: the extend mode of @color_line
///
/// Since: 7.0.0
public function hb_paint_extend_t hb_color_line_get_extend_func_t(hb_color_line_t* color_line, void* color_line_data, void* user_data);

/// A virtual method for the hb_paint_funcs_t to paint a linear
/// gradient everywhere within the current clip.
///
/// The @color_line object contains information about the colors of the gradients.
/// It is only valid for the duration of the callback, you cannot keep it around.
///
/// The coordinates of the points are interpreted according
/// to the current transform.
///
/// See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
/// section for details on how the points define the direction
/// of the gradient, and how to interpret the @color_line.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @color_line: Color information for the gradient
/// @x0: X coordinate of the first point
/// @y0: Y coordinate of the first point
/// @x1: X coordinate of the second point
/// @y1: Y coordinate of the second point
/// @x2: X coordinate of the third point
/// @y2: Y coordinate of the third point
/// @user_data: User data pointer passed to hb_paint_funcs_set_linear_gradient_func()
///
/// Since: 7.0.0
public function void hb_paint_linear_gradient_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_color_line_t* color_line, float x0, float y0, float x1, float y1, float x2, float y2, void* user_data);

/// A virtual method for the hb_paint_funcs_t to paint a radial
/// gradient everywhere within the current clip.
///
/// The @color_line object contains information about the colors of the gradients.
/// It is only valid for the duration of the callback, you cannot keep it around.
///
/// The coordinates of the points are interpreted according
/// to the current transform.
///
/// See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
/// section for details on how the points define the direction
/// of the gradient, and how to interpret the @color_line.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @color_line: Color information for the gradient
/// @x0: X coordinate of the first circle's center
/// @y0: Y coordinate of the first circle's center
/// @r0: radius of the first circle
/// @x1: X coordinate of the second circle's center
/// @y1: Y coordinate of the second circle's center
/// @r1: radius of the second circle
/// @user_data: User data pointer passed to hb_paint_funcs_set_radial_gradient_func()
///
/// Since: 7.0.0
public function void hb_paint_radial_gradient_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_color_line_t* color_line, float x0, float y0, float r0, float x1, float y1, float r1, void* user_data);

/// A virtual method for the hb_paint_funcs_t to paint a sweep
/// gradient everywhere within the current clip.
///
/// The @color_line object contains information about the colors of the gradients.
/// It is only valid for the duration of the callback, you cannot keep it around.
///
/// The coordinates of the points are interpreted according
/// to the current transform.
///
/// See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
/// section for details on how the points define the direction
/// of the gradient, and how to interpret the @color_line.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @color_line: Color information for the gradient
/// @x0: X coordinate of the circle's center
/// @y0: Y coordinate of the circle's center
/// @start_angle: the start angle, in radians
/// @end_angle: the end angle, in radians
/// @user_data: User data pointer passed to hb_paint_funcs_set_sweep_gradient_func()
///
/// Since: 7.0.0
public function void hb_paint_sweep_gradient_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_color_line_t* color_line, float x0, float y0, float start_angle, float end_angle, void* user_data);

/// A virtual method for the hb_paint_funcs_t to use
/// an intermediate surface for subsequent paint calls.
///
/// The drawing will be redirected to an intermediate surface
/// until a matching call to the hb_paint_funcs_pop_group_func_t
/// vfunc.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @user_data: User data pointer passed to hb_paint_funcs_set_push_group_func()
///
/// Since: 7.0.0
public function void hb_paint_push_group_func_t(hb_paint_funcs_t* funcs, void* paint_data, void* user_data);

/// A virtual method for the hb_paint_funcs_t to use
/// an intermediate surface for subsequent paint calls,
/// with the compositing mode known in advance.
///
/// This is like hb_paint_push_group_func_t, but the
/// compositing mode is provided at push time. By default
/// this calls hb_paint_push_group_func_t.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @mode: the compositing mode that will be used when the group is popped
/// @user_data: User data pointer passed to hb_paint_funcs_set_push_group_for_func()
///
/// Since: 14.2.0
public function void hb_paint_push_group_for_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_paint_composite_mode_t mode, void* user_data);

/// A virtual method for the hb_paint_funcs_t to undo
/// the effect of a prior call to the hb_paint_funcs_push_group_func_t
/// vfunc.
///
/// This call stops the redirection to the intermediate surface,
/// and then composites it on the previous surface, using the
/// compositing mode passed to this call.
///
/// @funcs: paint functions object
/// @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
/// @mode: the compositing mode to use
/// @user_data: User data pointer passed to hb_paint_funcs_set_pop_group_func()
///
/// Since: 7.0.0
public function void hb_paint_pop_group_func_t(hb_paint_funcs_t* funcs, void* paint_data, hb_paint_composite_mode_t mode, void* user_data);

/// A virtual method for hb_paint_funcs_t to fetch a custom palette override
/// color for @color_index.
///
/// Custom palette colors override colors from the font's selected color palette.
/// It is not necessary to override all palette entries; return `false` for
/// entries that should be taken from the font palette.
///
/// This function might be called multiple times, but the custom palette is
/// expected to remain unchanged for the duration of one
/// hb_font_paint_glyph() call.
///
/// @funcs: paint functions object.
/// @paint_data: data accompanying the paint functions in hb_font_paint_glyph().
/// @color_index: color index to fetch.
/// @color: (out): fetched color.
/// @user_data: user data pointer passed to hb_paint_funcs_set_custom_palette_color_func().
///
/// Return value: `true` if a custom color is provided, `false` otherwise.
///
/// Since: 7.0.0
public function hb_bool_t hb_paint_custom_palette_color_func_t(hb_paint_funcs_t* funcs, void* paint_data, c_uint color_index, hb_color_t* color, void* user_data);

/// Callback invoked once per (a0, a1) sector of a sweep
/// gradient tiling.  See hb_paint_sweep_gradient_tiles().
///
/// @a0: segment start angle, in radians.
/// @c0: segment start color.
/// @a1: segment end angle, in radians.
/// @c1: segment end color.
/// @user_data: user data passed to hb_paint_sweep_gradient_tiles().
///
/// Since: 14.2.0
public function void hb_paint_sweep_gradient_tile_func_t(float a0, hb_color_t c0, float a1, hb_color_t c1, void* user_data);

/// A virtual method for the hb_unicode_funcs_t structure.
///
/// This method should retrieve the Canonical Combining Class (ccc)
/// property for a specified Unicode code point.
///
/// @ufuncs: A Unicode-functions structure
/// @unicode: The code point to query
/// @user_data: User data pointer passed by the caller
///
/// Return value: The hb_unicode_combining_class_t of @unicode
public function hb_unicode_combining_class_t hb_unicode_combining_class_func_t(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* user_data);

/// A virtual method for the hb_unicode_funcs_t structure.
///
/// This method should retrieve the General Category property for
/// a specified Unicode code point.
///
/// @ufuncs: A Unicode-functions structure
/// @unicode: The code point to query
/// @user_data: User data pointer passed by the caller
///
/// Return value: The hb_unicode_general_category_t of @unicode
public function hb_unicode_general_category_t hb_unicode_general_category_func_t(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* user_data);

/// A virtual method for the hb_unicode_funcs_t structure.
///
/// This method should retrieve the Bi-Directional Mirroring Glyph
/// code point for a specified Unicode code point.
///
/// <note>Note: If a code point does not have a specified
/// Bi-Directional Mirroring Glyph defined, the method should
/// return the original code point.</note>
///
/// @ufuncs: A Unicode-functions structure
/// @unicode: The code point to query
/// @user_data: User data pointer passed by the caller
///
/// Return value: The hb_codepoint_t of the Mirroring Glyph for @unicode
public function hb_codepoint_t hb_unicode_mirroring_func_t(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* user_data);

/// A virtual method for the hb_unicode_funcs_t structure.
///
/// This method should retrieve the Script property for a
/// specified Unicode code point.
///
/// @ufuncs: A Unicode-functions structure
/// @unicode: The code point to query
/// @user_data: User data pointer passed by the caller
///
/// Return value: The hb_script_t of @unicode
public function hb_script_t hb_unicode_script_func_t(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode, void* user_data);

/// A virtual method for the hb_unicode_funcs_t structure.
///
/// This method should compose a sequence of two input Unicode code
/// points by canonical equivalence, returning the composed code
/// point in a hb_codepoint_t output parameter (if successful).
/// The method must return an hb_bool_t indicating the success
/// of the composition.
///
/// @ufuncs: A Unicode-functions structure
/// @a: The first code point to compose
/// @b: The second code point to compose
/// @ab: (out): The composed code point
/// @user_data: user data pointer passed by the caller
///
/// Return value: `true` is @a,@b composed, `false` otherwise
public function hb_bool_t hb_unicode_compose_func_t(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, hb_codepoint_t* ab, void* user_data);

/// A virtual method for the hb_unicode_funcs_t structure.
///
/// This method should decompose an input Unicode code point,
/// returning the two decomposed code points in hb_codepoint_t
/// output parameters (if successful). The method must return an
/// hb_bool_t indicating the success of the composition.
///
/// @ufuncs: A Unicode-functions structure
/// @ab: The code point to decompose
/// @a: (out): The first decomposed code point
/// @b: (out): The second decomposed code point
/// @user_data: user data pointer passed by the caller
///
/// Return value: `true` if @ab decomposed, `false` otherwise
public function hb_bool_t hb_unicode_decompose_func_t(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, hb_codepoint_t* a, hb_codepoint_t* b, void* user_data);

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the extents for a font, for horizontal-direction
/// text segments. Extents must be returned in an hb_glyph_extents output
/// parameter.
public typealias hb_font_get_font_h_extents_func_t = hb_font_get_font_extents_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the extents for a font, for vertical-direction
/// text segments. Extents must be returned in an hb_glyph_extents output
/// parameter.
public typealias hb_font_get_font_v_extents_func_t = hb_font_get_font_extents_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the advance for a specified glyph, in
/// horizontal-direction text segments. Advances must be returned in
/// an hb_position_t output parameter.
public typealias hb_font_get_glyph_h_advance_func_t = hb_font_get_glyph_advance_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the advance for a specified glyph, in
/// vertical-direction text segments. Advances must be returned in
/// an hb_position_t output parameter.
public typealias hb_font_get_glyph_v_advance_func_t = hb_font_get_glyph_advance_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the advances for a sequence of glyphs, in
/// horizontal-direction text segments.
public typealias hb_font_get_glyph_h_advances_func_t = hb_font_get_glyph_advances_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the advances for a sequence of glyphs, in
/// vertical-direction text segments.
public typealias hb_font_get_glyph_v_advances_func_t = hb_font_get_glyph_advances_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the (X,Y) coordinates (in scaled units) of the
/// origin for a glyph, for horizontal-direction text segments. Each
/// coordinate must be returned in an hb_position_t output parameter.
public typealias hb_font_get_glyph_h_origin_func_t = hb_font_get_glyph_origin_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the (X,Y) coordinates (in scaled units) of the
/// origin for a glyph, for vertical-direction text segments. Each coordinate
/// must be returned in an hb_position_t output parameter.
public typealias hb_font_get_glyph_v_origin_func_t = hb_font_get_glyph_origin_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the (X,Y) coordinates (in scaled units) of the
/// origin for requested glyph, for horizontal-direction text segments. Each
/// coordinate must be returned in a the x/y hb_position_t output parameters.
///
/// Since: 11.3.0
public typealias hb_font_get_glyph_h_origins_func_t = hb_font_get_glyph_origins_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the (X,Y) coordinates (in scaled units) of the
/// origin for requested glyph, for vertical-direction text segments. Each
/// coordinate must be returned in a the x/y hb_position_t output parameters.
///
/// Since: 11.3.0
public typealias hb_font_get_glyph_v_origins_func_t = hb_font_get_glyph_origins_func_t;

/// A virtual method for the hb_font_funcs_t of an hb_font_t object.
///
/// This method should retrieve the kerning-adjustment value for a glyph-pair in
/// the specified font, for horizontal text segments.
public typealias hb_font_get_glyph_h_kerning_func_t = hb_font_get_glyph_kerning_func_t;