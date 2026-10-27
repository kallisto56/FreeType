namespace HarfBuzz;


using System;
using System.Interop;


static
{
	// ====================================================================
	// hb-common.h
	// ====================================================================
	
	/// Converts a string into an hb_tag_t. Valid tags
	/// are four characters. Shorter input strings will be
	/// padded with spaces. Longer input strings will be
	/// truncated.
	///
	/// @str: (array length=len) (element-type uint8_t): String to convert
	/// @len: Length of @str, or -1 if it is `NULL`-terminated
	///
	/// Return value: The hb_tag_t corresponding to @str
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_tag_t hb_tag_from_string(c_char* str, c_int len);
	
	/// Converts an hb_tag_t to a string and returns it in @buf.
	/// Strings will be four characters long.
	///
	/// @tag: hb_tag_t to convert
	/// @buf: (out caller-allocates) (array fixed-size=4) (element-type uint8_t): Converted string
	///
	/// Since: 0.9.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_tag_to_string(hb_tag_t tag, c_char* buf);
	
	/// Converts a string to an hb_direction_t.
	///
	/// Matching is loose and applies only to the first letter. For
	/// examples, "LTR" and "left-to-right" will both return HB_DIRECTION_LTR.
	///
	/// Unmatched strings will return HB_DIRECTION_INVALID.
	///
	/// @str: (array length=len) (element-type uint8_t): String to convert
	/// @len: Length of @str, or -1 if it is `NULL`-terminated
	///
	/// Return value: The hb_direction_t matching @str
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_direction_t hb_direction_from_string(c_char* str, c_int len);
	
	/// Converts an hb_direction_t to a string.
	///
	/// @direction: The hb_direction_t to convert
	///
	/// Return value: (transfer none): The string corresponding to @direction
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* hb_direction_to_string(hb_direction_t direction);
	
	/// Converts @str representing a BCP 47 language tag to the corresponding
	/// hb_language_t.
	///
	/// @str: (array length=len) (element-type uint8_t): a string representing
	///     a BCP 47 language tag
	/// @len: length of the @str, or -1 if it is `NULL`-terminated.
	///
	/// Return value: (transfer none):
	/// The hb_language_t corresponding to the BCP 47 language tag.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_language_t hb_language_from_string(c_char* str, c_int len);
	
	/// Converts an hb_language_t to a string.
	///
	/// @language: The hb_language_t to convert
	///
	/// Return value: (transfer none):
	/// A `NULL`-terminated string representing the @language. Must not be freed by
	/// the caller.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* hb_language_to_string(hb_language_t language);
	
	/// Fetch the default language from current locale.
	///
	/// <note>Note that the first time this function is called, it calls
	/// "setlocale (LC_CTYPE, nullptr)" to fetch current locale.  The underlying
	/// setlocale function is, in many implementations, NOT threadsafe.  To avoid
	/// problems, call this function once before multiple threads can call it.
	/// This function is only used from hb_buffer_guess_segment_properties() by
	/// HarfBuzz itself.</note>
	///
	/// Return value: (transfer none): The default language of the locale as
	/// an hb_language_t
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_language_t hb_language_get_default();
	
	/// Check whether a second language tag is the same or a more
	/// specific version of the provided language tag.  For example,
	/// "fa_IR.utf8" is a more specific tag for "fa" or for "fa_IR".
	///
	/// @language: The hb_language_t to work on
	/// @specific: Another hb_language_t
	///
	/// Return value: `true` if languages match, `false` otherwise.
	///
	/// Since: 5.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_language_matches(hb_language_t language, hb_language_t specific);
	
	/// Converts an ISO 15924 script tag to a corresponding hb_script_t.
	///
	/// @tag: an hb_tag_t representing an ISO 15924 tag.
	///
	/// Return value:
	/// An hb_script_t corresponding to the ISO 15924 tag.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_script_t hb_script_from_iso15924_tag(hb_tag_t tag);
	
	/// Converts a string @str representing an ISO 15924 script tag to a
	/// corresponding hb_script_t. Shorthand for hb_tag_from_string() then
	/// hb_script_from_iso15924_tag().
	///
	/// @str: (array length=len) (element-type uint8_t): a string representing an
	///     ISO 15924 tag.
	/// @len: length of the @str, or -1 if it is `NULL`-terminated.
	///
	/// Return value:
	/// An hb_script_t corresponding to the ISO 15924 tag.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_script_t hb_script_from_string(c_char* str, c_int len);
	
	/// Converts an hb_script_t to a corresponding ISO 15924 script tag.
	///
	/// @script: an hb_script_t to convert.
	///
	/// Return value:
	/// An hb_tag_t representing an ISO 15924 script tag.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_tag_t hb_script_to_iso15924_tag(hb_script_t script);
	
	/// Fetches the hb_direction_t of a script when it is
	/// set horizontally. All right-to-left scripts will return
	/// HB_DIRECTION_RTL. All left-to-right scripts will return
	/// HB_DIRECTION_LTR.
	///
	/// Scripts that can be written either right-to-left or
	/// left-to-right will return HB_DIRECTION_INVALID.
	///
	/// Unknown scripts will return HB_DIRECTION_LTR.
	///
	/// @script: The hb_script_t to query
	///
	/// Return value: The horizontal hb_direction_t of @script
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_direction_t hb_script_get_horizontal_direction(hb_script_t script);
	
	/// Parses a string into a hb_feature_t.
	///
	/// The format for specifying feature strings follows. All valid CSS
	/// font-feature-settings values other than 'normal' and the global values are
	/// also accepted, though not documented below. CSS string escapes are not
	/// supported.
	///
	/// The range indices refer to the positions between Unicode characters. The
	/// position before the first character is always 0.
	///
	/// The format is Python-esque.  Here is how it all works:
	///
	/// <informaltable pgwide='1' align='left' frame='none'>
	/// <tgroup cols='5'>
	/// <thead>
	/// <row><entry>Syntax</entry>    <entry>Value</entry> <entry>Start</entry> <entry>End</entry></row>
	/// </thead>
	/// <tbody>
	/// <row><entry>Setting value:</entry></row>
	/// <row><entry>kern</entry>      <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
	/// <row><entry>+kern</entry>     <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
	/// <row><entry>-kern</entry>     <entry>0</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature off</entry></row>
	/// <row><entry>kern=0</entry>    <entry>0</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature off</entry></row>
	/// <row><entry>kern=1</entry>    <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
	/// <row><entry>aalt=2</entry>    <entry>2</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Choose 2nd alternate</entry></row>
	/// <row><entry>Setting index:</entry></row>
	/// <row><entry>kern[]</entry>    <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
	/// <row><entry>kern[:]</entry>   <entry>1</entry>     <entry>0</entry>      <entry>∞</entry>   <entry>Turn feature on</entry></row>
	/// <row><entry>kern[5:]</entry>  <entry>1</entry>     <entry>5</entry>      <entry>∞</entry>   <entry>Turn feature on, partial</entry></row>
	/// <row><entry>kern[:5]</entry>  <entry>1</entry>     <entry>0</entry>      <entry>5</entry>   <entry>Turn feature on, partial</entry></row>
	/// <row><entry>kern[3:5]</entry> <entry>1</entry>     <entry>3</entry>      <entry>5</entry>   <entry>Turn feature on, range</entry></row>
	/// <row><entry>kern[3]</entry>   <entry>1</entry>     <entry>3</entry>      <entry>3+1</entry> <entry>Turn feature on, single char</entry></row>
	/// <row><entry>Mixing it all:</entry></row>
	/// <row><entry>aalt[3:5]=2</entry> <entry>2</entry>   <entry>3</entry>      <entry>5</entry>   <entry>Turn 2nd alternate on for range</entry></row>
	/// </tbody>
	/// </tgroup>
	/// </informaltable>
	///
	/// @str: (array length=len) (element-type uint8_t): a string to parse
	/// @len: length of @str, or -1 if string is `NULL` terminated
	/// @feature: (out): the hb_feature_t to initialize with the parsed values
	///
	/// Return value:
	/// `true` if @str is successfully parsed, `false` otherwise
	///
	/// Since: 0.9.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_feature_from_string(c_char* str, c_int len, out hb_feature_t feature);
	
	/// Converts a hb_feature_t into a `NULL`-terminated string in the format
	/// understood by hb_feature_from_string(). The client in responsible for
	/// allocating big enough size for @buf, 128 bytes is more than enough.
	///
	/// Note that the feature value will be omitted if it is '1', but the
	/// string won't include any whitespace.
	///
	/// @feature: an hb_feature_t to convert
	/// @buf: (array length=size) (out): output string
	/// @size: the allocated size of @buf
	///
	/// Since: 0.9.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_feature_to_string(hb_feature_t* feature, c_char* buf, c_uint size);
	
	/// Parses a string into a hb_variation_t.
	///
	/// The format for specifying variation settings follows. All valid CSS
	/// font-variation-settings values other than 'normal' and 'inherited' are also
	/// accepted, though, not documented below.
	///
	/// The format is a tag, optionally followed by an equals sign, followed by a
	/// number. For example `wght=500`, or `slnt=-7.5`.
	///
	/// @str: (array length=len) (element-type uint8_t): a string to parse
	/// @len: length of @str, or -1 if string is `NULL` terminated
	/// @variation: (out): the hb_variation_t to initialize with the parsed values
	///
	/// Return value:
	/// `true` if @str is successfully parsed, `false` otherwise
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_variation_from_string(c_char* str, c_int len, out hb_variation_t variation);
	
	/// Converts an hb_variation_t into a `NULL`-terminated string in the format
	/// understood by hb_variation_from_string(). The client in responsible for
	/// allocating big enough size for @buf, 128 bytes is more than enough.
	///
	/// Note that the string won't include any whitespace.
	///
	/// @variation: an hb_variation_t to convert
	/// @buf: (array length=size) (out caller-allocates): output string
	/// @size: the allocated size of @buf
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_variation_to_string(hb_variation_t* variation, c_char* buf, c_uint size);
	
	/// Fetches the alpha channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Alpha channel value
	///
	/// Since: 2.1.0
	// TODO: !!!
	/*[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern uint8 hb_color_get_alpha(hb_color_t color);*/
	
	/// Fetches the red channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Red channel value
	///
	/// Since: 2.1.0
	// TODO: !!!
	/*[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern uint8 hb_color_get_red(hb_color_t color);*/
	
	/// Fetches the green channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Green channel value
	///
	/// Since: 2.1.0
	// TODO: !!!
	/*[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern uint8 hb_color_get_green(hb_color_t color);*/
	
	/// Fetches the blue channel of the given @color.
	///
	/// @color: an hb_color_t we are interested in its channels.
	///
	/// Return value: Blue channel value
	///
	/// Since: 2.1.0
	// TODO: !!!
	/*[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern uint8 hb_color_get_blue(hb_color_t color);*/
	
	/// Allocates @size bytes of memory, using the allocator set at
	/// compile-time. Typically just malloc().
	///
	/// @size: The size of the memory to allocate.
	///
	/// Return value: A pointer to the allocated memory.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_malloc(uint size);
	
	/// Allocates @nmemb elements of @size bytes each, initialized to zero,
	/// using the allocator set at compile-time. Typically just calloc().
	///
	/// @nmemb: The number of elements to allocate.
	/// @size: The size of each element.
	///
	/// Return value: A pointer to the allocated memory.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_calloc(uint nmemb, uint size);
	
	/// Reallocates the memory pointed to by @ptr to @size bytes, using the
	/// allocator set at compile-time. Typically just realloc().
	///
	/// @ptr: The pointer to the memory to reallocate.
	/// @size: The new size of the memory.
	///
	/// Return value: A pointer to the reallocated memory.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_realloc(void* ptr, uint size);
	
	/// Frees the memory pointed to by @ptr, using the allocator set at
	/// compile-time. Typically just free().
	///
	/// @ptr: The pointer to the memory to free.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_free(void* ptr);
	
	// ====================================================================
	// hb-blob.h
	// ====================================================================
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_create(c_char* data, c_uint length, hb_memory_mode_t mode, void* user_data, hb_destroy_func_t destroy);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_create_or_fail(c_char* data, c_uint length, hb_memory_mode_t mode, void* user_data, hb_destroy_func_t destroy);
	
	/// Creates a new blob containing the data from the
	/// specified binary font file.
	///
	/// The filename is passed directly to the system on all platforms,
	/// except on Windows, where the filename is interpreted as UTF-8.
	/// Only if the filename is not valid UTF-8, it will be interpreted
	/// according to the system codepage.
	///
	/// @file_name: A font filename
	///
	/// Returns: An hb_blob_t pointer with the content of the file,
	/// or hb_blob_get_empty() if failed.
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_create_from_file(c_char* file_name);
	
	/// Creates a new blob containing the data from the specified file.
	///
	/// The filename is passed directly to the system on all platforms,
	/// except on Windows, where the filename is interpreted as UTF-8.
	/// Only if the filename is not valid UTF-8, it will be interpreted
	/// according to the system codepage.
	///
	/// @file_name: A filename
	///
	/// Returns: An hb_blob_t pointer with the content of the file,
	/// or `NULL` if failed.
	///
	/// Since: 2.8.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_create_from_file_or_fail(c_char* file_name);
	
	/// Returns a blob that represents a range of bytes in @parent.  The new
	/// blob is always created with HB_MEMORY_MODE_READONLY, meaning that it
	/// will never modify data in the parent blob.  The parent data is not
	/// expected to be modified, and will result in undefined behavior if it
	/// is.
	///
	/// Makes @parent immutable.
	///
	/// @parent: Parent blob.
	/// @offset: Start offset of sub-blob within @parent, in bytes.
	/// @length: Length of sub-blob.
	///
	/// Return value: New blob, or the empty blob if something failed or if
	/// @length is zero or @offset is beyond the end of @parent's data.  Destroy
	/// with hb_blob_destroy().
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_create_sub_blob(hb_blob_t* parent, c_uint offset, c_uint length);
	
	/// Makes a writable copy of @blob.
	///
	/// @blob: A blob.
	///
	/// Return value: The new blob, or nullptr if allocation failed
	///
	/// Since: 1.8.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_copy_writable_or_fail(hb_blob_t* blob);
	
	/// Returns the singleton empty blob.
	///
	/// See TODO:link object types for more information.
	///
	/// Return value: (transfer full): The empty blob.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_blob_reference(hb_blob_t* blob);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_blob_destroy(hb_blob_t* blob);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_blob_set_user_data(hb_blob_t* blob, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_blob_get_user_data(hb_blob_t* blob, hb_user_data_key_t* key);
	
	/// Makes a blob immutable.
	///
	/// @blob: a blob
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_blob_make_immutable(hb_blob_t* blob);
	
	/// Tests whether a blob is immutable.
	///
	/// @blob: a blob.
	///
	/// Return value: `true` if @blob is immutable, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_blob_is_immutable(hb_blob_t* blob);
	
	/// Fetches the length of a blob's data.
	///
	/// @blob: a blob.
	///
	/// Return value: the length of @blob data in bytes.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_blob_get_length(hb_blob_t* blob);
	
	/// Fetches the data from a blob.
	///
	/// @blob: a blob.
	/// @length: (out): The length in bytes of the data retrieved
	///
	/// Returns: (nullable) (transfer none) (array length=length): the byte data of @blob.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* hb_blob_get_data(hb_blob_t* blob, out c_uint length);
	
	/// Tries to make blob data writable (possibly copying it) and
	/// return pointer to data.
	///
	/// Fails if blob has been made immutable, or if memory allocation
	/// fails.
	///
	/// @blob: a blob.
	/// @length: (out): output length of the writable data.
	///
	/// Returns: (transfer none) (array length=length): Writable blob data,
	/// or `NULL` if failed.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* hb_blob_get_data_writable(hb_blob_t* blob, out c_uint length);
	
	// ====================================================================
	// hb-buffer.h
	// ====================================================================
	
	/// Returns glyph flags encoded within a hb_glyph_info_t.
	///
	/// @info: a hb_glyph_info_t
	///
	/// Return value:
	/// The hb_glyph_flags_t encoded within @info
	///
	/// Since: 1.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_glyph_flags_t hb_glyph_info_get_glyph_flags(hb_glyph_info_t* info);
	
	/// Checks the equality of two hb_segment_properties_t's.
	///
	/// @a: first hb_segment_properties_t to compare.
	/// @b: second hb_segment_properties_t to compare.
	///
	/// Return value:
	/// `true` if all properties of @a equal those of @b, `false` otherwise.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_segment_properties_equal(hb_segment_properties_t* a, hb_segment_properties_t* b);
	
	/// Creates a hash representing @p.
	///
	/// @p: hb_segment_properties_t to hash.
	///
	/// Return value:
	/// A hash of @p.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_segment_properties_hash(hb_segment_properties_t* p);
	
	/// Fills in missing fields of @p from @src in a considered manner.
	///
	/// First, if @p does not have direction set, direction is copied from @src.
	///
	/// Next, if @p and @src have the same direction (which can be unset), if @p
	/// does not have script set, script is copied from @src.
	///
	/// Finally, if @p and @src have the same direction and script (which either
	/// can be unset), if @p does not have language set, language is copied from
	/// @src.
	///
	/// @p: hb_segment_properties_t to fill in.
	/// @src: hb_segment_properties_t to fill in from.
	///
	/// Since: 3.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_segment_properties_overlay(hb_segment_properties_t* p, hb_segment_properties_t* src);
	
	/// Creates a new hb_buffer_t with all properties to defaults.
	///
	/// Return value: (transfer full):
	/// A newly allocated hb_buffer_t with a reference count of 1. The initial
	/// reference count should be released with hb_buffer_destroy() when you are done
	/// using the hb_buffer_t. This function never returns `NULL`. If memory cannot
	/// be allocated, a special hb_buffer_t object will be returned on which
	/// hb_buffer_allocation_successful() returns `false`.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_t* hb_buffer_create();
	
	/// Creates a new hb_buffer_t, similar to hb_buffer_create(). The only
	/// difference is that the buffer is configured similarly to @src.
	///
	/// @src: An hb_buffer_t
	///
	/// Return value: (transfer full):
	/// A newly allocated hb_buffer_t, similar to hb_buffer_create().
	///
	/// Since: 3.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_t* hb_buffer_create_similar(hb_buffer_t* src);
	
	/// Resets the buffer to its initial status, as if it was just newly created
	/// with hb_buffer_create().
	///
	/// @buffer: An hb_buffer_t
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_reset(hb_buffer_t* buffer);
	
	/// Fetches an empty hb_buffer_t.
	///
	/// Return value: (transfer full): The empty buffer
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_t* hb_buffer_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_t* hb_buffer_reference(hb_buffer_t* buffer);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_destroy(hb_buffer_t* buffer);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_buffer_set_user_data(hb_buffer_t* buffer, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_buffer_get_user_data(hb_buffer_t* buffer, hb_user_data_key_t* key);
	
	/// Sets the type of @buffer contents. Buffers are either empty, contain
	/// characters (before shaping), or contain glyphs (the result of shaping).
	///
	/// You rarely need to call this function, since a number of other
	/// functions transition the content type for you. Namely:
	///
	/// - A newly created buffer starts with content type
	///   HB_BUFFER_CONTENT_TYPE_INVALID. Calling hb_buffer_reset(),
	///   hb_buffer_clear_contents(), as well as calling hb_buffer_set_length()
	///   with an argument of zero all set the buffer content type to invalid
	///   as well.
	///
	/// - Calling hb_buffer_add_utf8(), hb_buffer_add_utf16(),
	///   hb_buffer_add_utf32(), hb_buffer_add_codepoints() and
	///   hb_buffer_add_latin1() expect that buffer is either empty and
	///   have a content type of invalid, or that buffer content type is
	///   HB_BUFFER_CONTENT_TYPE_UNICODE, and they also set the content
	///   type to Unicode if they added anything to an empty buffer.
	///
	/// - Finally hb_shape() and hb_shape_full() expect that the buffer
	///   is either empty and have content type of invalid, or that buffer
	///   content type is HB_BUFFER_CONTENT_TYPE_UNICODE, and upon
	///   success they set the buffer content type to
	///   HB_BUFFER_CONTENT_TYPE_GLYPHS.
	///
	/// The above transitions are designed such that one can use a buffer
	/// in a loop of "reset : add-text : shape" without needing to ever
	/// modify the content type manually.
	///
	/// @buffer: An hb_buffer_t
	/// @content_type: The type of buffer contents to set
	///
	/// Since: 0.9.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_content_type(hb_buffer_t* buffer, hb_buffer_content_type_t content_type);
	
	/// Fetches the type of @buffer contents. Buffers are either empty, contain
	/// characters (before shaping), or contain glyphs (the result of shaping).
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The type of @buffer contents
	///
	/// Since: 0.9.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_content_type_t hb_buffer_get_content_type(hb_buffer_t* buffer);
	
	/// Sets the Unicode-functions structure of a buffer to
	/// @unicode_funcs.
	///
	/// @buffer: An hb_buffer_t
	/// @unicode_funcs: The Unicode-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_unicode_funcs(hb_buffer_t* buffer, hb_unicode_funcs_t* unicode_funcs);
	
	/// Fetches the Unicode-functions structure of a buffer.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value: The Unicode-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_funcs_t* hb_buffer_get_unicode_funcs(hb_buffer_t* buffer);
	
	/// Set the text flow direction of the buffer. No shaping can happen without
	/// setting @buffer direction, and it controls the visual direction for the
	/// output glyphs; for RTL direction the glyphs will be reversed. Many layout
	/// features depend on the proper setting of the direction, for example,
	/// reversing RTL text before shaping, then shaping with LTR direction is not
	/// the same as keeping the text in logical order and shaping with RTL
	/// direction.
	///
	/// @buffer: An hb_buffer_t
	/// @direction: the hb_direction_t of the @buffer
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_direction(hb_buffer_t* buffer, hb_direction_t direction);
	
	/// See hb_buffer_set_direction()
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The direction of the @buffer.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_direction_t hb_buffer_get_direction(hb_buffer_t* buffer);
	
	/// Sets the script of @buffer to @script.
	///
	/// Script is crucial for choosing the proper shaping behaviour for scripts that
	/// require it (e.g. Arabic) and the which OpenType features defined in the font
	/// to be applied.
	///
	/// You can pass one of the predefined hb_script_t values, or use
	/// hb_script_from_string() or hb_script_from_iso15924_tag() to get the
	/// corresponding script from an ISO 15924 script tag.
	///
	/// @buffer: An hb_buffer_t
	/// @script: An hb_script_t to set.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_script(hb_buffer_t* buffer, hb_script_t script);
	
	/// Fetches the script of @buffer.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The hb_script_t of the @buffer
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_script_t hb_buffer_get_script(hb_buffer_t* buffer);
	
	/// Sets the language of @buffer to @language.
	///
	/// Languages are crucial for selecting which OpenType feature to apply to the
	/// buffer which can result in applying language-specific behaviour. Languages
	/// are orthogonal to the scripts, and though they are related, they are
	/// different concepts and should not be confused with each other.
	///
	/// Use hb_language_from_string() to convert from BCP 47 language tags to
	/// hb_language_t.
	///
	/// @buffer: An hb_buffer_t
	/// @language: An hb_language_t to set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_language(hb_buffer_t* buffer, hb_language_t language);
	
	/// See hb_buffer_set_language().
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value: (transfer none):
	/// The hb_language_t of the buffer. Must not be freed by the caller.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_language_t hb_buffer_get_language(hb_buffer_t* buffer);
	
	/// Sets the segment properties of the buffer, a shortcut for calling
	/// hb_buffer_set_direction(), hb_buffer_set_script() and
	/// hb_buffer_set_language() individually.
	///
	/// @buffer: An hb_buffer_t
	/// @props: An hb_segment_properties_t to use
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_segment_properties(hb_buffer_t* buffer, hb_segment_properties_t* props);
	
	/// Sets @props to the hb_segment_properties_t of @buffer.
	///
	/// @buffer: An hb_buffer_t
	/// @props: (out): The output hb_segment_properties_t
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_get_segment_properties(hb_buffer_t* buffer, out hb_segment_properties_t props);
	
	/// Sets unset buffer segment properties based on buffer Unicode
	/// contents.  If buffer is not empty, it must have content type
	/// HB_BUFFER_CONTENT_TYPE_UNICODE.
	///
	/// If buffer script is not set (ie. is HB_SCRIPT_INVALID), it
	/// will be set to the Unicode script of the first character in
	/// the buffer that has a script other than HB_SCRIPT_COMMON,
	/// HB_SCRIPT_INHERITED, and HB_SCRIPT_UNKNOWN.
	///
	/// Next, if buffer direction is not set (ie. is HB_DIRECTION_INVALID),
	/// it will be set to the natural horizontal direction of the
	/// buffer script as returned by hb_script_get_horizontal_direction().
	/// If hb_script_get_horizontal_direction() returns HB_DIRECTION_INVALID,
	/// then HB_DIRECTION_LTR is used.
	///
	/// Finally, if buffer language is not set (ie. is HB_LANGUAGE_INVALID),
	/// it will be set to the process's default language as returned by
	/// hb_language_get_default().  This may change in the future by
	/// taking buffer script into consideration when choosing a language.
	/// Note that hb_language_get_default() is NOT threadsafe the first time
	/// it is called.  See documentation for that function for details.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_guess_segment_properties(hb_buffer_t* buffer);
	
	/// Sets @buffer flags to @flags. See hb_buffer_flags_t.
	///
	/// @buffer: An hb_buffer_t
	/// @flags: The buffer flags to set
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_flags(hb_buffer_t* buffer, hb_buffer_flags_t flags);
	
	/// Fetches the hb_buffer_flags_t of @buffer.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The @buffer flags
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_flags_t hb_buffer_get_flags(hb_buffer_t* buffer);
	
	/// Sets the cluster level of a buffer. The hb_buffer_cluster_level_t
	/// dictates one aspect of how HarfBuzz will treat non-base characters
	/// during shaping.
	///
	/// @buffer: An hb_buffer_t
	/// @cluster_level: The cluster level to set on the buffer
	///
	/// Since: 0.9.42
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_cluster_level(hb_buffer_t* buffer, hb_buffer_cluster_level_t cluster_level);
	
	/// Fetches the cluster level of a buffer. The hb_buffer_cluster_level_t
	/// dictates one aspect of how HarfBuzz will treat non-base characters
	/// during shaping.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value: The cluster level of @buffer
	///
	/// Since: 0.9.42
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_cluster_level_t hb_buffer_get_cluster_level(hb_buffer_t* buffer);
	
	/// Sets the hb_codepoint_t that replaces invalid entries for a given encoding
	/// when adding text to @buffer.
	///
	/// Default is HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT.
	///
	/// @buffer: An hb_buffer_t
	/// @replacement: the replacement hb_codepoint_t
	///
	/// Since: 0.9.31
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_replacement_codepoint(hb_buffer_t* buffer, hb_codepoint_t replacement);
	
	/// Fetches the hb_codepoint_t that replaces invalid entries for a given encoding
	/// when adding text to @buffer.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The @buffer replacement hb_codepoint_t
	///
	/// Since: 0.9.31
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_buffer_get_replacement_codepoint(hb_buffer_t* buffer);
	
	/// Sets the hb_codepoint_t that replaces invisible characters in
	/// the shaping result.  If set to zero (default), the glyph for the
	/// U+0020 SPACE character is used.  Otherwise, this value is used
	/// verbatim.
	///
	/// @buffer: An hb_buffer_t
	/// @invisible: the invisible hb_codepoint_t
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_invisible_glyph(hb_buffer_t* buffer, hb_codepoint_t invisible);
	
	/// See hb_buffer_set_invisible_glyph().
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The @buffer invisible hb_codepoint_t
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_buffer_get_invisible_glyph(hb_buffer_t* buffer);
	
	/// Sets the hb_codepoint_t that replaces characters not found in
	/// the font during shaping.
	///
	/// The not-found glyph defaults to zero, sometimes known as the
	/// ".notdef" glyph.  This API allows for differentiating the two.
	///
	/// @buffer: An hb_buffer_t
	/// @not_found: the not-found hb_codepoint_t
	///
	/// Since: 3.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_not_found_glyph(hb_buffer_t* buffer, hb_codepoint_t not_found);
	
	/// See hb_buffer_set_not_found_glyph().
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The @buffer not-found hb_codepoint_t
	///
	/// Since: 3.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_buffer_get_not_found_glyph(hb_buffer_t* buffer);
	
	/// Sets the hb_codepoint_t that replaces variation-selector characters not resolved
	/// in the font during shaping.
	///
	/// The not-found-variation-selector glyph defaults to HB_CODEPOINT_INVALID,
	/// in which case an unresolved variation-selector will be removed from the glyph
	/// string during shaping. This API allows for changing that and retaining a glyph,
	/// such that the situation can be detected by the client and handled accordingly
	/// (e.g. by using a different font).
	///
	/// @buffer: An hb_buffer_t
	/// @not_found_variation_selector: the not-found-variation-selector hb_codepoint_t
	///
	/// Since: 10.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_not_found_variation_selector_glyph(hb_buffer_t* buffer, hb_codepoint_t not_found_variation_selector);
	
	/// See hb_buffer_set_not_found_variation_selector_glyph().
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The @buffer not-found-variation-selector hb_codepoint_t
	///
	/// Since: 10.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_buffer_get_not_found_variation_selector_glyph(hb_buffer_t* buffer);
	
	/// Sets the random state of the buffer. The state changes
	/// every time a glyph uses randomness (eg. the `rand`
	/// OpenType feature). This function together with
	/// hb_buffer_get_random_state() allow for transferring
	/// the current random state to a subsequent buffer, to
	/// get better randomness distribution.
	///
	/// Defaults to 1 and when buffer contents are cleared.
	/// A value of 0 disables randomness during shaping.
	///
	/// @buffer: An hb_buffer_t
	/// @state: the new random state
	///
	/// Since: 8.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_random_state(hb_buffer_t* buffer, c_uint state);
	
	/// See hb_buffer_set_random_state().
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The @buffer random state
	///
	/// Since: 8.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_buffer_get_random_state(hb_buffer_t* buffer);
	
	/// Similar to hb_buffer_reset(), but does not clear the Unicode functions and
	/// the replacement code point.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Since: 0.9.11
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_clear_contents(hb_buffer_t* buffer);
	
	/// Pre allocates memory for @buffer to fit at least @size number of items.
	///
	/// @buffer: An hb_buffer_t
	/// @size: Number of items to pre allocate.
	///
	/// Return value:
	/// `true` if @buffer memory allocation succeeded, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_buffer_pre_allocate(hb_buffer_t* buffer, c_uint size);
	
	/// Check if allocating memory for the buffer succeeded.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// `true` if @buffer memory allocation succeeded, `false` otherwise.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_buffer_allocation_successful(hb_buffer_t* buffer);
	
	/// Reverses buffer contents.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_reverse(hb_buffer_t* buffer);
	
	/// Reverses buffer contents between @start and @end.
	///
	/// @buffer: An hb_buffer_t
	/// @start: start index
	/// @end: end index
	///
	/// Since: 0.9.41
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_reverse_range(hb_buffer_t* buffer, c_uint start, c_uint end);
	
	/// Reverses buffer clusters.  That is, the buffer contents are
	/// reversed, then each cluster (consecutive items having the
	/// same cluster number) are reversed again.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_reverse_clusters(hb_buffer_t* buffer);
	
	/// Appends a character with the Unicode value of @codepoint to @buffer, and
	/// gives it the initial cluster value of @cluster. Clusters can be any thing
	/// the client wants, they are usually used to refer to the index of the
	/// character in the input text stream and are output in
	/// hb_glyph_info_t.cluster field.
	///
	/// This function does not check the validity of @codepoint, it is up to the
	/// caller to ensure it is a valid Unicode code point.
	///
	/// @buffer: An hb_buffer_t
	/// @codepoint: A Unicode code point.
	/// @cluster: The cluster value of @codepoint.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_add(hb_buffer_t* buffer, hb_codepoint_t codepoint, c_uint cluster);
	
	/// See hb_buffer_add_codepoints().
	///
	/// Replaces invalid UTF-8 characters with the @buffer replacement code point,
	/// see hb_buffer_set_replacement_codepoint().
	///
	/// @buffer: An hb_buffer_t
	/// @text: (array length=text_length) (element-type uint8_t): An array of UTF-8
	///     characters to append.
	/// @text_length: The length of the @text, or -1 if it is `NULL` terminated.
	/// @item_offset: The offset of the first character to add to the @buffer.
	/// @item_length: The number of characters to add to the @buffer, or -1 for the
	///     end of @text (assuming it is `NULL` terminated).
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_add_utf8(hb_buffer_t* buffer, c_char* text, c_int text_length, c_uint item_offset, c_int item_length);
	
	/// See hb_buffer_add_codepoints().
	///
	/// Replaces invalid UTF-16 characters with the @buffer replacement code point,
	/// see hb_buffer_set_replacement_codepoint().
	///
	/// @buffer: An hb_buffer_t
	/// @text: (array length=text_length): An array of UTF-16 characters to append
	/// @text_length: The length of the @text, or -1 if it is `NULL` terminated
	/// @item_offset: The offset of the first character to add to the @buffer
	/// @item_length: The number of characters to add to the @buffer, or -1 for the
	///     end of @text (assuming it is `NULL` terminated)
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_add_utf16(hb_buffer_t* buffer, uint16* text, c_int text_length, c_uint item_offset, c_int item_length);
	
	/// See hb_buffer_add_codepoints().
	///
	/// Replaces invalid UTF-32 characters with the @buffer replacement code point,
	/// see hb_buffer_set_replacement_codepoint().
	///
	/// @buffer: An hb_buffer_t
	/// @text: (array length=text_length): An array of UTF-32 characters to append
	/// @text_length: The length of the @text, or -1 if it is `NULL` terminated
	/// @item_offset: The offset of the first character to add to the @buffer
	/// @item_length: The number of characters to add to the @buffer, or -1 for the
	///     end of @text (assuming it is `NULL` terminated)
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_add_utf32(hb_buffer_t* buffer, uint32* text, c_int text_length, c_uint item_offset, c_int item_length);
	
	/// Similar to hb_buffer_add_codepoints(), but allows only access to first 256
	/// Unicode code points that can fit in 8-bit strings.
	///
	/// <note>Has nothing to do with non-Unicode Latin-1 encoding.</note>
	///
	/// @buffer: An hb_buffer_t
	/// @text: (array length=text_length) (element-type uint8_t): an array of UTF-8
	///     characters to append
	/// @text_length: the length of the @text, or -1 if it is `NULL` terminated
	/// @item_offset: the offset of the first character to add to the @buffer
	/// @item_length: the number of characters to add to the @buffer, or -1 for the
	///     end of @text (assuming it is `NULL` terminated)
	///
	/// Since: 0.9.39
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_add_latin1(hb_buffer_t* buffer, uint8* text, c_int text_length, c_uint item_offset, c_int item_length);
	
	/// Appends characters from @text array to @buffer. The @item_offset is the
	/// position of the first character from @text that will be appended, and
	/// @item_length is the number of character. When shaping part of a larger text
	/// (e.g. a run of text from a paragraph), instead of passing just the substring
	/// corresponding to the run, it is preferable to pass the whole
	/// paragraph and specify the run start and length as @item_offset and
	/// @item_length, respectively, to give HarfBuzz the full context to be able,
	/// for example, to do cross-run Arabic shaping or properly handle combining
	/// marks at stat of run.
	///
	/// This function does not check the validity of @text, it is up to the caller
	/// to ensure it contains a valid Unicode scalar values.  In contrast,
	/// hb_buffer_add_utf32() can be used that takes similar input but performs
	/// sanity-check on the input.
	///
	/// @buffer: a hb_buffer_t to append characters to.
	/// @text: (array length=text_length): an array of Unicode code points to append.
	/// @text_length: the length of the @text, or -1 if it is `NULL` terminated.
	/// @item_offset: the offset of the first code point to add to the @buffer.
	/// @item_length: the number of code points to add to the @buffer, or -1 for the
	///     end of @text (assuming it is `NULL` terminated).
	///
	/// Since: 0.9.31
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_add_codepoints(hb_buffer_t* buffer, hb_codepoint_t* text, c_int text_length, c_uint item_offset, c_int item_length);
	
	/// Append (part of) contents of another buffer to this buffer.
	///
	/// @buffer: An hb_buffer_t
	/// @source: source hb_buffer_t
	/// @start: start index into source buffer to copy.  Use 0 to copy from start of buffer.
	/// @end: end index into source buffer to copy.  Use @UINT_MAX (or ((unsigned int) -1)) to copy to end of buffer.
	///
	/// Since: 1.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_append(hb_buffer_t* buffer, hb_buffer_t* source, c_uint start, c_uint end);
	
	/// Similar to hb_buffer_pre_allocate(), but clears any new items added at the
	/// end.
	///
	/// @buffer: An hb_buffer_t
	/// @length: The new length of @buffer
	///
	/// Return value:
	/// `true` if @buffer memory allocation succeeded, `false` otherwise.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_buffer_set_length(hb_buffer_t* buffer, c_uint length);
	
	/// Returns the number of items in the buffer.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Return value:
	/// The @buffer length.
	/// The value valid as long as buffer has not been modified.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_buffer_get_length(hb_buffer_t* buffer);
	
	/// Returns @buffer glyph information array.  Returned pointer
	/// is valid as long as @buffer contents are not modified.
	///
	/// @buffer: An hb_buffer_t
	/// @length: (out): The output-array length.
	///
	/// Return value: (transfer none) (array length=length):
	/// The @buffer glyph information array.
	/// The value valid as long as buffer has not been modified.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_glyph_info_t* hb_buffer_get_glyph_infos(hb_buffer_t* buffer, out c_uint length);
	
	/// Returns @buffer glyph position array.  Returned pointer
	/// is valid as long as @buffer contents are not modified.
	///
	/// If buffer did not have positions before, the positions will be
	/// initialized to zeros, unless this function is called from
	/// within a buffer message callback (see hb_buffer_set_message_func()),
	/// in which case `NULL` is returned.
	///
	/// @buffer: An hb_buffer_t
	/// @length: (out): The output length
	///
	/// Return value: (transfer none) (array length=length):
	/// The @buffer glyph position array.
	/// The value valid as long as buffer has not been modified.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_glyph_position_t* hb_buffer_get_glyph_positions(hb_buffer_t* buffer, out c_uint length);
	
	/// Returns whether @buffer has glyph position data.
	/// A buffer gains position data when hb_buffer_get_glyph_positions() is called on it,
	/// and cleared of position data when hb_buffer_clear_contents() is called.
	///
	/// @buffer: an hb_buffer_t.
	///
	/// Return value:
	/// `true` if the @buffer has position array, `false` otherwise.
	///
	/// Since: 2.7.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_buffer_has_positions(hb_buffer_t* buffer);
	
	/// Reorders a glyph buffer to have canonical in-cluster glyph order / position.
	/// The resulting clusters should behave identical to pre-reordering clusters.
	///
	/// <note>This has nothing to do with Unicode normalization.</note>
	///
	/// @buffer: An hb_buffer_t
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_normalize_glyphs(hb_buffer_t* buffer);
	
	/// Parses a string into an hb_buffer_serialize_format_t. Does not check if
	/// @str is a valid buffer serialization format, use
	/// hb_buffer_serialize_list_formats() to get the list of supported formats.
	///
	/// @str: (array length=len) (element-type uint8_t): a string to parse
	/// @len: length of @str, or -1 if string is `NULL` terminated
	///
	/// Return value:
	/// The parsed hb_buffer_serialize_format_t.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_serialize_format_t hb_buffer_serialize_format_from_string(c_char* str, c_int len);
	
	/// Converts @format to the string corresponding it, or `NULL` if it is not a valid
	/// hb_buffer_serialize_format_t.
	///
	/// @format: an hb_buffer_serialize_format_t to convert.
	///
	/// Return value: (transfer none):
	/// A `NULL` terminated string corresponding to @format. Should not be freed.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* hb_buffer_serialize_format_to_string(hb_buffer_serialize_format_t format);
	
	/// Returns a list of supported buffer serialization formats.
	///
	/// Return value: (transfer none):
	/// A string array of buffer serialization formats. Should not be freed.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char** hb_buffer_serialize_list_formats();
	
	/// Serializes @buffer into a textual representation of its glyph content,
	/// useful for showing the contents of the buffer, for example during debugging.
	/// There are currently two supported serialization formats:
	///
	/// ## text
	/// A human-readable, plain text format.
	/// The serialized glyphs will look something like:
	///
	/// |[<!-- language="plain" -->
	/// [uni0651=0@518,0+0|uni0628=0+1897]
	/// ]|
	///
	/// - The serialized glyphs are delimited with `[` and `]`.
	/// - Glyphs are separated with `|`
	/// - Each glyph starts with glyph name, or glyph index if
	///   HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES flag is set. Then,
	///   - If HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS is not set, `=` then hb_glyph_info_t.cluster.
	///   - If HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS is not set, the hb_glyph_position_t in the format:
	///     - If hb_glyph_position_t.x_offset and hb_glyph_position_t.y_offset are not both 0, `@x_offset,y_offset`. Then,
	///     - `+x_advance`, then `,y_advance` if hb_glyph_position_t.y_advance is not 0. Then,
	///   - If HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS is set, the hb_glyph_extents_t in the format `<x_bearing,y_bearing,width,height>`
	///
	/// ## json
	/// A machine-readable, structured format.
	/// The serialized glyphs will look something like:
	///
	/// |[<!-- language="plain" -->
	/// [{"g":"uni0651","cl":0,"dx":518,"dy":0,"ax":0,"ay":0},
	///  {"g":"uni0628","cl":0,"dx":0,"dy":0,"ax":1897,"ay":0}]
	/// ]|
	///
	/// Each glyph is a JSON object, with the following properties:
	/// - `g`: the glyph name or glyph index if
	///   HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES flag is set.
	/// - `cl`: hb_glyph_info_t.cluster if
	///   HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS is not set.
	/// - `dx`,`dy`,`ax`,`ay`: hb_glyph_position_t.x_offset, hb_glyph_position_t.y_offset,
	///    hb_glyph_position_t.x_advance and hb_glyph_position_t.y_advance
	///    respectively, if HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS is not set.
	/// - `xb`,`yb`,`w`,`h`: hb_glyph_extents_t.x_bearing, hb_glyph_extents_t.y_bearing,
	///    hb_glyph_extents_t.width and hb_glyph_extents_t.height respectively if
	///    HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS is set.
	///
	/// @buffer: an hb_buffer_t buffer.
	/// @start: the first item in @buffer to serialize.
	/// @end: the last item in @buffer to serialize.
	/// @buf: (out) (array length=buf_size) (element-type uint8_t): output string to
	///     write serialized buffer into.
	/// @buf_size: the size of @buf.
	/// @buf_consumed: (out) (optional): if not `NULL`, will be set to the number of bytes written into @buf.
	/// @font: (nullable): the hb_font_t used to shape this buffer, needed to
	///     read glyph names and extents. If `NULL`, an empty font will be used.
	/// @format: the hb_buffer_serialize_format_t to use for formatting the output.
	/// @flags: the hb_buffer_serialize_flags_t that control what glyph properties
	///     to serialize.
	///
	/// Return value:
	/// The number of serialized items.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_buffer_serialize_glyphs(hb_buffer_t* buffer, c_uint start, c_uint end, c_char* buf, c_uint buf_size, c_uint* buf_consumed, hb_font_t* font, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags);
	
	/// Serializes @buffer into a textual representation of its content,
	/// when the buffer contains Unicode codepoints (i.e., before shaping). This is
	/// useful for showing the contents of the buffer, for example during debugging.
	/// There are currently two supported serialization formats:
	///
	/// ## text
	/// A human-readable, plain text format.
	/// The serialized codepoints will look something like:
	///
	/// |[<!-- language="plain" -->
	///  <U+0651=0|U+0628=1>
	/// ]|
	///
	/// - Glyphs are separated with `|`
	/// - Unicode codepoints are expressed as zero-padded four (or more)
	///   digit hexadecimal numbers preceded by `U+`
	/// - If HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS is not set, the cluster
	///   will be indicated with a `=` then hb_glyph_info_t.cluster.
	///
	/// ## json
	/// A machine-readable, structured format.
	/// The serialized codepoints will be a list of objects with the following
	/// properties:
	/// - `u`: the Unicode codepoint as a decimal integer
	/// - `cl`: hb_glyph_info_t.cluster if
	///   HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS is not set.
	///
	/// For example:
	///
	/// |[<!-- language="plain" -->
	/// [{u:1617,cl:0},{u:1576,cl:1}]
	/// ]|
	///
	/// @buffer: an hb_buffer_t buffer.
	/// @start: the first item in @buffer to serialize.
	/// @end: the last item in @buffer to serialize.
	/// @buf: (out) (array length=buf_size) (element-type uint8_t): output string to
	///     write serialized buffer into.
	/// @buf_size: the size of @buf.
	/// @buf_consumed: (out) (optional): if not `NULL`, will be set to the number of bytes written into @buf.
	/// @format: the hb_buffer_serialize_format_t to use for formatting the output.
	/// @flags: the hb_buffer_serialize_flags_t that control what glyph properties
	///     to serialize.
	///
	/// Return value:
	/// The number of serialized items.
	///
	/// Since: 2.7.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_buffer_serialize_unicode(hb_buffer_t* buffer, c_uint start, c_uint end, c_char* buf, c_uint buf_size, c_uint* buf_consumed, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags);
	
	/// Serializes @buffer into a textual representation of its content, whether
	/// Unicode codepoints or glyph identifiers and positioning information. This is
	/// useful for showing the contents of the buffer, for example during debugging.
	/// See the documentation of hb_buffer_serialize_unicode() and
	/// hb_buffer_serialize_glyphs() for a description of the output format.
	///
	/// @buffer: an hb_buffer_t buffer.
	/// @start: the first item in @buffer to serialize.
	/// @end: the last item in @buffer to serialize.
	/// @buf: (out) (array length=buf_size) (element-type uint8_t): output string to
	///     write serialized buffer into.
	/// @buf_size: the size of @buf.
	/// @buf_consumed: (out) (optional): if not `NULL`, will be set to the number of bytes written into @buf.
	/// @font: (nullable): the hb_font_t used to shape this buffer, needed to
	///     read glyph names and extents. If `NULL`, an empty font will be used.
	/// @format: the hb_buffer_serialize_format_t to use for formatting the output.
	/// @flags: the hb_buffer_serialize_flags_t that control what glyph properties
	///     to serialize.
	///
	/// Return value:
	/// The number of serialized items.
	///
	/// Since: 2.7.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_buffer_serialize(hb_buffer_t* buffer, c_uint start, c_uint end, c_char* buf, c_uint buf_size, c_uint* buf_consumed, hb_font_t* font, hb_buffer_serialize_format_t format, hb_buffer_serialize_flags_t flags);
	
	/// Deserializes glyphs @buffer from textual representation in the format
	/// produced by hb_buffer_serialize_glyphs().
	///
	/// @buffer: an hb_buffer_t buffer.
	/// @buf: (array length=buf_len): string to deserialize
	/// @buf_len: the size of @buf, or -1 if it is `NULL`-terminated
	/// @end_ptr: (out) (optional): output pointer to the character after last
	///     consumed one.
	/// @font: (nullable): font for getting glyph IDs
	/// @format: the hb_buffer_serialize_format_t of the input @buf
	///
	/// Return value: `true` if the full string was parsed, `false` otherwise.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_buffer_deserialize_glyphs(hb_buffer_t* buffer, c_char* buf, c_int buf_len, c_char** end_ptr, hb_font_t* font, hb_buffer_serialize_format_t format);
	
	/// Deserializes Unicode @buffer from textual representation in the format
	/// produced by hb_buffer_serialize_unicode().
	///
	/// @buffer: an hb_buffer_t buffer.
	/// @buf: (array length=buf_len): string to deserialize
	/// @buf_len: the size of @buf, or -1 if it is `NULL`-terminated
	/// @end_ptr: (out) (optional): output pointer to the character after last
	///     consumed one.
	/// @format: the hb_buffer_serialize_format_t of the input @buf
	///
	/// Return value: `true` if the full string was parsed, `false` otherwise.
	///
	/// Since: 2.7.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_buffer_deserialize_unicode(hb_buffer_t* buffer, c_char* buf, c_int buf_len, c_char** end_ptr, hb_buffer_serialize_format_t format);
	
	/// If dottedcircle_glyph is (hb_codepoint_t) -1 then HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT
	/// and HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT are never returned.  This should be used by most
	/// callers if just comparing two buffers is needed.
	///
	/// @buffer: a buffer.
	/// @reference: other buffer to compare to.
	/// @dottedcircle_glyph: glyph id of U+25CC DOTTED CIRCLE, or (hb_codepoint_t) -1.
	/// @position_fuzz: allowed absolute difference in position values.
	///
	/// Since: 1.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_buffer_diff_flags_t hb_buffer_diff(hb_buffer_t* buffer, hb_buffer_t* reference, hb_codepoint_t dottedcircle_glyph, c_uint position_fuzz);
	
	/// Sets the implementation function for hb_buffer_message_func_t.
	///
	/// @buffer: An hb_buffer_t
	/// @func: (closure user_data) (destroy destroy) (scope notified): Callback function
	/// @user_data: (nullable): Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 1.1.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_set_message_func(hb_buffer_t* buffer, hb_buffer_message_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Called by a message callback after modifying buffer glyph indices,
	/// to update internal caches.
	///
	/// If not called from inside a message callback, does nothing.
	///
	/// @buffer: An hb_buffer_t
	///
	/// Since: 13.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_buffer_changed(hb_buffer_t* buffer);
	
	// ====================================================================
	// hb-draw.h
	// ====================================================================
	
	/// Sets move-to callback to the draw functions object.
	///
	/// @dfuncs: draw functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): move-to callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_move_to_func(hb_draw_funcs_t* dfuncs, hb_draw_move_to_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets line-to callback to the draw functions object.
	///
	/// @dfuncs: draw functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): line-to callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_line_to_func(hb_draw_funcs_t* dfuncs, hb_draw_line_to_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets quadratic-to callback to the draw functions object.
	///
	/// @dfuncs: draw functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): quadratic-to callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_quadratic_to_func(hb_draw_funcs_t* dfuncs, hb_draw_quadratic_to_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets cubic-to callback to the draw functions object.
	///
	/// @dfuncs: draw functions
	/// @func: (closure user_data) (destroy destroy) (scope notified): cubic-to callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_cubic_to_func(hb_draw_funcs_t* dfuncs, hb_draw_cubic_to_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets close-path callback to the draw functions object.
	///
	/// @dfuncs: draw functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): close-path callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_close_path_func(hb_draw_funcs_t* dfuncs, hb_draw_close_path_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the budget setter callback.
	///
	/// @dfuncs: draw functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): budget setter
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): callback to destroy @user_data
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_set_budget_func(hb_draw_funcs_t* dfuncs, hb_draw_set_budget_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the budget-policy getter callback.
	///
	/// @dfuncs: draw functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): budget getter
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): callback to destroy @user_data
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_get_budget_func(hb_draw_funcs_t* dfuncs, hb_draw_get_budget_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the live-budget getter callback.
	///
	/// @dfuncs: draw functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): live-budget getter
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): callback to destroy @user_data
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_set_get_budget_remaining_func(hb_draw_funcs_t* dfuncs, hb_draw_get_budget_remaining_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Creates a new draw callbacks object.
	///
	/// Return value: (transfer full):
	/// A newly allocated hb_draw_funcs_t with a reference count of 1. The initial
	/// reference count should be released with hb_draw_funcs_destroy when you are
	/// done using the hb_draw_funcs_t. This function never returns `NULL`. If
	/// memory cannot be allocated, a special singleton hb_draw_funcs_t object will
	/// be returned.
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_draw_funcs_t* hb_draw_funcs_create();
	
	/// Fetches the singleton empty draw-functions structure.
	///
	/// Return value: (transfer full): The empty draw-functions structure
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_draw_funcs_t* hb_draw_funcs_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_draw_funcs_t* hb_draw_funcs_reference(hb_draw_funcs_t* dfuncs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_destroy(hb_draw_funcs_t* dfuncs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_draw_funcs_set_user_data(hb_draw_funcs_t* dfuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_draw_funcs_get_user_data(hb_draw_funcs_t* dfuncs, hb_user_data_key_t* key);
	
	/// Makes @dfuncs object immutable.
	///
	/// @dfuncs: draw functions
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_funcs_make_immutable(hb_draw_funcs_t* dfuncs);
	
	/// Checks whether @dfuncs is immutable.
	///
	/// @dfuncs: draw functions
	///
	/// Return value: `true` if @dfuncs is immutable, `false` otherwise
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_draw_funcs_is_immutable(hb_draw_funcs_t* dfuncs);
	
	/// Sets the work-budget policy and recharges the live work budget. Negative
	/// values other than HB_BUDGET_DEFAULT are clamped to zero.
	///
	/// @dfuncs: draw functions object
	/// @draw_data: associated draw data
	/// @budget: the new work-budget policy
	///
	/// Return value: `true` if the draw functions support work budgets
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_draw_set_budget(hb_draw_funcs_t* dfuncs, void* draw_data, int64 budget);
	
	/// Fetches the configured work-budget policy.
	///
	/// @dfuncs: draw functions object
	/// @draw_data: associated draw data
	///
	/// Return value: the configured policy, or HB_BUDGET_DEFAULT if unsupported
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern int64 hb_draw_get_budget(hb_draw_funcs_t* dfuncs, void* draw_data);
	
	/// Fetches the live work budget. A negative value means the budget was
	/// exhausted. Zero means the preceding work fit exactly, but no positive-cost
	/// work can start.
	///
	/// @dfuncs: draw functions object
	/// @draw_data: associated draw data
	///
	/// Return value: the live work budget; if it is not tracked, the concrete
	///   configured policy or HB_BUDGET_UNLIMITED
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern int64 hb_draw_get_budget_remaining(hb_draw_funcs_t* dfuncs, void* draw_data);
	
	/// Perform a "move-to" draw operation.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	/// @to_x: X component of target point
	/// @to_y: Y component of target point
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_move_to(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float to_x, float to_y);
	
	/// Perform a "line-to" draw operation.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	/// @to_x: X component of target point
	/// @to_y: Y component of target point
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_line_to(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float to_x, float to_y);
	
	/// Perform a "quadratic-to" draw operation.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	/// @control_x: X component of control point
	/// @control_y: Y component of control point
	/// @to_x: X component of target point
	/// @to_y: Y component of target point
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_quadratic_to(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float control_x, float control_y, float to_x, float to_y);
	
	/// Perform a "cubic-to" draw operation.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	/// @control1_x: X component of first control point
	/// @control1_y: Y component of first control point
	/// @control2_x: X component of second control point
	/// @control2_y: Y component of second control point
	/// @to_x: X component of target point
	/// @to_y: Y component of target point
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_cubic_to(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float control1_x, float control1_y, float control2_x, float control2_y, float to_x, float to_y);
	
	/// Perform a "close-path" draw operation.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	///
	/// Since: 4.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_close_path(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st);
	
	/// Emits a tapered line segment as a filled trapezoid.  @w0 and
	/// @w1 are the full stroke widths at the start and end points
	/// respectively; they may differ for a tapered stroke or match
	/// for a uniform one.  Pass `NaN` for @w1 to use @w0 (uniform
	/// stroke) without repeating the value.
	///
	/// With HB_DRAW_LINE_CAP_SQUARE each endpoint is extended along
	/// the line direction by half its local stroke width, so four
	/// `hb_draw_line()` calls form a closed rectangle without gaps
	/// at the corners.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	/// @x0: start X coordinate
	/// @y0: start Y coordinate
	/// @w0: stroke width at the start
	/// @x1: end X coordinate
	/// @y1: end Y coordinate
	/// @w1: stroke width at the end
	/// @cap: end-cap shape (butt or square)
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_line(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float x0, float y0, float w0, float x1, float y1, float w1, hb_draw_line_cap_t cap);
	
	/// Emits an axis-aligned rectangle.  If @stroke_width is a finite
	/// positive value, the rectangle is rendered as an outlined ring
	/// of that thickness centered on the edges; if @stroke_width is
	/// `NaN`, the rectangle is rendered filled.
	///
	/// Note: stroked rectangles produce a bounding box covering the
	/// full outer rectangle, so if the pen is a GPU fragment-shader
	/// backend, the shader runs for every interior pixel even though
	/// only the outline contributes coverage.  For very thin
	/// outlines where the interior is much larger than the stroke,
	/// emitting four hb_draw_line() segments (one per edge) is
	/// considerably cheaper per frame.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	/// @x: top-left X coordinate
	/// @y: top-left Y coordinate
	/// @w: width (may be negative)
	/// @h: height (may be negative)
	/// @stroke_width: stroke width, or `NaN` for a filled rectangle
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_rectangle(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float x, float y, float w, float h, float stroke_width);
	
	/// Emits a circle approximated by four cubic Bezier curves.  If
	/// @stroke_width is a finite positive value, the circle is
	/// rendered as an outlined ring of that thickness centered on
	/// the nominal radius; if @stroke_width is `NaN`, the circle is
	/// rendered as a filled disc.
	///
	/// @dfuncs: draw functions
	/// @draw_data: associated draw data passed by the caller
	/// @st: current draw state
	/// @cx: center X coordinate
	/// @cy: center Y coordinate
	/// @r: radius
	/// @stroke_width: stroke width, or `NaN` for a filled disc
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_draw_circle(hb_draw_funcs_t* dfuncs, void* draw_data, hb_draw_state_t* st, float cx, float cy, float r, float stroke_width);
	
	// ====================================================================
	// hb-face.h
	// ====================================================================
	
	/// Fetches the number of faces in a blob.
	///
	/// @blob: a blob.
	///
	/// Return value: Number of faces in @blob
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_face_count(hb_blob_t* blob);
	
	/// Constructs a new face object from the specified blob and
	/// a face index into that blob.
	///
	/// The face index is used for blobs of file formats such as TTC and
	/// DFont that can contain more than one face.  Face indices within
	/// such collections are zero-based.
	///
	/// <note>Note: If the blob font format is not a collection, @index
	/// is ignored.  Otherwise, only the lower 16-bits of @index are used.
	/// The unmodified @index can be accessed via hb_face_get_index().</note>
	///
	/// <note>Note: The high 16-bits of @index, if non-zero, are used by
	/// hb_font_create() to load named-instances in variable fonts.  See
	/// hb_font_create() for details.</note>
	///
	/// @blob: hb_blob_t to work upon
	/// @index: The index of the face within @blob
	///
	/// Return value: (transfer full): The new face object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_create(hb_blob_t* blob, c_uint index);
	
	/// Like hb_face_create(), but returns `NULL` if the blob data
	/// contains no usable font face at the specified index.
	///
	/// @blob: hb_blob_t to work upon
	/// @index: The index of the face within @blob
	///
	/// Return value: (transfer full): The new face object, or `NULL` if
	/// no face is found at the specified index.
	///
	/// Since: 10.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_create_or_fail(hb_blob_t* blob, c_uint index);
	
	/// A thin wrapper around the face loader functions registered with HarfBuzz.
	/// If @loader_name is `NULL` or the empty string, the first available loader
	/// is used.
	///
	/// For example, the FreeType ("ft") loader might be able to load
	/// WOFF and WOFF2 files if FreeType is built with those features,
	/// whereas the OpenType ("ot") loader will not.
	///
	/// @blob: hb_blob_t to work upon
	/// @index: The index of the face within @blob
	/// @loader_name: (nullable): The name of the loader to use, or `NULL`
	///
	/// Return value: (transfer full): The new face object, or `NULL` if
	/// the loader fails to load the face.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_create_or_fail_using(hb_blob_t* blob, c_uint index, c_char* loader_name);
	
	/// A thin wrapper around hb_blob_create_from_file_or_fail()
	/// followed by hb_face_create_or_fail().
	///
	/// @file_name: A font filename
	/// @index: The index of the face within the file
	///
	/// Return value: (transfer full): The new face object, or `NULL` if
	/// no face is found at the specified index or the file cannot be read.
	///
	/// Since: 10.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_create_from_file_or_fail(c_char* file_name, c_uint index);
	
	/// A thin wrapper around the face loader functions registered with HarfBuzz.
	/// If @loader_name is `NULL` or the empty string, the first available loader
	/// is used.
	///
	/// For example, the FreeType ("ft") loader might be able to load
	/// WOFF and WOFF2 files if FreeType is built with those features,
	/// whereas the OpenType ("ot") loader will not.
	///
	/// @file_name: A font filename
	/// @index: The index of the face within the file
	/// @loader_name: (nullable): The name of the loader to use, or `NULL`
	///
	/// Return value: (transfer full): The new face object, or `NULL` if
	/// the file cannot be read or the loader fails to load the face.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_create_from_file_or_fail_using(c_char* file_name, c_uint index, c_char* loader_name);
	
	/// Retrieves the list of face loaders supported by HarfBuzz.
	///
	/// Return value: (transfer none) (array zero-terminated=1): a
	///    `NULL`-terminated array of supported face loaders
	///    constant strings. The returned array is owned by HarfBuzz
	///    and should not be modified or freed.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char** hb_face_list_loaders();
	
	/// Variant of hb_face_create(), built for those cases where it is more
	/// convenient to provide data for individual tables instead of the whole font
	/// data. With the caveat that hb_face_get_table_tags() would not work
	/// with faces created this way. You can address that by calling the
	/// hb_face_set_get_table_tags_func() function and setting the appropriate callback.
	///
	/// Creates a new face object from the specified @user_data and @reference_table_func,
	/// with the @destroy callback.
	///
	/// @reference_table_func: (closure user_data) (destroy destroy) (scope notified): Table-referencing function
	/// @user_data: A pointer to the user data
	/// @destroy: (nullable): A callback to call when @data is not needed anymore
	///
	/// Return value: (transfer full): The new face object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_create_for_tables(hb_reference_table_func_t reference_table_func, void* user_data, hb_destroy_func_t destroy);
	
	/// Fetches the singleton empty face object.
	///
	/// Return value: (transfer full): The empty face object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_reference(hb_face_t* face);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_destroy(hb_face_t* face);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_face_set_user_data(hb_face_t* face, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_face_get_user_data(hb_face_t* face, hb_user_data_key_t* key);
	
	/// Makes the given face object immutable.
	///
	/// @face: A face object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_make_immutable(hb_face_t* face);
	
	/// Tests whether the given face object is immutable.
	///
	/// @face: A face object
	///
	/// Return value: `true` is @face is immutable, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_face_is_immutable(hb_face_t* face);
	
	/// Fetches a reference to the specified table within
	/// the specified face. Returns an empty blob if referencing table data is not
	/// possible.
	///
	/// @face: A face object
	/// @tag: The hb_tag_t of the table to query
	///
	/// Return value: (transfer full): A pointer to the @tag table within @face
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_face_reference_table(hb_face_t* face, hb_tag_t tag);
	
	/// Fetches a pointer to the binary blob that contains the specified face.
	/// If referencing the face data is not possible, this function creates a blob
	/// out of individual table blobs if hb_face_get_table_tags() works with this
	/// face, otherwise it returns an empty blob.
	///
	/// @face: A face object
	///
	/// Return value: (transfer full): A pointer to the blob for @face
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_blob_t* hb_face_reference_blob(hb_face_t* face);
	
	/// Assigns the specified face-index to @face. Fails if the
	/// face is immutable.
	///
	/// <note>Note: changing the index has no effect on the face itself
	/// This only changes the value returned by hb_face_get_index().</note>
	///
	/// @face: A face object
	/// @index: The index to assign
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_set_index(hb_face_t* face, c_uint index);
	
	/// Fetches the face-index corresponding to the given face.
	///
	/// <note>Note: face indices within a collection are zero-based.</note>
	///
	/// @face: A face object
	///
	/// Return value: The index of @face.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_face_get_index(hb_face_t* face);
	
	/// Sets the units-per-em (upem) for a face object to the specified value.
	///
	/// This API is used in rare circumstances.
	///
	/// @face: A face object
	/// @upem: The units-per-em value to assign
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_set_upem(hb_face_t* face, c_uint upem);
	
	/// Fetches the units-per-em (UPEM) value of the specified face object.
	///
	/// Typical UPEM values for fonts are 1000, or 2048, but any value
	/// in between 16 and 16,384 is allowed for OpenType fonts.
	///
	/// @face: A face object
	///
	/// Return value: The upem value of @face
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_face_get_upem(hb_face_t* face);
	
	/// Sets the glyph count for a face object to the specified value.
	///
	/// This API is used in rare circumstances.
	///
	/// @face: A face object
	/// @glyph_count: The glyph-count value to assign
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_set_glyph_count(hb_face_t* face, c_uint glyph_count);
	
	/// Fetches the glyph-count value of the specified face object.
	///
	/// @face: A face object
	///
	/// Return value: The glyph-count value of @face
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_face_get_glyph_count(hb_face_t* face);
	
	/// Sets the table-tag-fetching function for the specified face object.
	///
	/// @face: A face object
	/// @func: (closure user_data) (destroy destroy) (scope notified): The table-tag-fetching function
	/// @user_data: A pointer to the user data, to be destroyed by @destroy when not needed anymore
	/// @destroy: (nullable): A callback to call when @func is not needed anymore
	///
	/// Since: 10.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_set_get_table_tags_func(hb_face_t* face, hb_get_table_tags_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Fetches a list of all table tags for a face, if possible. The list returned will
	/// begin at the offset provided
	///
	/// @face: A face object
	/// @start_offset: The index of first table tag to retrieve
	/// @table_count: (inout): Input = the maximum number of table tags to return;
	///     Output = the actual number of table tags returned (may be zero)
	/// @table_tags: (out) (array length=table_count) (nullable): The array of table tags found
	///
	/// Return value: Total number of tables, or zero if it is not possible to list
	///
	/// Since: 1.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_face_get_table_tags(hb_face_t* face, c_uint start_offset, c_uint* table_count, hb_tag_t* table_tags);
	
	/// Collects all of the Unicode characters covered by @face and adds
	/// them to the hb_set_t set @out.
	///
	/// @face: A face object
	/// @out: (out): The set to add Unicode characters to
	///
	/// Since: 1.9.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_collect_unicodes(hb_face_t* face, hb_set_t* @out);
	
	/// Collects the mapping from Unicode characters to nominal glyphs of the @face,
	/// and optionally all of the Unicode characters covered by @face.
	///
	/// @face: A face object
	/// @mapping: (out): The map to add Unicode-to-glyph mapping to
	/// @unicodes: (nullable) (out): The set to add Unicode characters to, or `NULL`
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_collect_nominal_glyph_mapping(hb_face_t* face, hb_map_t* mapping, hb_set_t* unicodes);
	
	/// Collects all Unicode "Variation Selector" characters covered by @face and adds
	/// them to the hb_set_t set @out.
	///
	/// @face: A face object
	/// @out: (out): The set to add Variation Selector characters to
	///
	/// Since: 1.9.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_collect_variation_selectors(hb_face_t* face, hb_set_t* @out);
	
	/// Collects all Unicode characters for @variation_selector covered by @face and adds
	/// them to the hb_set_t set @out.
	///
	/// @face: A face object
	/// @variation_selector: The Variation Selector to query
	/// @out: (out): The set to add Unicode characters to
	///
	/// Since: 1.9.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_collect_variation_unicodes(hb_face_t* face, hb_codepoint_t variation_selector, hb_set_t* @out);
	
	/// Creates a hb_face_t that can be used with hb_face_builder_add_table().
	/// After tables are added to the face, it can be compiled to a binary
	/// font file by calling hb_face_reference_blob().
	///
	/// Return value: (transfer full): New face.
	///
	/// Since: 1.9.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_face_builder_create();
	
	/// Add table for @tag with data provided by @blob to the face.  @face must
	/// be created using hb_face_builder_create().
	///
	/// @face: A face object created with hb_face_builder_create()
	/// @tag: The hb_tag_t of the table to add
	/// @blob: The blob containing the table data to add
	///
	/// Since: 1.9.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_face_builder_add_table(hb_face_t* face, hb_tag_t tag, hb_blob_t* blob);
	
	/// Set the ordering of tables for serialization. Any tables not
	/// specified in the tags list will be ordered after the tables in
	/// tags, ordered by the default sort ordering.
	///
	/// @face: A face object created with hb_face_builder_create()
	/// @tags: (array zero-terminated=1): ordered list of table tags terminated by
	///     HB_TAG_NONE
	///
	/// Since: 5.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_face_builder_sort_tables(hb_face_t* face, hb_tag_t* tags);
	
	// ====================================================================
	// hb-font.h
	// ====================================================================
	
	/// Creates a new hb_font_funcs_t structure of font functions.
	///
	/// Return value: (transfer full): The font-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_funcs_t* hb_font_funcs_create();
	
	/// Fetches an empty font-functions structure.
	///
	/// Return value: (transfer full): The font-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_funcs_t* hb_font_funcs_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_funcs_t* hb_font_funcs_reference(hb_font_funcs_t* ffuncs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_destroy(hb_font_funcs_t* ffuncs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_funcs_set_user_data(hb_font_funcs_t* ffuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_font_funcs_get_user_data(hb_font_funcs_t* ffuncs, hb_user_data_key_t* key);
	
	/// Makes a font-functions structure immutable.
	///
	/// @ffuncs: The font-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_make_immutable(hb_font_funcs_t* ffuncs);
	
	/// Tests whether a font-functions structure is immutable.
	///
	/// @ffuncs: The font-functions structure
	///
	/// Return value: `true` if @ffuncs is immutable, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_funcs_is_immutable(hb_font_funcs_t* ffuncs);
	
	/// Sets the implementation function for hb_font_get_font_h_extents_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 1.1.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_font_h_extents_func(hb_font_funcs_t* ffuncs, hb_font_get_font_h_extents_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_font_v_extents_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 1.1.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_font_v_extents_func(hb_font_funcs_t* ffuncs, hb_font_get_font_v_extents_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_nominal_glyph_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 1.2.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_nominal_glyph_func(hb_font_funcs_t* ffuncs, hb_font_get_nominal_glyph_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_nominal_glyphs_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 2.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_nominal_glyphs_func(hb_font_funcs_t* ffuncs, hb_font_get_nominal_glyphs_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_variation_glyph_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 1.2.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_variation_glyph_func(hb_font_funcs_t* ffuncs, hb_font_get_variation_glyph_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_h_advance_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_h_advance_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_advance_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_v_advance_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_v_advance_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_advance_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_h_advances_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 1.8.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_h_advances_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_advances_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_v_advances_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 1.8.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_v_advances_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_advances_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_h_origin_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_h_origin_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_origin_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_v_origin_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_v_origin_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_origin_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_h_origins_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 11.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_h_origins_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_origins_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_v_origins_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 11.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_v_origins_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_v_origins_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_h_kerning_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_h_kerning_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_h_kerning_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_extents_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_extents_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_extents_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_contour_point_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_contour_point_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_contour_point_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_name_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_name_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_name_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_get_glyph_from_name_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_glyph_from_name_func(hb_font_funcs_t* ffuncs, hb_font_get_glyph_from_name_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_draw_glyph_or_fail_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 11.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_draw_glyph_or_fail_func(hb_font_funcs_t* ffuncs, hb_font_draw_glyph_or_fail_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_font_paint_glyph_or_fail_func_t.
	///
	/// @ffuncs: A font-function structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is no longer needed
	///
	/// Since: 11.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_funcs_set_paint_glyph_or_fail_func(hb_font_funcs_t* ffuncs, hb_font_paint_glyph_or_fail_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Fetches the extents for a specified font, for horizontal
	/// text segments.
	///
	/// @font: hb_font_t to work upon
	/// @extents: (out): The font extents retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 1.1.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_h_extents(hb_font_t* font, out hb_font_extents_t extents);
	
	/// Fetches the extents for a specified font, for vertical
	/// text segments.
	///
	/// @font: hb_font_t to work upon
	/// @extents: (out): The font extents retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 1.1.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_v_extents(hb_font_t* font, out hb_font_extents_t extents);
	
	/// Fetches the nominal glyph ID for a Unicode code point in the
	/// specified font.
	///
	/// This version of the function should not be used to fetch glyph IDs
	/// for code points modified by variation selectors. For variation-selector
	/// support, user hb_font_get_variation_glyph() or use hb_font_get_glyph().
	///
	/// @font: hb_font_t to work upon
	/// @unicode: The Unicode code point to query
	/// @glyph: (out): The glyph ID retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 1.2.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_nominal_glyph(hb_font_t* font, hb_codepoint_t unicode, out hb_codepoint_t glyph);
	
	/// Fetches the glyph ID for a Unicode code point when followed by
	/// by the specified variation-selector code point, in the specified
	/// font.
	///
	/// @font: hb_font_t to work upon
	/// @unicode: The Unicode code point to query
	/// @variation_selector: The  variation-selector code point to query
	/// @glyph: (out): The glyph ID retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 1.2.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_variation_glyph(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t variation_selector, out hb_codepoint_t glyph);
	
	/// Fetches the nominal glyph IDs for a sequence of Unicode code points. Glyph
	/// IDs must be returned in a hb_codepoint_t output parameter. Stops at the
	/// first unsupported glyph ID.
	///
	/// @font: hb_font_t to work upon
	/// @count: number of code points to query
	/// @first_unicode: The first Unicode code point to query
	/// @unicode_stride: The stride between successive code points
	/// @first_glyph: (out): The first glyph ID retrieved
	/// @glyph_stride: The stride between successive glyph IDs
	///
	/// Return value: the number of code points processed
	///
	/// Since: 2.6.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_font_get_nominal_glyphs(hb_font_t* font, c_uint count, hb_codepoint_t* first_unicode, c_uint unicode_stride, out hb_codepoint_t first_glyph, c_uint glyph_stride);
	
	/// Fetches the advance for a glyph ID in the specified font,
	/// for horizontal text segments.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	///
	/// Return value: The advance of @glyph within @font
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_font_get_glyph_h_advance(hb_font_t* font, hb_codepoint_t glyph);
	
	/// Fetches the advance for a glyph ID in the specified font,
	/// for vertical text segments.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	///
	/// Return value: The advance of @glyph within @font
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_font_get_glyph_v_advance(hb_font_t* font, hb_codepoint_t glyph);
	
	/// Fetches the advances for a sequence of glyph IDs in the specified
	/// font, for horizontal text segments.
	///
	/// @font: hb_font_t to work upon
	/// @count: The number of glyph IDs in the sequence queried
	/// @first_glyph: The first glyph ID to query
	/// @glyph_stride: The stride between successive glyph IDs
	/// @first_advance: (out): The first advance retrieved
	/// @advance_stride: The stride between successive advances
	///
	/// Since: 1.8.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_glyph_h_advances(hb_font_t* font, c_uint count, hb_codepoint_t* first_glyph, c_uint glyph_stride, out hb_position_t first_advance, c_uint advance_stride);
	
	/// Fetches the advances for a sequence of glyph IDs in the specified
	/// font, for vertical text segments.
	///
	/// @font: hb_font_t to work upon
	/// @count: The number of glyph IDs in the sequence queried
	/// @first_glyph: The first glyph ID to query
	/// @glyph_stride: The stride between successive glyph IDs
	/// @first_advance: (out): The first advance retrieved
	/// @advance_stride: (out): The stride between successive advances
	///
	/// Since: 1.8.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_glyph_v_advances(hb_font_t* font, c_uint count, hb_codepoint_t* first_glyph, c_uint glyph_stride, out hb_position_t first_advance, c_uint advance_stride);
	
	/// Fetches the (X,Y) coordinates of the origin for a glyph ID
	/// in the specified font, for horizontal text segments.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @x: (out): The X coordinate of the origin
	/// @y: (out): The Y coordinate of the origin
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_h_origin(hb_font_t* font, hb_codepoint_t glyph, out hb_position_t x, out hb_position_t y);
	
	/// Fetches the (X,Y) coordinates of the origin for a glyph ID
	/// in the specified font, for vertical text segments.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @x: (out): The X coordinate of the origin
	/// @y: (out): The Y coordinate of the origin
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_v_origin(hb_font_t* font, hb_codepoint_t glyph, out hb_position_t x, out hb_position_t y);
	
	/// Fetches the (X,Y) coordinates of the origin for requested glyph IDs
	/// in the specified font, for horizontal text segments.
	///
	/// @font: hb_font_t to work upon
	/// @count: The number of glyph IDs in the sequence queried
	/// @first_glyph: The first glyph ID to query
	/// @glyph_stride: The stride between successive glyph IDs
	/// @first_x: (out): The first X coordinate of the origin retrieved
	/// @x_stride: The stride between successive X coordinates
	/// @first_y: (out): The first Y coordinate of the origin retrieved
	/// @y_stride: The stride between successive Y coordinates
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 11.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_h_origins(hb_font_t* font, c_uint count, hb_codepoint_t* first_glyph, c_uint glyph_stride, out hb_position_t first_x, c_uint x_stride, out hb_position_t first_y, c_uint y_stride);
	
	/// Fetches the (X,Y) coordinates of the origin for requested glyph IDs
	/// in the specified font, for vertical text segments.
	///
	/// @font: hb_font_t to work upon
	/// @count: The number of glyph IDs in the sequence queried
	/// @first_glyph: The first glyph ID to query
	/// @glyph_stride: The stride between successive glyph IDs
	/// @first_x: (out): The first X coordinate of the origin retrieved
	/// @x_stride: The stride between successive X coordinates
	/// @first_y: (out): The first Y coordinate of the origin retrieved
	/// @y_stride: The stride between successive Y coordinates
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 11.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_v_origins(hb_font_t* font, c_uint count, hb_codepoint_t* first_glyph, c_uint glyph_stride, out hb_position_t first_x, c_uint x_stride, out hb_position_t first_y, c_uint y_stride);
	
	/// Fetches the kerning-adjustment value for a glyph-pair in
	/// the specified font, for horizontal text segments.
	///
	/// <note>It handles legacy kerning only (as returned by the corresponding
	/// hb_font_funcs_t function).</note>
	///
	/// @font: hb_font_t to work upon
	/// @left_glyph: The glyph ID of the left glyph in the glyph pair
	/// @right_glyph: The glyph ID of the right glyph in the glyph pair
	///
	/// Return value: The kerning adjustment value
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_position_t hb_font_get_glyph_h_kerning(hb_font_t* font, hb_codepoint_t left_glyph, hb_codepoint_t right_glyph);
	
	/// Fetches the hb_glyph_extents_t data for a glyph ID
	/// in the specified font.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @extents: (out): The hb_glyph_extents_t retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_extents(hb_font_t* font, hb_codepoint_t glyph, out hb_glyph_extents_t extents);
	
	/// Fetches the (x,y) coordinates of a specified contour-point index
	/// in the specified glyph, within the specified font.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @point_index: The contour-point index to query
	/// @x: (out): The X value retrieved for the contour point
	/// @y: (out): The Y value retrieved for the contour point
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_contour_point(hb_font_t* font, hb_codepoint_t glyph, c_uint point_index, out hb_position_t x, out hb_position_t y);
	
	/// Fetches the glyph-name string for a glyph ID in the specified @font.
	///
	/// According to the OpenType specification, glyph names are limited to 63
	/// characters and can only contain (a subset of) ASCII.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @name: (out) (array length=size): Name string retrieved for the glyph ID
	/// @size: Length of the glyph-name string retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_name(hb_font_t* font, hb_codepoint_t glyph, c_char* name, c_uint size);
	
	/// Fetches the glyph ID that corresponds to a name string in the specified @font.
	///
	/// <note>Note: @len == -1 means the name string is null-terminated.</note>
	///
	/// @font: hb_font_t to work upon
	/// @name: (array length=len): The name string to query
	/// @len: The length of the name queried
	/// @glyph: (out): The glyph ID retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_from_name(hb_font_t* font, c_char* name, c_int len, out hb_codepoint_t glyph);
	
	/// Draws the outline that corresponds to a glyph in the specified @font.
	///
	/// This is a newer name for hb_font_draw_glyph(), that returns `false`
	/// if the font has no outlines for the glyph.
	///
	/// The outline is returned by way of calls to the callbacks of the @dfuncs
	/// objects, with @draw_data passed to them.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID
	/// @dfuncs: hb_draw_funcs_t to draw to
	/// @draw_data: User data to pass to draw callbacks
	///
	/// Return value: `true` if glyph was drawn, `false` otherwise
	///
	/// Since: 11.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_draw_glyph_or_fail(hb_font_t* font, hb_codepoint_t glyph, hb_draw_funcs_t* dfuncs, void* draw_data);
	
	/// Paints a color glyph.
	///
	/// Succeeds if @glyph has color paint layers (COLRv0),
	/// a color paint graph (COLRv1), or a bitmap image that the
	/// font's callbacks render successfully.  Returns `false` if
	/// the font has no color data for @glyph; the client can then
	/// fall back to hb_font_draw_glyph_or_fail() for the monochrome
	/// outline.
	///
	/// The painting instructions are returned by way of calls to
	/// the callbacks of the @funcs object, with @paint_data passed
	/// to them.
	///
	/// If the font has color palettes (see hb_ot_color_has_palettes()),
	/// then @palette_index selects the palette to use. If the font only
	/// has one palette, this will be 0.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID
	/// @pfuncs: hb_paint_funcs_t to paint with
	/// @paint_data: User data to pass to paint callbacks
	/// @palette_index: The index of the font's color palette to use
	/// @foreground: The foreground color, unpremultipled
	///
	/// Return value: `true` if glyph was painted, `false` otherwise
	///
	/// Since: 11.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_paint_glyph_or_fail(hb_font_t* font, hb_codepoint_t glyph, hb_paint_funcs_t* pfuncs, void* paint_data, c_uint palette_index, hb_color_t foreground);
	
	/// Fetches the glyph ID for a Unicode code point in the specified
	/// font, with an optional variation selector.
	///
	/// If @variation_selector is 0, calls hb_font_get_nominal_glyph();
	/// otherwise calls hb_font_get_variation_glyph().
	///
	/// @font: hb_font_t to work upon
	/// @unicode: The Unicode code point to query
	/// @variation_selector: A variation-selector code point
	/// @glyph: (out): The glyph ID retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph(hb_font_t* font, hb_codepoint_t unicode, hb_codepoint_t variation_selector, out hb_codepoint_t glyph);
	
	/// Fetches the extents for a font in a text segment of the
	/// specified direction.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @direction: The direction of the text segment
	/// @extents: (out): The hb_font_extents_t retrieved
	///
	/// Since: 1.1.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_extents_for_direction(hb_font_t* font, hb_direction_t direction, out hb_font_extents_t extents);
	
	/// Fetches the advance for a glyph ID from the specified font,
	/// in a text segment of the specified direction.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @direction: The direction of the text segment
	/// @x: (out): The horizontal advance retrieved
	/// @y: (out):  The vertical advance retrieved
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_glyph_advance_for_direction(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, out hb_position_t x, out hb_position_t y);
	
	/// Fetches the advances for a sequence of glyph IDs in the specified
	/// font, in a text segment of the specified direction.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @direction: The direction of the text segment
	/// @count: The number of glyph IDs in the sequence queried
	/// @first_glyph: The first glyph ID to query
	/// @glyph_stride: The stride between successive glyph IDs
	/// @first_advance: (out): The first advance retrieved
	/// @advance_stride: (out): The stride between successive advances
	///
	/// Since: 1.8.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_glyph_advances_for_direction(hb_font_t* font, hb_direction_t direction, c_uint count, hb_codepoint_t* first_glyph, c_uint glyph_stride, out hb_position_t first_advance, c_uint advance_stride);
	
	/// Fetches the (X,Y) coordinates of the origin for a glyph in
	/// the specified font.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @direction: The direction of the text segment
	/// @x: (out): The X coordinate retrieved for the origin
	/// @y: (out): The Y coordinate retrieved for the origin
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_glyph_origin_for_direction(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, out hb_position_t x, out hb_position_t y);
	
	/// Adds the origin coordinates to an (X,Y) point coordinate, in
	/// the specified glyph ID in the specified font.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @direction: The direction of the text segment
	/// @x: (inout): Input = The original X coordinate
	///     Output = The X coordinate plus the X-coordinate of the origin
	/// @y: (inout): Input = The original Y coordinate
	///     Output = The Y coordinate plus the Y-coordinate of the origin
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_add_glyph_origin_for_direction(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y);
	
	/// Subtracts the origin coordinates from an (X,Y) point coordinate,
	/// in the specified glyph ID in the specified font.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @direction: The direction of the text segment
	/// @x: (inout): Input = The original X coordinate
	///     Output = The X coordinate minus the X-coordinate of the origin
	/// @y: (inout): Input = The original Y coordinate
	///     Output = The Y coordinate minus the Y-coordinate of the origin
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_subtract_glyph_origin_for_direction(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, hb_position_t* x, hb_position_t* y);
	
	/// Fetches the kerning-adjustment value for a glyph-pair in the specified font.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @first_glyph: The glyph ID of the first glyph in the glyph pair to query
	/// @second_glyph: The glyph ID of the second glyph in the glyph pair to query
	/// @direction: The direction of the text segment
	/// @x: (out): The horizontal kerning-adjustment value retrieved
	/// @y: (out): The vertical kerning-adjustment value retrieved
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_glyph_kerning_for_direction(hb_font_t* font, hb_codepoint_t first_glyph, hb_codepoint_t second_glyph, hb_direction_t direction, out hb_position_t x, out hb_position_t y);
	
	/// Fetches the hb_glyph_extents_t data for a glyph ID
	/// in the specified font, with respect to the origin in
	/// a text segment in the specified direction.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @direction: The direction of the text segment
	/// @extents: (out): The hb_glyph_extents_t retrieved
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_extents_for_origin(hb_font_t* font, hb_codepoint_t glyph, hb_direction_t direction, out hb_glyph_extents_t extents);
	
	/// Fetches the (X,Y) coordinates of a specified contour-point index
	/// in the specified glyph ID in the specified font, with respect
	/// to the origin in a text segment in the specified direction.
	///
	/// Calls the appropriate direction-specific variant (horizontal
	/// or vertical) depending on the value of @direction.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @point_index: The contour-point index to query
	/// @direction: The direction of the text segment
	/// @x: (out): The X value retrieved for the contour point
	/// @y: (out): The Y value retrieved for the contour point
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_get_glyph_contour_point_for_origin(hb_font_t* font, hb_codepoint_t glyph, c_uint point_index, hb_direction_t direction, out hb_position_t x, out hb_position_t y);
	
	/// Fetches the name of the specified glyph ID in @font and returns
	/// it in string @s.
	///
	/// If the glyph ID has no name in @font, a string of the form `gidDDD` is
	/// generated, with `DDD` being the glyph ID.
	///
	/// According to the OpenType specification, glyph names are limited to 63
	/// characters and can only contain (a subset of) ASCII.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID to query
	/// @s: (out) (array length=size): The string containing the glyph name
	/// @size: Length of string @s
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_glyph_to_string(hb_font_t* font, hb_codepoint_t glyph, c_char* s, c_uint size);
	
	/// Fetches the glyph ID from @font that matches the specified string.
	/// Strings of the format `gidDDD` or `uniUUUU` are parsed automatically.
	///
	/// <note>Note: @len == -1 means the string is null-terminated.</note>
	///
	/// @font: hb_font_t to work upon
	/// @s: (array length=len) (element-type uint8_t): string to query
	/// @len: The length of the string @s
	/// @glyph: (out): The glyph ID corresponding to the string requested
	///
	/// Return value: `true` if data found, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_glyph_from_string(hb_font_t* font, c_char* s, c_int len, out hb_codepoint_t glyph);
	
	/// Draws the outline that corresponds to a glyph in the specified @font.
	///
	/// This is an older name for hb_font_draw_glyph_or_fail(), with no
	/// return value.
	///
	/// The outline is returned by way of calls to the callbacks of the @dfuncs
	/// objects, with @draw_data passed to them.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID
	/// @dfuncs: hb_draw_funcs_t to draw to
	/// @draw_data: User data to pass to draw callbacks
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_draw_glyph(hb_font_t* font, hb_codepoint_t glyph, hb_draw_funcs_t* dfuncs, void* draw_data);
	
	/// Paints the glyph. This function is similar to
	/// hb_font_paint_glyph_or_fail(), but if painting a color glyph
	/// failed, it will fall back to painting an outline monochrome
	/// glyph.
	///
	/// The painting instructions are returned by way of calls to
	/// the callbacks of the @funcs object, with @paint_data passed
	/// to them.
	///
	/// If the font has color palettes (see hb_ot_color_has_palettes()),
	/// then @palette_index selects the palette to use. If the font only
	/// has one palette, this will be 0.
	///
	/// @font: hb_font_t to work upon
	/// @glyph: The glyph ID
	/// @pfuncs: hb_paint_funcs_t to paint with
	/// @paint_data: User data to pass to paint callbacks
	/// @palette_index: The index of the font's color palette to use
	/// @foreground: The foreground color, unpremultipled
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_paint_glyph(hb_font_t* font, hb_codepoint_t glyph, hb_paint_funcs_t* pfuncs, void* paint_data, c_uint palette_index, hb_color_t foreground);
	
	/// Constructs a new font object from the specified face.
	///
	/// <note>Note: If @face's index value (as passed to hb_face_create()
	/// has non-zero top 16-bits, those bits minus one are passed to
	/// hb_font_set_var_named_instance(), effectively loading a named-instance
	/// of a variable font, instead of the default-instance.  This allows
	/// specifying which named-instance to load by default when creating the
	/// face.</note>
	///
	/// @face: a face.
	///
	/// Return value: (transfer full): The new font object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_t* hb_font_create(hb_face_t* face);
	
	/// Constructs a sub-font font object from the specified @parent font,
	/// replicating the parent's properties.
	///
	/// @parent: The parent font object
	///
	/// Return value: (transfer full): The new sub-font font object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_t* hb_font_create_sub_font(hb_font_t* parent);
	
	/// Fetches the empty font object.
	///
	/// Return value: (transfer full): The empty font object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_t* hb_font_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_t* hb_font_reference(hb_font_t* font);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_destroy(hb_font_t* font);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_set_user_data(hb_font_t* font, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_font_get_user_data(hb_font_t* font, hb_user_data_key_t* key);
	
	/// Makes @font immutable.
	///
	/// @font: hb_font_t to work upon
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_make_immutable(hb_font_t* font);
	
	/// Tests whether a font object is immutable.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: `true` if @font is immutable, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_is_immutable(hb_font_t* font);
	
	/// Returns the internal serial number of the font. The serial
	/// number is increased every time a setting on the font is
	/// changed, using a setter function.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: serial number
	///
	/// Since: 4.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_font_get_serial(hb_font_t* font);
	
	/// Notifies the @font that underlying font data has changed.
	/// This has the effect of increasing the serial as returned
	/// by hb_font_get_serial(), which invalidates internal caches.
	///
	/// @font: hb_font_t to work upon
	///
	/// Since: 4.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_changed(hb_font_t* font);
	
	/// Sets the parent font of @font.
	///
	/// @font: hb_font_t to work upon
	/// @parent: The parent font object to assign
	///
	/// Since: 1.0.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_parent(hb_font_t* font, hb_font_t* parent);
	
	/// Fetches the parent font of @font.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: (transfer none): The parent font object
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_font_t* hb_font_get_parent(hb_font_t* font);
	
	/// Sets @face as the font-face value of @font.
	///
	/// @font: hb_font_t to work upon
	/// @face: The hb_face_t to assign
	///
	/// Since: 1.4.3
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_face(hb_font_t* font, hb_face_t* face);
	
	/// Fetches the face associated with the specified font object.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: (transfer none): The hb_face_t value
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_face_t* hb_font_get_face(hb_font_t* font);
	
	/// Replaces the font-functions structure attached to a font, updating
	/// the font's user-data with @font-data and the @destroy callback.
	///
	/// @font: hb_font_t to work upon
	/// @klass: The font-functions structure.
	/// @font_data: Data to attach to @font
	/// @destroy: (nullable) (scope async) (closure font_data): The function to call when @font_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_funcs(hb_font_t* font, hb_font_funcs_t* klass, void* font_data, hb_destroy_func_t destroy);
	
	/// Replaces the user data attached to a font, updating the font's
	/// @destroy callback.
	///
	/// @font: hb_font_t to work upon
	/// @font_data: Data to attach to @font
	/// @destroy: (nullable) (scope async) (closure font_data): The function to call when @font_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_funcs_data(hb_font_t* font, void* font_data, hb_destroy_func_t destroy);
	
	/// Sets the font-functions structure to use for a font, based on the
	/// specified name.
	///
	/// If @name is `NULL` or the empty string, the default (first) functioning font-functions
	/// are used.  This default can be changed by setting the `HB_FONT_FUNCS` environment
	/// variable to the name of the desired font-functions.
	///
	/// @font: hb_font_t to work upon
	/// @name: The name of the font-functions structure to use, or `NULL`
	///
	/// Return value: `true` if the font-functions was found and set, `false` otherwise
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_set_funcs_using(hb_font_t* font, c_char* name);
	
	/// Retrieves the list of font functions supported by HarfBuzz.
	///
	/// Return value: (transfer none) (array zero-terminated=1): a
	///    `NULL`-terminated array of supported font functions
	///    constant strings. The returned array is owned by HarfBuzz
	///    and should not be modified or freed.
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char** hb_font_list_funcs();
	
	/// Sets the horizontal and vertical scale of a font.
	///
	/// The font scale is a number related to, but not the same as,
	/// font size. Typically the client establishes a scale factor
	/// to be used between the two. For example, 64, or 256, which
	/// would be the fractional-precision part of the font scale.
	/// This is necessary because hb_position_t values are integer
	/// types and you need to leave room for fractional values
	/// in there.
	///
	/// For example, to set the font size to 20, with 64
	/// levels of fractional precision you would call
	/// `hb_font_set_scale(font, 20 * 64, 20 * 64)`.
	///
	/// In the example above, even what font size 20 means is up to
	/// you. It might be 20 pixels, or 20 points, or 20 millimeters.
	/// HarfBuzz does not care about that.  You can set the point
	/// size of the font using hb_font_set_ptem(), and the pixel
	/// size using hb_font_set_ppem().
	///
	/// The choice of scale is yours but needs to be consistent between
	/// what you set here, and what you expect out of hb_position_t
	/// as well has draw / paint API output values.
	///
	/// Fonts default to a scale equal to the UPEM value of their face.
	/// A font with this setting is sometimes called an "unscaled" font.
	///
	/// @font: hb_font_t to work upon
	/// @x_scale: Horizontal scale value to assign
	/// @y_scale: Vertical scale value to assign
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_scale(hb_font_t* font, c_int x_scale, c_int y_scale);
	
	/// Fetches the horizontal and vertical scale of a font.
	///
	/// @font: hb_font_t to work upon
	/// @x_scale: (out): Horizontal scale value
	/// @y_scale: (out): Vertical scale value
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_scale(hb_font_t* font, out c_int x_scale, out c_int y_scale);
	
	/// Sets the horizontal and vertical pixels-per-em (PPEM) of a font.
	///
	/// These values are used for pixel-size-specific adjustment to
	/// shaping and draw results, though for the most part they are
	/// unused and can be left unset.
	///
	/// @font: hb_font_t to work upon
	/// @x_ppem: Horizontal ppem value to assign
	/// @y_ppem: Vertical ppem value to assign
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_ppem(hb_font_t* font, c_uint x_ppem, c_uint y_ppem);
	
	/// Fetches the horizontal and vertical points-per-em (ppem) of a font.
	///
	/// @font: hb_font_t to work upon
	/// @x_ppem: (out): Horizontal ppem value
	/// @y_ppem: (out): Vertical ppem value
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_ppem(hb_font_t* font, out c_uint x_ppem, out c_uint y_ppem);
	
	/// Sets the "point size" of a font. Set to zero to unset.
	/// Used in CoreText to implement optical sizing.
	///
	/// <note>Note: There are 72 points in an inch.</note>
	///
	/// @font: hb_font_t to work upon
	/// @ptem: font size in points.
	///
	/// Since: 1.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_ptem(hb_font_t* font, float ptem);
	
	/// Fetches the "point size" of a font. Used in CoreText to
	/// implement optical sizing.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: Point size.  A value of zero means "not set."
	///
	/// Since: 1.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern float hb_font_get_ptem(hb_font_t* font);
	
	/// Tests whether a font is synthetic. A synthetic font is one
	/// that has either synthetic slant or synthetic bold set on it.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: `true` if the font is synthetic, `false` otherwise.
	///
	/// Since: 11.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_font_is_synthetic(hb_font_t* font);
	
	/// Sets the "synthetic boldness" of a font.
	///
	/// Positive values for @x_embolden / @y_embolden make a font
	/// bolder, negative values thinner. Typical values are in the
	/// 0.01 to 0.05 range. The default value is zero.
	///
	/// Synthetic boldness is applied by offsetting the contour
	/// points of the glyph shape.
	///
	/// Synthetic boldness is applied when rendering a glyph via
	/// hb_font_draw_glyph_or_fail().
	///
	/// If @in_place is `false`, then glyph advance-widths are also
	/// adjusted, otherwise they are not.  The in-place mode is
	/// useful for simulating [font grading](https://fonts.google.com/knowledge/glossary/grade).
	///
	/// @font: hb_font_t to work upon
	/// @x_embolden: the amount to embolden horizontally
	/// @y_embolden: the amount to embolden vertically
	/// @in_place: whether to embolden glyphs in-place
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_synthetic_bold(hb_font_t* font, float x_embolden, float y_embolden, hb_bool_t in_place);
	
	/// Fetches the "synthetic boldness" parameters of a font.
	///
	/// @font: hb_font_t to work upon
	/// @x_embolden: (out): return location for horizontal value
	/// @y_embolden: (out): return location for vertical value
	/// @in_place: (out): return location for in-place value
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_get_synthetic_bold(hb_font_t* font, out float x_embolden, out float y_embolden, out hb_bool_t in_place);
	
	/// Sets the "synthetic slant" of a font.  By default is zero.
	/// Synthetic slant is the graphical skew applied to the font
	/// at rendering time.
	///
	/// HarfBuzz needs to know this value to adjust shaping results,
	/// metrics, and style values to match the slanted rendering.
	///
	/// <note>Note: The glyph shape fetched via the hb_font_draw_glyph_or_fail()
	/// function is slanted to reflect this value as well.</note>
	///
	/// <note>Note: The slant value is a ratio.  For example, a
	/// 20% slant would be represented as a 0.2 value.</note>
	///
	/// @font: hb_font_t to work upon
	/// @slant: synthetic slant value.
	///
	/// Since: 3.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_synthetic_slant(hb_font_t* font, float slant);
	
	/// Fetches the "synthetic slant" of a font.
	///
	/// @font: hb_font_t to work upon
	///
	/// Return value: Synthetic slant.  By default is zero.
	///
	/// Since: 3.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern float hb_font_get_synthetic_slant(hb_font_t* font);
	
	/// Applies a list of font-variation settings to a font.
	///
	/// Note that this overrides all existing variations set on @font.
	/// Axes not included in @variations will be effectively set to their
	/// default values.
	///
	/// @font: hb_font_t to work upon
	/// @variations: (array length=variations_length): Array of variation settings to apply
	/// @variations_length: Number of variations to apply
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_variations(hb_font_t* font, hb_variation_t* variations, c_uint variations_length);
	
	/// Change the value of one variation axis on the font.
	///
	/// Note: This function is expensive to be called repeatedly.
	///   If you want to set multiple variation axes at the same time,
	///   use hb_font_set_variations() instead.
	///
	/// @font: hb_font_t to work upon
	/// @tag: The hb_tag_t tag of the variation-axis name
	/// @value: The value of the variation axis
	///
	/// Since: 7.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_variation(hb_font_t* font, hb_tag_t tag, float value);
	
	/// Applies a list of variation coordinates (in design-space units)
	/// to a font.
	///
	/// Note that this overrides all existing variations set on @font.
	/// Axes not included in @coords will be effectively set to their
	/// default values.
	///
	/// @font: hb_font_t to work upon
	/// @coords: (array length=coords_length): Array of variation coordinates to apply
	/// @coords_length: Number of coordinates to apply
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_var_coords_design(hb_font_t* font, float* coords, c_uint coords_length);
	
	/// Fetches the list of variation coordinates (in design-space units) currently
	/// set on a font.
	///
	/// <note>Note that if no variation coordinates are set, this function may
	/// return NULL.</note>
	///
	/// <note>If variations have been set on the font using normalized coordinates
	/// (i.e. via hb_font_set_var_coords_normalized()), the design coordinates will
	/// have NaN (Not a Number) values.</note>
	///
	/// Return value is valid as long as variation coordinates of the font
	/// are not modified.
	///
	/// @font: hb_font_t to work upon
	/// @length: (out): Number of coordinates retrieved
	///
	/// Return value: coordinates array
	///
	/// Since: 3.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern float* hb_font_get_var_coords_design(hb_font_t* font, out c_uint length);
	
	/// Applies a list of variation coordinates (in normalized units)
	/// to a font.
	///
	/// Note that this overrides all existing variations set on @font.
	/// Axes not included in @coords will be effectively set to their
	/// default values.
	///
	/// <note>Note: Coordinates should be normalized to 2.14.</note>
	///
	/// @font: hb_font_t to work upon
	/// @coords: (array length=coords_length): Array of variation coordinates to apply
	/// @coords_length: Number of coordinates to apply
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_var_coords_normalized(hb_font_t* font, c_int* coords, c_uint coords_length);
	
	/// Fetches the list of normalized variation coordinates currently
	/// set on a font.
	///
	/// <note>Note that if no variation coordinates are set, this function may
	/// return NULL.</note>
	///
	/// Return value is valid as long as variation coordinates of the font
	/// are not modified.
	///
	/// @font: hb_font_t to work upon
	/// @length: (out): Number of coordinates retrieved
	///
	/// Return value: coordinates array
	///
	/// Since: 1.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_int* hb_font_get_var_coords_normalized(hb_font_t* font, out c_uint length);
	
	/// Sets design coords of a font from a named-instance index.
	///
	/// @font: a font.
	/// @instance_index: named instance index.
	///
	/// Since: 2.6.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_font_set_var_named_instance(hb_font_t* font, c_uint instance_index);
	
	/// Returns the currently-set named-instance index of the font.
	///
	/// @font: a font.
	///
	/// Return value: Named-instance index or HB_FONT_NO_VAR_NAMED_INSTANCE.
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_font_get_var_named_instance(hb_font_t* font);
	
	// ====================================================================
	// hb-map.h
	// ====================================================================
	
	/// Creates a new, initially empty map.
	///
	/// Return value: (transfer full): The new hb_map_t
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_map_t* hb_map_create();
	
	/// Fetches the singleton empty hb_map_t.
	///
	/// Return value: (transfer full): The empty hb_map_t
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_map_t* hb_map_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_map_t* hb_map_reference(hb_map_t* map);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_map_destroy(hb_map_t* map);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_map_set_user_data(hb_map_t* map, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_map_get_user_data(hb_map_t* map, hb_user_data_key_t* key);
	
	/// Tests whether memory allocation for a set was successful.
	///
	/// @map: A map
	///
	/// Return value: `true` if allocation succeeded, `false` otherwise
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_map_allocation_successful(hb_map_t* map);
	
	/// Allocate a copy of @map.
	///
	/// @map: A map
	///
	/// Return value: (transfer full): Newly-allocated map.
	///
	/// Since: 4.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_map_t* hb_map_copy(hb_map_t* map);
	
	/// Clears out the contents of @map.
	///
	/// @map: A map
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_map_clear(hb_map_t* map);
	
	/// Tests whether @map is empty (contains no elements).
	///
	/// @map: A map
	///
	/// Return value: `true` if @map is empty
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_map_is_empty(hb_map_t* map);
	
	/// Returns the number of key-value pairs in the map.
	///
	/// @map: A map
	///
	/// Return value: The population of @map
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_map_get_population(hb_map_t* map);
	
	/// Tests whether @map and @other are equal (contain the same
	/// elements).
	///
	/// @map: A map
	/// @other: Another map
	///
	/// Return value: `true` if the two maps are equal, `false` otherwise.
	///
	/// Since: 4.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_map_is_equal(hb_map_t* map, hb_map_t* other);
	
	/// Creates a hash representing @map.
	///
	/// @map: A map
	///
	/// Return value:
	/// A hash of @map.
	///
	/// Since: 4.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_map_hash(hb_map_t* map);
	
	/// Stores @key:@value in the map.
	///
	/// @map: A map
	/// @key: The key to store in the map
	/// @value: The value to store for @key
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_map_set(hb_map_t* map, hb_codepoint_t key, hb_codepoint_t value);
	
	/// Fetches the value stored for @key in @map.
	///
	/// @map: A map
	/// @key: The key to query
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_map_get(hb_map_t* map, hb_codepoint_t key);
	
	/// Removes @key and its stored value from @map.
	///
	/// @map: A map
	/// @key: The key to delete
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_map_del(hb_map_t* map, hb_codepoint_t key);
	
	/// Tests whether @key is an element of @map.
	///
	/// @map: A map
	/// @key: The key to query
	///
	/// Return value: `true` if @key is found in @map, `false` otherwise
	///
	/// Since: 1.7.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_map_has(hb_map_t* map, hb_codepoint_t key);
	
	/// Add the contents of @other to @map.
	///
	/// @map: A map
	/// @other: Another map
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_map_update(hb_map_t* map, hb_map_t* other);
	
	/// Fetches the next key/value pair in @map.
	///
	/// Set @idx to -1 to get started.
	///
	/// If the map is modified during iteration, the behavior is undefined.
	///
	/// The order in which the key/values are returned is undefined.
	///
	/// @map: A map
	/// @idx: (inout): Iterator internal state
	/// @key: (out): Key retrieved
	/// @value: (out): Value retrieved
	///
	/// Return value: `true` if there was a next value, `false` otherwise
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_map_next(hb_map_t* map, c_int* idx, out hb_codepoint_t key, out hb_codepoint_t value);
	
	/// Add the keys of @map to @keys.
	///
	/// @map: A map
	/// @keys: A set
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_map_keys(hb_map_t* map, hb_set_t* keys);
	
	/// Add the values of @map to @values.
	///
	/// @map: A map
	/// @values: A set
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_map_values(hb_map_t* map, hb_set_t* values);
	
	// ====================================================================
	// hb-paint.h
	// ====================================================================
	
	/// Sets the budget setter callback.
	///
	/// @funcs: paint functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): budget setter
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): callback to destroy @user_data
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_set_budget_func(hb_paint_funcs_t* funcs, hb_paint_set_budget_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the budget-policy getter callback.
	///
	/// @funcs: paint functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): budget getter
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): callback to destroy @user_data
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_get_budget_func(hb_paint_funcs_t* funcs, hb_paint_get_budget_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the live-budget getter callback.
	///
	/// @funcs: paint functions object
	/// @func: (closure user_data) (destroy destroy) (scope notified): live-budget getter
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): callback to destroy @user_data
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_get_budget_remaining_func(hb_paint_funcs_t* funcs, hb_paint_get_budget_remaining_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Creates a new hb_paint_funcs_t structure of paint functions.
	///
	/// The initial reference count of 1 should be released with hb_paint_funcs_destroy()
	/// when you are done using the hb_paint_funcs_t. This function never returns
	/// `NULL`. If memory cannot be allocated, a special singleton hb_paint_funcs_t
	/// object will be returned.
	///
	/// Returns value: (transfer full): the paint-functions structure
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_paint_funcs_t* hb_paint_funcs_create();
	
	/// Fetches the singleton empty paint-functions structure.
	///
	/// Return value: (transfer full): The empty paint-functions structure
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_paint_funcs_t* hb_paint_funcs_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_paint_funcs_t* hb_paint_funcs_reference(hb_paint_funcs_t* funcs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_destroy(hb_paint_funcs_t* funcs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_paint_funcs_set_user_data(hb_paint_funcs_t* funcs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_paint_funcs_get_user_data(hb_paint_funcs_t* funcs, hb_user_data_key_t* key);
	
	/// Makes a paint-functions structure immutable.
	///
	/// After this call, all attempts to set one of the callbacks
	/// on @funcs will fail.
	///
	/// @funcs: The paint-functions structure
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_make_immutable(hb_paint_funcs_t* funcs);
	
	/// Tests whether a paint-functions structure is immutable.
	///
	/// @funcs: The paint-functions structure
	///
	/// Return value: `true` if @funcs is immutable, `false` otherwise
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_paint_funcs_is_immutable(hb_paint_funcs_t* funcs);
	
	/// Sets the work-budget policy and recharges the live work budget. Negative
	/// values other than HB_BUDGET_DEFAULT are clamped to zero.
	///
	/// @funcs: paint functions object
	/// @paint_data: associated paint data
	/// @budget: the new work-budget policy
	///
	/// Return value: `true` if the paint functions support work budgets
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_paint_set_budget(hb_paint_funcs_t* funcs, void* paint_data, int64 budget);
	
	/// Fetches the configured work-budget policy.
	///
	/// @funcs: paint functions object
	/// @paint_data: associated paint data
	///
	/// Return value: the configured policy, or HB_BUDGET_DEFAULT if unsupported
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern int64 hb_paint_get_budget(hb_paint_funcs_t* funcs, void* paint_data);
	
	/// Fetches the live work budget. A negative value means the budget was
	/// exhausted. Zero means the preceding work fit exactly, but no positive-cost
	/// work can start.
	///
	/// @funcs: paint functions object
	/// @paint_data: associated paint data
	///
	/// Return value: the live work budget; if it is not tracked, the concrete
	///   configured policy or HB_BUDGET_UNLIMITED
	///
	/// Since: 14.5.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern int64 hb_paint_get_budget_remaining(hb_paint_funcs_t* funcs, void* paint_data);
	
	/// Fetches a list of color stops from the given color line object.
	///
	/// Note that due to variations being applied, the returned color stops
	/// may be out of order. It is the callers responsibility to ensure that
	/// color stops are sorted by their offset before they are used.
	///
	/// @color_line: a hb_color_line_t object
	/// @start: the index of the first color stop to return
	/// @count: (inout) (optional): Input = the maximum number of feature tags to return;
	///     Output = the actual number of feature tags returned (may be zero)
	/// @color_stops: (out) (array length=count) (optional): Array of hb_color_stop_t to populate
	///
	/// Return value: the total number of color stops in @color_line
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_color_line_get_color_stops(hb_color_line_t* color_line, c_uint start, c_uint* count, hb_color_stop_t* color_stops);
	
	/// Fetches the extend mode of the color line object.
	///
	/// @color_line: a hb_color_line_t object
	///
	/// Return value: the extend mode of @color_line
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_paint_extend_t hb_color_line_get_extend(hb_color_line_t* color_line);
	
	/// Sets the push-transform callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The push-transform callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_push_transform_func(hb_paint_funcs_t* funcs, hb_paint_push_transform_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the pop-transform callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The pop-transform callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_pop_transform_func(hb_paint_funcs_t* funcs, hb_paint_pop_transform_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the color-glyph callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The color-glyph callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 8.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_color_glyph_func(hb_paint_funcs_t* funcs, hb_paint_color_glyph_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the fill-glyph callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The fill-glyph callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 14.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_fill_glyph_func(hb_paint_funcs_t* funcs, hb_paint_fill_glyph_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the push-clip-glyph callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-glyph callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_push_clip_glyph_func(hb_paint_funcs_t* funcs, hb_paint_push_clip_glyph_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the push-clip-rect callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-rectangle callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_push_clip_rectangle_func(hb_paint_funcs_t* funcs, hb_paint_push_clip_rectangle_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the push-clip-path-start callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-path-start callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_push_clip_path_start_func(hb_paint_funcs_t* funcs, hb_paint_push_clip_path_start_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the push-clip-path-end callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-path-end callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_push_clip_path_end_func(hb_paint_funcs_t* funcs, hb_paint_push_clip_path_end_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the pop-clip callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The pop-clip callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_pop_clip_func(hb_paint_funcs_t* funcs, hb_paint_pop_clip_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the paint-color callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The paint-color callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_color_func(hb_paint_funcs_t* funcs, hb_paint_color_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the paint-image callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The paint-image callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_image_func(hb_paint_funcs_t* funcs, hb_paint_image_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the linear-gradient callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The linear-gradient callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_linear_gradient_func(hb_paint_funcs_t* funcs, hb_paint_linear_gradient_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the radial-gradient callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The radial-gradient callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_radial_gradient_func(hb_paint_funcs_t* funcs, hb_paint_radial_gradient_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the sweep-gradient callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The sweep-gradient callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_sweep_gradient_func(hb_paint_funcs_t* funcs, hb_paint_sweep_gradient_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the push-group callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The push-group callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_push_group_func(hb_paint_funcs_t* funcs, hb_paint_push_group_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the push-group-for callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The push-group-for callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_push_group_for_func(hb_paint_funcs_t* funcs, hb_paint_push_group_for_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the pop-group callback on the paint functions struct.
	///
	/// @funcs: A paint functions struct
	/// @func: (closure user_data) (destroy destroy) (scope notified): The pop-group callback
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): Function to call when @user_data is no longer needed
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_pop_group_func(hb_paint_funcs_t* funcs, hb_paint_pop_group_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the custom-palette-color callback on @funcs.
	///
	/// @funcs: a paint functions struct.
	/// @func: (closure user_data) (destroy destroy) (scope notified): custom-palette-color callback.
	/// @user_data: data to pass to @func.
	/// @destroy: (nullable): function to call when @user_data is no longer needed.
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_funcs_set_custom_palette_color_func(hb_paint_funcs_t* funcs, hb_paint_custom_palette_color_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Perform a "push-transform" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @xx: xx component of the transform matrix
	/// @yx: yx component of the transform matrix
	/// @xy: xy component of the transform matrix
	/// @yy: yy component of the transform matrix
	/// @dx: dx component of the transform matrix
	/// @dy: dy component of the transform matrix
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_transform(hb_paint_funcs_t* funcs, void* paint_data, float xx, float yx, float xy, float yy, float dx, float dy);
	
	/// Push the transform reflecting the font's scale and slant
	/// settings onto the paint functions.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @font: a font
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_font_transform(hb_paint_funcs_t* funcs, void* paint_data, hb_font_t* font);
	
	/// Push the inverse of the transform reflecting the font's
	/// scale and slant settings onto the paint functions.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @font: a font
	///
	/// Since: 11.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_inverse_font_transform(hb_paint_funcs_t* funcs, void* paint_data, hb_font_t* font);
	
	/// Perform a "pop-transform" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_pop_transform(hb_paint_funcs_t* funcs, void* paint_data);
	
	/// Perform a "color-glyph" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @glyph: the glyph ID
	/// @font: the font
	///
	/// Since: 8.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_paint_color_glyph(hb_paint_funcs_t* funcs, void* paint_data, hb_codepoint_t glyph, hb_font_t* font);
	
	/// Perform a "fill-glyph" paint operation: fill the glyph's shape
	/// with a solid color.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @glyph: the glyph ID
	/// @font: the font
	/// @is_foreground: whether the color is the foreground
	/// @color: The color to use
	///
	/// Since: 14.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_fill_glyph(hb_paint_funcs_t* funcs, void* paint_data, hb_codepoint_t glyph, hb_font_t* font, hb_bool_t is_foreground, hb_color_t color);
	
	/// Perform a "push-clip-glyph" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @glyph: the glyph ID
	/// @font: the font
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_clip_glyph(hb_paint_funcs_t* funcs, void* paint_data, hb_codepoint_t glyph, hb_font_t* font);
	
	/// Perform a "push-clip-rect" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @xmin: min X for the rectangle
	/// @ymin: min Y for the rectangle
	/// @xmax: max X for the rectangle
	/// @ymax: max Y for the rectangle
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_clip_rectangle(hb_paint_funcs_t* funcs, void* paint_data, float xmin, float ymin, float xmax, float ymax);
	
	/// Begin clipping to an arbitrary path.  Returns an
	/// hb_draw_funcs_t owned by the backend (the caller must not
	/// free it) that the caller uses to emit the clip outline via
	/// hb_draw_*() calls, using the returned @draw_data as the
	/// draw data.  The returned draw funcs and draw data are only
	/// valid until the matching hb_paint_push_clip_path_end() call;
	/// no other paint calls should be made between start and end
	/// except hb_draw_*() on the returned funcs.  Finish the path
	/// with hb_paint_push_clip_path_end(); pop the clip later
	/// with hb_paint_pop_clip().
	///
	/// Usage:
	///
	/// |[<!-- language="plain" -->
	/// hb_draw_funcs_t *df = hb_paint_push_clip_path_start (pf, pd, &dd);
	/// hb_draw_move_to (df, dd, NULL, ...);
	/// hb_draw_line_to (df, dd, NULL, ...);
	/// ...
	/// hb_draw_close_path (df, dd, NULL);
	/// hb_paint_push_clip_path_end (pf, pd);
	/// /&ast; paint ops here are clipped to the emitted path &ast;/
	/// hb_paint_pop_clip (pf, pd);
	/// ]|
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @draw_data: (out) (nullable): location to receive the draw data
	///     the caller should pass alongside the returned draw funcs.
	///
	/// Return value: (transfer none): draw funcs that accumulate
	///   the clip path, or `NULL` if the backend does not implement
	///   arbitrary-path clipping.
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_draw_funcs_t* hb_paint_push_clip_path_start(hb_paint_funcs_t* funcs, void* paint_data, void** draw_data);
	
	/// Signal that the arbitrary-clip path started by
	/// hb_paint_push_clip_path_start() is fully drawn.  The
	/// accumulated path now acts as a clip on the paint context
	/// until a matching hb_paint_pop_clip() call.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_clip_path_end(hb_paint_funcs_t* funcs, void* paint_data);
	
	/// Perform a "pop-clip" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_pop_clip(hb_paint_funcs_t* funcs, void* paint_data);
	
	/// Perform a "color" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @is_foreground: whether the color is the foreground
	/// @color: The color to use
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_color(hb_paint_funcs_t* funcs, void* paint_data, hb_bool_t is_foreground, hb_color_t color);
	
	/// Perform a "image" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @image: image data
	/// @width: width of the raster image in pixels, or 0
	/// @height: height of the raster image in pixels, or 0
	/// @format: the image format as a tag
	/// @slant: Deprecated. set to 0.0
	/// @extents: (nullable): the extents of the glyph
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_image(hb_paint_funcs_t* funcs, void* paint_data, hb_blob_t* image, c_uint width, c_uint height, hb_tag_t format, float slant, hb_glyph_extents_t* extents);
	
	/// Perform a "linear-gradient" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @color_line: Color information for the gradient
	/// @x0: X coordinate of the first point
	/// @y0: Y coordinate of the first point
	/// @x1: X coordinate of the second point
	/// @y1: Y coordinate of the second point
	/// @x2: X coordinate of the third point
	/// @y2: Y coordinate of the third point
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_linear_gradient(hb_paint_funcs_t* funcs, void* paint_data, hb_color_line_t* color_line, float x0, float y0, float x1, float y1, float x2, float y2);
	
	/// Perform a "radial-gradient" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @color_line: Color information for the gradient
	/// @x0: X coordinate of the first circle's center
	/// @y0: Y coordinate of the first circle's center
	/// @r0: radius of the first circle
	/// @x1: X coordinate of the second circle's center
	/// @y1: Y coordinate of the second circle's center
	/// @r1: radius of the second circle
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_radial_gradient(hb_paint_funcs_t* funcs, void* paint_data, hb_color_line_t* color_line, float x0, float y0, float r0, float x1, float y1, float r1);
	
	/// Perform a "sweep-gradient" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @color_line: Color information for the gradient
	/// @x0: X coordinate of the circle's center
	/// @y0: Y coordinate of the circle's center
	/// @start_angle: the start angle
	/// @end_angle: the end angle
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_sweep_gradient(hb_paint_funcs_t* funcs, void* paint_data, hb_color_line_t* color_line, float x0, float y0, float start_angle, float end_angle);
	
	/// Perform a "push-group" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_group(hb_paint_funcs_t* funcs, void* paint_data);
	
	/// Perform a "push-group" paint operation, with the compositing
	/// mode known in advance.  By default, this calls
	/// hb_paint_push_group().
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @mode: the compositing mode that will be used when the group is popped
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_push_group_for(hb_paint_funcs_t* funcs, void* paint_data, hb_paint_composite_mode_t mode);
	
	/// Perform a "pop-group" paint operation.
	///
	/// @funcs: paint functions
	/// @paint_data: associated data passed by the caller
	/// @mode: the compositing mode to use
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_pop_group(hb_paint_funcs_t* funcs, void* paint_data, hb_paint_composite_mode_t mode);
	
	/// Gets the custom palette override color for @color_index.
	///
	/// @funcs: paint functions.
	/// @paint_data: associated data passed by the caller.
	/// @color_index: color index to fetch.
	/// @color: (out): fetched color.
	///
	/// Return value: `true` if a custom color is provided, `false` otherwise.
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_paint_custom_palette_color(hb_paint_funcs_t* funcs, void* paint_data, c_uint color_index, out hb_color_t color);
	
	/// Reduces a COLRv1 linear gradient's 3-anchor spec (P0=color
	/// stop 0, P1=color stop 1, P2=rotation reference) to the
	/// 2-point axis (P0, P1') used by SVG / cairo / most software
	/// renderers.  P1' is the foot of P1 on the line through P0
	/// perpendicular to (P2 - P0); the resulting axis is the
	/// gradient's actual direction (perpendicular to the rotation
	/// line).  Degenerate (P0 == P2) passes through unchanged.
	///
	/// @x0: x coordinate of P0 (color stop 0).
	/// @y0: y coordinate of P0 (color stop 0).
	/// @x1: x coordinate of P1 (color stop 1).
	/// @y1: y coordinate of P1 (color stop 1).
	/// @x2: x coordinate of P2 (rotation reference).
	/// @y2: y coordinate of P2 (rotation reference).
	/// @xx0: (out): x coordinate of the resulting axis start.
	/// @yy0: (out): y coordinate of the resulting axis start.
	/// @xx1: (out): x coordinate of the resulting axis end.
	/// @yy1: (out): y coordinate of the resulting axis end.
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_reduce_linear_anchors(float x0, float y0, float x1, float y1, float x2, float y2, out float xx0, out float yy0, out float xx1, out float yy1);
	
	/// Sorts @stops by offset and rescales offsets into [0, 1] in
	/// place.  Writes the original (min, max) to @min / @max so the
	/// caller can shift the gradient geometry (axis endpoints for
	/// linear, centers+radii for radial, start+end angles for sweep)
	/// to keep the rendered gradient visually unchanged after the
	/// rescale.  Empty input is safe: both out-parameters set to 0.
	///
	/// @stops: (array length=len) (inout): color stops.
	/// @len: number of stops.
	/// @min: (out): original minimum offset.
	/// @max: (out): original maximum offset.
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_normalize_color_line(hb_color_stop_t* stops, c_uint len, out float min, out float max);
	
	/// Iterates the full 0..2π sweep produced by a color-stop list,
	/// invoking @emit_patch once per (start, end) angular segment.
	/// Handles HB_PAINT_EXTEND_PAD, HB_PAINT_EXTEND_REPEAT, and
	/// HB_PAINT_EXTEND_REFLECT.  Stops must be pre-sorted by
	/// offset; use hb_paint_normalize_color_line() first if they
	/// aren't.
	///
	/// @stops: (array length=n_stops) (inout): color stops (sorted, offsets in [0,1]).
	/// @n_stops: number of stops.
	/// @extend: extend mode.
	/// @start_angle: sweep start angle, in radians.
	/// @end_angle: sweep end angle, in radians.
	/// @emit_patch: (scope call): callback invoked once per tile.
	/// @user_data: data passed to @emit_patch.
	///
	/// Since: 14.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_paint_sweep_gradient_tiles(hb_color_stop_t* stops, c_uint n_stops, hb_paint_extend_t extend, float start_angle, float end_angle, hb_paint_sweep_gradient_tile_func_t emit_patch, void* user_data);
	
	// ====================================================================
	// hb-set.h
	// ====================================================================
	
	/// Creates a new, initially empty set.
	///
	/// Return value: (transfer full): The new hb_set_t
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_set_t* hb_set_create();
	
	/// Fetches the singleton empty hb_set_t.
	///
	/// Return value: (transfer full): The empty hb_set_t
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_set_t* hb_set_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_set_t* hb_set_reference(hb_set_t* set);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_destroy(hb_set_t* set);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_set_user_data(hb_set_t* set, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_set_get_user_data(hb_set_t* set, hb_user_data_key_t* key);
	
	/// Tests whether memory allocation for a set was successful.
	///
	/// @set: A set
	///
	/// Return value: `true` if allocation succeeded, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_allocation_successful(hb_set_t* set);
	
	/// Allocate a copy of @set.
	///
	/// @set: A set
	///
	/// Return value: (transfer full): Newly-allocated set.
	///
	/// Since: 2.8.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_set_t* hb_set_copy(hb_set_t* set);
	
	/// Clears out the contents of a set.
	///
	/// @set: A set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_clear(hb_set_t* set);
	
	/// Tests whether a set is empty (contains no elements).
	///
	/// @set: a set.
	///
	/// Return value: `true` if @set is empty
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_is_empty(hb_set_t* set);
	
	/// Inverts the contents of @set.
	///
	/// @set: A set
	///
	/// Since: 3.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_invert(hb_set_t* set);
	
	/// Returns whether the set is inverted.
	///
	/// @set: A set
	///
	/// Return value: `true` if the set is inverted, `false` otherwise
	///
	/// Since: 7.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_is_inverted(hb_set_t* set);
	
	/// Tests whether @codepoint belongs to @set.
	///
	/// @set: A set
	/// @codepoint: The element to query
	///
	/// Return value: `true` if @codepoint is in @set, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_has(hb_set_t* set, hb_codepoint_t codepoint);
	
	/// Adds @codepoint to @set.
	///
	/// @set: A set
	/// @codepoint: The element to add to @set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_add(hb_set_t* set, hb_codepoint_t codepoint);
	
	/// Adds all of the elements from @first to @last
	/// (inclusive) to @set.
	///
	/// @set: A set
	/// @first: The first element to add to @set
	/// @last: The final element to add to @set
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_add_range(hb_set_t* set, hb_codepoint_t first, hb_codepoint_t last);
	
	/// Adds @num_codepoints codepoints to a set at once.
	/// The codepoints array must be in increasing order,
	/// with size at least @num_codepoints.
	///
	/// @set: A set
	/// @sorted_codepoints: (array length=num_codepoints): Array of codepoints to add
	/// @num_codepoints: Length of @sorted_codepoints
	///
	/// Since: 4.1.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_add_sorted_array(hb_set_t* set, hb_codepoint_t* sorted_codepoints, c_uint num_codepoints);
	
	/// Removes @codepoint from @set.
	///
	/// @set: A set
	/// @codepoint: Removes @codepoint from @set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_del(hb_set_t* set, hb_codepoint_t codepoint);
	
	/// Removes all of the elements from @first to @last
	/// (inclusive) from @set.
	///
	/// If @last is HB_SET_VALUE_INVALID, then all values
	/// greater than or equal to @first are removed.
	///
	/// @set: A set
	/// @first: The first element to remove from @set
	/// @last: The final element to remove from @set
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_del_range(hb_set_t* set, hb_codepoint_t first, hb_codepoint_t last);
	
	/// Tests whether @set and @other are equal (contain the same
	/// elements).
	///
	/// @set: A set
	/// @other: Another set
	///
	/// Return value: `true` if the two sets are equal, `false` otherwise.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_is_equal(hb_set_t* set, hb_set_t* other);
	
	/// Tests whether @set and @other have any elements in common.
	///
	/// @set: A set
	/// @other: Another set
	///
	/// Return value: `true` if the two sets intersect, `false` otherwise.
	///
	/// Since: 14.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_intersects(hb_set_t* set, hb_set_t* other);
	
	/// Creates a hash representing @set.
	///
	/// @set: A set
	///
	/// Return value:
	/// A hash of @set.
	///
	/// Since: 4.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_set_hash(hb_set_t* set);
	
	/// Tests whether @set is a subset of @larger_set.
	///
	/// @set: A set
	/// @larger_set: Another set
	///
	/// Return value: `true` if the @set is a subset of (or equal to) @larger_set, `false` otherwise.
	///
	/// Since: 1.8.1
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_is_subset(hb_set_t* set, hb_set_t* larger_set);
	
	/// Makes the contents of @set equal to the contents of @other.
	///
	/// @set: A set
	/// @other: Another set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_set(hb_set_t* set, hb_set_t* other);
	
	/// Makes @set the union of @set and @other.
	///
	/// @set: A set
	/// @other: Another set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_union(hb_set_t* set, hb_set_t* other);
	
	/// Makes @set the intersection of @set and @other.
	///
	/// @set: A set
	/// @other: Another set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_intersect(hb_set_t* set, hb_set_t* other);
	
	/// Subtracts the contents of @other from @set.
	///
	/// @set: A set
	/// @other: Another set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_subtract(hb_set_t* set, hb_set_t* other);
	
	/// Makes @set the symmetric difference of @set
	/// and @other.
	///
	/// @set: A set
	/// @other: Another set
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_set_symmetric_difference(hb_set_t* set, hb_set_t* other);
	
	/// Returns the number of elements in the set.
	///
	/// @set: A set
	///
	/// Return value: The population of @set
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_set_get_population(hb_set_t* set);
	
	/// Finds the smallest element in the set.
	///
	/// @set: A set
	///
	/// Return value: minimum of @set, or HB_SET_VALUE_INVALID if @set is empty.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_set_get_min(hb_set_t* set);
	
	/// Finds the largest element in the set.
	///
	/// @set: A set
	///
	/// Return value: maximum of @set, or HB_SET_VALUE_INVALID if @set is empty.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_set_get_max(hb_set_t* set);
	
	/// Fetches the next element in @set that is greater than current value of @codepoint.
	///
	/// Set @codepoint to HB_SET_VALUE_INVALID to get started.
	///
	/// @set: A set
	/// @codepoint: (inout): Input = Code point to query
	///     Output = Code point retrieved
	///
	/// Return value: `true` if there was a next value, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_next(hb_set_t* set, hb_codepoint_t* codepoint);
	
	/// Fetches the previous element in @set that is lower than current value of @codepoint.
	///
	/// Set @codepoint to HB_SET_VALUE_INVALID to get started.
	///
	/// @set: A set
	/// @codepoint: (inout): Input = Code point to query
	///     Output = Code point retrieved
	///
	/// Return value: `true` if there was a previous value, `false` otherwise
	///
	/// Since: 1.8.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_previous(hb_set_t* set, hb_codepoint_t* codepoint);
	
	/// Fetches the next consecutive range of elements in @set that
	/// are greater than current value of @last.
	///
	/// Set @last to HB_SET_VALUE_INVALID to get started.
	///
	/// @set: A set
	/// @first: (out): The first code point in the range
	/// @last: (inout): Input = The current last code point in the range
	///     Output = The last code point in the range
	///
	/// Return value: `true` if there was a next range, `false` otherwise
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_next_range(hb_set_t* set, out hb_codepoint_t first, hb_codepoint_t* last);
	
	/// Fetches the previous consecutive range of elements in @set that
	/// are greater than current value of @last.
	///
	/// Set @first to HB_SET_VALUE_INVALID to get started.
	///
	/// @set: A set
	/// @first: (inout): Input = The current first code point in the range
	///     Output = The first code point in the range
	/// @last: (out): The last code point in the range
	///
	/// Return value: `true` if there was a previous range, `false` otherwise
	///
	/// Since: 1.8.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_set_previous_range(hb_set_t* set, hb_codepoint_t* first, out hb_codepoint_t last);
	
	/// Finds the next element in @set that is greater than @codepoint. Writes out
	/// codepoints to @out, until either the set runs out of elements, or @size
	/// codepoints are written, whichever comes first.
	///
	/// @set: A set
	/// @codepoint: Outputting codepoints starting after this one.
	///     Use HB_SET_VALUE_INVALID to get started.
	/// @out: (array length=size): An array of codepoints to write to.
	/// @size: The maximum number of codepoints to write out.
	///
	/// Return value: the number of values written.
	///
	/// Since: 4.2.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_uint hb_set_next_many(hb_set_t* set, hb_codepoint_t codepoint, hb_codepoint_t* @out, c_uint size);
	
	// ====================================================================
	// hb-shape.h
	// ====================================================================
	
	/// Shapes @buffer using @font turning its Unicode characters content to
	/// positioned glyphs. If @features is not `NULL`, it will be used to control the
	/// features applied during shaping. If two @features have the same tag but
	/// overlapping ranges the value of the feature with the higher index takes
	/// precedence.
	///
	/// @font: an hb_font_t to use for shaping
	/// @buffer: an hb_buffer_t to shape
	/// @features: (array length=num_features) (nullable): an array of user
	///     specified hb_feature_t or `NULL`
	/// @num_features: the length of @features array
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_shape(hb_font_t* font, hb_buffer_t* buffer, hb_feature_t* features, c_uint num_features);
	
	/// See hb_shape() for details. If @shaper_list is not `NULL`, the specified
	/// shapers will be used in the given order, otherwise the default shapers list
	/// will be used.
	///
	/// @font: an hb_font_t to use for shaping
	/// @buffer: an hb_buffer_t to shape
	/// @features: (array length=num_features) (nullable): an array of user
	///     specified hb_feature_t or `NULL`
	/// @num_features: the length of @features array
	/// @shaper_list: (array zero-terminated=1) (nullable): a `NULL`-terminated
	///     array of shapers to use or `NULL`
	///
	/// Return value: false if all shapers failed, true otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_shape_full(hb_font_t* font, hb_buffer_t* buffer, hb_feature_t* features, c_uint num_features, c_char** shaper_list);
	
	/// See hb_shape_full() for basic details. If @shaper_list is not `NULL`, the specified
	/// shapers will be used in the given order, otherwise the default shapers list
	/// will be used.
	///
	/// In addition, justify the shaping results such that the shaping results reach
	/// the target advance width/height, depending on the buffer direction.
	///
	/// If the advance of the buffer shaped with hb_shape_full() is already known,
	/// put that in *advance. Otherwise set *advance to zero.
	///
	/// This API is currently experimental and will probably change in the future.
	///
	/// @font: a mutable hb_font_t to use for shaping
	/// @buffer: an hb_buffer_t to shape
	/// @features: (array length=num_features) (nullable): an array of user
	///     specified hb_feature_t or `NULL`
	/// @num_features: the length of @features array
	/// @shaper_list: (array zero-terminated=1) (nullable): a `NULL`-terminated
	///     array of shapers to use or `NULL`
	/// @min_target_advance: Minimum advance width/height to aim for.
	/// @max_target_advance: Maximum advance width/height to aim for.
	/// @advance: (inout): Input/output advance width/height of the buffer.
	/// @var_tag: (out): Variation-axis tag used for justification.
	/// @var_value: (out): Variation-axis value used to reach target justification.
	///
	/// Return value: false if all shapers failed, true otherwise
	///
	/// XSince: EXPERIMENTAL
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_shape_justify(hb_font_t* font, hb_buffer_t* buffer, hb_feature_t* features, c_uint num_features, c_char** shaper_list, float min_target_advance, float max_target_advance, float* advance, out hb_tag_t var_tag, out float var_value);
	
	/// Retrieves the list of shapers supported by HarfBuzz.
	///
	/// Return value: (transfer none) (array zero-terminated=1): a
	///    `NULL`-terminated array of supported shapers constant string.
	///    The returned array is owned by HarfBuzz and should not be
	///    modified or freed.
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char** hb_shape_list_shapers();
	
	// ====================================================================
	// hb-shape-plan.h
	// ====================================================================
	
	/// Constructs a shaping plan for a combination of @face, @user_features, @props,
	/// and @shaper_list.
	///
	/// @face: hb_face_t to use
	/// @props: The hb_segment_properties_t of the segment
	/// @user_features: (array length=num_user_features): The list of user-selected features
	/// @num_user_features: The number of user-selected features
	/// @shaper_list: (array zero-terminated=1): List of shapers to try
	///
	/// Return value: (transfer full): The shaping plan
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_shape_plan_t* hb_shape_plan_create(hb_face_t* face, hb_segment_properties_t* props, hb_feature_t* user_features, c_uint num_user_features, c_char** shaper_list);
	
	/// Creates a cached shaping plan suitable for reuse, for a combination
	/// of @face, @user_features, @props, and @shaper_list.
	///
	/// @face: hb_face_t to use
	/// @props: The hb_segment_properties_t of the segment
	/// @user_features: (array length=num_user_features): The list of user-selected features
	/// @num_user_features: The number of user-selected features
	/// @shaper_list: (array zero-terminated=1): List of shapers to try
	///
	/// Return value: (transfer full): The shaping plan
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_shape_plan_t* hb_shape_plan_create_cached(hb_face_t* face, hb_segment_properties_t* props, hb_feature_t* user_features, c_uint num_user_features, c_char** shaper_list);
	
	/// The variable-font version of hb_shape_plan_create.
	/// Constructs a shaping plan for a combination of @face, @user_features, @props,
	/// and @shaper_list, plus the variation-space coordinates @coords.
	///
	/// @face: hb_face_t to use
	/// @props: The hb_segment_properties_t of the segment
	/// @user_features: (array length=num_user_features): The list of user-selected features
	/// @num_user_features: The number of user-selected features
	/// @coords: (array length=num_coords): The list of variation-space coordinates
	/// @num_coords: The number of variation-space coordinates
	/// @shaper_list: (array zero-terminated=1): List of shapers to try
	///
	/// Return value: (transfer full): The shaping plan
	///
	/// Since: 1.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_shape_plan_t* hb_shape_plan_create2(hb_face_t* face, hb_segment_properties_t* props, hb_feature_t* user_features, c_uint num_user_features, c_int* coords, c_uint num_coords, c_char** shaper_list);
	
	/// The variable-font version of hb_shape_plan_create_cached.
	/// Creates a cached shaping plan suitable for reuse, for a combination
	/// of @face, @user_features, @props, and @shaper_list, plus the
	/// variation-space coordinates @coords.
	///
	/// @face: hb_face_t to use
	/// @props: The hb_segment_properties_t of the segment
	/// @user_features: (array length=num_user_features): The list of user-selected features
	/// @num_user_features: The number of user-selected features
	/// @coords: (array length=num_coords): The list of variation-space coordinates
	/// @num_coords: The number of variation-space coordinates
	/// @shaper_list: (array zero-terminated=1): List of shapers to try
	///
	/// Return value: (transfer full): The shaping plan
	///
	/// Since: 1.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_shape_plan_t* hb_shape_plan_create_cached2(hb_face_t* face, hb_segment_properties_t* props, hb_feature_t* user_features, c_uint num_user_features, c_int* coords, c_uint num_coords, c_char** shaper_list);
	
	/// Fetches the singleton empty shaping plan.
	///
	/// Return value: (transfer full): The empty shaping plan
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_shape_plan_t* hb_shape_plan_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_shape_plan_t* hb_shape_plan_reference(hb_shape_plan_t* shape_plan);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_shape_plan_destroy(hb_shape_plan_t* shape_plan);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_shape_plan_set_user_data(hb_shape_plan_t* shape_plan, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_shape_plan_get_user_data(hb_shape_plan_t* shape_plan, hb_user_data_key_t* key);
	
	/// Executes the given shaping plan on the specified buffer, using
	/// the given @font and @features.
	///
	/// @shape_plan: A shaping plan
	/// @font: The hb_font_t to use
	/// @buffer: The hb_buffer_t to work upon
	/// @features: (array length=num_features): Features to enable
	/// @num_features: The number of features to enable
	///
	/// Return value: `true` if success, `false` otherwise.
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_shape_plan_execute(hb_shape_plan_t* shape_plan, hb_font_t* font, hb_buffer_t* buffer, hb_feature_t* features, c_uint num_features);
	
	/// Fetches the shaper from a given shaping plan.
	///
	/// @shape_plan: A shaping plan
	///
	/// Return value: (transfer none): The shaper
	///
	/// Since: 0.9.7
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* hb_shape_plan_get_shaper(hb_shape_plan_t* shape_plan);
	
	// ====================================================================
	// hb-style.h
	// ====================================================================
	
	/// Searches variation axes of a hb_font_t object for a specific axis first,
	/// if not set, first tries to get default style values in `STAT` table
	/// then tries to polyfill from different tables of the font.
	///
	/// @font: a hb_font_t object.
	/// @style_tag: a style tag.
	///
	/// Returns: Corresponding axis or default value to a style tag.
	///
	/// Since: 3.0.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern float hb_style_get_value(hb_font_t* font, hb_style_tag_t style_tag);
	
	// ====================================================================
	// hb-unicode.h
	// ====================================================================
	
	/// Fetches a pointer to the default Unicode-functions structure that is used
	/// when no functions are explicitly set on hb_buffer_t.
	///
	/// Return value: (transfer none): a pointer to the hb_unicode_funcs_t Unicode-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_funcs_t* hb_unicode_funcs_get_default();
	
	/// Creates a new hb_unicode_funcs_t structure of Unicode functions.
	///
	/// @parent: (nullable): Parent Unicode-functions structure
	///
	/// Return value: (transfer full): The Unicode-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_funcs_t* hb_unicode_funcs_create(hb_unicode_funcs_t* parent);
	
	/// Fetches the singleton empty Unicode-functions structure.
	///
	/// Return value: (transfer full): The empty Unicode-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_funcs_t* hb_unicode_funcs_get_empty();
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_funcs_t* hb_unicode_funcs_reference(hb_unicode_funcs_t* ufuncs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_destroy(hb_unicode_funcs_t* ufuncs);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_unicode_funcs_set_user_data(hb_unicode_funcs_t* ufuncs, hb_user_data_key_t* key, void* data, hb_destroy_func_t destroy, hb_bool_t replace);
	
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* hb_unicode_funcs_get_user_data(hb_unicode_funcs_t* ufuncs, hb_user_data_key_t* key);
	
	/// Makes the specified Unicode-functions structure
	/// immutable.
	///
	/// @ufuncs: The Unicode-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_make_immutable(hb_unicode_funcs_t* ufuncs);
	
	/// Tests whether the specified Unicode-functions structure
	/// is immutable.
	///
	/// @ufuncs: The Unicode-functions structure
	///
	/// Return value: `true` if @ufuncs is immutable, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_unicode_funcs_is_immutable(hb_unicode_funcs_t* ufuncs);
	
	/// Fetches the parent of the Unicode-functions structure
	/// @ufuncs.
	///
	/// @ufuncs: The Unicode-functions structure
	///
	/// Return value: The parent Unicode-functions structure
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_funcs_t* hb_unicode_funcs_get_parent(hb_unicode_funcs_t* ufuncs);
	
	/// Sets the implementation function for hb_unicode_combining_class_func_t.
	///
	/// @ufuncs: A Unicode-functions structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_set_combining_class_func(hb_unicode_funcs_t* ufuncs, hb_unicode_combining_class_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_unicode_general_category_func_t.
	///
	/// @ufuncs: A Unicode-functions structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_set_general_category_func(hb_unicode_funcs_t* ufuncs, hb_unicode_general_category_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_unicode_mirroring_func_t.
	///
	/// @ufuncs: A Unicode-functions structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_set_mirroring_func(hb_unicode_funcs_t* ufuncs, hb_unicode_mirroring_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_unicode_script_func_t.
	///
	/// @ufuncs: A Unicode-functions structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_set_script_func(hb_unicode_funcs_t* ufuncs, hb_unicode_script_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_unicode_compose_func_t.
	///
	/// @ufuncs: A Unicode-functions structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_set_compose_func(hb_unicode_funcs_t* ufuncs, hb_unicode_compose_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Sets the implementation function for hb_unicode_decompose_func_t.
	///
	/// @ufuncs: A Unicode-functions structure
	/// @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
	/// @user_data: Data to pass to @func
	/// @destroy: (nullable): The function to call when @user_data is not needed anymore
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_unicode_funcs_set_decompose_func(hb_unicode_funcs_t* ufuncs, hb_unicode_decompose_func_t func, void* user_data, hb_destroy_func_t destroy);
	
	/// Retrieves the Canonical Combining Class (ccc) property
	/// of code point @unicode.
	///
	/// @ufuncs: The Unicode-functions structure
	/// @unicode: The code point to query
	///
	/// Return value: The hb_unicode_combining_class_t of @unicode
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_combining_class_t hb_unicode_combining_class(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode);
	
	/// Retrieves the General Category (gc) property
	/// of code point @unicode.
	///
	/// @ufuncs: The Unicode-functions structure
	/// @unicode: The code point to query
	///
	/// Return value: The hb_unicode_general_category_t of @unicode
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_unicode_general_category_t hb_unicode_general_category(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode);
	
	/// Retrieves the Bi-directional Mirroring Glyph code
	/// point defined for code point @unicode.
	///
	/// @ufuncs: The Unicode-functions structure
	/// @unicode: The code point to query
	///
	/// Return value: The hb_codepoint_t of the Mirroring Glyph for @unicode
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_codepoint_t hb_unicode_mirroring(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode);
	
	/// Retrieves the hb_script_t script to which code
	/// point @unicode belongs.
	///
	/// @ufuncs: The Unicode-functions structure
	/// @unicode: The code point to query
	///
	/// Return value: The hb_script_t of @unicode
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_script_t hb_unicode_script(hb_unicode_funcs_t* ufuncs, hb_codepoint_t unicode);
	
	/// Fetches the composition of a sequence of two Unicode
	/// code points.
	///
	/// Calls the composition function of the specified
	/// Unicode-functions structure @ufuncs.
	///
	/// @ufuncs: The Unicode-functions structure
	/// @a: The first Unicode code point to compose
	/// @b: The second Unicode code point to compose
	/// @ab: (out): The composition of @a, @b
	///
	/// Return value: `true` if @a and @b composed, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_unicode_compose(hb_unicode_funcs_t* ufuncs, hb_codepoint_t a, hb_codepoint_t b, out hb_codepoint_t ab);
	
	/// Fetches the decomposition of a Unicode code point.
	///
	/// Calls the decomposition function of the specified
	/// Unicode-functions structure @ufuncs.
	///
	/// @ufuncs: The Unicode-functions structure
	/// @ab: Unicode code point to decompose
	/// @a: (out): The first code point of the decomposition of @ab
	/// @b: (out): The second code point of the decomposition of @ab
	///
	/// Return value: `true` if @ab was decomposed, `false` otherwise
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_unicode_decompose(hb_unicode_funcs_t* ufuncs, hb_codepoint_t ab, out hb_codepoint_t a, out hb_codepoint_t b);
	
	// ====================================================================
	// hb-version.h
	// ====================================================================
	
	/// Returns library version as three integer components.
	///
	/// @major: (out): Library major version component
	/// @minor: (out): Library minor version component
	/// @micro: (out): Library micro version component
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void hb_version(out c_uint major, out c_uint minor, out c_uint micro);
	
	/// Returns library version as a string with three components.
	///
	/// Return value: Library version string
	///
	/// Since: 0.9.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* hb_version_string();
	
	/// Tests the library version against a minimum value,
	/// as three integer components.
	///
	/// @major: Library major version component
	/// @minor: Library minor version component
	/// @micro: Library micro version component
	///
	/// Return value: `true` if the library is equal to or greater than
	/// the test value, `false` otherwise
	///
	/// Since: 0.9.30
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern hb_bool_t hb_version_atleast(c_uint major, c_uint minor, c_uint micro);
}