namespace FreeType;


using System;
using System.Interop;


static
{
	// ====================================================================
	// Library setup (freetype.h)
	// ====================================================================

	/// Initialize a new FreeType library object.  The set of modules that are
	/// registered by this function is determined at build time.
	///
	/// @output:
	///   alibrary ::
	///     A handle to a new library object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   In case you want to provide your own memory allocating routines, use
	///   FT_New_Library instead, followed by a call to FT_Add_Default_Modules
	///   (or a series of calls to FT_Add_Module) and
	///   FT_Set_Default_Properties.
	///
	///   See the documentation of FT_Library and FT_Face for multi-threading
	///   issues.
	///
	///   If you need reference-counting (cf. FT_Reference_Library), use
	///   FT_New_Library and FT_Done_Library.
	///
	///   If compilation option `FT_CONFIG_OPTION_ENVIRONMENT_PROPERTIES` is
	///   set, this function reads the `FREETYPE_PROPERTIES` environment
	///   variable to control driver properties.  See section properties for
	///   more.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Init_FreeType(out FT_Library alibrary);

	/// Destroy a given FreeType library object and all of its children,
	/// including resources, drivers, faces, sizes, etc.
	///
	/// @input:
	///   library ::
	///     A handle to the target library object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Done_FreeType(FT_Library library);

	/// A counter gets initialized to 1 at the time an FT_Library structure
	/// is created.  This function increments the counter.  FT_Done_Library
	/// then only destroys a library if the counter is 1, otherwise it simply
	/// decrements the counter.
	///
	/// This function helps in managing life-cycles of structures that
	/// reference FT_Library objects.
	///
	/// @input:
	///   library ::
	///     A handle to a target library object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @since:
	///   2.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Reference_Library(FT_Library library);

	/// Return the version of the FreeType library being used.  This is useful
	/// when dynamically linking to the library, since one cannot use the
	/// macros FREETYPE_MAJOR, FREETYPE_MINOR, and FREETYPE_PATCH.
	///
	/// @input:
	///   library ::
	///     A source library handle.
	///
	/// @output:
	///   amajor ::
	///     The major version number.
	///
	///   aminor ::
	///     The minor version number.
	///
	///   apatch ::
	///     The patch version number.
	///
	/// @note:
	///   The reason why this function takes a `library` argument is because
	///   certain programs implement library initialization in a custom way that
	///   doesn't use FT_Init_FreeType.
	///
	///   In such cases, the library version might not be available before the
	///   library object has been created.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Library_Version(FT_Library library, out FT_Int amajor, out FT_Int aminor, out FT_Int apatch);

	/// Retrieve the description of a valid FreeType error code.
	///
	/// @input:
	///   error_code ::
	///     A valid FreeType error code.
	///
	/// @return:
	///   A C string or `NULL`, if any error occurred.
	///
	/// @note:
	///   FreeType has to be compiled with `FT_CONFIG_OPTION_ERROR_STRINGS` or
	///   `FT_DEBUG_LEVEL_ERROR` to get meaningful descriptions.
	///   'error_string' will be `NULL` otherwise.
	///
	///   Module identification will be ignored:
	///
	///   ```c
	///     strcmp( FT_Error_String(  FT_Err_Unknown_File_Format ),
	///             FT_Error_String( BDF_Err_Unknown_File_Format ) ) == 0;
	///   ```
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* FT_Error_String(FT_Error error_code);

	// ====================================================================
	// Faces (freetype.h)
	// ====================================================================

	/// Call FT_Open_Face to open a font by its pathname.
	///
	/// @inout:
	///   library ::
	///     A handle to the library resource.
	///
	/// @input:
	///   pathname ::
	///     A path to the font file.
	///
	///   face_index ::
	///     See FT_Open_Face for a detailed description of this parameter.
	///
	/// @output:
	///   aface ::
	///     A handle to a new face object.  If `face_index` is greater than or
	///     equal to zero, it must be non-`NULL`.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The `pathname` string should be recognizable as such by a standard
	///   `fopen` call on your system; in particular, this means that `pathname`
	///   must not contain null bytes.  If that is not sufficient to address all
	///   file name possibilities (for example, to handle wide character file
	///   names on Windows in UTF-16 encoding) you might use FT_Open_Face to
	///   pass a memory array or a stream object instead.
	///
	///   Use FT_Done_Face to destroy the created FT_Face object (along with
	///   its slot and sizes).
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_New_Face(FT_Library library, c_char* filepathname, FT_Long face_index, out FT_Face aface);

	/// Call FT_Open_Face to open a font that has been loaded into memory.
	///
	/// @inout:
	///   library ::
	///     A handle to the library resource.
	///
	/// @input:
	///   file_base ::
	///     A pointer to the beginning of the font data.
	///
	///   file_size ::
	///     The size of the memory chunk used by the font data.
	///
	///   face_index ::
	///     See FT_Open_Face for a detailed description of this parameter.
	///
	/// @output:
	///   aface ::
	///     A handle to a new face object.  If `face_index` is greater than or
	///     equal to zero, it must be non-`NULL`.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   You must not deallocate the memory before calling FT_Done_Face.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_New_Memory_Face(FT_Library library, FT_Byte* file_base, FT_Long file_size, FT_Long face_index, out FT_Face aface);

	/// Create a face object from a given resource described by FT_Open_Args.
	///
	/// @inout:
	///   library ::
	///     A handle to the library resource.
	///
	/// @input:
	///   args ::
	///     A pointer to an `FT_Open_Args` structure that must be filled by the
	///     caller.
	///
	///   face_index ::
	///     This field holds two different values.  Bits 0-15 are the index of
	///     the face in the font file (starting with value 0).  Set it to 0 if
	///     there is only one face in the font file.
	///
	///     [Since 2.6.1] Bits 16-30 are relevant to TrueType GX and OpenType
	///     Font Variations only, specifying the named instance index for the
	///     current face index (starting with value 1; value 0 makes FreeType
	///     ignore named instances).  For non-variation fonts, bits 16-30 are
	///     ignored.  Assuming that you want to access the third named instance
	///     in face 4, `face_index` should be set to 0x00030004.  If you want
	///     to access face 4 without variation handling, simply set
	///     `face_index` to value 4.
	///
	///     `FT_Open_Face` and its siblings can be used to quickly check whether
	///     the font format of a given font resource is supported by FreeType.
	///     In general, if the `face_index` argument is negative, the function's
	///     return value is 0 if the font format is recognized, or non-zero
	///     otherwise.  The function allocates a more or less empty face handle
	///     in `*aface` (if `aface` isn't `NULL`); the only two useful fields in
	///     this special case are `face->num_faces` and `face->style_flags`.
	///     For any negative value of `face_index`, `face->num_faces` gives the
	///     number of faces within the font file.  For the negative value
	///     '-(N+1)' (with 'N' a non-negative 16-bit value), bits 16-30 in
	///     `face->style_flags` give the number of named instances in face 'N'
	///     if we have a variation font (or zero otherwise).  After examination,
	///     the returned FT_Face structure should be deallocated with a call to
	///     FT_Done_Face.
	///
	/// @output:
	///   aface ::
	///     A handle to a new face object.  If `face_index` is greater than or
	///     equal to zero, it must be non-`NULL`.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///     Unlike FreeType 1.x, this function automatically creates a glyph slot
	///     for the face object that can be accessed directly through
	///     `face->glyph`.
	///
	///     Each new face object created with this function also owns a default
	///     FT_Size object, accessible as `face->size`.
	///
	///     One FT_Library instance can have multiple face objects, that is,
	///     FT_Open_Face and its siblings can be called multiple times using the
	///     same `library` argument.
	///
	///     See the discussion of reference counters in the description of
	///     FT_Reference_Face.
	///
	///     If `FT_OPEN_STREAM` is set in `args->flags`, the stream in
	///     `args->stream` is automatically closed before this function returns
	///     any error (including `FT_Err_Invalid_Argument`).
	///
	///   example:
	///     To loop over all faces, use code similar to the following snippet
	///     (omitting the error handling).
	///
	///     ```
	///       ...
	///       FT_Face  face;
	///       FT_Long  i, num_faces;
	///
	///
	///       error = FT_Open_Face( library, args, -1, &face );
	///       if ( error ) { ... }
	///
	///       num_faces = face->num_faces;
	///       FT_Done_Face( face );
	///
	///       for ( i = 0; i < num_faces; i++ )
	///       {
	///         ...
	///         error = FT_Open_Face( library, args, i, &face );
	///         ...
	///         FT_Done_Face( face );
	///         ...
	///       }
	///     ```
	///
	///     To loop over all valid values for `face_index`, use something similar
	///     to the following snippet, again without error handling.  The code
	///     accesses all faces immediately (thus only a single call of
	///     `FT_Open_Face` within the do-loop), with and without named instances.
	///
	///     ```
	///       ...
	///       FT_Face  face;
	///
	///       FT_Long  num_faces     = 0;
	///       FT_Long  num_instances = 0;
	///
	///       FT_Long  face_idx     = 0;
	///       FT_Long  instance_idx = 0;
	///
	///
	///       do
	///       {
	///         FT_Long  id = ( instance_idx << 16 ) + face_idx;
	///
	///
	///         error = FT_Open_Face( library, args, id, &face );
	///         if ( error ) { ... }
	///
	///         num_faces     = face->num_faces;
	///         num_instances = face->style_flags >> 16;
	///
	///         ...
	///
	///         FT_Done_Face( face );
	///
	///         if ( instance_idx < num_instances )
	///           instance_idx++;
	///         else
	///         {
	///           face_idx++;
	///           instance_idx = 0;
	///         }
	///
	///       } while ( face_idx < num_faces )
	///     ```
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Open_Face(FT_Library library, FT_Open_Args* args, FT_Long face_index, out FT_Face aface);

	/// Call FT_Attach_Stream to attach a file.
	///
	/// @inout:
	///   face ::
	///     The target face object.
	///
	/// @input:
	///   filepathname ::
	///     The pathname.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Attach_File(FT_Face face, c_char* filepathname);

	/// 'Attach' data to a face object.  Normally, this is used to read
	/// additional information for the face object.  For example, you can
	/// attach an AFM file that comes with a Type 1 font to get the kerning
	/// values and other metrics.
	///
	/// @inout:
	///   face ::
	///     The target face object.
	///
	/// @input:
	///   parameters ::
	///     A pointer to FT_Open_Args that must be filled by the caller.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The meaning of the 'attach' (i.e., what really happens when the new
	///   file is read) is not fixed by FreeType itself.  It really depends on
	///   the font format (and thus the font driver).
	///
	///   Client applications are expected to know what they are doing when
	///   invoking this function.  Most drivers simply do not implement file or
	///   stream attachments.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Attach_Stream(FT_Face face, FT_Open_Args* parameters);

	/// A counter gets initialized to 1 at the time an FT_Face structure is
	/// created.  This function increments the counter.  FT_Done_Face then
	/// only destroys a face if the counter is 1, otherwise it simply
	/// decrements the counter.
	///
	/// This function helps in managing life-cycles of structures that
	/// reference FT_Face objects.
	///
	/// @input:
	///   face ::
	///     A handle to a target face object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @since:
	///   2.4.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Reference_Face(FT_Face face);

	/// Discard a given face object, as well as all of its child slots and
	/// sizes.
	///
	/// @input:
	///   face ::
	///     A handle to a target face object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   See the discussion of reference counters in the description of
	///   FT_Reference_Face.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Done_Face(FT_Face face);

	/// Set or override certain (library or module-wide) properties on a
	/// face-by-face basis.  Useful for finer-grained control and avoiding
	/// locks on shared structures (threads can modify their own faces as they
	/// see fit).
	///
	/// Contrary to FT_Property_Set, this function uses FT_Parameter so that
	/// you can pass multiple properties to the target face in one call.  Note
	/// that only a subset of the available properties can be controlled.
	///
	/// * FT_PARAM_TAG_STEM_DARKENING (stem darkening, corresponding to the
	///   property `no-stem-darkening` provided by the 'autofit', 'cff',
	///   'type1', and 't1cid' modules; see no-stem-darkening).
	///
	/// * FT_PARAM_TAG_RANDOM_SEED (seed value for the CFF, Type 1, and CID
	///   'random' operator, corresponding to the `random-seed` property
	///   provided by the 'cff', 'type1', and 't1cid' modules; see
	///   random-seed).
	///
	/// * FT_PARAM_TAG_LCD_FILTER_WEIGHTS (no longer supported).
	///
	/// Pass `NULL` as `data` in FT_Parameter for a given tag to reset the
	/// option and use the library or module default again.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   num_properties ::
	///     The number of properties that follow.
	///
	///   properties ::
	///     A handle to an FT_Parameter array with `num_properties` elements.
	///
	/// @return:
	///     FreeType error code.  0 means success.
	///
	///   example:
	///     Here is an example that sets three properties.  You must define
	///     `FT_CONFIG_OPTION_SUBPIXEL_RENDERING` to make the LCD filter examples
	///     work.
	///
	///     ```
	///       FT_Parameter         property1;
	///       FT_Bool              darken_stems = 1;
	///
	///       FT_Parameter         property2;
	///       FT_Int32             random_seed = 314159265;
	///
	///       FT_Parameter         properties[2] = { property1,
	///                                              property2 };
	///
	///
	///       property1.tag  = FT_PARAM_TAG_STEM_DARKENING;
	///       property1.data = &darken_stems;
	///
	///       property2.tag  = FT_PARAM_TAG_RANDOM_SEED;
	///       property2.data = &random_seed;
	///
	///       FT_Face_Properties( face, 3, properties );
	///     ```
	///
	///     The next example resets a single property to its default value.
	///
	///     ```
	///       FT_Parameter  property;
	///
	///
	///       property.tag  = FT_PARAM_TAG_STEM_DARKENING;
	///       property.data = NULL;
	///
	///       FT_Face_Properties( face, 1, &property );
	///     ```
	///
	/// @since:
	///   2.8
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Face_Properties(FT_Face face, FT_UInt num_properties, FT_Parameter* properties);

	/// Deprecated, does nothing.
	///
	/// @input:
	///   face ::
	///     A face handle.
	///
	/// @return:
	///   Always returns false.
	///
	/// @note:
	///   Since May 2010, TrueType hinting is no longer patented.
	///
	/// @since:
	///   2.3.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Bool FT_Face_CheckTrueTypePatents(FT_Face face);

	/// Deprecated, does nothing.
	///
	/// @input:
	///   face ::
	///     A face handle.
	///
	///   value ::
	///     New boolean setting.
	///
	/// @return:
	///   Always returns false.
	///
	/// @note:
	///   Since May 2010, TrueType hinting is no longer patented.
	///
	/// @since:
	///   2.3.5
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Bool FT_Face_SetUnpatentedHinting(FT_Face face, FT_Bool value);

	// ====================================================================
	// Sizes (freetype.h, ftsizes.h)
	// ====================================================================

	/// Select a bitmap strike.  To be more precise, this function sets the
	/// scaling factors of the active FT_Size object in a face so that
	/// bitmaps from this particular strike are taken by FT_Load_Glyph and
	/// friends.
	///
	/// @inout:
	///   face ::
	///     A handle to a target face object.
	///
	/// @input:
	///   strike_index ::
	///     The index of the bitmap strike in the `available_sizes` field of
	///     FT_FaceRec structure.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   For bitmaps embedded in outline fonts it is common that only a subset
	///   of the available glyphs at a given ppem value is available.  FreeType
	///   silently uses outlines if there is no bitmap for a given glyph index.
	///
	///   For TrueType GX and OpenType Font Variations, a bitmap strike makes
	///   sense only if the default instance is active (that is, no glyph
	///   variation takes place); otherwise, FreeType simply ignores bitmap
	///   strikes.  The same is true for all named instances that are different
	///   from the default instance.
	///
	///   Don't use this function if you are using the FreeType cache API.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Select_Size(FT_Face face, FT_Int strike_index);

	/// Resize the scale of the active FT_Size object in a face.
	///
	/// @inout:
	///   face ::
	///     A handle to a target face object.
	///
	/// @input:
	///   req ::
	///     A pointer to a FT_Size_RequestRec.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Although drivers may select the bitmap strike matching the request,
	///   you should not rely on this if you intend to select a particular
	///   bitmap strike.  Use FT_Select_Size instead in that case.
	///
	///   The relation between the requested size and the resulting glyph size
	///   is dependent entirely on how the size is defined in the source face.
	///   The font designer chooses the final size of each glyph relative to
	///   this size.  For more information refer to
	///   'https://freetype.org/freetype2/docs/glyphs/glyphs-2.html'.
	///
	///   Contrary to FT_Set_Char_Size, this function doesn't have special code
	///   to normalize zero-valued widths, heights, or resolutions, which are
	///   treated as FT_LOAD_NO_SCALE.
	///
	///   Don't use this function if you are using the FreeType cache API.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Request_Size(FT_Face face, FT_Size_Request req);

	/// Call FT_Request_Size to request the nominal size (in points).
	///
	/// @inout:
	///   face ::
	///     A handle to a target face object.
	///
	/// @input:
	///   char_width ::
	///     The nominal width, in 26.6 fractional points.
	///
	///   char_height ::
	///     The nominal height, in 26.6 fractional points.
	///
	///   horz_resolution ::
	///     The horizontal resolution in dpi.
	///
	///   vert_resolution ::
	///     The vertical resolution in dpi.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   While this function allows fractional points as input values, the
	///   resulting ppem value for the given resolution is always rounded to the
	///   nearest integer.
	///
	///   If either the character width or height is zero, it is set equal to
	///   the other value.
	///
	///   If either the horizontal or vertical resolution is zero, it is set
	///   equal to the other value.
	///
	///   A character width or height smaller than 1pt is set to 1pt; if both
	///   resolution values are zero, they are set to 72dpi.
	///
	///   Don't use this function if you are using the FreeType cache API.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_Char_Size(FT_Face face, FT_F26Dot6 char_width, FT_F26Dot6 char_height, FT_UInt horz_resolution, FT_UInt vert_resolution);

	/// Call FT_Request_Size to request the nominal size (in pixels).
	///
	/// @inout:
	///   face ::
	///     A handle to the target face object.
	///
	/// @input:
	///   pixel_width ::
	///     The nominal width, in pixels.
	///
	///   pixel_height ::
	///     The nominal height, in pixels.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   You should not rely on the resulting glyphs matching or being
	///   constrained to this pixel size.  Refer to FT_Request_Size to
	///   understand how requested sizes relate to actual sizes.
	///
	///   Don't use this function if you are using the FreeType cache API.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_Pixel_Sizes(FT_Face face, FT_UInt pixel_width, FT_UInt pixel_height);

	/// Create a new size object from a given face object.
	///
	/// @input:
	///   face ::
	///     A handle to a parent face object.
	///
	/// @output:
	///   asize ::
	///     A handle to a new size object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   You need to call FT_Activate_Size in order to select the new size for
	///   upcoming calls to FT_Set_Pixel_Sizes, FT_Set_Char_Size,
	///   FT_Load_Glyph, FT_Load_Char, etc.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_New_Size(FT_Face face, out FT_Size size);

	/// Discard a given size object.  Note that FT_Done_Face automatically
	/// discards all size objects allocated with FT_New_Size.
	///
	/// @input:
	///   size ::
	///     A handle to a target size object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Done_Size(FT_Size size);

	/// Even though it is possible to create several size objects for a given
	/// face (see FT_New_Size for details), functions like FT_Load_Glyph or
	/// FT_Load_Char only use the one that has been activated last to
	/// determine the 'current character pixel size'.
	///
	/// This function can be used to 'activate' a previously created size
	/// object.
	///
	/// @input:
	///   size ::
	///     A handle to a target size object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If `face` is the size's parent face object, this function changes the
	///   value of `face->size` to the input size handle.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Activate_Size(FT_Size size);

	// ====================================================================
	// Glyph loading and rendering (freetype.h)
	// ====================================================================

	/// Load a glyph into the glyph slot of a face object.
	///
	/// @inout:
	///   face ::
	///     A handle to the target face object where the glyph is loaded.
	///
	/// @input:
	///   glyph_index ::
	///     The index of the glyph in the font file.  For CID-keyed fonts
	///     (either in PS or in CFF format) this argument specifies the CID
	///     value.
	///
	///   load_flags ::
	///     A flag indicating what to load for this glyph.  The FT_LOAD_XXX
	///     flags can be used to control the glyph loading process (e.g.,
	///     whether the outline should be scaled, whether to load bitmaps or
	///     not, whether to hint the outline, etc).
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   For proper scaling and hinting, the active FT_Size object owned by
	///   the face has to be meaningfully initialized by calling
	///   FT_Set_Char_Size before this function, for example.  The loaded
	///   glyph may be transformed.  See FT_Set_Transform for the details.
	///
	///   For subsetted CID-keyed fonts, `FT_Err_Invalid_Argument` is returned
	///   for invalid CID values (that is, for CID values that don't have a
	///   corresponding glyph in the font).  See the discussion of the
	///   FT_FACE_FLAG_CID_KEYED flag for more details.
	///
	///   If you receive `FT_Err_Glyph_Too_Big`, try getting the glyph outline
	///   at EM size, then scale it manually and fill it as a graphics
	///   operation.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Load_Glyph(FT_Face face, FT_UInt glyph_index, FT_Load_Flags load_flags);

	/// Load a glyph into the glyph slot of a face object, accessed by its
	/// character code.
	///
	/// @inout:
	///   face ::
	///     A handle to a target face object where the glyph is loaded.
	///
	/// @input:
	///   char_code ::
	///     The glyph's character code, according to the current charmap used in
	///     the face.
	///
	///   load_flags ::
	///     A flag indicating what to load for this glyph.  The FT_LOAD_XXX
	///     constants can be used to control the glyph loading process (e.g.,
	///     whether the outline should be scaled, whether to load bitmaps or
	///     not, whether to hint the outline, etc).
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function simply calls FT_Get_Char_Index and FT_Load_Glyph.
	///
	///   Many fonts contain glyphs that can't be loaded by this function since
	///   its glyph indices are not listed in any of the font's charmaps.
	///
	///   If no active cmap is set up (i.e., `face->charmap` is zero), the call
	///   to FT_Get_Char_Index is omitted, and the function behaves identically
	///   to FT_Load_Glyph.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Load_Char(FT_Face face, FT_ULong char_code, FT_Load_Flags load_flags);

	/// Set the transformation that is applied to glyph images when they are
	/// loaded into a glyph slot through FT_Load_Glyph.
	///
	/// @inout:
	///   face ::
	///     A handle to the source face object.
	///
	/// @input:
	///   matrix ::
	///     A pointer to the transformation's 2x2 matrix.  Use `NULL` for the
	///     identity matrix.
	///   delta ::
	///     A pointer to the translation vector.  Use `NULL` for the null
	///     vector.
	///
	/// @note:
	///   This function is provided as a convenience, but keep in mind that
	///   FT_Matrix coefficients are only 16.16 fixed-point values, which can
	///   limit the accuracy of the results.  Using floating-point computations
	///   to perform the transform directly in client code instead will always
	///   yield better numbers.
	///
	///   The transformation is only applied to scalable image formats after the
	///   glyph has been loaded.  It means that hinting is unaltered by the
	///   transformation and is performed on the character size given in the
	///   last call to FT_Set_Char_Size or FT_Set_Pixel_Sizes.
	///
	///   Note that this also transforms the `face.glyph.advance` field, but
	///   **not** the values in `face.glyph.metrics`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Set_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);

	/// Return the transformation that is applied to glyph images when they
	/// are loaded into a glyph slot through FT_Load_Glyph.  See
	/// FT_Set_Transform for more details.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	/// @output:
	///   matrix ::
	///     A pointer to a transformation's 2x2 matrix.  Set this to NULL if you
	///     are not interested in the value.
	///
	///   delta ::
	///     A pointer to a translation vector.  Set this to NULL if you are not
	///     interested in the value.
	///
	/// @since:
	///   2.11
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Get_Transform(FT_Face face, FT_Matrix* matrix, FT_Vector* delta);

	/// Convert a given glyph image to a bitmap.  It does so by inspecting the
	/// glyph image format, finding the relevant renderer, and invoking it.
	///
	/// @inout:
	///   slot ::
	///     A handle to the glyph slot containing the image to convert.
	///
	/// @input:
	///   render_mode ::
	///     The render mode used to render the glyph image into a bitmap.  See
	///     FT_Render_Mode for a list of possible values.
	///
	///     If FT_RENDER_MODE_NORMAL is used, a previous call of FT_Load_Glyph
	///     with flag FT_LOAD_COLOR makes `FT_Render_Glyph` provide a default
	///     blending of colored glyph layers associated with the current glyph
	///     slot (provided the font contains such layers) instead of rendering
	///     the glyph slot's outline.  This is an experimental feature; see
	///     FT_LOAD_COLOR for more information.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   When FreeType outputs a bitmap of a glyph, it really outputs an alpha
	///   coverage map.  If a pixel is completely covered by a filled-in
	///   outline, the bitmap contains 0xFF at that pixel, meaning that
	///   0xFF/0xFF fraction of that pixel is covered, meaning the pixel is 100%
	///   black (or 0% bright).  If a pixel is only 50% covered (value 0x80),
	///   the pixel is made 50% black (50% bright or a middle shade of grey).
	///   0% covered means 0% black (100% bright or white).
	///
	///   On high-DPI screens like on smartphones and tablets, the pixels are so
	///   small that their chance of being completely covered and therefore
	///   completely black are fairly good.  On the low-DPI screens, however,
	///   the situation is different.  The pixels are too large for most of the
	///   details of a glyph and shades of gray are the norm rather than the
	///   exception.
	///
	///   This is relevant because all our screens have a second problem: they
	///   are not linear.  1 + 1 is not 2.  Twice the value does not result in
	///   twice the brightness.  When a pixel is only 50% covered, the coverage
	///   map says 50% black, and this translates to a pixel value of 128 when
	///   you use 8 bits per channel (0-255).  However, this does not translate
	///   to 50% brightness for that pixel on our sRGB and gamma 2.2 screens.
	///   Due to their non-linearity, they dwell longer in the darks and only a
	///   pixel value of about 186 results in 50% brightness -- 128 ends up too
	///   dark on both bright and dark backgrounds.  The net result is that dark
	///   text looks burnt-out, pixely and blotchy on bright background, bright
	///   text too frail on dark backgrounds, and colored text on colored
	///   background (for example, red on green) seems to have dark halos or
	///   'dirt' around it.  The situation is especially ugly for diagonal stems
	///   like in 'w' glyph shapes where the quality of FreeType's anti-aliasing
	///   depends on the correct display of grays.  On high-DPI screens where
	///   smaller, fully black pixels reign supreme, this doesn't matter, but on
	///   our low-DPI screens with all the gray shades, it does.  0% and 100%
	///   brightness are the same things in linear and non-linear space, just
	///   all the shades in-between aren't.
	///
	///   The blending function for placing text over a background is
	///
	///   ```
	///     dst = alpha * src + (1 - alpha) * dst    ,
	///   ```
	///
	///   which is known as the OVER operator.
	///
	///   To correctly composite an anti-aliased pixel of a glyph onto a
	///   surface,
	///
	///   1. take the foreground and background colors (e.g., in sRGB space)
	///      and apply gamma to get them in a linear space,
	///
	///   2. use OVER to blend the two linear colors using the glyph pixel
	///      as the alpha value (remember, the glyph bitmap is an alpha coverage
	///      bitmap), and
	///
	///   3. apply inverse gamma to the blended pixel and write it back to
	///      the image.
	///
	///   Internal testing at Adobe found that a target inverse gamma of 1.8 for
	///   step 3 gives good results across a wide range of displays with an sRGB
	///   gamma curve or a similar one.
	///
	///   This process can cost performance.  There is an approximation that
	///   does not need to know about the background color; see
	///   https://web.archive.org/web/20211019204945/https://bel.fi/alankila/lcd/
	///   and
	///   https://web.archive.org/web/20210211002939/https://bel.fi/alankila/lcd/alpcor.html
	///   for details.
	///
	///   **ATTENTION**: Linear blending is even more important when dealing
	///   with subpixel-rendered glyphs to prevent color-fringing!  A
	///   subpixel-rendered glyph must first be filtered with a filter that
	///   gives equal weight to the three color primaries and does not exceed a
	///   sum of 0x100, see section lcd_rendering.  Then the only difference to
	///   gray linear blending is that subpixel-rendered linear blending is done
	///   3 times per pixel: red foreground subpixel to red background subpixel
	///   and so on for green and blue.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Render_Glyph(FT_GlyphSlot slot, FT_Render_Mode render_mode);

	/// Return the kerning vector between two glyphs of the same face.
	///
	/// @input:
	///   face ::
	///     A handle to a source face object.
	///
	///   left_glyph ::
	///     The index of the left glyph in the kern pair.
	///
	///   right_glyph ::
	///     The index of the right glyph in the kern pair.
	///
	///   kern_mode ::
	///     See FT_Kerning_Mode for more information.  Determines the scale and
	///     dimension of the returned kerning vector.
	///
	/// @output:
	///   akerning ::
	///     The kerning vector.  This is either in font units, fractional pixels
	///     (26.6 format), or pixels for scalable formats, and in pixels for
	///     fixed-sizes formats.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Only horizontal layouts (left-to-right & right-to-left) are supported
	///   by this method.  Other layouts, or more sophisticated kernings, are
	///   out of the scope of this API function -- they can be implemented
	///   through format-specific interfaces.
	///
	///   Note that, for TrueType and OpenType fonts only, this can extract data
	///   from both the 'kern' table and the basic, pair-wise kerning feature
	///   from the GPOS table (with `TT_CONFIG_OPTION_GPOS_KERNING` enabled),
	///   though FreeType does not support the more advanced GPOS layout
	///   features; use a library like HarfBuzz for those instead.  If a font
	///   has both a 'kern' table and kern features of a GPOS table, the 'kern'
	///   table will be used.
	///
	///   Also note for right-to-left scripts, the functionality may differ for
	///   fonts with GPOS tables vs. 'kern' tables.  For GPOS, right-to-left
	///   fonts typically use both a placement offset and an advance for pair
	///   positioning, which this API does not support, so it would output
	///   kerning values of zero; though if the right-to-left font used only
	///   advances in GPOS pair positioning, then this API could output kerning
	///   values for it, but it would use `left_glyph` to mean the first glyph
	///   for that case.  Whereas 'kern' tables are always advance-only and
	///   always store the left glyph first.
	///
	///   Use FT_HAS_KERNING to find out whether a font has data that can be
	///   extracted with `FT_Get_Kerning`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Kerning(FT_Face face, FT_UInt left_glyph, FT_UInt right_glyph, FT_Kerning_Mode kern_mode, out FT_Vector akerning);

	/// Return the track kerning for a given face object at a given size.
	///
	/// @input:
	///   face ::
	///     A handle to a source face object.
	///
	///   point_size ::
	///     The point size in 16.16 fractional points.
	///
	///   degree ::
	///     The degree of tightness.  Increasingly negative values represent
	///     tighter track kerning, while increasingly positive values represent
	///     looser track kerning.  Value zero means no track kerning.
	///
	/// @output:
	///   akerning ::
	///     The kerning in 16.16 fractional points, to be uniformly applied
	///     between all glyphs.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Currently, only the Type 1 font driver supports track kerning, using
	///   data from AFM files (if attached with FT_Attach_File or
	///   FT_Attach_Stream).
	///
	///   Only very few AFM files come with track kerning data; please refer to
	///   Adobe's AFM specification for more details.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Track_Kerning(FT_Face face, FT_Fixed point_size, FT_Int degree, out FT_Fixed akerning);

	/// Retrieve the ASCII name of a given glyph in a face.  This only works
	/// for those faces where FT_HAS_GLYPH_NAMES returns true.
	///
	/// @input:
	///   face ::
	///     A handle to a source face object.
	///
	///   glyph_index ::
	///     The glyph index.
	///
	///   buffer_max ::
	///     The maximum number of bytes available in the buffer.
	///
	/// @output:
	///   buffer ::
	///     A pointer to a target buffer where the name is copied to.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   An error is returned if the face doesn't provide glyph names or if the
	///   glyph index is invalid.  In all cases of failure, the first byte of
	///   `buffer` is set to 0 to indicate an empty name.
	///
	///   The glyph name is truncated to fit within the buffer if it is too
	///   long.  The returned string is always zero-terminated.
	///
	///   Be aware that FreeType reorders glyph indices internally so that glyph
	///   index 0 always corresponds to the 'missing glyph' (called '.notdef').
	///
	///   This function has limited capabilities if the config macro
	///   `FT_CONFIG_OPTION_POSTSCRIPT_NAMES` is not defined in `ftoption.h`:
	///   It then works only for fonts that actually embed glyph names (which
	///   many recent OpenType fonts do not).
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Glyph_Name(FT_Face face, FT_UInt glyph_index, FT_Pointer buffer, FT_UInt buffer_max);

	/// Retrieve the ASCII PostScript name of a given face, if available.
	/// This only works with PostScript, TrueType, and OpenType fonts.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	/// @return:
	///   A pointer to the face's PostScript name.  `NULL` if unavailable.
	///
	/// @note:
	///   The returned pointer is owned by the face and is destroyed with it.
	///
	///   For variation fonts, this string changes if you select a different
	///   instance, and you have to call `FT_Get_PostScript_Name` again to
	///   retrieve it.  FreeType follows Adobe TechNote #5902, 'Generating
	///   PostScript Names for Fonts Using OpenType Font Variations'.
	///
	///     https://download.macromedia.com/pub/developer/opentype/tech-notes/5902.AdobePSNameGeneration.html
	///
	///   [Since 2.9] Special PostScript names for named instances are only
	///   returned if the named instance is set with FT_Set_Named_Instance (and
	///   the font has corresponding entries in its 'fvar' table or is the
	///   default named instance).  If FT_IS_VARIATION returns true, the
	///   algorithmically derived PostScript name is provided, not looking up
	///   special entries for named instances.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* FT_Get_Postscript_Name(FT_Face face);

	/// Retrieve a description of a given subglyph.  Only use it if
	/// `glyph->format` is FT_GLYPH_FORMAT_COMPOSITE; an error is returned
	/// otherwise.
	///
	/// @input:
	///   glyph ::
	///     The source glyph slot.
	///
	///   sub_index ::
	///     The index of the subglyph.  Must be less than
	///     `glyph->num_subglyphs`.
	///
	/// @output:
	///   p_index ::
	///     The glyph index of the subglyph.
	///
	///   p_flags ::
	///     The subglyph flags, see FT_SUBGLYPH_FLAG_XXX.
	///
	///   p_arg1 ::
	///     The subglyph's first argument (if any).
	///
	///   p_arg2 ::
	///     The subglyph's second argument (if any).
	///
	///   p_transform ::
	///     The subglyph transformation (if any).
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The values of `*p_arg1`, `*p_arg2`, and `*p_transform` must be
	///   interpreted depending on the flags returned in `*p_flags`.  See the
	///   OpenType specification for details.
	///
	///     https://learn.microsoft.com/typography/opentype/spec/glyf#composite-glyph-description
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_SubGlyph_Info(FT_GlyphSlot glyph, FT_UInt sub_index, out FT_Int p_index, out FT_SubGlyph_Flags p_flags, out FT_Int p_arg1, out FT_Int p_arg2, out FT_Matrix p_transform);

	/// Retrieve the advance value of a given glyph outline in an FT_Face.
	///
	/// @input:
	///   face ::
	///     The source FT_Face handle.
	///
	///   gindex ::
	///     The glyph index.
	///
	///   load_flags ::
	///     A set of bit flags similar to those used when calling
	///     FT_Load_Glyph, used to determine what kind of advances you need.
	///
	/// @output:
	///   padvance ::
	///     The advance value.  If scaling is performed (based on the value of
	///     `load_flags`), the advance value is in 16.16 format.  Otherwise, it
	///     is in font units.
	///
	///     If FT_LOAD_VERTICAL_LAYOUT is set, this is the vertical advance
	///     corresponding to a vertical layout.  Otherwise, it is the horizontal
	///     advance in a horizontal layout.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function may fail if you use FT_ADVANCE_FLAG_FAST_ONLY and if
	///   the corresponding font backend doesn't have a quick way to retrieve
	///   the advances.
	///
	///   A scaled advance is returned in 16.16 format but isn't transformed by
	///   the affine transformation specified by FT_Set_Transform.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Advance(FT_Face face, FT_UInt gindex, FT_Load_Flags load_flags, out FT_Fixed padvance);

	/// Retrieve the advance values of several glyph outlines in an FT_Face.
	///
	/// @input:
	///   face ::
	///     The source FT_Face handle.
	///
	///   start ::
	///     The first glyph index.
	///
	///   count ::
	///     The number of advance values you want to retrieve.
	///
	///   load_flags ::
	///     A set of bit flags similar to those used when calling
	///     FT_Load_Glyph.
	///
	/// @output:
	///   padvance ::
	///     The advance values.  This array, to be provided by the caller, must
	///     contain at least `count` elements.
	///
	///     If scaling is performed (based on the value of `load_flags`), the
	///     advance values are in 16.16 format.  Otherwise, they are in font
	///     units.
	///
	///     If FT_LOAD_VERTICAL_LAYOUT is set, these are the vertical advances
	///     corresponding to a vertical layout.  Otherwise, they are the
	///     horizontal advances in a horizontal layout.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function may fail if you use FT_ADVANCE_FLAG_FAST_ONLY and if
	///   the corresponding font backend doesn't have a quick way to retrieve
	///   the advances.
	///
	///   Scaled advances are returned in 16.16 format but aren't transformed by
	///   the affine transformation specified by FT_Set_Transform.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Advances(FT_Face face, FT_UInt start, FT_UInt count, FT_Load_Flags load_flags, FT_Fixed* padvances);

	// ====================================================================
	// Character maps (freetype.h)
	// ====================================================================

	/// Select a given charmap by its encoding tag (as listed in
	/// `freetype.h`).
	///
	/// @inout:
	///   face ::
	///     A handle to the source face object.
	///
	/// @input:
	///   encoding ::
	///     A handle to the selected encoding.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function returns an error if no charmap in the face corresponds
	///   to the encoding queried here.
	///
	///   Because many fonts contain more than a single cmap for Unicode
	///   encoding, this function has some special code to select the one that
	///   covers Unicode best ('best' in the sense that a UCS-4 cmap is
	///   preferred to a UCS-2 cmap).  It is thus preferable to FT_Set_Charmap
	///   in this case.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Select_Charmap(FT_Face face, FT_Encoding encoding);

	/// Select a given charmap for character code to glyph index mapping.
	///
	/// @inout:
	///   face ::
	///     A handle to the source face object.
	///
	/// @input:
	///   charmap ::
	///     A handle to the selected charmap.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function returns an error if the charmap is not part of the face
	///   (i.e., if it is not listed in the `face->charmaps` table).
	///
	///   It also fails if an OpenType type 14 or 15 charmap is selected (which
	///   doesn't map character codes to glyph indices at all).
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_Charmap(FT_Face face, FT_CharMap charmap);

	/// Retrieve index of a given charmap.
	///
	/// @input:
	///   charmap ::
	///     A handle to a charmap.
	///
	/// @return:
	///   The index into the array of character maps within the face to which
	///   `charmap` belongs.  If an error occurs, -1 is returned.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Int FT_Get_Charmap_Index(FT_CharMap charmap);

	/// Return the glyph index of a given character code.  This function uses
	/// the currently selected charmap to do the mapping.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   charcode ::
	///     The character code.
	///
	/// @return:
	///   The glyph index.  0 means 'undefined character code'.
	///
	/// @note:
	///   If you use FreeType to manipulate the contents of font files directly,
	///   be aware that the glyph index returned by this function doesn't always
	///   correspond to the internal indices used within the file.  This is done
	///   to ensure that value 0 always corresponds to the 'missing glyph'.  If
	///   the first glyph is not named '.notdef', then for Type 1 and Type 42
	///   fonts, '.notdef' will be moved into the glyph ID 0 position, and
	///   whatever was there will be moved to the position '.notdef' had.  For
	///   Type 1 fonts, if there is no '.notdef' glyph at all, then one will be
	///   created at index 0 and whatever was there will be moved to the last
	///   index -- Type 42 fonts are considered invalid under this condition.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_UInt FT_Get_Char_Index(FT_Face face, FT_ULong charcode);

	/// Return the first character code in the current charmap of a given
	/// face, together with its corresponding glyph index.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	/// @output:
	///   agindex ::
	///     Glyph index of first character code.  0 if charmap is empty.
	///
	/// @return:
	///   The charmap's first character code.
	///
	/// @note:
	///   You should use this function together with FT_Get_Next_Char to parse
	///   all character codes available in a given charmap.  The code should
	///   look like this:
	///
	///   ```
	///     FT_ULong  charcode;
	///     FT_UInt   gindex;
	///
	///
	///     charcode = FT_Get_First_Char( face, &gindex );
	///     while ( gindex != 0 )
	///     {
	///       ... do something with (charcode,gindex) pair ...
	///
	///       charcode = FT_Get_Next_Char( face, charcode, &gindex );
	///     }
	///   ```
	///
	///   Be aware that character codes can have values up to 0xFFFFFFFF; this
	///   might happen for non-Unicode or malformed cmaps.  However, even with
	///   regular Unicode encoding, so-called 'last resort fonts' (using SFNT
	///   cmap format 13, see function FT_Get_CMap_Format) normally have
	///   entries for all Unicode characters up to 0x1FFFFF, which can cause *a
	///   lot* of iterations.
	///
	///   Note that `*agindex` is set to 0 if the charmap is empty.  The result
	///   itself can be 0 in two cases: if the charmap is empty or if the
	///   value 0 is the first valid character code.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_ULong FT_Get_First_Char(FT_Face face, FT_UInt* agindex);

	/// Return the next character code in the current charmap of a given face
	/// following the value `char_code`, as well as the corresponding glyph
	/// index.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   char_code ::
	///     The starting character code.
	///
	/// @output:
	///   agindex ::
	///     Glyph index of next character code.  0 if charmap is empty.
	///
	/// @return:
	///   The charmap's next character code.
	///
	/// @note:
	///   You should use this function with FT_Get_First_Char to walk over all
	///   character codes available in a given charmap.  See the note for that
	///   function for a simple code example.
	///
	///   Note that `*agindex` is set to 0 when there are no more codes in the
	///   charmap.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_ULong FT_Get_Next_Char(FT_Face face, FT_ULong char_code, FT_UInt* agindex);

	/// Return the glyph index of a given glyph name.  This only works
	/// for those faces where FT_HAS_GLYPH_NAMES returns true.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   glyph_name ::
	///     The glyph name.
	///
	/// @return:
	///   The glyph index.  0 means 'undefined character code'.
	///
	/// @note:
	///   Acceptable glyph names might come from the [Adobe Glyph
	///   List](https://github.com/adobe-type-tools/agl-aglfn).  See
	///   FT_Get_Glyph_Name for the inverse functionality.
	///
	///   This function has limited capabilities if the config macro
	///   `FT_CONFIG_OPTION_POSTSCRIPT_NAMES` is not defined in `ftoption.h`:
	///   It then works only for fonts that actually embed glyph names (which
	///   many recent OpenType fonts do not).
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_UInt FT_Get_Name_Index(FT_Face face, FT_String* glyph_name);

	/// Return the `fsType` flags for a font.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	/// @return:
	///   The `fsType` flags, see FT_FSTYPE_XXX.
	///
	/// @note:
	///   Use this function rather than directly reading the `fs_type` field in
	///   the PS_FontInfoRec structure, which is only guaranteed to return the
	///   correct results for Type 1 fonts.
	///
	/// @since:
	///   2.3.8
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_FSType_Flags FT_Get_FSType_Flags(FT_Face face);

	/// Return the glyph index of a given character code as modified by the
	/// variation selector.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   charcode ::
	///     The character code point in Unicode.
	///
	///   variantSelector ::
	///     The Unicode code point of the variation selector.
	///
	/// @return:
	///   The glyph index.  0 means either 'undefined character code', or
	///   'undefined selector code', or 'no variation selector cmap subtable',
	///   or 'current CharMap is not Unicode'.
	///
	/// @note:
	///   If you use FreeType to manipulate the contents of font files directly,
	///   be aware that the glyph index returned by this function doesn't always
	///   correspond to the internal indices used within the file.  This is done
	///   to ensure that value 0 always corresponds to the 'missing glyph'.
	///
	///   This function is only meaningful if
	///     a) the font has a variation selector cmap sub table, and
	///     b) the current charmap has a Unicode encoding.
	///
	/// @since:
	///   2.3.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_UInt FT_Face_GetCharVariantIndex(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);

	/// Check whether this variation of this Unicode character is the one to
	/// be found in the charmap.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   charcode ::
	///     The character codepoint in Unicode.
	///
	///   variantSelector ::
	///     The Unicode codepoint of the variation selector.
	///
	/// @return:
	///   1 if found in the standard (Unicode) cmap, 0 if found in the variation
	///   selector cmap, or -1 if it is not a variation.
	///
	/// @note:
	///   This function is only meaningful if the font has a variation selector
	///   cmap subtable.
	///
	/// @since:
	///   2.3.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Int FT_Face_GetCharVariantIsDefault(FT_Face face, FT_ULong charcode, FT_ULong variantSelector);

	/// Return a zero-terminated list of Unicode variation selectors found in
	/// the font.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	/// @return:
	///   A pointer to an array of selector code points, or `NULL` if there is
	///   no valid variation selector cmap subtable.
	///
	/// @note:
	///   The last item in the array is 0; the array is owned by the FT_Face
	///   object but can be overwritten or released on the next call to a
	///   FreeType function.
	///
	/// @since:
	///   2.3.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_UInt32* FT_Face_GetVariantSelectors(FT_Face face);

	/// Return a zero-terminated list of Unicode variation selectors found for
	/// the specified character code.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   charcode ::
	///     The character codepoint in Unicode.
	///
	/// @return:
	///   A pointer to an array of variation selector code points that are
	///   active for the given character, or `NULL` if the corresponding list is
	///   empty.
	///
	/// @note:
	///   The last item in the array is 0; the array is owned by the FT_Face
	///   object but can be overwritten or released on the next call to a
	///   FreeType function.
	///
	/// @since:
	///   2.3.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_UInt32* FT_Face_GetVariantsOfChar(FT_Face face, FT_ULong charcode);

	/// Return a zero-terminated list of Unicode character codes found for the
	/// specified variation selector.
	///
	/// @input:
	///   face ::
	///     A handle to the source face object.
	///
	///   variantSelector ::
	///     The variation selector code point in Unicode.
	///
	/// @return:
	///   A list of all the code points that are specified by this selector
	///   (both default and non-default codes are returned) or `NULL` if there
	///   is no valid cmap or the variation selector is invalid.
	///
	/// @note:
	///   The last item in the array is 0; the array is owned by the FT_Face
	///   object but can be overwritten or released on the next call to a
	///   FreeType function.
	///
	/// @since:
	///   2.3.6
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_UInt32* FT_Face_GetCharsOfVariant(FT_Face face, FT_ULong variantSelector);

	// ====================================================================
	// Fixed point and vector helpers (freetype.h)
	// ====================================================================

	/// Compute `(a*b)/c` with maximum accuracy, using a 64-bit intermediate
	/// integer whenever necessary.
	///
	/// This function isn't necessarily as fast as some processor-specific
	/// operations, but is at least completely portable.
	///
	/// @input:
	///   a ::
	///     The first multiplier.
	///
	///   b ::
	///     The second multiplier.
	///
	///   c ::
	///     The divisor.
	///
	/// @return:
	///   The result of `(a*b)/c`.  This function never traps when trying to
	///   divide by zero; it simply returns 'MaxInt' or 'MinInt' depending on
	///   the signs of `a` and `b`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Long FT_MulDiv(FT_Long a, FT_Long b, FT_Long c);

	/// Compute `(a*b)/0x10000` with maximum accuracy.  Its main use is to
	/// multiply a given value by a 16.16 fixed-point factor.
	///
	/// @input:
	///   a ::
	///     The first multiplier.
	///
	///   b ::
	///     The second multiplier.  Use a 16.16 factor here whenever possible
	///     (see note below).
	///
	/// @return:
	///   The result of `(a*b)/0x10000`.
	///
	/// @note:
	///   This function has been optimized for the case where the absolute value
	///   of `a` is less than 2048, and `b` is a 16.16 scaling factor.  As this
	///   happens mainly when scaling from notional units to fractional pixels
	///   in FreeType, it resulted in noticeable speed improvements between
	///   versions 2.x and 1.x.
	///
	///   As a conclusion, always try to place a 16.16 factor as the _second_
	///   argument of this function; this can make a great difference.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Long FT_MulFix(FT_Long a, FT_Long b);

	/// Compute `(a*0x10000)/b` with maximum accuracy.  Its main use is to
	/// divide a given value by a 16.16 fixed-point factor.
	///
	/// @input:
	///   a ::
	///     The numerator.
	///
	///   b ::
	///     The denominator.  Use a 16.16 factor here.
	///
	/// @return:
	///   The result of `(a*0x10000)/b`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Long FT_DivFix(FT_Long a, FT_Long b);

	/// Round a 16.16 fixed number.
	///
	/// @input:
	///   a ::
	///     The number to be rounded.
	///
	/// @return:
	///   `a` rounded to the nearest 16.16 fixed integer, halfway cases away
	///   from zero.
	///
	/// @note:
	///   The function uses wrap-around arithmetic.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Fixed FT_RoundFix(FT_Fixed a);

	/// Compute the smallest following integer of a 16.16 fixed number.
	///
	/// @input:
	///   a ::
	///     The number for which the ceiling function is to be computed.
	///
	/// @return:
	///   `a` rounded towards plus infinity.
	///
	/// @note:
	///   The function uses wrap-around arithmetic.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Fixed FT_CeilFix(FT_Fixed a);

	/// Compute the largest previous integer of a 16.16 fixed number.
	///
	/// @input:
	///   a ::
	///     The number for which the floor function is to be computed.
	///
	/// @return:
	///   `a` rounded towards minus infinity.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Fixed FT_FloorFix(FT_Fixed a);

	/// Transform a single vector through a 2x2 matrix.
	///
	/// @inout:
	///   vector ::
	///     The target vector to transform.
	///
	/// @input:
	///   matrix ::
	///     A pointer to the source 2x2 matrix.
	///
	/// @note:
	///   The result is undefined if either `vector` or `matrix` is invalid.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Vector_Transform(FT_Vector* vector, FT_Matrix* matrix);

	// ====================================================================
	// Trigonometry (fttrigon.h)
	// ====================================================================

	/// Return the sinus of a given angle in fixed-point format.
	///
	/// @input:
	///   angle ::
	///     The input angle.
	///
	/// @return:
	///   The sinus value.
	///
	/// @note:
	///   If you need both the sinus and cosinus for a given angle, use the
	///   function FT_Vector_Unit.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Fixed FT_Sin(FT_Angle angle);

	/// Return the cosinus of a given angle in fixed-point format.
	///
	/// @input:
	///   angle ::
	///     The input angle.
	///
	/// @return:
	///   The cosinus value.
	///
	/// @note:
	///   If you need both the sinus and cosinus for a given angle, use the
	///   function FT_Vector_Unit.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Fixed FT_Cos(FT_Angle angle);

	/// Return the tangent of a given angle in fixed-point format.
	///
	/// @input:
	///   angle ::
	///     The input angle.
	///
	/// @return:
	///   The tangent value.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Fixed FT_Tan(FT_Angle angle);

	/// Return the arc-tangent corresponding to a given vector (x,y) in the 2d
	/// plane.
	///
	/// @input:
	///   x ::
	///     The horizontal vector coordinate.
	///
	///   y ::
	///     The vertical vector coordinate.
	///
	/// @return:
	///   The arc-tangent value (i.e. angle).
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Angle FT_Atan2(FT_Fixed x, FT_Fixed y);

	/// Return the difference between two angles.  The result is always
	/// constrained to the ]-PI..PI] interval.
	///
	/// @input:
	///   angle1 ::
	///     First angle.
	///
	///   angle2 ::
	///     Second angle.
	///
	/// @return:
	///   Constrained value of `angle2-angle1`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Angle FT_Angle_Diff(FT_Angle angle1, FT_Angle angle2);

	/// Return the unit vector corresponding to a given angle.  After the
	/// call, the value of `vec.x` will be `cos(angle)`, and the value of
	/// `vec.y` will be `sin(angle)`.
	///
	/// This function is useful to retrieve both the sinus and cosinus of a
	/// given angle quickly.
	///
	/// @output:
	///   vec ::
	///     The address of target vector.
	///
	/// @input:
	///   angle ::
	///     The input angle.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Vector_Unit(FT_Vector* vec, FT_Angle angle);

	/// Rotate a vector by a given angle.
	///
	/// @inout:
	///   vec ::
	///     The address of target vector.
	///
	/// @input:
	///   angle ::
	///     The input angle.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Vector_Rotate(FT_Vector* vec, FT_Angle angle);

	/// Return the length of a given vector.
	///
	/// @input:
	///   vec ::
	///     The address of target vector.
	///
	/// @return:
	///   The vector length, expressed in the same units that the original
	///   vector coordinates.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Fixed FT_Vector_Length(FT_Vector* vec);

	/// Compute both the length and angle of a given vector.
	///
	/// @input:
	///   vec ::
	///     The address of source vector.
	///
	/// @output:
	///   length ::
	///     The vector length.
	///
	///   angle ::
	///     The vector angle.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Vector_Polarize(FT_Vector* vec, out FT_Fixed length, out FT_Angle angle);

	/// Compute vector coordinates from a length and angle.
	///
	/// @output:
	///   vec ::
	///     The address of source vector.
	///
	/// @input:
	///   length ::
	///     The vector length.
	///
	///   angle ::
	///     The vector angle.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Vector_From_Polar(FT_Vector* vec, FT_Fixed length, FT_Angle angle);

	// ====================================================================
	// Glyph objects (ftglyph.h)
	// ====================================================================

	/// A function used to create a new empty glyph image.  Note that the
	/// created FT_Glyph object must be released with FT_Done_Glyph.
	///
	/// @input:
	///   library ::
	///     A handle to the FreeType library object.
	///
	///   format ::
	///     The format of the glyph's image.
	///
	/// @output:
	///   aglyph ::
	///     A handle to the glyph object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_New_Glyph(FT_Library library, FT_Glyph_Format format, out FT_Glyph aglyph);

	/// A function used to extract a glyph image from a slot.  Note that the
	/// created FT_Glyph object must be released with FT_Done_Glyph.
	///
	/// @input:
	///   slot ::
	///     A handle to the source glyph slot.
	///
	/// @output:
	///   aglyph ::
	///     A handle to the glyph object.  `NULL` in case of error.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Because `*aglyph->advance.x` and `*aglyph->advance.y` are 16.16
	///   fixed-point numbers, `slot->advance.x` and `slot->advance.y` (which
	///   are in 26.6 fixed-point format) must be in the range ]-32768;32768[.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Glyph(FT_GlyphSlot slot, out FT_Glyph aglyph);

	/// A function used to copy a glyph image.  Note that the created
	/// FT_Glyph object must be released with FT_Done_Glyph.
	///
	/// @input:
	///   source ::
	///     A handle to the source glyph object.
	///
	/// @output:
	///   target ::
	///     A handle to the target glyph object.  `NULL` in case of error.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Glyph_Copy(FT_Glyph source, out FT_Glyph target);

	/// Transform a glyph image if its format is scalable.
	///
	/// @inout:
	///   glyph ::
	///     A handle to the target glyph object.
	///
	/// @input:
	///   matrix ::
	///     A pointer to a 2x2 matrix to apply.
	///
	///   delta ::
	///     A pointer to a 2d vector to apply.  Coordinates are expressed in
	///     1/64 of a pixel.
	///
	/// @return:
	///   FreeType error code (if not 0, the glyph format is not scalable).
	///
	/// @note:
	///   The 2x2 transformation matrix is also applied to the glyph's advance
	///   vector.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Glyph_Transform(FT_Glyph glyph, FT_Matrix* matrix, FT_Vector* delta);

	/// Return a glyph's 'control box'.  The control box encloses all the
	/// outline's points, including Bezier control points.  Though it
	/// coincides with the exact bounding box for most glyphs, it can be
	/// slightly larger in some situations (like when rotating an outline that
	/// contains Bezier outside arcs).
	///
	/// Computing the control box is very fast, while getting the bounding box
	/// can take much more time as it needs to walk over all segments and arcs
	/// in the outline.  To get the latter, you can use the 'ftbbox'
	/// component, which is dedicated to this single task.
	///
	/// @input:
	///   glyph ::
	///     A handle to the source glyph object.
	///
	///   mode ::
	///     The mode that indicates how to interpret the returned bounding box
	///     values.
	///
	/// @output:
	///   acbox ::
	///     The glyph coordinate bounding box.  Coordinates are expressed in
	///     1/64 of pixels if it is grid-fitted.
	///
	/// @note:
	///   Coordinates are relative to the glyph origin, using the y upwards
	///   convention.
	///
	///   If the glyph has been loaded with FT_LOAD_NO_SCALE, `bbox_mode` must
	///   be set to FT_GLYPH_BBOX_UNSCALED to get unscaled font units in 26.6
	///   pixel format.  The value FT_GLYPH_BBOX_SUBPIXELS is another name for
	///   this constant.
	///
	///   If the font is tricky and the glyph has been loaded with
	///   FT_LOAD_NO_SCALE, the resulting CBox is meaningless.  To get
	///   reasonable values for the CBox it is necessary to load the glyph at a
	///   large ppem value (so that the hinting instructions can properly shift
	///   and scale the subglyphs), then extracting the CBox, which can be
	///   eventually converted back to font units.
	///
	///   Note that the maximum coordinates are exclusive, which means that one
	///   can compute the width and height of the glyph image (be it in integer
	///   or 26.6 pixels) as:
	///
	///   ```
	///     width  = bbox.xMax - bbox.xMin;
	///     height = bbox.yMax - bbox.yMin;
	///   ```
	///
	///   Note also that for 26.6 coordinates, if `bbox_mode` is set to
	///   FT_GLYPH_BBOX_GRIDFIT, the coordinates will also be grid-fitted,
	///   which corresponds to:
	///
	///   ```
	///     bbox.xMin = FLOOR(bbox.xMin);
	///     bbox.yMin = FLOOR(bbox.yMin);
	///     bbox.xMax = CEILING(bbox.xMax);
	///     bbox.yMax = CEILING(bbox.yMax);
	///   ```
	///
	///   To get the bbox in pixel coordinates, set `bbox_mode` to
	///   FT_GLYPH_BBOX_TRUNCATE.
	///
	///   To get the bbox in grid-fitted pixel coordinates, set `bbox_mode` to
	///   FT_GLYPH_BBOX_PIXELS.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Glyph_Get_CBox(FT_Glyph glyph, FT_Glyph_BBox_Mode bbox_mode, out FT_BBox acbox);

	/// Convert a given glyph object to a bitmap glyph object.
	///
	/// @inout:
	///   the_glyph ::
	///     A pointer to a handle to the target glyph.
	///
	/// @input:
	///   render_mode ::
	///     An enumeration that describes how the data is rendered.
	///
	///   origin ::
	///     A pointer to a vector used to translate the glyph image before
	///     rendering.  Can be 0 (if no translation).  The origin is expressed
	///     in 26.6 pixels.
	///
	///   destroy ::
	///     A boolean that indicates that the original glyph image should be
	///     destroyed by this function.  It is never destroyed in case of error.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function does nothing if the glyph format isn't scalable.
	///
	///   The glyph image is translated with the `origin` vector before
	///   rendering.
	///
	///   The first parameter is a pointer to an FT_Glyph handle that will be
	///   _replaced_ by this function (with newly allocated data).  Typically,
	///   you would do something like the following (omitting error handling).
	///
	///   ```
	///     FT_Glyph        glyph;
	///     FT_BitmapGlyph  glyph_bitmap;
	///
	///
	///     // load glyph
	///     error = FT_Load_Char( face, glyph_index, FT_LOAD_DEFAULT );
	///
	///     // extract glyph image
	///     error = FT_Get_Glyph( face->glyph, &glyph );
	///
	///     // convert to a bitmap (default render mode + destroying old)
	///     if ( glyph->format != FT_GLYPH_FORMAT_BITMAP )
	///     {
	///       error = FT_Glyph_To_Bitmap( &glyph, FT_RENDER_MODE_NORMAL,
	///                                   0, 1 );
	///       if ( error ) // `glyph' unchanged
	///         ...
	///     }
	///
	///     // access bitmap content by typecasting
	///     glyph_bitmap = (FT_BitmapGlyph)glyph;
	///
	///     // do funny stuff with it, like blitting/drawing
	///     ...
	///
	///     // discard glyph image (bitmap or not)
	///     FT_Done_Glyph( glyph );
	///   ```
	///
	///   Here is another example, again without error handling.
	///
	///   ```
	///     FT_Glyph  glyphs[MAX_GLYPHS]
	///
	///
	///     ...
	///
	///     for ( idx = 0; i < MAX_GLYPHS; i++ )
	///       error = FT_Load_Glyph( face, idx, FT_LOAD_DEFAULT ) ||
	///               FT_Get_Glyph ( face->glyph, &glyphs[idx] );
	///
	///     ...
	///
	///     for ( idx = 0; i < MAX_GLYPHS; i++ )
	///     {
	///       FT_Glyph  bitmap = glyphs[idx];
	///
	///
	///       ...
	///
	///       // after this call, `bitmap' no longer points into
	///       // the `glyphs' array (and the old value isn't destroyed)
	///       FT_Glyph_To_Bitmap( &bitmap, FT_RENDER_MODE_MONO, 0, 0 );
	///
	///       ...
	///
	///       FT_Done_Glyph( bitmap );
	///     }
	///
	///     ...
	///
	///     for ( idx = 0; i < MAX_GLYPHS; i++ )
	///       FT_Done_Glyph( glyphs[idx] );
	///   ```
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Glyph_To_Bitmap(FT_Glyph* the_glyph, FT_Render_Mode render_mode, FT_Vector* origin, FT_Bool destroy);

	/// Destroy a given glyph.
	///
	/// @input:
	///   glyph ::
	///     A handle to the target glyph object.  Can be `NULL`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Done_Glyph(FT_Glyph glyph);

	/// Perform the matrix operation `b = a*b`.
	///
	/// @input:
	///   a ::
	///     A pointer to matrix `a`.
	///
	/// @inout:
	///   b ::
	///     A pointer to matrix `b`.
	///
	/// @note:
	///   The result is undefined if either `a` or `b` is zero.
	///
	///   Since the function uses wrap-around arithmetic, results become
	///   meaningless if the arguments are very large.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Matrix_Multiply(FT_Matrix* a, FT_Matrix* b);

	/// Invert a 2x2 matrix.  Return an error if it can't be inverted.
	///
	/// @inout:
	///   matrix ::
	///     A pointer to the target matrix.  Remains untouched in case of error.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Matrix_Invert(FT_Matrix* matrix);

	// ====================================================================
	// Bitmaps (ftbitmap.h)
	// ====================================================================

	/// Initialize a pointer to an FT_Bitmap structure.
	///
	/// @inout:
	///   abitmap ::
	///     A pointer to the bitmap structure.
	///
	/// @note:
	///   A deprecated name for the same function is `FT_Bitmap_New`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Bitmap_Init(FT_Bitmap* abitmap);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Bitmap_New(FT_Bitmap* abitmap);

	/// Copy a bitmap into another one.
	///
	/// @input:
	///   library ::
	///     A handle to a library object.
	///
	///   source ::
	///     A handle to the source bitmap.
	///
	/// @output:
	///   target ::
	///     A handle to the target bitmap.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   `source->buffer` and `target->buffer` must neither be equal nor
	///   overlap.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Bitmap_Copy(FT_Library library, FT_Bitmap* source, FT_Bitmap* target);

	/// Embolden a bitmap.  The new bitmap will be about `xStrength` pixels
	/// wider and `yStrength` pixels higher.  The left and bottom borders are
	/// kept unchanged.
	///
	/// @input:
	///   library ::
	///     A handle to a library object.
	///
	///   xStrength ::
	///     How strong the glyph is emboldened horizontally.  Expressed in 26.6
	///     pixel format.
	///
	///   yStrength ::
	///     How strong the glyph is emboldened vertically.  Expressed in 26.6
	///     pixel format.
	///
	/// @inout:
	///   bitmap ::
	///     A handle to the target bitmap.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The current implementation restricts `xStrength` to be less than or
	///   equal to 8 if bitmap is of pixel_mode FT_PIXEL_MODE_MONO.
	///
	///   If you want to embolden the bitmap owned by a FT_GlyphSlotRec, you
	///   should call FT_GlyphSlot_Own_Bitmap on the slot first.
	///
	///   Bitmaps in FT_PIXEL_MODE_GRAY2 and FT_PIXEL_MODE_GRAY@ format are
	///   converted to FT_PIXEL_MODE_GRAY format (i.e., 8bpp).
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Bitmap_Embolden(FT_Library library, FT_Bitmap* bitmap, FT_Pos xStrength, FT_Pos yStrength);

	/// Convert a bitmap object with depth 1bpp, 2bpp, 4bpp, 8bpp or 32bpp to
	/// a bitmap object with depth 8bpp, making the number of used bytes per
	/// line (a.k.a. the 'pitch') a multiple of `alignment`.
	///
	/// @input:
	///   library ::
	///     A handle to a library object.
	///
	///   source ::
	///     The source bitmap.
	///
	///   alignment ::
	///     The pitch of the bitmap is a multiple of this argument.  Common
	///     values are 1, 2, or 4.
	///
	/// @output:
	///   target ::
	///     The target bitmap.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   It is possible to call FT_Bitmap_Convert multiple times without
	///   calling FT_Bitmap_Done (the memory is simply reallocated).
	///
	///   Use FT_Bitmap_Done to finally remove the bitmap object.
	///
	///   The `library` argument is taken to have access to FreeType's memory
	///   handling functions.
	///
	///   `source->buffer` and `target->buffer` must neither be equal nor
	///   overlap.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Bitmap_Convert(FT_Library library, FT_Bitmap* source, FT_Bitmap* target, FT_Int alignment);

	/// Blend a bitmap onto another bitmap, using a given color.
	///
	/// @input:
	///   library ::
	///     A handle to a library object.
	///
	///   source ::
	///     The source bitmap, which can have any FT_Pixel_Mode format.
	///
	///   source_offset ::
	///     The offset vector to the upper left corner of the source bitmap in
	///     26.6 pixel format.  It should represent an integer offset; the
	///     function will set the lowest six bits to zero to enforce that.
	///
	///   color ::
	///     The color used to draw `source` onto `target`.
	///
	/// @inout:
	///   target ::
	///     A handle to an `FT_Bitmap` object.  It should be either initialized
	///     as empty with a call to FT_Bitmap_Init, or it should be of type
	///     FT_PIXEL_MODE_BGRA.
	///
	///   atarget_offset ::
	///     The offset vector to the upper left corner of the target bitmap in
	///     26.6 pixel format.  It should represent an integer offset; the
	///     function will set the lowest six bits to zero to enforce that.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function doesn't perform clipping.
	///
	///   The bitmap in `target` gets allocated or reallocated as needed; the
	///   vector `atarget_offset` is updated accordingly.
	///
	///   In case of allocation or reallocation, the bitmap's pitch is set to
	///   `4 * width`.  Both `source` and `target` must have the same bitmap
	///   flow (as indicated by the sign of the `pitch` field).
	///
	///   `source->buffer` and `target->buffer` must neither be equal nor
	///   overlap.
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Bitmap_Blend(FT_Library library, FT_Bitmap* source, FT_Vector source_offset, FT_Bitmap* target, FT_Vector* atarget_offset, FT_Color color);

	/// Make sure that a glyph slot owns `slot->bitmap`.
	///
	/// @input:
	///   slot ::
	///     The glyph slot.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function is to be used in combination with FT_Bitmap_Embolden.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_GlyphSlot_Own_Bitmap(FT_GlyphSlot slot);

	/// Destroy a bitmap object initialized with FT_Bitmap_Init.
	///
	/// @input:
	///   library ::
	///     A handle to a library object.
	///
	///   bitmap ::
	///     The bitmap object to be freed.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The `library` argument is taken to have access to FreeType's memory
	///   handling functions.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Bitmap_Done(FT_Library library, FT_Bitmap* bitmap);

	// ====================================================================
	// Outlines (ftoutln.h, ftbbox.h)
	// ====================================================================

	/// Walk over an outline's structure to decompose it into individual
	/// segments and Bezier arcs.  This function also emits 'move to'
	/// operations to indicate the start of new contours in the outline.
	///
	/// @input:
	///   outline ::
	///     A pointer to the source target.
	///
	///   func_interface ::
	///     A table of 'emitters', i.e., function pointers called during
	///     decomposition to indicate path operations.
	///
	/// @inout:
	///   user ::
	///     A typeless pointer that is passed to each emitter during the
	///     decomposition.  It can be used to store the state during the
	///     decomposition.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Degenerate contours, segments, and Bezier arcs may be reported.  In
	///   most cases, it is best to filter these out before using the outline
	///   for stroking or other path modification purposes (which may cause
	///   degenerate segments to become non-degenerate and visible, like when
	///   stroke caps are used or the path is otherwise outset).  Some glyph
	///   outlines may contain deliberate degenerate single points for mark
	///   attachement.
	///
	///   Similarly, the function returns success for an empty outline also
	///   (doing nothing, that is, not calling any emitter); if necessary, you
	///   should filter this out, too.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Decompose(FT_Outline* outline, FT_Outline_Funcs* func_interface, void* user);

	/// Create a new outline of a given size.
	///
	/// @input:
	///   library ::
	///     A handle to the library object from where the outline is allocated.
	///     Note however that the new outline will **not** necessarily be
	///     **freed**, when destroying the library, by FT_Done_FreeType.
	///
	///   numPoints ::
	///     The maximum number of points within the outline.  Must be smaller
	///     than or equal to 0xFFFF (65535).
	///
	///   numContours ::
	///     The maximum number of contours within the outline.  This value must
	///     be in the range 0 to `numPoints`.
	///
	/// @output:
	///   anoutline ::
	///     A handle to the new outline.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The reason why this function takes a `library` parameter is simply to
	///   use the library's memory allocator.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_New(FT_Library library, FT_UInt numPoints, FT_Int numContours, FT_Outline* anoutline);

	/// Destroy an outline created with FT_Outline_New.
	///
	/// @input:
	///   library ::
	///     A handle of the library object used to allocate the outline.
	///
	///   outline ::
	///     A pointer to the outline object to be discarded.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If the outline's 'owner' field is not set, only the outline descriptor
	///   will be released.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Done(FT_Library library, FT_Outline* outline);

	/// Check the contents of an outline descriptor.
	///
	/// @input:
	///   outline ::
	///     A handle to a source outline.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   An empty outline, or an outline with a single point only is also
	///   valid.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Check(FT_Outline* outline);

	/// Return an outline's 'control box'.  The control box encloses all the
	/// outline's points, including Bezier control points.  Though it
	/// coincides with the exact bounding box for most glyphs, it can be
	/// slightly larger in some situations (like when rotating an outline that
	/// contains Bezier outside arcs).
	///
	/// Computing the control box is very fast, while getting the bounding box
	/// can take much more time as it needs to walk over all segments and arcs
	/// in the outline.  To get the latter, you can use the 'ftbbox'
	/// component, which is dedicated to this single task.
	///
	/// @input:
	///   outline ::
	///     A pointer to the source outline descriptor.
	///
	/// @output:
	///   acbox ::
	///     The outline's control box.
	///
	/// @note:
	///   See FT_Glyph_Get_CBox for a discussion of tricky fonts.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Outline_Get_CBox(FT_Outline* outline, out FT_BBox acbox);

	/// Compute the exact bounding box of an outline.  This is slower than
	/// computing the control box.  However, it uses an advanced algorithm
	/// that returns _very_ quickly when the two boxes coincide.  Otherwise,
	/// the outline Bezier arcs are traversed to extract their extrema.
	///
	/// @input:
	///   outline ::
	///     A pointer to the source outline.
	///
	/// @output:
	///   abbox ::
	///     The outline's exact bounding box.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If the font is tricky and the glyph has been loaded with
	///   FT_LOAD_NO_SCALE, the resulting BBox is meaningless.  To get
	///   reasonable values for the BBox it is necessary to load the glyph at a
	///   large ppem value (so that the hinting instructions can properly shift
	///   and scale the subglyphs), then extracting the BBox, which can be
	///   eventually converted back to font units.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Get_BBox(FT_Outline* outline, out FT_BBox abbox);

	/// Apply a simple translation to the points of an outline.
	///
	/// @inout:
	///   outline ::
	///     A pointer to the target outline descriptor.
	///
	/// @input:
	///   xOffset ::
	///     The horizontal offset.
	///
	///   yOffset ::
	///     The vertical offset.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Outline_Translate(FT_Outline* outline, FT_Pos xOffset, FT_Pos yOffset);

	/// Copy an outline into another one.  Both objects must have the same
	/// sizes (number of points & number of contours) when this function is
	/// called.
	///
	/// @input:
	///   source ::
	///     A handle to the source outline.
	///
	/// @output:
	///   target ::
	///     A handle to the target outline.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Copy(FT_Outline* source, FT_Outline* target);

	/// Apply a simple 2x2 matrix to all of an outline's points.  Useful for
	/// applying rotations, slanting, flipping, etc.
	///
	/// @inout:
	///   outline ::
	///     A pointer to the target outline descriptor.
	///
	/// @input:
	///   matrix ::
	///     A pointer to the transformation matrix.
	///
	/// @note:
	///   You can use FT_Outline_Translate if you need to translate the
	///   outline's points.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Outline_Transform(FT_Outline* outline, FT_Matrix* matrix);

	/// Embolden an outline.  The new outline will be at most 4 times
	/// `strength` pixels wider and higher.  You may think of the left and
	/// bottom borders as unchanged.
	///
	/// Negative `strength` values to reduce the outline thickness are
	/// possible also.
	///
	/// @inout:
	///   outline ::
	///     A handle to the target outline.
	///
	/// @input:
	///   strength ::
	///     How strong the glyph is emboldened.  Expressed in 26.6 pixel format.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///     The used algorithm to increase or decrease the thickness of the glyph
	///     doesn't change the number of points; this means that certain
	///     situations like acute angles or intersections are sometimes handled
	///     incorrectly.
	///
	///     If you need 'better' metrics values you should call
	///     FT_Outline_Get_CBox or FT_Outline_Get_BBox.
	///
	///     To get meaningful results, font scaling values must be set with
	///     functions like FT_Set_Char_Size before calling FT_Render_Glyph.
	///
	///   example:
	///     ```
	///       FT_Load_Glyph( face, index, FT_LOAD_DEFAULT );
	///
	///       if ( face->glyph->format == FT_GLYPH_FORMAT_OUTLINE )
	///         FT_Outline_Embolden( &face->glyph->outline, strength );
	///     ```
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Embolden(FT_Outline* outline, FT_Pos strength);

	/// Embolden an outline.  The new outline will be `xstrength` pixels wider
	/// and `ystrength` pixels higher.  Otherwise, it is similar to
	/// FT_Outline_Embolden, which uses the same strength in both directions.
	///
	/// @since:
	///   2.4.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_EmboldenXY(FT_Outline* outline, FT_Pos xstrength, FT_Pos ystrength);

	/// Reverse the drawing direction of an outline.  This is used to ensure
	/// consistent fill conventions for mirrored glyphs.
	///
	/// @inout:
	///   outline ::
	///     A pointer to the target outline descriptor.
	///
	/// @note:
	///   This function toggles the bit flag FT_OUTLINE_REVERSE_FILL in the
	///   outline's `flags` field.
	///
	///   It shouldn't be used by a normal client application, unless it knows
	///   what it is doing.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Outline_Reverse(FT_Outline* outline);

	/// Render an outline within a bitmap.  The outline's image is simply
	/// OR-ed to the target bitmap.
	///
	/// @input:
	///   library ::
	///     A handle to a FreeType library object.
	///
	///   outline ::
	///     A pointer to the source outline descriptor.
	///
	/// @inout:
	///   abitmap ::
	///     A pointer to the target bitmap descriptor.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function does **not create** the bitmap, it only renders an
	///   outline image within the one you pass to it!  Consequently, the
	///   various fields in `abitmap` should be set accordingly.
	///
	///   It will use the raster corresponding to the default glyph format.
	///
	///   The value of the `num_grays` field in `abitmap` is ignored.  If you
	///   select the gray-level rasterizer, and you want less than 256 gray
	///   levels, you have to use FT_Outline_Render directly.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Get_Bitmap(FT_Library library, FT_Outline* outline, FT_Bitmap* abitmap);

	/// Render an outline within a bitmap using the current scan-convert.
	///
	/// @input:
	///   library ::
	///     A handle to a FreeType library object.
	///
	///   outline ::
	///     A pointer to the source outline descriptor.
	///
	/// @inout:
	///   params ::
	///     A pointer to an FT_Raster_Params structure used to describe the
	///     rendering operation.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This advanced function uses FT_Raster_Params as an argument.
	///   The field `params.source` will be set to `outline` before the scan
	///   converter is called, which means that the value you give to it is
	///   actually ignored.  Either `params.target` must point to preallocated
	///   bitmap, or FT_RASTER_FLAG_DIRECT must be set in `params.flags`
	///   allowing FreeType rasterizer to be used for direct composition,
	///   translucency, etc.  See FT_Raster_Params for more details.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Outline_Render(FT_Library library, FT_Outline* outline, FT_Raster_Params* @params);

	/// This function analyzes a glyph outline and tries to compute its fill
	/// orientation (see FT_Orientation).  This is done by integrating the
	/// total area covered by the outline. The positive integral corresponds
	/// to the clockwise orientation and FT_ORIENTATION_POSTSCRIPT is
	/// returned. The negative integral corresponds to the counter-clockwise
	/// orientation and FT_ORIENTATION_TRUETYPE is returned.
	///
	/// Note that this will return FT_ORIENTATION_TRUETYPE for empty
	/// outlines.
	///
	/// @input:
	///   outline ::
	///     A handle to the source outline.
	///
	/// @return:
	///   The orientation.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Orientation FT_Outline_Get_Orientation(FT_Outline* outline);

	// ====================================================================
	// Synthetic styles (ftsynth.h)
	// ====================================================================

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_GlyphSlot_Embolden(FT_GlyphSlot slot);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_GlyphSlot_AdjustWeight(FT_GlyphSlot slot, FT_Fixed xdelta, FT_Fixed ydelta);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_GlyphSlot_Oblique(FT_GlyphSlot slot);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_GlyphSlot_Slant(FT_GlyphSlot slot, FT_Fixed xslant, FT_Fixed yslant);

	// ====================================================================
	// Misc (ftgasp.h, ftfntfmt.h)
	// ====================================================================

	/// For a TrueType or OpenType font file, return the rasterizer behaviour
	/// flags from the font's 'gasp' table corresponding to a given character
	/// pixel size.
	///
	/// @input:
	///   face ::
	///     The source face handle.
	///
	///   ppem ::
	///     The vertical character pixel size.
	///
	/// @return:
	///   Bit flags (see FT_GASP_XXX), or FT_GASP_NO_TABLE if there is no
	///   'gasp' table in the face.
	///
	/// @note:
	///   If you want to use the MM functionality of OpenType variation fonts
	///   (i.e., using FT_Set_Var_Design_Coordinates and friends), call this
	///   function **after** setting an instance since the return values can
	///   change.
	///
	/// @since:
	///   2.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Gasp FT_Get_Gasp(FT_Face face, FT_UInt ppem);

	/// Return a string describing the format of a given face.  Possible values
	/// are 'TrueType', 'Type 1', 'BDF', 'PCF', 'Type 42', 'CID Type 1', 'CFF',
	/// 'PFR', and 'Windows FNT'.
	///
	/// The return value is suitable to be used as an X11 FONT_PROPERTY.
	///
	/// @input:
	///   face ::
	///     Input face handle.
	///
	/// @return:
	///   Font format string.  `NULL` in case of error.
	///
	/// @note:
	///   A deprecated name for the same function is `FT_Get_X11_Font_Format`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* FT_Get_Font_Format(FT_Face face);

	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern c_char* FT_Get_X11_Font_Format(FT_Face face);
}