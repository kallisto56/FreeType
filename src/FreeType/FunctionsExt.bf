namespace FreeType;


using System;
using System.Interop;


static
{
	// ====================================================================
	// Stroker (ftstroke.h)
	// ====================================================================

	/// Retrieve the FT_StrokerBorder value corresponding to the 'inside'
	/// borders of a given outline.
	///
	/// @input:
	///   outline ::
	///     The source outline handle.
	///
	/// @return:
	///   The border index.  FT_STROKER_BORDER_RIGHT for empty or invalid
	///   outlines.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_StrokerBorder FT_Outline_GetInsideBorder(FT_Outline* outline);

	/// Retrieve the FT_StrokerBorder value corresponding to the 'outside'
	/// borders of a given outline.
	///
	/// @input:
	///   outline ::
	///     The source outline handle.
	///
	/// @return:
	///   The border index.  FT_STROKER_BORDER_LEFT for empty or invalid
	///   outlines.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_StrokerBorder FT_Outline_GetOutsideBorder(FT_Outline* outline);

	/// Create a new stroker object.
	///
	/// @input:
	///   library ::
	///     FreeType library handle.
	///
	/// @output:
	///   astroker ::
	///     A new stroker object handle.  `NULL` in case of error.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_New(FT_Library library, out FT_Stroker astroker);

	/// Reset a stroker object's attributes.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   radius ::
	///     The border radius.
	///
	///   line_cap ::
	///     The line cap style.
	///
	///   line_join ::
	///     The line join style.
	///
	///   miter_limit ::
	///     The maximum reciprocal sine of half-angle at the miter join,
	///     expressed as 16.16 fixed-point value.
	///
	/// @note:
	///   The `radius` is expressed in the same units as the outline
	///   coordinates.
	///
	///   The `miter_limit` multiplied by the `radius` gives the maximum size
	///   of a miter spike, at which it is clipped for
	///   FT_STROKER_LINEJOIN_MITER_VARIABLE or replaced with a bevel join for
	///   FT_STROKER_LINEJOIN_MITER_FIXED.
	///
	///   This function calls FT_Stroker_Rewind automatically.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Stroker_Set(FT_Stroker stroker, FT_Fixed radius, FT_Stroker_LineCap line_cap, FT_Stroker_LineJoin line_join, FT_Fixed miter_limit);

	/// Reset a stroker object without changing its attributes.  You should
	/// call this function before beginning a new series of calls to
	/// FT_Stroker_BeginSubPath or FT_Stroker_EndSubPath.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Stroker_Rewind(FT_Stroker stroker);

	/// A convenience function used to parse a whole outline with the stroker.
	/// The resulting outline(s) can be retrieved later by functions like
	/// FT_Stroker_GetCounts and FT_Stroker_Export.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   outline ::
	///     The source outline.
	///
	///   opened ::
	///     A boolean.  If 1, the outline is treated as an open path instead of
	///     a closed one.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If `opened` is 0 (the default), the outline is treated as a closed
	///   path, and the stroker generates two distinct 'border' outlines.
	///
	///   If `opened` is 1, the outline is processed as an open path, and the
	///   stroker generates a single 'stroke' outline.
	///
	///   This function calls FT_Stroker_Rewind automatically.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_ParseOutline(FT_Stroker stroker, FT_Outline* outline, FT_Bool opened);

	/// Start a new sub-path in the stroker.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   to ::
	///     A pointer to the start vector.
	///
	///   open ::
	///     A boolean.  If 1, the sub-path is treated as an open one.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function is useful when you need to stroke a path that is not
	///   stored as an FT_Outline object.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_BeginSubPath(FT_Stroker stroker, FT_Vector* to, FT_Bool open);

	/// Close the current sub-path in the stroker.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   You should call this function after FT_Stroker_BeginSubPath.  If the
	///   subpath was not 'opened', this function 'draws' a single line segment
	///   to the start position when needed.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_EndSubPath(FT_Stroker stroker);

	/// 'Draw' a single line segment in the stroker's current sub-path, from
	/// the last position.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   to ::
	///     A pointer to the destination point.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   You should call this function between FT_Stroker_BeginSubPath and
	///   FT_Stroker_EndSubPath.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_LineTo(FT_Stroker stroker, FT_Vector* to);

	/// 'Draw' a single quadratic Bezier in the stroker's current sub-path,
	/// from the last position.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   control ::
	///     A pointer to a Bezier control point.
	///
	///   to ::
	///     A pointer to the destination point.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   You should call this function between FT_Stroker_BeginSubPath and
	///   FT_Stroker_EndSubPath.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_ConicTo(FT_Stroker stroker, FT_Vector* control, FT_Vector* to);

	/// 'Draw' a single cubic Bezier in the stroker's current sub-path, from
	/// the last position.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   control1 ::
	///     A pointer to the first Bezier control point.
	///
	///   control2 ::
	///     A pointer to second Bezier control point.
	///
	///   to ::
	///     A pointer to the destination point.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   You should call this function between FT_Stroker_BeginSubPath and
	///   FT_Stroker_EndSubPath.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_CubicTo(FT_Stroker stroker, FT_Vector* control1, FT_Vector* control2, FT_Vector* to);

	/// Call this function once you have finished parsing your paths with the
	/// stroker.  It returns the number of points and contours necessary to
	/// export one of the 'border' or 'stroke' outlines generated by the
	/// stroker.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   border ::
	///     The border index.
	///
	/// @output:
	///   anum_points ::
	///     The number of points.
	///
	///   anum_contours ::
	///     The number of contours.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   When an outline, or a sub-path, is 'closed', the stroker generates two
	///   independent 'border' outlines, named 'left' and 'right'.
	///
	///   When the outline, or a sub-path, is 'opened', the stroker merges the
	///   'border' outlines with caps.  The 'left' border receives all points,
	///   while the 'right' border becomes empty.
	///
	///   Use the function FT_Stroker_GetCounts instead if you want to retrieve
	///   the counts associated to both borders.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_GetBorderCounts(FT_Stroker stroker, FT_StrokerBorder border, out FT_UInt anum_points, out FT_UInt anum_contours);

	/// Call this function after FT_Stroker_GetBorderCounts to export the
	/// corresponding border to your own FT_Outline structure.
	///
	/// Note that this function appends the border points and contours to your
	/// outline, but does not try to resize its arrays.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   border ::
	///     The border index.
	///
	///   outline ::
	///     The target outline handle.
	///
	/// @note:
	///   Always call this function after FT_Stroker_GetBorderCounts to get
	///   sure that there is enough room in your FT_Outline object to receive
	///   all new data.
	///
	///   When an outline, or a sub-path, is 'closed', the stroker generates two
	///   independent 'border' outlines, named 'left' and 'right'.
	///
	///   When the outline, or a sub-path, is 'opened', the stroker merges the
	///   'border' outlines with caps.  The 'left' border receives all points,
	///   while the 'right' border becomes empty.
	///
	///   Use the function FT_Stroker_Export instead if you want to retrieve
	///   all borders at once.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Stroker_ExportBorder(FT_Stroker stroker, FT_StrokerBorder border, FT_Outline* outline);

	/// Call this function once you have finished parsing your paths with the
	/// stroker.  It returns the number of points and contours necessary to
	/// export all points/borders from the stroked outline/path.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	/// @output:
	///   anum_points ::
	///     The number of points.
	///
	///   anum_contours ::
	///     The number of contours.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Stroker_GetCounts(FT_Stroker stroker, out FT_UInt anum_points, out FT_UInt anum_contours);

	/// Call this function after FT_Stroker_GetBorderCounts to export all
	/// borders to your own FT_Outline structure.
	///
	/// Note that this function appends the border points and contours to your
	/// outline, but does not try to resize its arrays.
	///
	/// @input:
	///   stroker ::
	///     The target stroker handle.
	///
	///   outline ::
	///     The target outline handle.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Stroker_Export(FT_Stroker stroker, FT_Outline* outline);

	/// Destroy a stroker object.
	///
	/// @input:
	///   stroker ::
	///     A stroker handle.  Can be `NULL`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Stroker_Done(FT_Stroker stroker);

	/// Stroke a given outline glyph object with a given stroker.
	///
	/// @inout:
	///   pglyph ::
	///     Source glyph handle on input, new glyph handle on output.
	///
	/// @input:
	///   stroker ::
	///     A stroker handle.
	///
	///   destroy ::
	///     A Boolean.  If 1, the source glyph object is destroyed on success.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The source glyph is untouched in case of error.
	///
	///   Adding stroke may yield a significantly wider and taller glyph
	///   depending on how large of a radius was used to stroke the glyph.  You
	///   may need to manually adjust horizontal and vertical advance amounts to
	///   account for this added size.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Glyph_Stroke(FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool destroy);

	/// Stroke a given outline glyph object with a given stroker, but only
	/// return either its inside or outside border.
	///
	/// @inout:
	///   pglyph ::
	///     Source glyph handle on input, new glyph handle on output.
	///
	/// @input:
	///   stroker ::
	///     A stroker handle.
	///
	///   inside ::
	///     A Boolean.  If 1, return the inside border, otherwise the outside
	///     border.
	///
	///   destroy ::
	///     A Boolean.  If 1, the source glyph object is destroyed on success.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The source glyph is untouched in case of error.
	///
	///   Adding stroke may yield a significantly wider and taller glyph
	///   depending on how large of a radius was used to stroke the glyph.  You
	///   may need to manually adjust horizontal and vertical advance amounts to
	///   account for this added size.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Glyph_StrokeBorder(FT_Glyph* pglyph, FT_Stroker stroker, FT_Bool inside, FT_Bool destroy);

	// ====================================================================
	// LCD rendering (ftlcdfil.h)
	// ====================================================================

	/// This function is used to change filter applied to LCD decimated
	/// bitmaps, like the ones used when calling FT_Render_Glyph with
	/// FT_RENDER_MODE_LCD or FT_RENDER_MODE_LCD_V.
	///
	/// @input:
	///   library ::
	///     A handle to the target library instance.
	///
	///   filter ::
	///     The filter type.
	///
	///     You can use FT_LCD_FILTER_NONE here to disable this feature, or
	///     FT_LCD_FILTER_DEFAULT to use a default filter that should work well
	///     on most LCD screens.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Since 2.10.3 the LCD filtering is enabled with FT_LCD_FILTER_DEFAULT.
	///   It is no longer necessary to call this function explicitly except
	///   to choose a different filter or disable filtering altogether with
	///   FT_LCD_FILTER_NONE.
	///
	///   This function does nothing but returns `FT_Err_Unimplemented_Feature`
	///   if the configuration macro `FT_CONFIG_OPTION_SUBPIXEL_RENDERING` is
	///   not defined in your build of the library.
	///
	/// @since:
	///   2.3.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Library_SetLcdFilter(FT_Library library, FT_LcdFilter filter);

	/// This function can be used to enable LCD filter with custom weights,
	/// instead of using presets in FT_Library_SetLcdFilter.
	///
	/// @input:
	///   library ::
	///     A handle to the target library instance.
	///
	///   weights ::
	///     A pointer to an array; the function copies the first five bytes and
	///     uses them to specify the filter weights in 1/256 units.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   This function does nothing but returns `FT_Err_Unimplemented_Feature`
	///   if the configuration macro `FT_CONFIG_OPTION_SUBPIXEL_RENDERING` is
	///   not defined in your build of the library.
	///
	///   LCD filter weights can also be set per face using FT_Face_Properties
	///   with FT_PARAM_TAG_LCD_FILTER_WEIGHTS.
	///
	/// @since:
	///   2.4.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Library_SetLcdFilterWeights(FT_Library library, c_uchar* weights);

	/// This function can be used to modify default positions of color
	/// subpixels, which controls Harmony LCD rendering.
	///
	/// @input:
	///   library ::
	///     A handle to the target library instance.
	///
	///   sub ::
	///     A pointer to an array of 3 vectors in 26.6 fractional pixel format;
	///     the function modifies the default values, see the note below.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Subpixel geometry examples:
	///
	///   - {{-21, 0}, {0, 0}, {21, 0}} is the default, corresponding to 3 color
	///   stripes shifted by a third of a pixel. This could be an RGB panel.
	///
	///   - {{21, 0}, {0, 0}, {-21, 0}} looks the same as the default but can
	///   specify a BGR panel instead, while keeping the bitmap in the same
	///   RGB888 format.
	///
	///   - {{0, 21}, {0, 0}, {0, -21}} is the vertical RGB, but the bitmap
	///   stays RGB888 as a result.
	///
	///   - {{-11, 16}, {-11, -16}, {22, 0}} is a certain PenTile arrangement.
	///
	///   This function does nothing and returns `FT_Err_Unimplemented_Feature`
	///   in the context of ClearType-style subpixel rendering when
	///   `FT_CONFIG_OPTION_SUBPIXEL_RENDERING` is defined in your build of the
	///   library.
	///
	/// @since:
	///   2.10.0
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Library_SetLcdGeometry(FT_Library library, FT_Vector* sub);

	// ====================================================================
	// Modules, renderers, properties (ftmodapi.h)
	// ====================================================================

	/// Add a new module to a given library instance.
	///
	/// @inout:
	///   library ::
	///     A handle to the library object.
	///
	/// @input:
	///   clazz ::
	///     A pointer to class descriptor for the module.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   An error will be returned if a module already exists by that name, or
	///   if the module requires a version of FreeType that is too great.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Add_Module(FT_Library library, FT_Module_Class* clazz);

	/// Find a module by its name.
	///
	/// @input:
	///   library ::
	///     A handle to the library object.
	///
	///   module_name ::
	///     The module's name (as an ASCII string).
	///
	/// @return:
	///   A module handle.  0 if none was found.
	///
	/// @note:
	///   FreeType's internal modules aren't documented very well, and you
	///   should look up the source code for details.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Module FT_Get_Module(FT_Library library, c_char* module_name);

	/// Remove a given module from a library instance.
	///
	/// @inout:
	///   library ::
	///     A handle to a library object.
	///
	/// @input:
	///   module ::
	///     A handle to a module object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The module object is destroyed by the function in case of success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Remove_Module(FT_Library library, FT_Module module);

	/// Set a property for a given module.
	///
	/// @input:
	///   library ::
	///     A handle to the library the module is part of.
	///
	///   module_name ::
	///     The module name.
	///
	///   property_name ::
	///     The property name.  Properties are described in section
	///     properties.
	///
	///     Note that only a few modules have properties.
	///
	///   value ::
	///     A generic pointer to a variable or structure that gives the new
	///     value of the property.  The exact definition of `value` is
	///     dependent on the property; see section properties.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If `module_name` isn't a valid module name, or `property_name`
	///   doesn't specify a valid property, or if `value` doesn't represent a
	///   valid value for the given property, an error is returned.
	///
	///   The following example sets property 'bar' (a simple integer) in
	///   module 'foo' to value 1.
	///
	///   ```
	///     FT_UInt  bar;
	///
	///
	///     bar = 1;
	///     FT_Property_Set( library, "foo", "bar", &bar );
	///   ```
	///
	///   Note that the FreeType Cache sub-system doesn't recognize module
	///   property changes.  To avoid glyph lookup confusion within the cache
	///   you should call FTC_Manager_Reset to completely flush the cache if a
	///   module property gets changed after FTC_Manager_New has been called.
	///
	///   It is not possible to set properties of the FreeType Cache sub-system
	///   itself with FT_Property_Set; use FTC_Property_Set instead.
	///
	/// @since:
	///   2.4.11
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Property_Set(FT_Library library, FT_String* module_name, FT_String* property_name, void* value);

	/// Get a module's property value.
	///
	/// @input:
	///   library ::
	///     A handle to the library the module is part of.
	///
	///   module_name ::
	///     The module name.
	///
	///   property_name ::
	///     The property name.  Properties are described in section
	///     properties.
	///
	/// @inout:
	///   value ::
	///     A generic pointer to a variable or structure that gives the value
	///     of the property.  The exact definition of `value` is dependent on
	///     the property; see section properties.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If `module_name` isn't a valid module name, or `property_name`
	///   doesn't specify a valid property, or if `value` doesn't represent a
	///   valid value for the given property, an error is returned.
	///
	///   The following example gets property 'baz' (a range) in module 'foo'.
	///
	///   ```
	///     typedef  range_
	///     {
	///       FT_Int32  min;
	///       FT_Int32  max;
	///
	///     } range;
	///
	///     range  baz;
	///
	///
	///     FT_Property_Get( library, "foo", "baz", &baz );
	///   ```
	///
	///   It is not possible to retrieve properties of the FreeType Cache
	///   sub-system with FT_Property_Get; use FTC_Property_Get instead.
	///
	/// @since:
	///   2.4.11
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Property_Get(FT_Library library, FT_String* module_name, FT_String* property_name, void* value);

	/// If compilation option `FT_CONFIG_OPTION_ENVIRONMENT_PROPERTIES` is
	/// set, this function reads the `FREETYPE_PROPERTIES` environment
	/// variable to control driver properties.  See section properties for
	/// more.
	///
	/// If the compilation option is not set, this function does nothing.
	///
	/// `FREETYPE_PROPERTIES` has the following syntax form (broken here into
	/// multiple lines for better readability).
	///
	/// ```
	///   <optional whitespace>
	///   <module-name1> ':'
	///   <property-name1> '=' <property-value1>
	///   <whitespace>
	///   <module-name2> ':'
	///   <property-name2> '=' <property-value2>
	///   ...
	/// ```
	///
	/// Example:
	///
	/// ```
	///   FREETYPE_PROPERTIES=truetype:interpreter-version=35 \
	///                       cff:no-stem-darkening=0
	/// ```
	///
	/// @inout:
	///   library ::
	///     A handle to a new library object.
	///
	/// @since:
	///   2.8
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Set_Default_Properties(FT_Library library);

	/// This function is used to create a new FreeType library instance from a
	/// given memory object.  It is thus possible to use libraries with
	/// distinct memory allocators within the same program.  Note, however,
	/// that the used FT_Memory structure is expected to remain valid for the
	/// life of the FT_Library object.
	///
	/// Normally, you would call this function (followed by a call to
	/// FT_Add_Default_Modules or a series of calls to FT_Add_Module, and a
	/// call to FT_Set_Default_Properties) instead of FT_Init_FreeType to
	/// initialize the FreeType library.
	///
	/// Don't use FT_Done_FreeType but FT_Done_Library to destroy a library
	/// instance.
	///
	/// @input:
	///   memory ::
	///     A handle to the original memory object.
	///
	/// @output:
	///   alibrary ::
	///     A pointer to handle of a new library object.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   See the discussion of reference counters in the description of
	///   FT_Reference_Library.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_New_Library(FT_Memory memory, out FT_Library alibrary);

	/// Discard a given library object.  This closes all drivers and discards
	/// all resource objects.
	///
	/// @input:
	///   library ::
	///     A handle to the target library.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   See the discussion of reference counters in the description of
	///   FT_Reference_Library.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Done_Library(FT_Library library);

	/// Add the set of default drivers to a given library object.  This is
	/// only useful when you create a library object with FT_New_Library
	/// (usually to plug a custom memory manager).
	///
	/// @inout:
	///   library ::
	///     A handle to a new library object.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_Add_Default_Modules(FT_Library library);

	/// Return an FT_TrueTypeEngineType value to indicate which level of the
	/// TrueType virtual machine a given library instance supports.
	///
	/// @input:
	///   library ::
	///     A library instance.
	///
	/// @return:
	///   A value indicating which level is supported.
	///
	/// @since:
	///   2.2
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_TrueTypeEngineType FT_Get_TrueType_Engine_Type(FT_Library library);

	// ====================================================================
	// Variable fonts / multiple masters (ftmm.h)
	// ====================================================================

	/// Retrieve a variation descriptor of a given Adobe MM font.
	///
	/// This function can't be used with TrueType GX or OpenType Font
	/// Variations.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	/// @output:
	///   amaster ::
	///     The Adobe MM font's variation descriptor.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Multi_Master(FT_Face face, out FT_Multi_Master amaster);

	/// Retrieve a variation descriptor for a given font.
	///
	/// This function works with all supported variation formats.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	/// @output:
	///   amaster ::
	///     The variation descriptor.  Allocates a data structure, which the
	///     user must deallocate with a call to FT_Done_MM_Var after use.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_MM_Var(FT_Face face, out FT_MM_Var* amaster);

	/// Free the memory allocated by FT_Get_MM_Var.
	///
	/// @input:
	///   library ::
	///     A handle of the face's parent library object that was used in the
	///     call to FT_Get_MM_Var to create `amaster`.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Done_MM_Var(FT_Library library, FT_MM_Var* amaster);

	/// For Adobe MM fonts, choose an interpolated font design through design
	/// coordinates.
	///
	/// This function can't be used with TrueType GX or OpenType Font
	/// Variations.
	///
	/// @inout:
	///   face ::
	///     A handle to the source face.
	///
	/// @input:
	///   num_coords ::
	///     The number of available design coordinates.  If it is larger than
	///     the number of axes, ignore the excess values.  If it is smaller than
	///     the number of axes, use default values for the remaining axes.
	///
	///   coords ::
	///     An array of design coordinates.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   [Since 2.8.1] To reset all axes to the default values, call the
	///   function with `num_coords` set to zero and `coords` set to `NULL`.
	///
	///   [Since 2.9] If `num_coords` is larger than zero, this function sets
	///   the FT_FACE_FLAG_VARIATION bit in FT_Face's `face_flags` field
	///   (i.e., FT_IS_VARIATION returns true).  If `num_coords` is zero, this
	///   bit flag gets unset.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_MM_Design_Coordinates(FT_Face face, FT_UInt num_coords, FT_Long* coords);

	/// Choose an interpolated font design through design coordinates.
	///
	/// This function works with all supported variation formats.
	///
	/// @inout:
	///   face ::
	///     A handle to the source face.
	///
	/// @input:
	///   num_coords ::
	///     The number of available design coordinates.  If it is larger than
	///     the number of axes, ignore the excess values.  If it is smaller than
	///     the number of axes, use default values for the remaining axes.
	///
	///   coords ::
	///     An array of design coordinates.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The design coordinates are 16.16 fractional values for TrueType GX and
	///   OpenType Font Variations.  For Adobe MM fonts, the values are supposed
	///   to be whole numbers (i.e., the fractional part is zero).
	///
	///   [Since 2.8.1] To reset all axes to the default values, call the
	///   function with `num_coords` set to zero and `coords` set to `NULL`.
	///   [Since 2.9] 'Default values' means the currently selected named
	///   instance (or the base font if no named instance is selected).
	///
	///   [Since 2.9] If `num_coords` is larger than zero, this function sets
	///   the FT_FACE_FLAG_VARIATION bit in FT_Face's `face_flags` field
	///   (i.e., FT_IS_VARIATION returns true).  If `num_coords` is zero, this
	///   bit flag gets unset.
	///
	///   [Since 2.14] This function also sets the FT_FACE_FLAG_VARIATION bit
	///   in FT_Face's `face_flags` field (i.e., FT_IS_VARIATION returns
	///   true) if any of the provided coordinates is different from the face's
	///   default value for the corresponding axis, that is, the set up face is
	///   not at its default position.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_Var_Design_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

	/// Get the design coordinates of the currently selected interpolated
	/// font.
	///
	/// This function works with all supported variation formats.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	///   num_coords ::
	///     The number of design coordinates to retrieve.  If it is larger than
	///     the number of axes, set the excess values to 0.
	///
	/// @output:
	///   coords ::
	///     The design coordinates array, which must be allocated by the user.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The design coordinates are 16.16 fractional values for TrueType GX and
	///   OpenType Font Variations.  For Adobe MM fonts, the values are whole
	///   numbers (i.e., the fractional part is zero).
	///
	/// @since:
	///   2.7.1
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Var_Design_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

	/// Choose an interpolated font design through normalized coordinates.
	///
	/// This function works with all supported variation formats.
	///
	/// @inout:
	///   face ::
	///     A handle to the source face.
	///
	/// @input:
	///   num_coords ::
	///     The number of available design coordinates.  If it is larger than
	///     the number of axes, ignore the excess values.  If it is smaller than
	///     the number of axes, use default values for the remaining axes.
	///
	///   coords ::
	///     The normalized coordinates array.  Each element is a 16.16
	///     fractional value and must be between 0 and 1.0 for Adobe MM fonts,
	///     and between -1.0 and 1.0 for TrueType GX and OpenType Font
	///     Variations.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   [Since 2.8.1] To reset all axes to the default values, call the
	///   function with `num_coords` set to zero and `coords` set to `NULL`.
	///   [Since 2.9] 'Default values' means the currently selected named
	///   instance (or the base font if no named instance is selected).
	///
	///   [Since 2.9] If `num_coords` is larger than zero, this function sets
	///   the FT_FACE_FLAG_VARIATION bit in FT_Face's `face_flags` field
	///   (i.e., FT_IS_VARIATION returns true).  If `num_coords` is zero, this
	///   bit flag gets unset.
	///
	///   [Since 2.14] This function also sets the FT_FACE_FLAG_VARIATION bit
	///   in FT_Face's `face_flags` field (i.e., FT_IS_VARIATION returns
	///   true) if any of the provided coordinates is different from the face's
	///   default value for the corresponding axis, that is, the set up face is
	///   not at its default position.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_MM_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

	/// Get the normalized coordinates of the currently selected interpolated
	/// font.
	///
	/// This function works with all supported variation formats.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	///   num_coords ::
	///     The number of normalized coordinates to retrieve.  If it is larger
	///     than the number of axes, set the excess values to 0.5 for Adobe MM
	///     fonts, and to 0 for TrueType GX and OpenType Font Variations.
	///
	/// @output:
	///   coords ::
	///     The normalized coordinates array (as 16.16 fractional values), which
	///     must be allocated by the user.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @since:
	///   2.7.1
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_MM_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

	/// This is another name of FT_Set_MM_Blend_Coordinates.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_Var_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

	/// This is another name of FT_Get_MM_Blend_Coordinates.
	///
	/// @since:
	///   2.7.1
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Var_Blend_Coordinates(FT_Face face, FT_UInt num_coords, FT_Fixed* coords);

	/// For Adobe MM fonts, choose an interpolated font design by directly
	/// setting the weight vector.
	///
	/// This function can't be used with TrueType GX or OpenType Font
	/// Variations.
	///
	/// @inout:
	///   face ::
	///     A handle to the source face.
	///
	/// @input:
	///   len ::
	///     The length of the weight vector array.  If it is larger than the
	///     number of designs, the extra values are ignored.  If it is less than
	///     the number of designs, the remaining values are set to zero.
	///
	///   weightvector ::
	///     An array representing the weight vector.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Adobe MM fonts limit the number of designs, and thus the length of the
	///   weight vector, to 16 elements.
	///
	///   If `len` is larger than zero, this function sets the
	///   FT_FACE_FLAG_VARIATION bit in FT_Face's `face_flags` field (i.e.,
	///   FT_IS_VARIATION returns true).  If `len` is zero, this bit flag is
	///   unset and the weight vector array is reset to the default values.
	///
	///   The Adobe documentation also states that the values in the
	///   `WeightVector` array must total 1.0 +/- 0.001.  In practice this does
	///   not seem to be enforced, so is not enforced here, either.
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_MM_WeightVector(FT_Face face, FT_UInt len, FT_Fixed* weightvector);

	/// For Adobe MM fonts, retrieve the current weight vector of the font.
	///
	/// This function can't be used with TrueType GX or OpenType Font
	/// Variations.
	///
	/// @inout:
	///   face ::
	///     A handle to the source face.
	///
	///   len ::
	///     A pointer to the size of the array to be filled.  If the size of the
	///     array is less than the number of designs, `FT_Err_Invalid_Argument`
	///     is returned, and `len` is set to the required size (the number of
	///     designs).  If the size of the array is greater than the number of
	///     designs, the remaining entries are set to 0.  On successful
	///     completion, `len` is set to the number of designs (i.e., the number
	///     of values written to the array).
	///
	/// @output:
	///   weightvector ::
	///     An array to be filled; it must be allocated by the user.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   Adobe MM fonts limit the number of designs, and thus the length of the
	///   weight vector, to 16 elements.
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_MM_WeightVector(FT_Face face, FT_UInt* len, FT_Fixed* weightvector);

	/// Get the 'flags' field of an OpenType Variation Axis Record.
	///
	/// Not meaningful for Adobe MM fonts (`*flags` is always zero).
	///
	/// @input:
	///   master ::
	///     The variation descriptor.
	///
	///   axis_index ::
	///     The index of the requested variation axis.
	///
	/// @output:
	///   flags ::
	///     The 'flags' field.  See FT_VAR_AXIS_FLAG_XXX for possible values.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @since:
	///   2.8.1
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Var_Axis_Flags(FT_MM_Var* master, FT_UInt axis_index, out FT_Var_Axis_Flags flags);

	/// Set or change the current named instance.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	///   instance_index ::
	///     The index of the requested instance, starting with value 1.  If set
	///     to value 0, FreeType switches to font access without a named
	///     instance.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The function uses the value of `instance_index` to set bits 16-30 of
	///   the face's `face_index` field.  It also resets any variation applied
	///   to the font, and the FT_FACE_FLAG_VARIATION bit of the face's
	///   `face_flags` field gets reset to zero (i.e., FT_IS_VARIATION returns
	///   false).
	///
	///   For Adobe MM fonts, this function resets the current face to the
	///   default instance.
	///
	/// @since:
	///   2.9
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Set_Named_Instance(FT_Face face, FT_UInt instance_index);

	/// Retrieve the index of the default named instance, to be used with
	/// FT_Set_Named_Instance.
	///
	/// FreeType synthesizes a named instance for the default instance if the
	/// font does not contain such an entry.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	/// @output:
	///   instance_index ::
	///     The index of the default named instance.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   For Adobe MM fonts, this function always returns zero for
	///   `instance_index`.
	///
	/// @since:
	///   2.13.1
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Default_Named_Instance(FT_Face face, FT_UInt* instance_index);

	// ====================================================================
	// SFNT names and tables (ftsnames.h, tttables.h)
	// ====================================================================

	/// Retrieve the number of name strings in the SFNT 'name' table.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	/// @return:
	///   The number of strings in the 'name' table.
	///
	/// @note:
	///   This function always returns an error if the config macro
	///   `TT_CONFIG_OPTION_SFNT_NAMES` is not defined in `ftoption.h`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_UInt FT_Get_Sfnt_Name_Count(FT_Face face);

	/// Retrieve a string of the SFNT 'name' table for a given index.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	///   idx ::
	///     The index of the 'name' string.
	///
	/// @output:
	///   aname ::
	///     The indexed FT_SfntName structure.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The `string` array returned in the `aname` structure is not
	///   null-terminated.  Note that you don't have to deallocate `string` by
	///   yourself; FreeType takes care of it if you call FT_Done_Face.
	///
	///   Use FT_Get_Sfnt_Name_Count to get the total number of available
	///   'name' table entries, then do a loop until you get the right platform,
	///   encoding, and name ID.
	///
	///   'name' table format 1 entries can use language tags also, see
	///   FT_Get_Sfnt_LangTag.
	///
	///   This function always returns an error if the config macro
	///   `TT_CONFIG_OPTION_SFNT_NAMES` is not defined in `ftoption.h`.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Sfnt_Name(FT_Face face, FT_UInt idx, out FT_SfntName aname);

	/// Retrieve the language tag associated with a language ID of an SFNT
	/// 'name' table entry.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	///   langID ::
	///     The language ID, as returned by FT_Get_Sfnt_Name.  This is always a
	///     value larger than 0x8000.
	///
	/// @output:
	///   alangTag ::
	///     The language tag associated with the 'name' table entry's language
	///     ID.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The `string` array returned in the `alangTag` structure is not
	///   null-terminated.  Note that you don't have to deallocate `string` by
	///   yourself; FreeType takes care of it if you call FT_Done_Face.
	///
	///   Only 'name' table format 1 supports language tags.  For format 0
	///   tables, this function always returns FT_Err_Invalid_Table.  For
	///   invalid format 1 language ID values, FT_Err_Invalid_Argument is
	///   returned.
	///
	///   This function always returns an error if the config macro
	///   `TT_CONFIG_OPTION_SFNT_NAMES` is not defined in `ftoption.h`.
	///
	/// @since:
	///   2.8
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Get_Sfnt_LangTag(FT_Face face, FT_UInt langID, out FT_SfntLangTag alangTag);

	/// Return a pointer to a given SFNT table stored within a face.
	///
	/// @input:
	///   face ::
	///     A handle to the source.
	///
	///   tag ::
	///     The index of the SFNT table.
	///
	/// @return:
	///   A type-less pointer to the table.  This will be `NULL` in case of
	///   error, or if the corresponding table was not found **OR** loaded from
	///   the file.
	///
	///   Use a typecast according to `tag` to access the structure elements.
	///
	/// @note:
	///     The table is owned by the face object and disappears with it.
	///
	///     This function is only useful to access SFNT tables that are loaded by
	///     the sfnt, truetype, and opentype drivers.  See FT_Sfnt_Tag for a
	///     list.
	///
	///   example:
	///     Here is an example demonstrating access to the 'vhea' table.
	///
	///     ```
	///       TT_VertHeader*  vert_header;
	///
	///
	///       vert_header =
	///         (TT_VertHeader*)FT_Get_Sfnt_Table( face, FT_SFNT_VHEA );
	///     ```
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void* FT_Get_Sfnt_Table(FT_Face face, FT_Sfnt_Tag tag);

	/// Load any SFNT font table into client memory.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	///   tag ::
	///     The four-byte tag of the table to load.  Use value 0 if you want to
	///     access the whole font file.  Otherwise, you can use one of the
	///     definitions found in the FT_TRUETYPE_TAGS_H file, or forge a new
	///     one with FT_MAKE_TAG.
	///
	///     [Since 2.14] Use value 1 if you want to access the table directory
	///     of the (currently selected) font.
	///
	///   offset ::
	///     The starting offset in the table (or file if tag == 0).
	///
	/// @output:
	///   buffer ::
	///     The target buffer address.  The client must ensure that the memory
	///     array is big enough to hold the data.
	///
	/// @inout:
	///   length ::
	///     If the `length` parameter is `NULL`, try to load the whole table.
	///     Return an error code if it fails.
	///
	///     Else, if `*length` is 0, exit immediately while returning the
	///     table's (or file) full size in it.
	///
	///     Else the number of bytes to read from the table or file, from the
	///     starting offset.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If you need to determine the table's length you should first call this
	///   function with `*length` set to 0, as in the following example:
	///
	///   ```
	///     FT_ULong  length = 0;
	///
	///
	///     error = FT_Load_Sfnt_Table( face, tag, 0, NULL, &length );
	///     if ( error ) { ... table does not exist ... }
	///
	///     buffer = malloc( length );
	///     if ( buffer == NULL ) { ... not enough memory ... }
	///
	///     error = FT_Load_Sfnt_Table( face, tag, 0, buffer, &length );
	///     if ( error ) { ... could not load table ... }
	///   ```
	///
	///   Note that structures like TT_Header or TT_OS2 can't be used with
	///   this function; they are limited to FT_Get_Sfnt_Table.  Reason is that
	///   those structures depend on the processor architecture, with varying
	///   size (e.g. 32bit vs. 64bit) or order (big endian vs. little endian).
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Load_Sfnt_Table(FT_Face face, FT_ULong tag, FT_Long offset, FT_Byte* buffer, FT_ULong* length);

	/// Return information on an SFNT table.
	///
	/// @input:
	///   face ::
	///     A handle to the source face.
	///
	///   table_index ::
	///     The index of an SFNT table.  The function returns
	///     FT_Err_Table_Missing for an invalid value.
	///
	/// @inout:
	///   tag ::
	///     The name tag of the SFNT table.  If the value is `NULL`,
	///     `table_index` is ignored, and `length` returns the number of SFNT
	///     tables in the font.
	///
	/// @output:
	///   length ::
	///     The length of the SFNT table (or the number of SFNT tables,
	///     depending on `tag`).
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   While parsing fonts, FreeType handles SFNT tables with length zero as
	///   missing.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Sfnt_Table_Info(FT_Face face, FT_UInt table_index, FT_ULong* tag, FT_ULong* length);

	/// Return cmap language ID as specified in the OpenType standard.
	/// Definitions of language ID values are in file FT_TRUETYPE_IDS_H.
	///
	/// @input:
	///   charmap ::
	///     The target charmap.
	///
	/// @return:
	///   The language ID of `charmap`.  If `charmap` doesn't belong to an SFNT
	///   face, just return 0 as the default value.
	///
	///   For a format 14 cmap (to access Unicode IVS), the return value is
	///   0xFFFFFFFF.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_ULong FT_Get_CMap_Language_ID(FT_CharMap charmap);

	/// Return the format of an SFNT 'cmap' table.
	///
	/// @input:
	///   charmap ::
	///     The target charmap.
	///
	/// @return:
	///   The format of `charmap`.  If `charmap` doesn't belong to an SFNT face
	///   (including the synthetic Unicode charmap sometimes created by
	///   FreeType), return -1.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Long FT_Get_CMap_Format(FT_CharMap charmap);

	// ====================================================================
	// Color palettes and COLR v0 layers (ftcolor.h)
	// ====================================================================

	/// Retrieve the face's color palette data.
	///
	/// @input:
	///   face ::
	///     The source face handle.
	///
	/// @output:
	///   apalette ::
	///     A pointer to an FT_Palette_Data structure.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   All arrays in the returned FT_Palette_Data structure are read-only.
	///
	///   This function always returns an error if the config macro
	///   `TT_CONFIG_OPTION_COLOR_LAYERS` is not defined in `ftoption.h`.
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Palette_Data_Get(FT_Face face, out FT_Palette_Data apalette);

	///   This function has two purposes.
	///
	///   (1) It activates a palette for rendering color glyphs, and
	///
	///   (2) it retrieves all (unmodified) color entries of this palette.  This
	///       function returns a read-write array, which means that a calling
	///       application can modify the palette entries on demand.
	///
	/// A corollary of (2) is that calling the function, then modifying some
	/// values, then calling the function again with the same arguments resets
	/// all color entries to the original 'CPAL' values; all user modifications
	/// are lost.
	///
	/// @input:
	///   face ::
	///     The source face handle.
	///
	///   palette_index ::
	///     The palette index.
	///
	/// @output:
	///   apalette ::
	///     An array of color entries for a palette with index `palette_index`,
	///     having `num_palette_entries` elements (as found in the
	///     `FT_Palette_Data` structure).  If `apalette` is set to `NULL`, no
	///     array gets returned (and no color entries can be modified).
	///
	///     In case the font doesn't support color palettes, `NULL` is returned.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   The array pointed to by `apalette_entries` is owned and managed by
	///   FreeType.
	///
	///   This function always returns an error if the config macro
	///   `TT_CONFIG_OPTION_COLOR_LAYERS` is not defined in `ftoption.h`.
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Palette_Select(FT_Face face, FT_UShort palette_index, FT_Color** apalette);

	/// 'COLR' uses palette index 0xFFFF to indicate a 'text foreground
	/// color'.  This function sets this value.
	///
	/// @input:
	///   face ::
	///     The source face handle.
	///
	///   foreground_color ::
	///     An `FT_Color` structure to define the text foreground color.
	///
	/// @return:
	///   FreeType error code.  0 means success.
	///
	/// @note:
	///   If this function isn't called, the text foreground color is set to
	///   white opaque (BGRA value 0xFFFFFFFF) if
	///   FT_PALETTE_FOR_DARK_BACKGROUND is present for the current palette,
	///   and black opaque (BGRA value 0x000000FF) otherwise, including the case
	///   that no palette types are available in the 'CPAL' table.
	///
	///   This function always returns an error if the config macro
	///   `TT_CONFIG_OPTION_COLOR_LAYERS` is not defined in `ftoption.h`.
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_Palette_Set_Foreground_Color(FT_Face face, FT_Color foreground_color);

	/// This is an interface to the 'COLR' table in OpenType fonts to
	/// iteratively retrieve the colored glyph layers associated with the
	/// current glyph slot.
	///
	///   https://learn.microsoft.com/typography/opentype/spec/colr
	///
	/// The glyph layer data for a given glyph index, if present, provides an
	/// alternative, multi-color glyph representation: Instead of rendering
	/// the outline or bitmap with the given glyph index, glyphs with the
	/// indices and colors returned by this function are rendered layer by
	/// layer.
	///
	/// The returned elements are ordered in the z direction from bottom to
	/// top; the 'n'th element should be rendered with the associated palette
	/// color and blended on top of the already rendered layers (elements 0,
	/// 1, ..., n-1).
	///
	/// @input:
	///   face ::
	///     A handle to the parent face object.
	///
	///   base_glyph ::
	///     The glyph index the colored glyph layers are associated with.
	///
	/// @inout:
	///   iterator ::
	///     An FT_LayerIterator object.  For the first call you should set
	///     `iterator->p` to `NULL`.  For all following calls, simply use the
	///     same object again.
	///
	/// @output:
	///   aglyph_index ::
	///     The glyph index of the current layer.
	///
	///   acolor_index ::
	///     The color index into the font face's color palette of the current
	///     layer.  The value 0xFFFF is special; it doesn't reference a palette
	///     entry but indicates that the text foreground color should be used
	///     instead (to be set up by the application outside of FreeType).
	///
	///     The color palette can be retrieved with FT_Palette_Select.
	///
	/// @return:
	///   Value 1 if everything is OK.  If there are no more layers (or if there
	///   are no layers at all), value 0 gets returned.  In case of an error,
	///   value 0 is returned also.
	///
	/// @note:
	///     This function is necessary if you want to handle glyph layers by
	///     yourself.  In particular, functions that operate with FT_GlyphRec
	///     objects (like FT_Get_Glyph or FT_Glyph_To_Bitmap) don't have access
	///     to this information.
	///
	///     Note that FT_Render_Glyph is able to handle colored glyph layers
	///     automatically if the FT_LOAD_COLOR flag is passed to a previous call
	///     to FT_Load_Glyph.  [This is an experimental feature.]
	///
	///   example:
	///     ```
	///       FT_Color*         palette;
	///       FT_LayerIterator  iterator;
	///
	///       FT_Bool  have_layers;
	///       FT_UInt  layer_glyph_index;
	///       FT_UInt  layer_color_index;
	///
	///
	///       error = FT_Palette_Select( face, palette_index, &palette );
	///       if ( error )
	///         palette = NULL;
	///
	///       iterator.p  = NULL;
	///       have_layers = FT_Get_Color_Glyph_Layer( face,
	///                                               glyph_index,
	///                                               &layer_glyph_index,
	///                                               &layer_color_index,
	///                                               &iterator );
	///
	///       if ( palette && have_layers )
	///       {
	///         do
	///         {
	///           FT_Color  layer_color;
	///
	///
	///           if ( layer_color_index == 0xFFFF )
	///             layer_color = text_foreground_color;
	///           else
	///             layer_color = palette[layer_color_index];
	///
	///           // Load and render glyph `layer_glyph_index', then
	///           // blend resulting pixmap (using color `layer_color')
	///           // with previously created pixmaps.
	///
	///         } while ( FT_Get_Color_Glyph_Layer( face,
	///                                             glyph_index,
	///                                             &layer_glyph_index,
	///                                             &layer_color_index,
	///                                             &iterator ) );
	///       }
	///     ```
	///
	/// @since:
	///   2.10
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Bool FT_Get_Color_Glyph_Layer(FT_Face face, FT_UInt base_glyph, out FT_UInt aglyph_index, out FT_UInt acolor_index, FT_LayerIterator* iterator);

	// ====================================================================
	// Lists (ftlist.h)
	// ====================================================================

	/// Find the list node for a given listed object.
	///
	/// @input:
	///   list ::
	///     A pointer to the parent list.
	///   data ::
	///     The address of the listed object.
	///
	/// @return:
	///   List node.  `NULL` if it wasn't found.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_ListNode FT_List_Find(FT_List list, void* data);

	/// Append an element to the end of a list.
	///
	/// @inout:
	///   list ::
	///     A pointer to the parent list.
	///   node ::
	///     The node to append.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_List_Add(FT_List list, FT_ListNode node);

	/// Insert an element at the head of a list.
	///
	/// @inout:
	///   list ::
	///     A pointer to parent list.
	///   node ::
	///     The node to insert.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_List_Insert(FT_List list, FT_ListNode node);

	/// Remove a node from a list.  This function doesn't check whether the
	/// node is in the list!
	///
	/// @input:
	///   node ::
	///     The node to remove.
	///
	/// @inout:
	///   list ::
	///     A pointer to the parent list.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_List_Remove(FT_List list, FT_ListNode node);

	/// Move a node to the head/top of a list.  Used to maintain LRU lists.
	///
	/// @inout:
	///   list ::
	///     A pointer to the parent list.
	///   node ::
	///     The node to move.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_List_Up(FT_List list, FT_ListNode node);

	/// Parse a list and calls a given iterator function on each element.
	/// Note that parsing is stopped as soon as one of the iterator calls
	/// returns a non-zero value.
	///
	/// @input:
	///   list ::
	///     A handle to the list.
	///   iterator ::
	///     An iterator function, called on each node of the list.
	///   user ::
	///     A user-supplied field that is passed as the second argument to the
	///     iterator.
	///
	/// @return:
	///   The result (a FreeType error code) of the last iterator call.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern FT_Error FT_List_Iterate(FT_List list, FT_List_Iterator iterator, void* user);

	/// Destroy all elements in the list as well as the list itself.
	///
	/// @input:
	///   list ::
	///     A handle to the list.
	///
	///   destroy ::
	///     A list destructor that will be applied to each element of the list.
	///     Set this to `NULL` if not needed.
	///
	///   memory ::
	///     The current memory object that handles deallocation.
	///
	///   user ::
	///     A user-supplied field that is passed as the last argument to the
	///     destructor.
	///
	/// @note:
	///   This function expects that all nodes added by FT_List_Add or
	///   FT_List_Insert have been dynamically allocated.
	[CallingConvention(.Cdecl), CLink, LinkName(.C)]
	public static extern void FT_List_Finalize(FT_List list, FT_List_Destructor destroy, FT_Memory memory, void* user);
}