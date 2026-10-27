namespace FreeType;


using System;
using System.Interop;


/// The FreeType error code type.  A value of 0 is always interpreted as a
/// successful operation.
public enum FT_Error : c_int
{
	/// no error
	FT_Err_Ok = 0x00,
	/// cannot open resource
	FT_Err_Cannot_Open_Resource = 0x01,
	/// unknown file format
	FT_Err_Unknown_File_Format = 0x02,
	/// broken file
	FT_Err_Invalid_File_Format = 0x03,
	/// invalid FreeType version
	FT_Err_Invalid_Version = 0x04,
	/// module version is too low
	FT_Err_Lower_Module_Version = 0x05,
	/// invalid argument
	FT_Err_Invalid_Argument = 0x06,
	/// unimplemented feature
	FT_Err_Unimplemented_Feature = 0x07,
	/// broken table
	FT_Err_Invalid_Table = 0x08,
	/// broken offset within table
	FT_Err_Invalid_Offset = 0x09,
	/// array allocation size too large
	FT_Err_Array_Too_Large = 0x0A,
	/// missing module
	FT_Err_Missing_Module = 0x0B,
	/// missing property
	FT_Err_Missing_Property = 0x0C,
	/// invalid glyph index
	FT_Err_Invalid_Glyph_Index = 0x10,
	/// invalid character code
	FT_Err_Invalid_Character_Code = 0x11,
	/// unsupported glyph image format
	FT_Err_Invalid_Glyph_Format = 0x12,
	/// cannot render this glyph format
	FT_Err_Cannot_Render_Glyph = 0x13,
	/// invalid outline
	FT_Err_Invalid_Outline = 0x14,
	/// invalid composite glyph
	FT_Err_Invalid_Composite = 0x15,
	/// too many hints
	FT_Err_Too_Many_Hints = 0x16,
	/// invalid pixel size
	FT_Err_Invalid_Pixel_Size = 0x17,
	/// invalid SVG document
	FT_Err_Invalid_SVG_Document = 0x18,
	/// invalid object handle
	FT_Err_Invalid_Handle = 0x20,
	/// invalid library handle
	FT_Err_Invalid_Library_Handle = 0x21,
	/// invalid module handle
	FT_Err_Invalid_Driver_Handle = 0x22,
	/// invalid face handle
	FT_Err_Invalid_Face_Handle = 0x23,
	/// invalid size handle
	FT_Err_Invalid_Size_Handle = 0x24,
	/// invalid glyph slot handle
	FT_Err_Invalid_Slot_Handle = 0x25,
	/// invalid charmap handle
	FT_Err_Invalid_CharMap_Handle = 0x26,
	/// invalid cache manager handle
	FT_Err_Invalid_Cache_Handle = 0x27,
	/// invalid stream handle
	FT_Err_Invalid_Stream_Handle = 0x28,
	/// too many modules
	FT_Err_Too_Many_Drivers = 0x30,
	/// too many extensions
	FT_Err_Too_Many_Extensions = 0x31,
	/// out of memory
	FT_Err_Out_Of_Memory = 0x40,
	/// unlisted object
	FT_Err_Unlisted_Object = 0x41,
	/// cannot open stream
	FT_Err_Cannot_Open_Stream = 0x51,
	/// invalid stream seek
	FT_Err_Invalid_Stream_Seek = 0x52,
	/// invalid stream skip
	FT_Err_Invalid_Stream_Skip = 0x53,
	/// invalid stream read
	FT_Err_Invalid_Stream_Read = 0x54,
	/// invalid stream operation
	FT_Err_Invalid_Stream_Operation = 0x55,
	/// invalid frame operation
	FT_Err_Invalid_Frame_Operation = 0x56,
	/// nested frame access
	FT_Err_Nested_Frame_Access = 0x57,
	/// invalid frame read
	FT_Err_Invalid_Frame_Read = 0x58,
	/// raster uninitialized
	FT_Err_Raster_Uninitialized = 0x60,
	/// raster corrupted
	FT_Err_Raster_Corrupted = 0x61,
	/// raster overflow
	FT_Err_Raster_Overflow = 0x62,
	/// negative height while rastering
	FT_Err_Raster_Negative_Height = 0x63,
	/// too many registered caches
	FT_Err_Too_Many_Caches = 0x70,
	/// invalid opcode
	FT_Err_Invalid_Opcode = 0x80,
	/// too few arguments
	FT_Err_Too_Few_Arguments = 0x81,
	/// stack overflow
	FT_Err_Stack_Overflow = 0x82,
	/// code overflow
	FT_Err_Code_Overflow = 0x83,
	/// bad argument
	FT_Err_Bad_Argument = 0x84,
	/// division by zero
	FT_Err_Divide_By_Zero = 0x85,
	/// invalid reference
	FT_Err_Invalid_Reference = 0x86,
	/// found debug opcode
	FT_Err_Debug_OpCode = 0x87,
	/// found ENDF opcode in execution stream
	FT_Err_ENDF_In_Exec_Stream = 0x88,
	/// nested DEFS
	FT_Err_Nested_DEFS = 0x89,
	/// invalid code range
	FT_Err_Invalid_CodeRange = 0x8A,
	/// execution context too long
	FT_Err_Execution_Too_Long = 0x8B,
	/// too many function definitions
	FT_Err_Too_Many_Function_Defs = 0x8C,
	/// too many instruction definitions
	FT_Err_Too_Many_Instruction_Defs = 0x8D,
	/// SFNT font table missing
	FT_Err_Table_Missing = 0x8E,
	/// horizontal header (hhea) table missing
	FT_Err_Horiz_Header_Missing = 0x8F,
	/// locations (loca) table missing
	FT_Err_Locations_Missing = 0x90,
	/// name table missing
	FT_Err_Name_Table_Missing = 0x91,
	/// character map (cmap) table missing
	FT_Err_CMap_Table_Missing = 0x92,
	/// horizontal metrics (hmtx) table missing
	FT_Err_Hmtx_Table_Missing = 0x93,
	/// PostScript (post) table missing
	FT_Err_Post_Table_Missing = 0x94,
	/// invalid horizontal metrics
	FT_Err_Invalid_Horiz_Metrics = 0x95,
	/// invalid character map (cmap) format
	FT_Err_Invalid_CharMap_Format = 0x96,
	/// invalid ppem value
	FT_Err_Invalid_PPem = 0x97,
	/// invalid vertical metrics
	FT_Err_Invalid_Vert_Metrics = 0x98,
	/// could not find context
	FT_Err_Could_Not_Find_Context = 0x99,
	/// invalid PostScript (post) table format
	FT_Err_Invalid_Post_Table_Format = 0x9A,
	/// invalid PostScript (post) table
	FT_Err_Invalid_Post_Table = 0x9B,
	/// found FDEF or IDEF opcode in glyf bytecode
	FT_Err_DEF_In_Glyf_Bytecode = 0x9C,
	/// missing bitmap in strike
	FT_Err_Missing_Bitmap = 0x9D,
	/// SVG hooks have not been set
	FT_Err_Missing_SVG_Hooks = 0x9E,
	/// opcode syntax error
	FT_Err_Syntax_Error = 0xA0,
	/// argument stack underflow
	FT_Err_Stack_Underflow = 0xA1,
	/// ignore
	FT_Err_Ignore = 0xA2,
	/// no Unicode glyph name found
	FT_Err_No_Unicode_Glyph_Name = 0xA3,
	/// glyph too big for hinting
	FT_Err_Glyph_Too_Big = 0xA4,
	/// `STARTFONT' field missing
	FT_Err_Missing_Startfont_Field = 0xB0,
	/// `FONT' field missing
	FT_Err_Missing_Font_Field = 0xB1,
	/// `SIZE' field missing
	FT_Err_Missing_Size_Field = 0xB2,
	/// `FONTBOUNDINGBOX' field missing
	FT_Err_Missing_Fontboundingbox_Field = 0xB3,
	/// `CHARS' field missing
	FT_Err_Missing_Chars_Field = 0xB4,
	/// `STARTCHAR' field missing
	FT_Err_Missing_Startchar_Field = 0xB5,
	/// `ENCODING' field missing
	FT_Err_Missing_Encoding_Field = 0xB6,
	/// `BBX' field missing
	FT_Err_Missing_Bbx_Field = 0xB7,
	/// `BBX' too big
	FT_Err_Bbx_Too_Big = 0xB8,
	/// Font header corrupted or missing fields
	FT_Err_Corrupted_Font_Header = 0xB9,
	/// Font glyphs corrupted or missing fields
	FT_Err_Corrupted_Font_Glyphs = 0xBA
}

