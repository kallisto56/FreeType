namespace HarfBuzz;


using System;
using System.Interop;


static
{
	// ====================================================================
	// Constants
	// ====================================================================

	/// Use the implementation's finite default work budget.
	///
	/// Since: 14.5.0
	public const int64 HB_BUDGET_DEFAULT = -0x7FFFFFFFFFFFFFFF - 1;

	/// Use an effectively unlimited work budget. Structural safety limits remain
	/// active.
	///
	/// Since: 14.5.0
	public const int64 HB_BUDGET_UNLIMITED = 0x7FFFFFFFFFFFFFFF;

	/// Unused hb_codepoint_t value.
	///
	/// Since: 8.0.0
	public const hb_codepoint_t HB_CODEPOINT_INVALID = 0xFFFFFFFF;

	/// Unset hb_tag_t.
	public const hb_tag_t HB_TAG_NONE = 0;

	/// Maximum possible unsigned hb_tag_t.
	///
	/// Since: 0.9.26
	public const hb_tag_t HB_TAG_MAX = 0xFFFFFFFF;

	/// Maximum possible signed hb_tag_t.
	///
	/// Since: 0.9.33
	public const hb_tag_t HB_TAG_MAX_SIGNED = 0x7FFFFFFF;

	/// Special setting for hb_feature_t.start to apply the feature from the start
	/// of the buffer.
	///
	/// Since: 2.0.0
	public const c_int HB_FEATURE_GLOBAL_START = 0;

	/// Special setting for hb_feature_t.end to apply the feature from to the end
	/// of the buffer.
	///
	/// Since: 2.0.0
	public const c_uint HB_FEATURE_GLOBAL_END = 0xFFFFFFFF;

	/// The default code point for replacing invalid characters in a given encoding.
	/// Set to U+FFFD REPLACEMENT CHARACTER.
	///
	/// Since: 0.9.31
	public const c_uint HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT = 0xFFFD;

	/// Constant signifying that a font does not have any
	/// named-instance index set.  This is the default of
	/// a font.
	///
	/// Since: 7.0.0
	public const c_uint HB_FONT_NO_VAR_NAMED_INSTANCE = 0xFFFFFFFF;

	/// Unset hb_map_t value.
	///
	/// Since: 1.7.7
	public const hb_codepoint_t HB_MAP_VALUE_INVALID = 0xFFFFFFFF;

	/// Tag identifying PNG images in hb_paint_image_func_t callbacks.
	///
	/// Since: 7.0.0
	public const hb_tag_t HB_PAINT_IMAGE_FORMAT_PNG = 0x706E6720;

	/// Tag identifying SVG images in hb_paint_image_func_t callbacks.
	///
	/// Since: 7.0.0
	public const hb_tag_t HB_PAINT_IMAGE_FORMAT_SVG = 0x73766720;

	/// Tag identifying raw pixel-data images in hb_paint_image_func_t callbacks.
	/// The data is in BGRA pre-multiplied sRGBA color-space format.
	///
	/// Since: 7.0.0
	public const hb_tag_t HB_PAINT_IMAGE_FORMAT_BGRA = 0x42475241;

	/// Unset hb_set_t value.
	///
	/// Since: 0.9.21
	public const hb_codepoint_t HB_SET_VALUE_INVALID = 0xFFFFFFFF;

	/// Maximum valid Unicode code point.
	///
	/// Since: 1.9.0
	public const c_uint HB_UNICODE_MAX = 0x10FFFF;

	/// The major component of the library version available at compile-time.
	public const c_int HB_VERSION_MAJOR = 14;

	/// The minor component of the library version available at compile-time.
	public const c_int HB_VERSION_MINOR = 6;

	/// The micro component of the library version available at compile-time.
	public const c_int HB_VERSION_MICRO = 0;

	/// OpenType [Baseline Table](https://docs.microsoft.com/en-us/typography/opentype/spec/base).
	public const hb_tag_t HB_OT_TAG_BASE = 0x42415345;

	/// OpenType [Glyph Definition Table](https://docs.microsoft.com/en-us/typography/opentype/spec/gdef).
	public const hb_tag_t HB_OT_TAG_GDEF = 0x47444546;

	/// OpenType [Glyph Substitution Table](https://docs.microsoft.com/en-us/typography/opentype/spec/gsub).
	public const hb_tag_t HB_OT_TAG_GSUB = 0x47535542;

	/// OpenType [Glyph Positioning Table](https://docs.microsoft.com/en-us/typography/opentype/spec/gpos).
	public const hb_tag_t HB_OT_TAG_GPOS = 0x47504F53;

	/// OpenType [Justification Table](https://docs.microsoft.com/en-us/typography/opentype/spec/jstf).
	public const hb_tag_t HB_OT_TAG_JSTF = 0x4A535446;

	/// OpenType script tag, `DFLT`, for features that are not script-specific.
	public const hb_tag_t HB_OT_TAG_DEFAULT_SCRIPT = 0x44464C54;

	/// OpenType language tag, `dflt`. Not a valid language tag, but some fonts
	/// mistakenly use it.
	public const hb_tag_t HB_OT_TAG_DEFAULT_LANGUAGE = 0x64666C74;

	/// Maximum number of OpenType tags that can correspond to a give hb_script_t.
	///
	/// Since: 2.0.0
	public const c_uint HB_OT_MAX_TAGS_PER_SCRIPT = 3;

	/// Maximum number of OpenType tags that can correspond to a give hb_language_t.
	///
	/// Since: 2.0.0
	public const c_uint HB_OT_MAX_TAGS_PER_LANGUAGE = 3;

	/// Special value for script index indicating unsupported script.
	public const c_uint HB_OT_LAYOUT_NO_SCRIPT_INDEX = 0xFFFF;

	/// Special value for feature index indicating unsupported feature.
	public const c_uint HB_OT_LAYOUT_NO_FEATURE_INDEX = 0xFFFF;

	/// Special value for language index indicating default or unsupported language.
	public const c_uint HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = 0xFFFF;

	/// Special value for variations index indicating unsupported variation.
	public const c_uint HB_OT_LAYOUT_NO_VARIATIONS_INDEX = 0xFFFFFFFF;

	/// OpenType [Mathematical Typesetting Table](https://docs.microsoft.com/en-us/typography/opentype/spec/math).
	///
	/// Since: 1.3.3
	public const hb_tag_t HB_OT_TAG_MATH = 0x4D415448;

	/// OpenType script tag, `math`, for features specific to math shaping.
	///
	/// <note>HB_OT_TAG_MATH_SCRIPT is not a valid hb_script_t and should only be
	/// used with functions that accept raw OpenType script tags, such as
	/// hb_ot_layout_collect_features. In other cases, HB_SCRIPT_MATH should be
	/// used instead.</note>
	///
	/// Since: 3.4.0
	public const hb_tag_t HB_OT_TAG_MATH_SCRIPT = 0x6D617468;

	/// The serial number of the current internal buffer format.
	///
	/// The serial number will increase when internal hb_glyph_info_t and
	/// hb_glyph_position_t members change their format.
	///
	/// Since: 13.2.0
	public const c_int HB_OT_SHAPE_BUFFER_FORMAT_SERIAL = 1;

	/// Registered tag for the roman/italic axis.
	public const hb_tag_t HB_OT_TAG_VAR_AXIS_ITALIC = 0x6974616C;

	/// Registered tag for the optical-size axis.
	/// <note>Note: The optical-size axis supersedes the OpenType `size` feature.</note>
	public const hb_tag_t HB_OT_TAG_VAR_AXIS_OPTICAL_SIZE = 0x6F70737A;

	/// Registered tag for the slant axis
	public const hb_tag_t HB_OT_TAG_VAR_AXIS_SLANT = 0x736C6E74;

	/// Registered tag for the width axis.
	public const hb_tag_t HB_OT_TAG_VAR_AXIS_WIDTH = 0x77647468;

	/// Registered tag for the weight axis.
	public const hb_tag_t HB_OT_TAG_VAR_AXIS_WEIGHT = 0x77676874;

	public const c_uint HB_AAT_LAYOUT_NO_SELECTOR_INDEX = 0xFFFF;

	// ====================================================================
	// Macro helpers
	// ====================================================================

	/// Constructs an hb_tag_t from four character literals.
	///
	/// @c1: 1st character of the tag
	/// @c2: 2nd character of the tag
	/// @c3: 3rd character of the tag
	/// @c4: 4th character of the tag
	[Inline]
	public static hb_tag_t HB_TAG(char8 c1, char8 c2, char8 c3, char8 c4)
	{
		return (((hb_tag_t)c1 & 0xFF) << 24) | (((hb_tag_t)c2 & 0xFF) << 16) | (((hb_tag_t)c3 & 0xFF) << 8) | ((hb_tag_t)c4 & 0xFF);
	}

	/// Tests whether a text direction is valid.
	///
	/// @dir: hb_direction_t to test
	[Inline]
	public static bool HB_DIRECTION_IS_VALID(hb_direction_t dir)
	{
		return (((c_uint)dir) & 0xFFFFFFFC) == 4;
	}

	/// Tests whether a text direction is horizontal. Requires
	/// that the direction be valid.
	///
	/// @dir: hb_direction_t to test
	[Inline]
	public static bool HB_DIRECTION_IS_HORIZONTAL(hb_direction_t dir)
	{
		return (((c_uint)dir) & 0xFFFFFFFE) == 4;
	}

	/// Tests whether a text direction is vertical. Requires
	/// that the direction be valid.
	///
	/// @dir: hb_direction_t to test
	[Inline]
	public static bool HB_DIRECTION_IS_VERTICAL(hb_direction_t dir)
	{
		return (((c_uint)dir) & 0xFFFFFFFE) == 6;
	}

	/// Tests whether a text direction moves forward (from left to right, or from
	/// top to bottom). Requires that the direction be valid.
	///
	/// @dir: hb_direction_t to test
	[Inline]
	public static bool HB_DIRECTION_IS_FORWARD(hb_direction_t dir)
	{
		return (((c_uint)dir) & 0xFFFFFFFD) == 4;
	}

	/// Tests whether a text direction moves backward (from right to left, or from
	/// bottom to top). Requires that the direction be valid.
	///
	/// @dir: hb_direction_t to test
	[Inline]
	public static bool HB_DIRECTION_IS_BACKWARD(hb_direction_t dir)
	{
		return (((c_uint)dir) & 0xFFFFFFFD) == 5;
	}

	/// Reverses a text direction. Requires that the direction
	/// be valid.
	///
	/// @dir: hb_direction_t to reverse
	[Inline]
	public static hb_direction_t HB_DIRECTION_REVERSE(hb_direction_t dir)
	{
		return (hb_direction_t)(((c_uint)dir) ^ 1);
	}

	/// Constructs an hb_color_t from four integers.
	///
	/// @b: blue channel value
	/// @g: green channel value
	/// @r: red channel value
	/// @a: alpha channel value
	///
	/// Since: 2.1.0
	[Inline]
	public static hb_color_t HB_COLOR(uint8 b, uint8 g, uint8 r, uint8 a)
	{
		return ((hb_color_t)b << 24) | ((hb_color_t)g << 16) | ((hb_color_t)r << 8) | (hb_color_t)a;
	}

	/// Fetches the alpha channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Alpha channel value
	///
	/// Since: 2.1.0
	[Inline]
	public static uint8 hb_color_get_alpha(hb_color_t color)
	{
		return (uint8)(color & 0xFF);
	}

	/// Fetches the red channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Red channel value
	///
	/// Since: 2.1.0
	[Inline]
	public static uint8 hb_color_get_red(hb_color_t color)
	{
		return (uint8)((color >> 8) & 0xFF);
	}

	/// Fetches the green channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Green channel value
	///
	/// Since: 2.1.0
	[Inline]
	public static uint8 hb_color_get_green(hb_color_t color)
	{
		return (uint8)((color >> 16) & 0xFF);
	}

	/// Fetches the blue channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Blue channel value
	///
	/// Since: 2.1.0
	[Inline]
	public static uint8 hb_color_get_blue(hb_color_t color)
	{
		return (uint8)((color >> 24) & 0xFF);
	}

	/// Tests the library version at compile-time against a minimum value,
	/// as three integer components.
	///
	/// @major: the major component of the version number
	/// @minor: the minor component of the version number
	/// @micro: the micro component of the version number
	[Inline]
	public static bool HB_VERSION_ATLEAST(c_uint major, c_uint minor, c_uint micro)
	{
		return ((c_uint)HB_VERSION_MAJOR * 10000 + (c_uint)HB_VERSION_MINOR * 100 + (c_uint)HB_VERSION_MICRO) >= (major * 10000 + minor * 100 + micro);
	}

	/// Tests whether a cluster level groups cluster values into monotone order.
	/// Requires that the level be valid.
	///
	/// @level: hb_buffer_cluster_level_t to test
	///
	/// Since: 11.0.0
	[Inline]
	public static bool HB_BUFFER_CLUSTER_LEVEL_IS_MONOTONE(hb_buffer_cluster_level_t level)
	{
		return ((1U << (c_uint)level) & ((1U << (c_uint)hb_buffer_cluster_level_t.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES) | (1U << (c_uint)hb_buffer_cluster_level_t.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS))) != 0;
	}

	/// Tests whether a cluster level groups cluster values by graphemes. Requires
	/// that the level be valid.
	///
	/// @level: hb_buffer_cluster_level_t to test
	///
	/// Since: 11.0.0
	[Inline]
	public static bool HB_BUFFER_CLUSTER_LEVEL_IS_GRAPHEMES(hb_buffer_cluster_level_t level)
	{
		return ((1U << (c_uint)level) & ((1U << (c_uint)hb_buffer_cluster_level_t.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES) | (1U << (c_uint)hb_buffer_cluster_level_t.HB_BUFFER_CLUSTER_LEVEL_GRAPHEMES))) != 0;
	}

	/// Tests whether a cluster level does not group cluster values by graphemes.
	/// Requires that the level be valid.
	///
	/// @level: hb_buffer_cluster_level_t to test
	///
	/// Since: 11.0.0
	[Inline]
	public static bool HB_BUFFER_CLUSTER_LEVEL_IS_CHARACTERS(hb_buffer_cluster_level_t level)
	{
		return ((1U << (c_uint)level) & ((1U << (c_uint)hb_buffer_cluster_level_t.HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS) | (1U << (c_uint)hb_buffer_cluster_level_t.HB_BUFFER_CLUSTER_LEVEL_CHARACTERS))) != 0;
	}
}