/// An enumeration to specify character sets supported by charmaps.  Used
/// in the FT_Select_Charmap API function.
///
/// @note:
///   Despite the name, this enumeration lists specific character
///   repertoires (i.e., charsets), and not text encoding methods (e.g.,
///   UTF-8, UTF-16, etc.).
///
///   Other encodings might be defined in the future.
///
/// @note:
///   When loading a font, FreeType makes a Unicode charmap active if
///   possible (either if the font provides such a charmap, or if FreeType
///   can synthesize one from PostScript glyph name dictionaries; in either
///   case, the charmap is tagged with `FT_ENCODING_UNICODE`).  If such a
///   charmap is synthesized, it is placed at the first position of the
///   charmap array.
///
///   All other encodings are considered legacy and tagged only if
///   explicitly defined in the font file.  Otherwise, `FT_ENCODING_NONE` is
///   used.
///
///   `FT_ENCODING_NONE` is set by the BDF and PCF drivers if the charmap is
///   neither Unicode nor ISO-8859-1 (otherwise it is set to
///   `FT_ENCODING_UNICODE`).  Use FT_Get_BDF_Charset_ID to find out which
///   encoding is really present.  If, for example, the `cs_registry` field
///   is 'KOI8' and the `cs_encoding` field is 'R', the font is encoded in
///   KOI8-R.
///
///   `FT_ENCODING_NONE` is always set (with a single exception) by the
///   winfonts driver.  Use FT_Get_WinFNT_Header and examine the `charset`
///   field of the FT_WinFNT_HeaderRec structure to find out which encoding
///   is really present.  For example, FT_WinFNT_ID_CP1251 (204) means
///   Windows code page 1251 (for Russian).
///
///   `FT_ENCODING_NONE` is set if `platform_id` is TT_PLATFORM_MACINTOSH
///   and `encoding_id` is not `TT_MAC_ID_ROMAN` (otherwise it is set to
///   `FT_ENCODING_APPLE_ROMAN`).
///
///   If `platform_id` is TT_PLATFORM_MACINTOSH, use the function
///   FT_Get_CMap_Language_ID to query the Mac language ID that may be
///   needed to be able to distinguish Apple encoding variants.  See
///
///     https://www.unicode.org/Public/MAPPINGS/VENDORS/APPLE/Readme.txt
///
///   to get an idea how to do that.  Basically, if the language ID is 0,
///   don't use it, otherwise subtract 1 from the language ID.  Then examine
///   `encoding_id`.  If, for example, `encoding_id` is `TT_MAC_ID_ROMAN`
///   and the language ID (minus 1) is `TT_MAC_LANGID_GREEK`, it is the
///   Greek encoding, not Roman.  `TT_MAC_ID_ARABIC` with
///   `TT_MAC_LANGID_FARSI` means the Farsi variant of the Arabic encoding.
[AllowDuplicates]
public enum FT_Encoding : c_int
{
	/// The encoding value 0 is reserved for all formats except BDF, PCF,
	/// and Windows FNT; see below for more information.
	FT_ENCODING_NONE = 0,

	/// Microsoft Symbol encoding, used to encode mathematical symbols and
	/// wingdings.  For more information, see
	/// 'https://learn.microsoft.com/typography/opentype/spec/recom#non-standard-symbol-fonts',
	/// 'http://www.kostis.net/charsets/symbol.htm', and
	/// 'http://www.kostis.net/charsets/wingding.htm'.
	///
	/// This encoding uses character codes from the PUA (Private Unicode
	/// Area) in the range U+F020-U+F0FF.
	FT_ENCODING_MS_SYMBOL = 0x73796D62,

	/// The Unicode character set.  This value covers all versions of the
	/// Unicode repertoire, including ASCII and Latin-1.  Most fonts include
	/// a Unicode charmap, but not all of them.
	///
	/// For example, if you want to access Unicode value U+1F028 (and the
	/// font contains it), use value 0x1F028 as the input value for
	/// FT_Get_Char_Index.
	FT_ENCODING_UNICODE = 0x756E6963,

	/// Shift JIS encoding for Japanese.  More info at
	/// 'https://en.wikipedia.org/wiki/Shift_JIS'.  See note on multi-byte
	/// encodings below.
	FT_ENCODING_SJIS = 0x736A6973,

	/// Corresponds to encoding systems mainly for Simplified Chinese as
	/// used in People's Republic of China (PRC).  The encoding layout is
	/// based on GB 2312 and its supersets GBK and GB 18030.
	FT_ENCODING_PRC = 0x67622020,

	/// Corresponds to an encoding system for Traditional Chinese as used in
	/// Taiwan and Hong Kong.
	FT_ENCODING_BIG5 = 0x62696735,

	/// Corresponds to the Korean encoding system known as Extended Wansung
	/// (MS Windows code page 949).  For more information see
	/// 'https://www.unicode.org/Public/MAPPINGS/VENDORS/MICSFT/WindowsBestFit/bestfit949.txt'.
	FT_ENCODING_WANSUNG = 0x77616E73,

	/// The Korean standard character set (KS C 5601-1992), which
	/// corresponds to MS Windows code page 1361.  This character set
	/// includes all possible Hangul character combinations.
	FT_ENCODING_JOHAB = 0x6A6F6861,

	FT_ENCODING_GB2312 = 0x67622020,
	/// Same as FT_ENCODING_SJIS.  Deprecated.
	FT_ENCODING_MS_SJIS = 0x736A6973,

	/// Same as FT_ENCODING_PRC.  Deprecated.
	FT_ENCODING_MS_GB2312 = 0x67622020,

	/// Same as FT_ENCODING_BIG5.  Deprecated.
	FT_ENCODING_MS_BIG5 = 0x62696735,

	/// Same as FT_ENCODING_WANSUNG.  Deprecated.
	FT_ENCODING_MS_WANSUNG = 0x77616E73,

	/// Same as FT_ENCODING_JOHAB.  Deprecated.
	FT_ENCODING_MS_JOHAB = 0x6A6F6861,

	/// Adobe Standard encoding, as found in Type 1, CFF, and OpenType/CFF
	/// fonts.  It is limited to 256 character codes.
	FT_ENCODING_ADOBE_STANDARD = 0x41444F42,

	/// Adobe Expert encoding, as found in Type 1, CFF, and OpenType/CFF
	/// fonts.  It is limited to 256 character codes.
	FT_ENCODING_ADOBE_EXPERT = 0x41444245,

	/// Corresponds to a custom encoding, as found in Type 1, CFF, and
	/// OpenType/CFF fonts.  It is limited to 256 character codes.
	FT_ENCODING_ADOBE_CUSTOM = 0x41444243,

	/// Corresponds to a Latin-1 encoding as defined in a Type 1 PostScript
	/// font.  It is limited to 256 character codes.
	FT_ENCODING_ADOBE_LATIN_1 = 0x6C617431,

	/// This value is deprecated and was neither used nor reported by
	/// FreeType.  Don't use or test for it.
	FT_ENCODING_OLD_LATIN_2 = 0x6C617432,

	/// Apple roman encoding.  Many TrueType and OpenType fonts contain a
	/// charmap for this 8-bit encoding, since older versions of Mac OS are
	/// able to use it.
	FT_ENCODING_APPLE_ROMAN = 0x61726D6E
}

/// Render modes supported by FreeType 2.  Each mode corresponds to a
/// specific type of scanline conversion performed on the outline.
///
/// For bitmap fonts and embedded bitmaps the `bitmap->pixel_mode` field
/// in the FT_GlyphSlotRec structure gives the format of the returned
/// bitmap.
///
/// All modes except FT_RENDER_MODE_MONO use 256 levels of opacity,
/// indicating pixel coverage.  Use linear alpha blending and gamma
/// correction to correctly render non-monochrome glyph bitmaps onto a
/// surface; see FT_Render_Glyph.
///
/// The FT_RENDER_MODE_SDF is a special render mode that uses up to 256
/// distance values, indicating the signed distance from the grid position
/// to the nearest outline.
///
/// @note:
///   The selected render mode only affects scalable vector glyphs of a font.
///   Embedded bitmaps often have a different pixel mode like
///   FT_PIXEL_MODE_MONO.  You can use FT_Bitmap_Convert to transform them
///   into 8-bit pixmaps.
public enum FT_Render_Mode : c_int
{
	/// Default render mode; it corresponds to 8-bit anti-aliased bitmaps.
	FT_RENDER_MODE_NORMAL = 0,

	/// This is equivalent to FT_RENDER_MODE_NORMAL.  It is only defined as
	/// a separate value because render modes are also used indirectly to
	/// define hinting algorithm selectors.  See FT_LOAD_TARGET_XXX for
	/// details.
	FT_RENDER_MODE_LIGHT = 1,

	/// This mode corresponds to 1-bit bitmaps (with 2 levels of opacity).
	FT_RENDER_MODE_MONO = 2,

	/// This mode corresponds to horizontal RGB and BGR subpixel displays
	/// like LCD screens.  It produces 8-bit bitmaps that are 3 times the
	/// width of the original glyph outline in pixels, and which use the
	/// FT_PIXEL_MODE_LCD mode.
	FT_RENDER_MODE_LCD = 3,

	/// This mode corresponds to vertical RGB and BGR subpixel displays
	/// (like PDA screens, rotated LCD displays, etc.).  It produces 8-bit
	/// bitmaps that are 3 times the height of the original glyph outline in
	/// pixels and use the FT_PIXEL_MODE_LCD_V mode.
	FT_RENDER_MODE_LCD_V = 4,

	/// The positive (unsigned) 8-bit bitmap values can be converted to the
	/// single-channel signed distance field (SDF) by subtracting 128, with
	/// the positive and negative results corresponding to the inside and
	/// the outside of a glyph contour, respectively.  The distance units are
	/// arbitrarily determined by an adjustable spread property.
	FT_RENDER_MODE_SDF = 5,

	FT_RENDER_MODE_MAX = 6
}

/// An enumeration to specify the format of kerning values returned by
/// FT_Get_Kerning.
///
/// @note:
///   `FT_KERNING_DEFAULT` returns full pixel values; it also makes FreeType
///   heuristically scale down kerning distances at small ppem values so
///   that they don't become too big.
///
///   Both `FT_KERNING_DEFAULT` and `FT_KERNING_UNFITTED` use the current
///   horizontal scaling factor (as set e.g. with FT_Set_Char_Size) to
///   convert font units to pixels.
public enum FT_Kerning_Mode : c_int
{
	/// Return grid-fitted kerning distances in 26.6 fractional pixels.
	FT_KERNING_DEFAULT = 0,

	/// Return un-grid-fitted kerning distances in 26.6 fractional pixels.
	FT_KERNING_UNFITTED = 1,

	/// Return the kerning vector in original font units.
	FT_KERNING_UNSCALED = 2
}

public enum FT_Size_Request_Type : c_int
{
	FT_SIZE_REQUEST_TYPE_NOMINAL = 0,
	FT_SIZE_REQUEST_TYPE_REAL_DIM = 1,
	FT_SIZE_REQUEST_TYPE_BBOX = 2,
	FT_SIZE_REQUEST_TYPE_CELL = 3,
	FT_SIZE_REQUEST_TYPE_SCALES = 4,
	FT_SIZE_REQUEST_TYPE_MAX = 5
}

/// An enumeration type used to describe the format of pixels in a given
/// bitmap.  Note that additional formats may be added in the future.
public enum FT_Pixel_Mode : c_uchar
{
	/// Value 0 is reserved.
	FT_PIXEL_MODE_NONE = 0,

	/// A monochrome bitmap, using 1 bit per pixel.  Note that pixels are
	/// stored in most-significant order (MSB), which means that the
	/// left-most pixel in a byte has value 128.
	FT_PIXEL_MODE_MONO = 1,

	/// An 8-bit bitmap, generally used to represent anti-aliased glyph
	/// images.  Each pixel is stored in one byte.  Note that the number of
	/// 'gray' levels is stored in the `num_grays` field of the FT_Bitmap
	/// structure (it generally is 256).
	FT_PIXEL_MODE_GRAY = 2,

	/// A 2-bit per pixel bitmap, used to represent embedded anti-aliased
	/// bitmaps in font files according to the OpenType specification.  We
	/// haven't found a single font using this format, however.
	FT_PIXEL_MODE_GRAY2 = 3,

	/// A 4-bit per pixel bitmap, representing embedded anti-aliased bitmaps
	/// in font files according to the OpenType specification.  We haven't
	/// found a single font using this format, however.
	FT_PIXEL_MODE_GRAY4 = 4,

	/// An 8-bit bitmap, representing RGB or BGR decimated glyph images used
	/// for display on LCD displays; the bitmap is three times wider than
	/// the original glyph image.  See also FT_RENDER_MODE_LCD.
	FT_PIXEL_MODE_LCD = 5,

	/// An 8-bit bitmap, representing RGB or BGR decimated glyph images used
	/// for display on rotated LCD displays; the bitmap is three times
	/// taller than the original glyph image.  See also
	/// FT_RENDER_MODE_LCD_V.
	FT_PIXEL_MODE_LCD_V = 6,

	/// [Since 2.5] An image with four 8-bit channels per pixel,
	/// representing a color image (such as emoticons) with alpha channel.
	/// For each pixel, the format is BGRA, which means, the blue channel
	/// comes first in memory.  The color channels are pre-multiplied and in
	/// the sRGB colorspace.  For example, full red at half-translucent
	/// opacity will be represented as '00,00,80,80', not '00,00,FF,80'.
	/// See also FT_LOAD_COLOR.
	FT_PIXEL_MODE_BGRA = 7,

	FT_PIXEL_MODE_MAX = 8
}

/// An enumeration type used to describe the format of a given glyph
/// image.  Note that this version of FreeType only supports two image
/// formats, even though future font drivers will be able to register
/// their own format.
public enum FT_Glyph_Format : c_int
{
	/// The value 0 is reserved.
	FT_GLYPH_FORMAT_NONE = 0,

	/// The glyph image is a composite of several other images.  This format
	/// is _only_ used with FT_LOAD_NO_RECURSE, and is used to report
	/// compound glyphs (like accented characters).
	FT_GLYPH_FORMAT_COMPOSITE = 0x636F6D70,

	/// The glyph image is a bitmap, and can be described as an FT_Bitmap.
	/// You generally need to access the `bitmap` field of the
	/// FT_GlyphSlotRec structure to read it.
	FT_GLYPH_FORMAT_BITMAP = 0x62697473,

	/// The glyph image is a vectorial outline made of line segments and
	/// Bezier arcs; it can be described as an FT_Outline; you generally
	/// want to access the `outline` field of the FT_GlyphSlotRec structure
	/// to read it.
	FT_GLYPH_FORMAT_OUTLINE = 0x6F75746C,

	/// The glyph image is a vectorial path with no inside and outside
	/// contours.  Some Type 1 fonts, like those in the Hershey family,
	/// contain glyphs in this format.  These are described as FT_Outline,
	/// but FreeType isn't currently capable of rendering them correctly.
	FT_GLYPH_FORMAT_PLOTTER = 0x706C6F74,

	/// [Since 2.12] The glyph is represented by an SVG document in the
	/// 'SVG ' table.
	FT_GLYPH_FORMAT_SVG = 0x53564720
}

/// A list of values used to describe an outline's contour orientation.
///
/// The TrueType and PostScript specifications use different conventions
/// to determine whether outline contours should be filled or unfilled.
[AllowDuplicates]
public enum FT_Orientation : c_int
{
	/// According to the TrueType specification, clockwise contours must be
	/// filled, and counter-clockwise ones must be unfilled.
	FT_ORIENTATION_TRUETYPE = 0,

	/// According to the PostScript specification, counter-clockwise
	/// contours must be filled, and clockwise ones must be unfilled.
	FT_ORIENTATION_POSTSCRIPT = 1,

	/// This is identical to FT_ORIENTATION_TRUETYPE, but is used to
	/// remember that in TrueType, everything that is to the right of the
	/// drawing direction of a contour must be filled.
	FT_ORIENTATION_FILL_RIGHT = 0,

	/// This is identical to FT_ORIENTATION_POSTSCRIPT, but is used to
	/// remember that in PostScript, everything that is to the left of the
	/// drawing direction of a contour must be filled.
	FT_ORIENTATION_FILL_LEFT = 1,

	/// The orientation cannot be determined.  That is, different parts of
	/// the glyph have different orientation.
	FT_ORIENTATION_NONE = 2
}

/// The mode how the values of FT_Glyph_Get_CBox are returned.
[AllowDuplicates]
public enum FT_Glyph_BBox_Mode : c_int
{
	/// Return unscaled font units.
	FT_GLYPH_BBOX_UNSCALED = 0,

	/// Return unfitted 26.6 coordinates.
	FT_GLYPH_BBOX_SUBPIXELS = 0,

	/// Return grid-fitted 26.6 coordinates.
	FT_GLYPH_BBOX_GRIDFIT = 1,

	/// Return coordinates in integer pixels.
	FT_GLYPH_BBOX_TRUNCATE = 2,

	/// Return grid-fitted pixel coordinates.
	FT_GLYPH_BBOX_PIXELS = 3
}

/// A list of values to identify various types of LCD filters.
///
/// @since:
///   2.3.0
public enum FT_LcdFilter : c_int
{
	/// Do not perform filtering.  When used with subpixel rendering, this
	/// results in sometimes severe color fringes.
	FT_LCD_FILTER_NONE = 0,

	/// This is a beveled, normalized, and color-balanced five-tap filter
	/// with weights of [0x08 0x4D 0x56 0x4D 0x08] in 1/256 units.
	FT_LCD_FILTER_DEFAULT = 1,

	/// this is a boxy, normalized, and color-balanced three-tap filter with
	/// weights of [0x00 0x55 0x56 0x55 0x00] in 1/256 units.
	FT_LCD_FILTER_LIGHT = 2,

	/// The legacy libXft color filter is no longer supported and ignored.
	FT_LCD_FILTER_LEGACY1 = 3,

	FT_LCD_FILTER_LEGACY = 16,
	FT_LCD_FILTER_MAX = 17
}

/// A list of values describing which kind of TrueType bytecode engine is
/// implemented in a given FT_Library instance.  It is used by the
/// FT_Get_TrueType_Engine_Type function.
///
/// @since:
///   2.2
public enum FT_TrueTypeEngineType : c_int
{
	/// The library doesn't implement any kind of bytecode interpreter.
	FT_TRUETYPE_ENGINE_TYPE_NONE = 0,

	/// Deprecated and removed.
	FT_TRUETYPE_ENGINE_TYPE_UNPATENTED = 1,

	/// The library implements a bytecode interpreter that covers the full
	/// instruction set of the TrueType virtual machine (this was governed
	/// by patents until May 2010, hence the name).
	FT_TRUETYPE_ENGINE_TYPE_PATENTED = 2
}

/// These values determine how two joining lines are rendered in a
/// stroker.
[AllowDuplicates]
public enum FT_Stroker_LineJoin : c_int
{
	/// Used to render rounded line joins.  Circular arcs are used to join
	/// two lines smoothly.
	FT_STROKER_LINEJOIN_ROUND = 0,

	/// Used to render beveled line joins.  The outer corner of the joined
	/// lines is filled by enclosing the triangular region of the corner
	/// with a straight line between the outer corners of each stroke.
	FT_STROKER_LINEJOIN_BEVEL = 1,

	FT_STROKER_LINEJOIN_MITER_VARIABLE = 2,
	/// Used to render mitered line joins, with variable bevels if the miter
	/// limit is exceeded.  The intersection of the strokes is clipped
	/// perpendicularly to the bisector, at a distance corresponding to
	/// the miter limit. This prevents long spikes being created.
	/// `FT_STROKER_LINEJOIN_MITER_VARIABLE` generates a mitered line join
	/// as used in XPS.  `FT_STROKER_LINEJOIN_MITER` is an alias for
	/// `FT_STROKER_LINEJOIN_MITER_VARIABLE`, retained for backward
	/// compatibility.
	FT_STROKER_LINEJOIN_MITER = 2,

	/// Used to render mitered line joins, with fixed bevels if the miter
	/// limit is exceeded.  The outer edges of the strokes for the two
	/// segments are extended until they meet at an angle.  A bevel join
	/// (see above) is used if the segments meet at too sharp an angle and
	/// the outer edges meet beyond a distance corresponding to the meter
	/// limit.  This prevents long spikes being created.
	/// `FT_STROKER_LINEJOIN_MITER_FIXED` generates a miter line join as
	/// used in PostScript and PDF.
	FT_STROKER_LINEJOIN_MITER_FIXED = 3
}

/// These values determine how the end of opened sub-paths are rendered in
/// a stroke.
public enum FT_Stroker_LineCap : c_int
{
	/// The end of lines is rendered as a full stop on the last point
	/// itself.
	FT_STROKER_LINECAP_BUTT = 0,

	/// The end of lines is rendered as a half-circle around the last point.
	FT_STROKER_LINECAP_ROUND = 1,

	/// The end of lines is rendered as a square around the last point.
	FT_STROKER_LINECAP_SQUARE = 2
}

/// These values are used to select a given stroke border in
/// FT_Stroker_GetBorderCounts and FT_Stroker_ExportBorder.
///
/// @note:
///   Applications are generally interested in the 'inside' and 'outside'
///   borders.  However, there is no direct mapping between these and the
///   'left' and 'right' ones, since this really depends on the glyph's
///   drawing orientation, which varies between font formats.
///
///   You can however use FT_Outline_GetInsideBorder and
///   FT_Outline_GetOutsideBorder to get these.
public enum FT_StrokerBorder : c_int
{
	/// Select the left border, relative to the drawing direction.
	FT_STROKER_BORDER_LEFT = 0,

	/// Select the right border, relative to the drawing direction.
	FT_STROKER_BORDER_RIGHT = 1
}

/// An enumeration to specify indices of SFNT tables loaded and parsed by
/// FreeType during initialization of an SFNT font.  Used in the
/// FT_Get_Sfnt_Table API function.
public enum FT_Sfnt_Tag : c_int
{
	/// To access the font's TT_Header structure.
	FT_SFNT_HEAD = 0,

	/// To access the font's TT_MaxProfile structure.
	FT_SFNT_MAXP = 1,

	/// To access the font's TT_OS2 structure.
	FT_SFNT_OS2 = 2,

	/// To access the font's TT_HoriHeader structure.
	FT_SFNT_HHEA = 3,

	/// To access the font's TT_VertHeader structure.
	FT_SFNT_VHEA = 4,

	/// To access the font's TT_Postscript structure.
	FT_SFNT_POST = 5,

	/// To access the font's TT_PCLT structure.
	FT_SFNT_PCLT = 6,

	FT_SFNT_MAX = 7
}

/// A list of bit flags used in the `face_flags` field of the FT_FaceRec
/// structure.  They inform client applications of properties of the
/// corresponding face.
public enum FT_Face_Flags : c_long
{
	/// The face contains outline glyphs.  Note that a face can contain
	/// bitmap strikes also, i.e., a face can have both this flag and
	/// FT_FACE_FLAG_FIXED_SIZES set.
	FT_FACE_FLAG_SCALABLE = 1 << 0,

	/// The face contains bitmap strikes.  See also the `num_fixed_sizes`
	/// and `available_sizes` fields of FT_FaceRec.
	FT_FACE_FLAG_FIXED_SIZES = 1 << 1,

	/// The face contains fixed-width characters (like Courier, Lucida,
	/// MonoType, etc.).
	FT_FACE_FLAG_FIXED_WIDTH = 1 << 2,

	/// The face uses the SFNT storage scheme.  For now, this means TrueType
	/// and OpenType.
	FT_FACE_FLAG_SFNT = 1 << 3,

	/// The face contains horizontal glyph metrics.  This should be set for
	/// all common formats.
	FT_FACE_FLAG_HORIZONTAL = 1 << 4,

	/// The face contains vertical glyph metrics.  This is only available in
	/// some formats, not all of them.
	FT_FACE_FLAG_VERTICAL = 1 << 5,

	/// The face contains kerning information.  If set, the kerning distance
	/// can be retrieved using the function FT_Get_Kerning.  Otherwise the
	/// function always returns the vector (0,0).
	///
	/// Note that for TrueType fonts only, FreeType supports both the 'kern'
	/// table and the basic, pair-wise kerning feature from the 'GPOS' table
	/// (with `TT_CONFIG_OPTION_GPOS_KERNING` enabled), though FreeType does
	/// not support the more advanced GPOS layout features; use a library
	/// like HarfBuzz for those instead.
	FT_FACE_FLAG_KERNING = 1 << 6,

	/// THIS FLAG IS DEPRECATED.  DO NOT USE OR TEST IT.
	FT_FACE_FLAG_FAST_GLYPHS = 1 << 7,

	/// The face contains multiple masters and is capable of interpolating
	/// between them.  Supported formats are Adobe MM, TrueType GX, and
	/// OpenType Font Variations.
	///
	/// See section multiple_masters for API details.
	FT_FACE_FLAG_MULTIPLE_MASTERS = 1 << 8,

	/// The face contains glyph names, which can be retrieved using
	/// FT_Get_Glyph_Name.  Note that some TrueType fonts contain broken
	/// glyph name tables.  Use the function FT_Has_PS_Glyph_Names when
	/// needed.
	FT_FACE_FLAG_GLYPH_NAMES = 1 << 9,

	/// Used internally by FreeType to indicate that a face's stream was
	/// provided by the client application and should not be destroyed when
	/// FT_Done_Face is called.  Don't read or test this flag.
	FT_FACE_FLAG_EXTERNAL_STREAM = 1 << 10,

	/// The font driver has a hinting machine of its own.  For example, with
	/// TrueType fonts, it makes sense to use data from the SFNT 'gasp'
	/// table only if the native TrueType hinting engine (with the bytecode
	/// interpreter) is available and active.
	FT_FACE_FLAG_HINTER = 1 << 11,

	/// The face is CID-keyed.  In that case, the face is not accessed by
	/// glyph indices but by CID values.  For subsetted CID-keyed fonts this
	/// has the consequence that not all index values are a valid argument
	/// to FT_Load_Glyph.  Only the CID values for which corresponding
	/// glyphs in the subsetted font exist make `FT_Load_Glyph` return
	/// successfully; in all other cases you get an
	/// `FT_Err_Invalid_Argument` error.
	///
	/// Note that CID-keyed fonts that are in an SFNT wrapper (that is, all
	/// OpenType/CFF fonts) don't have this flag set since the glyphs are
	/// accessed in the normal way (using contiguous indices); the
	/// 'CID-ness' isn't visible to the application.
	FT_FACE_FLAG_CID_KEYED = 1 << 12,

	/// The face is 'tricky', that is, it always needs the font format's
	/// native hinting engine to get a reasonable result.  A typical example
	/// is the old Chinese font `mingli.ttf` (but not `mingliu.ttc`) that
	/// uses TrueType bytecode instructions to move and scale all of its
	/// subglyphs.
	///
	/// It is not possible to auto-hint such fonts using
	/// FT_LOAD_FORCE_AUTOHINT; it will also ignore FT_LOAD_NO_HINTING.
	/// You have to set both FT_LOAD_NO_HINTING and FT_LOAD_NO_AUTOHINT to
	/// really disable hinting; however, you probably never want this except
	/// for demonstration purposes.
	///
	/// Currently, there are about a dozen TrueType fonts in the list of
	/// tricky fonts; they are hard-coded in file `ttobjs.c`.
	FT_FACE_FLAG_TRICKY = 1 << 13,

	/// [Since 2.5.1] The face has color glyph tables.  See FT_LOAD_COLOR
	/// for more information.
	FT_FACE_FLAG_COLOR = 1 << 14,

	/// [Since 2.9] Set if the current face (or named instance) has been
	/// altered with FT_Set_MM_Design_Coordinates,
	/// FT_Set_Var_Design_Coordinates, FT_Set_Var_Blend_Coordinates, or
	/// FT_Set_MM_WeightVector to select a non-default instance.
	FT_FACE_FLAG_VARIATION = 1 << 15,

	/// [Since 2.12] The face has an 'SVG ' OpenType table.
	FT_FACE_FLAG_SVG = 1 << 16,

	/// [Since 2.12] The face has an 'sbix' OpenType table *and* outlines.
	/// For such fonts, FT_FACE_FLAG_SCALABLE is not set by default to
	/// retain backward compatibility.
	FT_FACE_FLAG_SBIX = 1 << 17,

	/// [Since 2.12] The face has an 'sbix' OpenType table where outlines
	/// should be drawn on top of bitmap strikes.
	FT_FACE_FLAG_SBIX_OVERLAY = 1 << 18
}

/// A list of bit flags to indicate the style of a given face.  These are
/// used in the `style_flags` field of FT_FaceRec.
///
/// @note:
///   The style information as provided by FreeType is very basic.  More
///   details are beyond the scope and should be done on a higher level (for
///   example, by analyzing various fields of the 'OS/2' table in SFNT based
///   fonts).
public enum FT_Style_Flags : c_long
{
	/// The face style is italic or oblique.
	FT_STYLE_FLAG_ITALIC = 1 << 0,

	/// The face is bold.
	FT_STYLE_FLAG_BOLD = 1 << 1
}

/// A list of bit field constants used within the `flags` field of the
/// FT_Open_Args structure.
///
/// @note:
///   The `FT_OPEN_MEMORY`, `FT_OPEN_STREAM`, and `FT_OPEN_PATHNAME` flags
///   are mutually exclusive.
public enum FT_Open_Flags : c_uint
{
	/// This is a memory-based stream.
	FT_OPEN_MEMORY = 0x1,

	/// Copy the stream from the `stream` field.
	FT_OPEN_STREAM = 0x2,

	/// Create a new input stream from a C path name.
	FT_OPEN_PATHNAME = 0x4,

	/// Use the `driver` field.
	FT_OPEN_DRIVER = 0x8,

	/// Use the `num_params` and `params` fields.
	FT_OPEN_PARAMS = 0x10
}

/// A list of constants describing subglyphs.  Please refer to the 'glyf'
/// table description in the OpenType specification for the meaning of the
/// various flags (which get synthesized for non-OpenType subglyphs).
///
///   https://learn.microsoft.com/typography/opentype/spec/glyf#composite-glyph-description
public enum FT_SubGlyph_Flags : c_uint
{
	FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS = 1,
	FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES = 2,
	FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID = 4,
	FT_SUBGLYPH_FLAG_SCALE = 8,
	FT_SUBGLYPH_FLAG_XY_SCALE = 0x40,
	FT_SUBGLYPH_FLAG_2X2 = 0x80,
	FT_SUBGLYPH_FLAG_USE_MY_METRICS = 0x200
}

/// A list of bit flags used in the `fsType` field of the OS/2 table in a
/// TrueType or OpenType font and the `FSType` entry in a PostScript font.
/// These bit flags are returned by FT_Get_FSType_Flags; they inform
/// client applications of embedding and subsetting restrictions
/// associated with a font.
///
/// See
/// https://adobe-type-tools.github.io/font-tech-notes/pdfs/AcrobatDC_FontPolicies.pdf
/// for more details.
///
/// @note:
///   The flags are ORed together, thus more than a single value can be
///   returned.
///
///   While the `fsType` flags can indicate that a font may be embedded, a
///   license with the font vendor may be separately required to use the
///   font in this way.
public enum FT_FSType_Flags : c_ushort
{
	/// Fonts with no fsType bit set may be embedded and permanently
	/// installed on the remote system by an application.
	FT_FSTYPE_INSTALLABLE_EMBEDDING = 0x0000,

	/// Fonts that have only this bit set must not be modified, embedded or
	/// exchanged in any manner without first obtaining permission of the
	/// font software copyright owner.
	FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING = 0x0002,

	/// The font may be embedded and temporarily loaded on the remote
	/// system.  Documents containing Preview & Print fonts must be opened
	/// 'read-only'; no edits can be applied to the document.
	FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING = 0x0004,

	/// The font may be embedded but must only be installed temporarily on
	/// other systems.  In contrast to Preview & Print fonts, documents
	/// containing editable fonts may be opened for reading, editing is
	/// permitted, and changes may be saved.
	FT_FSTYPE_EDITABLE_EMBEDDING = 0x0008,

	/// The font may not be subsetted prior to embedding.
	FT_FSTYPE_NO_SUBSETTING = 0x0100,

	/// Only bitmaps contained in the font may be embedded; no outline data
	/// may be embedded.  If there are no bitmaps available in the font,
	/// then the font is unembeddable.
	FT_FSTYPE_BITMAP_EMBEDDING_ONLY = 0x0200
}

/// A list of bit field constants for FT_Load_Glyph to indicate what kind
/// of operations to perform during glyph loading.
///
/// @note:
///   By default, hinting is enabled and the font's native hinter (see
///   FT_FACE_FLAG_HINTER) is preferred over the auto-hinter.  You can
///   disable hinting by setting FT_LOAD_NO_HINTING or change the
///   precedence by setting FT_LOAD_FORCE_AUTOHINT.  You can also set
///   FT_LOAD_NO_AUTOHINT in case you don't want the auto-hinter to be used
///   at all.
///
///   See the description of FT_FACE_FLAG_TRICKY for a special exception
///   (affecting only a handful of Asian fonts).
///
///   Besides deciding which hinter to use, you can also decide which
///   hinting algorithm to use.  See FT_LOAD_TARGET_XXX for details.
///
///   Note that the auto-hinter needs a valid Unicode cmap (either a native
///   one or synthesized by FreeType) for producing correct results.  If a
///   font provides an incorrect mapping (for example, assigning the
///   character code U+005A, LATIN CAPITAL LETTER Z, to a glyph depicting a
///   mathematical integral sign), the auto-hinter might produce useless
///   results.
[AllowDuplicates]
public enum FT_Load_Flags : c_int
{
	/// Corresponding to 0, this value is used as the default glyph load
	/// operation.  In this case, the following happens:
	///
	/// 1. FreeType looks for a bitmap for the glyph corresponding to the
	/// face's current size.  If one is found, the function returns.  The
	/// bitmap data can be accessed from the glyph slot (see note below).
	///
	/// 2. If no embedded bitmap is searched for or found, FreeType looks
	/// for a scalable outline.  If one is found, it is loaded from the font
	/// file, scaled to device pixels, then 'hinted' to the pixel grid in
	/// order to optimize it.  The outline data can be accessed from the
	/// glyph slot (see note below).
	///
	/// Note that by default the glyph loader doesn't render outlines into
	/// bitmaps.  The following flags are used to modify this default
	/// behaviour to more specific and useful cases.
	FT_LOAD_DEFAULT = 0x0,

	/// Don't scale the loaded outline glyph but keep it in font units.
	/// This flag is also assumed if FT_Size owned by the face was not
	/// properly initialized.
	///
	/// This flag implies FT_LOAD_NO_HINTING and FT_LOAD_NO_BITMAP, and
	/// unsets FT_LOAD_RENDER.
	///
	/// If the font is 'tricky' (see FT_FACE_FLAG_TRICKY for more), using
	/// `FT_LOAD_NO_SCALE` usually yields meaningless outlines because the
	/// subglyphs must be scaled and positioned with hinting instructions.
	/// This can be solved by loading the font without `FT_LOAD_NO_SCALE`
	/// and setting the character size to `font->units_per_EM`.
	FT_LOAD_NO_SCALE = 1 << 0,

	/// Disable hinting.  This generally generates 'blurrier' bitmap glyphs
	/// when the glyphs are rendered in any of the anti-aliased modes.  See
	/// also the note below.
	///
	/// This flag is implied by FT_LOAD_NO_SCALE.
	FT_LOAD_NO_HINTING = 1 << 1,

	/// Call FT_Render_Glyph after the glyph is loaded.  By default, the
	/// glyph is rendered in FT_RENDER_MODE_NORMAL mode.  This can be
	/// overridden by FT_LOAD_TARGET_XXX or FT_LOAD_MONOCHROME.
	///
	/// This flag is unset by FT_LOAD_NO_SCALE.
	FT_LOAD_RENDER = 1 << 2,

	/// Ignore bitmap strikes when loading.  Bitmap-only fonts ignore this
	/// flag.
	///
	/// FT_LOAD_NO_SCALE always sets this flag.
	FT_LOAD_NO_BITMAP = 1 << 3,

	/// Load the glyph for vertical text layout.  In particular, the
	/// `advance` value in the FT_GlyphSlotRec structure is set to the
	/// `vertAdvance` value of the `metrics` field.
	///
	/// In case FT_HAS_VERTICAL doesn't return true, you shouldn't use this
	/// flag currently.  Reason is that in this case vertical metrics get
	/// synthesized, and those values are not always consistent across
	/// various font formats.
	FT_LOAD_VERTICAL_LAYOUT = 1 << 4,

	/// Prefer the auto-hinter over the font's native hinter.  See also the
	/// note below.
	FT_LOAD_FORCE_AUTOHINT = 1 << 5,

	/// Ignored.  Deprecated.
	FT_LOAD_CROP_BITMAP = 1 << 6,

	/// Make the font driver perform pedantic verifications during glyph
	/// loading and hinting.  This is mostly used to detect broken glyphs in
	/// fonts.  By default, FreeType tries to handle broken fonts also.
	///
	/// In particular, errors from the TrueType bytecode engine are not
	/// passed to the application if this flag is not set; this might result
	/// in partially hinted or distorted glyphs in case a glyph's bytecode
	/// is buggy.
	FT_LOAD_PEDANTIC = 1 << 7,

	FT_LOAD_ADVANCE_ONLY = 1 << 8,
	/// Ignored.  Deprecated.
	FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = 1 << 9,

	/// Don't load composite glyphs recursively.  Instead, the font driver
	/// fills the `num_subglyph` and `subglyphs` values of the glyph slot;
	/// it also sets `glyph->format` to FT_GLYPH_FORMAT_COMPOSITE.  The
	/// description of subglyphs can then be accessed with
	/// FT_Get_SubGlyph_Info.
	///
	/// Don't use this flag for retrieving metrics information since some
	/// font drivers only return rudimentary data.
	///
	/// This flag implies FT_LOAD_NO_SCALE and FT_LOAD_IGNORE_TRANSFORM.
	FT_LOAD_NO_RECURSE = 1 << 10,

	/// Ignore the transform matrix set by FT_Set_Transform.
	FT_LOAD_IGNORE_TRANSFORM = 1 << 11,

	/// This flag is used with FT_LOAD_RENDER to indicate that you want to
	/// render an outline glyph to a 1-bit monochrome bitmap glyph, with
	/// 8 pixels packed into each byte of the bitmap data.
	///
	/// Note that this has no effect on the hinting algorithm used.  You
	/// should rather use FT_LOAD_TARGET_MONO so that the
	/// monochrome-optimized hinting algorithm is used.
	FT_LOAD_MONOCHROME = 1 << 12,

	/// Keep `linearHoriAdvance` and `linearVertAdvance` fields of
	/// FT_GlyphSlotRec in font units.  See FT_GlyphSlotRec for details.
	FT_LOAD_LINEAR_DESIGN = 1 << 13,

	/// [Since 2.12] This is the opposite of FT_LOAD_NO_BITMAP, more or
	/// less: FT_Load_Glyph returns `FT_Err_Invalid_Argument` if the face
	/// contains a bitmap strike for the given size (or the strike selected
	/// by FT_Select_Size) but there is no glyph in the strike.
	///
	/// Note that this load flag was part of FreeType since version 2.0.6
	/// but previously tagged as internal.
	FT_LOAD_SBITS_ONLY = 1 << 14,

	/// Disable the auto-hinter.  See also the note below.
	FT_LOAD_NO_AUTOHINT = 1 << 15,

	/// Load colored glyphs.  FreeType searches in the following order;
	/// there are slight differences depending on the font format.
	///
	/// [Since 2.5] Load embedded color bitmap images (provided
	/// FT_LOAD_NO_BITMAP is not set).  The resulting color bitmaps, if
	/// available, have the FT_PIXEL_MODE_BGRA format, with pre-multiplied
	/// color channels.  If the flag is not set and color bitmaps are found,
	/// they are converted to 256-level gray bitmaps, using the
	/// FT_PIXEL_MODE_GRAY format.
	///
	/// [Since 2.12] If the glyph index maps to an entry in the face's
	/// 'SVG ' table, load the associated SVG document from this table and
	/// set the `format` field of FT_GlyphSlotRec to FT_GLYPH_FORMAT_SVG
	/// ([since 2.13.1] provided FT_LOAD_NO_SVG is not set).  Note that
	/// FreeType itself can't render SVG documents; however, the library
	/// provides hooks to seamlessly integrate an external renderer.  See
	/// sections ot_svg_driver and svg_fonts for more.
	///
	/// [Since 2.10, experimental] If the glyph index maps to an entry in
	/// the face's 'COLR' table with a 'CPAL' palette table (as defined in
	/// the OpenType specification), make FT_Render_Glyph provide a default
	/// blending of the color glyph layers associated with the glyph index,
	/// using the same bitmap format as embedded color bitmap images.  This
	/// is mainly for convenience and works only for glyphs in 'COLR' v0
	/// tables.  **There is no rendering support for 'COLR' v1** (with the
	/// exception of v1 tables that exclusively use v0 features)!  You need
	/// a graphics library like Skia or Cairo to interpret the graphics
	/// commands stored in v1 tables.  For full control of color layers use
	/// FT_Get_Color_Glyph_Layer and FreeType's color functions like
	/// FT_Palette_Select instead of setting FT_LOAD_COLOR for rendering
	/// so that the client application can handle blending by itself.
	FT_LOAD_COLOR = 1 << 20,

	/// [Since 2.6.1] Compute glyph metrics from the glyph data, without the
	/// use of bundled metrics tables (for example, the 'hdmx' table in
	/// TrueType fonts).  This flag is mainly used by font validating or
	/// font editing applications, which need to ignore, verify, or edit
	/// those tables.
	///
	/// Currently, this flag is only implemented for TrueType fonts.
	FT_LOAD_COMPUTE_METRICS = 1 << 21,

	/// [Since 2.7.1] Request loading of the metrics and bitmap image
	/// information of a (possibly embedded) bitmap glyph without allocating
	/// or copying the bitmap image data itself.  No effect if the target
	/// glyph is not a bitmap image.
	///
	/// This flag unsets FT_LOAD_RENDER.
	FT_LOAD_BITMAP_METRICS_ONLY = 1 << 22,

	FT_LOAD_SVG_ONLY = 1 << 23,
	/// [Since 2.13.1] Ignore SVG glyph data when loading.
	FT_LOAD_NO_SVG = 1 << 24,

	/// The default hinting algorithm, optimized for standard gray-level
	/// rendering.  For monochrome output, use FT_LOAD_TARGET_MONO instead.
	FT_LOAD_TARGET_NORMAL = 0x00000,

	/// A lighter hinting algorithm for gray-level modes.  Many generated
	/// glyphs are fuzzier but better resemble their original shape.  This
	/// is achieved by snapping glyphs to the pixel grid only vertically
	/// (Y-axis), as is done by FreeType's new CFF engine or Microsoft's
	/// ClearType font renderer.  This preserves inter-glyph spacing in
	/// horizontal text.  The snapping is done either by the native font
	/// driver, if the driver itself and the font support it, or by the
	/// auto-hinter.
	///
	/// Advance widths are rounded to integer values; however, using the
	/// `lsb_delta` and `rsb_delta` fields of FT_GlyphSlotRec, it is
	/// possible to get fractional advance widths for subpixel positioning
	/// (which is recommended to use).
	///
	/// If configuration option `AF_CONFIG_OPTION_TT_SIZE_METRICS` is
	/// active, TrueType-like metrics are used to make this mode behave
	/// similarly as in unpatched FreeType versions between 2.4.6 and 2.7.1
	/// (inclusive).
	FT_LOAD_TARGET_LIGHT = 0x10000,

	/// Strong hinting algorithm that should only be used for monochrome
	/// output.  The result is probably unpleasant if the glyph is rendered
	/// in non-monochrome modes.
	///
	/// Note that for outline fonts only the TrueType font driver has proper
	/// monochrome hinting support, provided the TTFs contain hints for B/W
	/// rendering (which most fonts no longer provide).  If these conditions
	/// are not met it is very likely that you get ugly results at smaller
	/// sizes.
	FT_LOAD_TARGET_MONO = 0x20000,

	/// A variant of FT_LOAD_TARGET_LIGHT optimized for horizontally
	/// decimated LCD displays.
	FT_LOAD_TARGET_LCD = 0x30000,

	/// A variant of FT_LOAD_TARGET_NORMAL optimized for vertically
	/// decimated LCD displays.
	FT_LOAD_TARGET_LCD_V = 0x40000,

	/// A bit-flag to be OR-ed with the `flags` parameter of the
	/// FT_Get_Advance and FT_Get_Advances functions.
	///
	/// If set, it indicates that you want these functions to fail if the
	/// corresponding hinting mode or font driver doesn't allow for very quick
	/// advance computation.
	///
	/// Typically, glyphs that are either unscaled, unhinted, bitmapped, or
	/// light-hinted can have their advance width computed very quickly.
	///
	/// Normal and bytecode hinted modes that require loading, scaling, and
	/// hinting of the glyph outline, are extremely slow by comparison.
	FT_ADVANCE_FLAG_FAST_ONLY = 0x20000000
}

/// A list of bit-field constants used for the flags in an outline's
/// `flags` field.
///
/// @note:
///   The flags FT_OUTLINE_IGNORE_DROPOUTS, FT_OUTLINE_SMART_DROPOUTS, and
///   FT_OUTLINE_INCLUDE_STUBS are ignored by the smooth rasterizer.
///
///   There exists a second mechanism to pass the drop-out mode to the B/W
///   rasterizer; see the `tags` field in FT_Outline.
///
///   Please refer to the description of the 'SCANTYPE' instruction in the
///   [OpenType specification](https://learn.microsoft.com/typography/opentype/spec/tt_instructions#scantype)
///   how simple drop-outs, smart drop-outs, and stubs are defined.
public enum FT_Outline_Flags : c_int
{
	/// Value 0 is reserved.
	FT_OUTLINE_NONE = 0x0,

	/// If set, this flag indicates that the outline's field arrays (i.e.,
	/// `points`, `flags`, and `contours`) are 'owned' by the outline
	/// object, and should thus be freed when it is destroyed.
	FT_OUTLINE_OWNER = 0x1,

	/// By default, outlines are filled using the non-zero winding rule.  If
	/// set to 1, the outline will be filled using the even-odd fill rule
	/// (only works with the smooth rasterizer).
	FT_OUTLINE_EVEN_ODD_FILL = 0x2,

	/// By default, outside contours of an outline are oriented in
	/// clock-wise direction, as defined in the TrueType specification.
	/// This flag is set if the outline uses the opposite direction
	/// (typically for Type 1 fonts).  This flag is ignored by the scan
	/// converter.
	FT_OUTLINE_REVERSE_FILL = 0x4,

	/// By default, the scan converter will try to detect drop-outs in an
	/// outline and correct the glyph bitmap to ensure consistent shape
	/// continuity.  If set, this flag hints the scan-line converter to
	/// ignore such cases.  See below for more information.
	FT_OUTLINE_IGNORE_DROPOUTS = 0x8,

	/// Select smart dropout control.  If unset, use simple dropout control.
	/// Ignored if FT_OUTLINE_IGNORE_DROPOUTS is set.  See below for more
	/// information.
	FT_OUTLINE_SMART_DROPOUTS = 0x10,

	/// If set, turn pixels on for 'stubs', otherwise exclude them.  Ignored
	/// if FT_OUTLINE_IGNORE_DROPOUTS is set.  See below for more
	/// information.
	FT_OUTLINE_INCLUDE_STUBS = 0x20,

	/// [Since 2.10.3] This flag indicates that this outline contains
	/// overlapping contours and the anti-aliased renderer should perform
	/// oversampling to mitigate possible artifacts.  This flag should _not_
	/// be set for well designed glyphs without overlaps because it quadruples
	/// the rendering time.
	FT_OUTLINE_OVERLAP = 0x40,

	/// This flag indicates that the scan-line converter should try to
	/// convert this outline to bitmaps with the highest possible quality.
	/// It is typically set for small character sizes.  Note that this is
	/// only a hint that might be completely ignored by a given
	/// scan-converter.
	FT_OUTLINE_HIGH_PRECISION = 0x100,

	/// This flag is set to force a given scan-converter to only use a
	/// single pass over the outline to render a bitmap glyph image.
	/// Normally, it is set for very large character sizes.  It is only a
	/// hint that might be completely ignored by a given scan-converter.
	FT_OUTLINE_SINGLE_PASS = 0x200
}

/// Bit flags stored in each element of FT_Outline.tags (original C macros FT_CURVE_TAG_*).
/// The low three bits tell the point type: ON = on-curve point, CONIC = off-curve conic control,
/// CUBIC = off-curve cubic control. The other bits are hinting hints.
/// Use FT_CURVE_TAG(flag) to extract the point type.
public enum FT_Curve_Tag : c_uchar
{
	FT_CURVE_TAG_ON = 0x01,
	FT_CURVE_TAG_CONIC = 0x00,
	FT_CURVE_TAG_CUBIC = 0x02,
	FT_CURVE_TAG_HAS_SCANMODE = 0x04,
	FT_CURVE_TAG_TOUCH_X = 0x08,
	FT_CURVE_TAG_TOUCH_Y = 0x10,
	FT_CURVE_TAG_TOUCH_BOTH = 0x18
}

/// A list of bit flag constants as used in the `flags` field of a
/// FT_Raster_Params structure.
public enum FT_Raster_Flag : c_int
{
	/// This value is 0.
	FT_RASTER_FLAG_DEFAULT = 0x0,

	/// This flag is set to indicate that an anti-aliased glyph image should
	/// be generated.  Otherwise, it will be monochrome (1-bit).
	FT_RASTER_FLAG_AA = 0x1,

	/// This flag is set to indicate direct rendering.  In this mode, client
	/// applications must provide their own span callback.  This lets them
	/// directly draw or compose over an existing bitmap.  If this bit is
	/// _not_ set, the target pixmap's buffer _must_ be zeroed before
	/// rendering and the output will be clipped to its size.
	///
	/// Direct rendering is only possible with anti-aliased glyphs.
	FT_RASTER_FLAG_DIRECT = 0x2,

	/// This flag is only used in direct rendering mode.  If set, the output
	/// will be clipped to a box specified in the `clip_box` field of the
	/// FT_Raster_Params structure.  Otherwise, the `clip_box` is
	/// effectively set to the bounding box and all spans are generated.
	FT_RASTER_FLAG_CLIP = 0x4,

	/// This flag is set to indicate that a signed distance field glyph
	/// image should be generated.  This is only used while rendering with
	/// the FT_RENDER_MODE_SDF render mode.
	FT_RASTER_FLAG_SDF = 0x8
}

/// A list of values and/or bit-flags returned by the FT_Get_Gasp
/// function.
///
/// @note:
///   The bit-flags `FT_GASP_DO_GRIDFIT` and `FT_GASP_DO_GRAY` are to be
///   used for standard font rasterization only.  Independently of that,
///   `FT_GASP_SYMMETRIC_SMOOTHING` and `FT_GASP_SYMMETRIC_GRIDFIT` are to
///   be used if ClearType is enabled (and `FT_GASP_DO_GRIDFIT` and
///   `FT_GASP_DO_GRAY` are consequently ignored).
///
///   'ClearType' is Microsoft's implementation of LCD rendering, partly
///   protected by patents.
///
/// @since:
///   2.3.0
public enum FT_Gasp : c_int
{
	/// This special value means that there is no GASP table in this face.
	/// It is up to the client to decide what to do.
	FT_GASP_NO_TABLE = -1,

	/// Grid-fitting and hinting should be performed at the specified ppem.
	/// This **really** means TrueType bytecode interpretation.  If this bit
	/// is not set, no hinting gets applied.
	FT_GASP_DO_GRIDFIT = 0x01,

	/// Anti-aliased rendering should be performed at the specified ppem.
	/// If not set, do monochrome rendering.
	FT_GASP_DO_GRAY = 0x02,

	/// Grid-fitting must be used with ClearType's symmetric smoothing.
	FT_GASP_SYMMETRIC_GRIDFIT = 0x04,

	/// If set, smoothing along multiple axes must be used with ClearType.
	FT_GASP_SYMMETRIC_SMOOTHING = 0x08
}

/// A list of bit field constants used in the `palette_flags` array of the
/// FT_Palette_Data structure to indicate for which background a palette
/// with a given index is usable.
///
/// @since:
///   2.10
public enum FT_Palette_Flags : c_ushort
{
	/// The palette is appropriate to use when displaying the font on a
	/// light background such as white.
	FT_PALETTE_FOR_LIGHT_BACKGROUND = 0x01,

	/// The palette is appropriate to use when displaying the font on a dark
	/// background such as black.
	FT_PALETTE_FOR_DARK_BACKGROUND = 0x02
}

/// A list of bit flags used in the return value of
/// FT_Get_Var_Axis_Flags.
///
/// @since:
///   2.8.1
public enum FT_Var_Axis_Flags : c_uint
{
	/// The variation axis should not be exposed to user interfaces.
	FT_VAR_AXIS_FLAG_HIDDEN = 1
}

/// Tags for FT_Parameter.tag (original C macros FT_PARAM_TAG_*, from ftparams.h).
/// Each value is a FT_MAKE_TAG four-character tag.
[AllowDuplicates]
public enum FT_Param_Tag : c_ulong
{
	/// A tag for FT_Parameter to make FT_Open_Face ignore typographic
	/// family names in the 'name' table (introduced in OpenType version 1.4).
	/// Use this for backward compatibility with legacy systems that have a
	/// four-faces-per-family restriction.
	///
	/// @since:
	///   2.8
	FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY = 0x69677066,

	FT_PARAM_TAG_IGNORE_PREFERRED_FAMILY = 0x69677066,
	/// A tag for FT_Parameter to make FT_Open_Face ignore typographic
	/// subfamily names in the 'name' table (introduced in OpenType version
	/// 1.4).  Use this for backward compatibility with legacy systems that
	/// have a four-faces-per-family restriction.
	///
	/// @since:
	///   2.8
	FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY = 0x69677073,

	FT_PARAM_TAG_IGNORE_PREFERRED_SUBFAMILY = 0x69677073,
	/// An FT_Parameter tag to be used with FT_Open_Face to indicate
	/// incremental glyph loading.
	FT_PARAM_TAG_INCREMENTAL = 0x696E6372,

	/// A tag for FT_Parameter to make FT_Open_Face ignore an 'sbix' table
	/// while loading a font.  Use this if FT_FACE_FLAG_SBIX is set and you
	/// want to access the outline glyphs in the font.
	FT_PARAM_TAG_IGNORE_SBIX = 0x69736278,

	/// Overriding global LCD filter weights with custom values for a given
	/// face is no longer supported and ignored.
	///
	/// @since:
	///   2.8
	FT_PARAM_TAG_LCD_FILTER_WEIGHTS = 0x6C636466,

	/// An FT_Parameter tag to be used with FT_Face_Properties.  The
	/// corresponding 32bit signed integer argument overrides the font
	/// driver's random seed value with a face-specific one; see random-seed.
	///
	/// @since:
	///   2.8
	FT_PARAM_TAG_RANDOM_SEED = 0x73656564,

	/// An FT_Parameter tag to be used with FT_Face_Properties.  The
	/// corresponding Boolean argument specifies whether to apply stem
	/// darkening, overriding the global default values or the values set up
	/// with FT_Property_Set (see no-stem-darkening).
	///
	/// This is a passive setting that only takes effect if the font driver or
	/// autohinter honors it, which the CFF, Type 1, and CID drivers always
	/// do, but the autohinter only in 'light' hinting mode (as of version
	/// 2.9).
	///
	/// @since:
	///   2.8
	FT_PARAM_TAG_STEM_DARKENING = 0x6461726B,

	/// Deprecated, no effect.
	///
	/// Previously: A constant used as the tag of an FT_Parameter structure
	/// to indicate that unpatented methods only should be used by the
	/// TrueType bytecode interpreter for a typeface opened by FT_Open_Face.
	FT_PARAM_TAG_UNPATENTED_HINTING = 0x756E7061
}
