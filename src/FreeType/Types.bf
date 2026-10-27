namespace FreeType;


using System;
using System.Interop;


// ====================================================================
// Basic types
// ====================================================================

/// A typedef of unsigned char, used for simple booleans.  As usual,
/// values 1 and 0 represent true and false, respectively.
public typealias FT_Bool = c_uchar;

/// A signed 16-bit integer used to store a distance in original font
/// units.
public typealias FT_FWord = c_short;

/// An unsigned 16-bit integer used to store a distance in original font
/// units.
public typealias FT_UFWord = c_ushort;

/// A simple typedef for the _signed_ char type.
public typealias FT_Char = int8;    // signed char; there is no portable interop alias for it

/// A simple typedef for the _unsigned_ char type.
public typealias FT_Byte = c_uchar;

/// A typedef for constant memory areas.
public typealias FT_Bytes = FT_Byte*;

/// A typedef for 32-bit tags (as used in the SFNT format).
public typealias FT_Tag = uint32;

/// A simple typedef for the char type, usually used for strings.
public typealias FT_String = c_char;

/// A typedef for signed short.
public typealias FT_Short = c_short;

/// A typedef for unsigned short.
public typealias FT_UShort = c_ushort;

/// A typedef for the int type.
public typealias FT_Int = c_int;

/// A typedef for the unsigned int type.
public typealias FT_UInt = c_uint;

/// A typedef for signed long.
public typealias FT_Long = c_long;

/// A typedef for unsigned long.
public typealias FT_ULong = c_ulong;

public typealias FT_Int16 = int16;

public typealias FT_UInt16 = uint16;

public typealias FT_Int32 = int32;

public typealias FT_UInt32 = uint32;

public typealias FT_Int64 = int64;

public typealias FT_UInt64 = uint64;

/// This is equivalent to the ANSI C `size_t` type, i.e., the largest
/// _unsigned_ integer type used to express a file size or position, or a
/// memory block size.
public typealias FT_Offset = uint;    // size_t (pointer sized)

/// This is equivalent to the ANSI C `ptrdiff_t` type, i.e., the largest
/// _signed_ integer type used to express the distance between two
/// pointers.
public typealias FT_PtrDist = int;    // ptrdiff_t (pointer sized)

/// A simple typedef for a typeless pointer.
public typealias FT_Pointer = void*;

/// This type is used to store 16.16 fixed-point values, like scaling
/// values or matrix coefficients.
public typealias FT_Fixed = FT_Long;

/// The type FT_Pos is used to store vectorial coordinates.  Depending on
/// the context, these can represent distances in integer font units, or
/// 16.16, or 26.6 fixed-point pixel coordinates.
public typealias FT_Pos = FT_Long;

/// A signed 26.6 fixed-point type used for vectorial pixel coordinates.
public typealias FT_F26Dot6 = FT_Long;

/// A signed 2.14 fixed-point type used for unit vectors.
public typealias FT_F2Dot14 = c_short;

/// This type is used to model angle values in FreeType.  Note that the
/// angle is a 16.16 fixed-point value expressed in degrees.
public typealias FT_Angle = FT_Fixed;

// ====================================================================
// Opaque handles: typedef struct FT_LibraryRec_ *FT_Library;
// ====================================================================

public struct FT_LibraryRec_ { }
/// A handle to a FreeType library instance.  Each 'library' is completely
/// independent from the others; it is the 'root' of a set of objects like
/// fonts, faces, sizes, etc.
///
/// It also embeds a memory manager (see FT_Memory), as well as a
/// scan-line converter object (see FT_Raster).
///
/// [Since 2.5.6] In multi-threaded applications it is easiest to use one
/// `FT_Library` object per thread.  In case this is too cumbersome, a
/// single `FT_Library` object across threads is possible also, as long as
/// a mutex lock is used around FT_New_Face and FT_Done_Face.
///
/// @note:
///   Library objects are normally created by FT_Init_FreeType, and
///   destroyed with FT_Done_FreeType.  If you need reference-counting
///   (cf. FT_Reference_Library), use FT_New_Library and FT_Done_Library.
public typealias FT_Library = FT_LibraryRec_*;

public struct FT_ModuleRec_ { }
/// A handle to a given FreeType module object.  A module can be a font
/// driver, a renderer, or anything else that provides services to the
/// former.
public typealias FT_Module = FT_ModuleRec_*;

public struct FT_DriverRec_ { }
/// A handle to a given FreeType font driver object.  A font driver is a
/// module capable of creating faces from font files.
public typealias FT_Driver = FT_DriverRec_*;

public struct FT_RendererRec_ { }
/// A handle to a given FreeType renderer.  A renderer is a module in
/// charge of converting a glyph's outline image to a bitmap.  It supports
/// a single glyph image format, and one or more target surface depths.
public typealias FT_Renderer = FT_RendererRec_*;

public struct FT_Face_InternalRec_ { }
/// An opaque handle to an `FT_Face_InternalRec` structure that models the
/// private data of a given FT_Face object.
///
/// This structure might change between releases of FreeType 2 and is not
/// generally available to client applications.
public typealias FT_Face_Internal = FT_Face_InternalRec_*;

public struct FT_Size_InternalRec_ { }
/// An opaque handle to an `FT_Size_InternalRec` structure, used to model
/// private data of a given FT_Size object.
public typealias FT_Size_Internal = FT_Size_InternalRec_*;

public struct FT_Slot_InternalRec_ { }
/// An opaque handle to an `FT_Slot_InternalRec` structure, used to model
/// private data of a given FT_GlyphSlot object.
public typealias FT_Slot_Internal = FT_Slot_InternalRec_*;

public struct FT_SubGlyphRec_ { }
/// The subglyph structure is an internal object used to describe
/// subglyphs (for example, in the case of composites).
///
/// @note:
///   The subglyph implementation is not part of the high-level API, hence
///   the forward structure declaration.
///
///   You can however retrieve subglyph information with
///   FT_Get_SubGlyph_Info.
public typealias FT_SubGlyph = FT_SubGlyphRec_*;

public struct FT_StrokerRec_ { }
/// Opaque handle to a path stroker object.
public typealias FT_Stroker = FT_StrokerRec_*;

public struct FT_Glyph_Class { }

// ====================================================================
// Callback types
// ====================================================================

/// Describe a function used to destroy the 'client' data of any FreeType
/// object.  See the description of the FT_Generic type for details of
/// usage.
///
/// @input:
///   The address of the FreeType object that is under finalization.  Its
///   client data is accessed through its `generic` field.
public function void FT_Generic_Finalizer(void* @object);

/// A function used to allocate `size` bytes from `memory`.
///
/// @input:
///   memory ::
///     A handle to the source memory manager.
///
///   size ::
///     The size in bytes to allocate.
///
/// @return:
///   Address of new memory block.  0 in case of failure.
public function void* FT_Alloc_Func(FT_Memory memory, c_long size);

/// A function used to release a given block of memory.
///
/// @input:
///   memory ::
///     A handle to the source memory manager.
///
///   block ::
///     The address of the target memory block.
public function void FT_Free_Func(FT_Memory memory, void* block);

/// A function used to re-allocate a given block of memory.
///
/// @input:
///   memory ::
///     A handle to the source memory manager.
///
///   cur_size ::
///     The block's current size in bytes.
///
///   new_size ::
///     The block's requested new size.
///
///   block ::
///     The block's current address.
///
/// @return:
///   New block address.  0 in case of memory shortage.
///
/// @note:
///   In case of error, the old block must still be available.
public function void* FT_Realloc_Func(FT_Memory memory, c_long cur_size, c_long new_size, void* block);

/// A function used to seek and read data from a given input stream.
///
/// @input:
///   stream ::
///     A handle to the source stream.
///
///   offset ::
///     The offset from the start of the stream to seek to.
///
///   buffer ::
///     The address of the read buffer.
///
///   count ::
///     The number of bytes to read from the stream.
///
/// @return:
///   If count > 0, return the number of bytes effectively read by the
///   stream (after seeking to `offset`).  If count == 0, return the status
///   of the seek operation (non-zero indicates an error).
public function c_ulong FT_Stream_IoFunc(FT_Stream stream, c_ulong offset, c_uchar* buffer, c_ulong count);

/// A function used to close a given input stream.
///
/// @input:
///   stream ::
///     A handle to the target stream.
public function void FT_Stream_CloseFunc(FT_Stream stream);

/// A function pointer type used to describe the signature of a 'move to'
/// function during outline walking/decomposition.
///
/// A 'move to' is emitted to start a new contour in an outline.
///
/// @input:
///   to ::
///     A pointer to the target point of the 'move to'.
///
///   user ::
///     A typeless pointer, which is passed from the caller of the
///     decomposition function.
///
/// @return:
///   Error code.  0 means success.
public function c_int FT_Outline_MoveToFunc(FT_Vector* to, void* user);

/// A function pointer type used to describe the signature of a 'line to'
/// function during outline walking/decomposition.
///
/// A 'line to' is emitted to indicate a segment in the outline.
///
/// @input:
///   to ::
///     A pointer to the target point of the 'line to'.
///
///   user ::
///     A typeless pointer, which is passed from the caller of the
///     decomposition function.
///
/// @return:
///   Error code.  0 means success.
public function c_int FT_Outline_LineToFunc(FT_Vector* to, void* user);

/// A function pointer type used to describe the signature of a 'conic to'
/// function during outline walking or decomposition.
///
/// A 'conic to' is emitted to indicate a second-order Bezier arc in the
/// outline.
///
/// @input:
///   control ::
///     An intermediate control point between the last position and the new
///     target in `to`.
///
///   to ::
///     A pointer to the target end point of the conic arc.
///
///   user ::
///     A typeless pointer, which is passed from the caller of the
///     decomposition function.
///
/// @return:
///   Error code.  0 means success.
public function c_int FT_Outline_ConicToFunc(FT_Vector* control, FT_Vector* to, void* user);

/// A function pointer type used to describe the signature of a 'cubic to'
/// function during outline walking or decomposition.
///
/// A 'cubic to' is emitted to indicate a third-order Bezier arc.
///
/// @input:
///   control1 ::
///     A pointer to the first Bezier control point.
///
///   control2 ::
///     A pointer to the second Bezier control point.
///
///   to ::
///     A pointer to the target end point.
///
///   user ::
///     A typeless pointer, which is passed from the caller of the
///     decomposition function.
///
/// @return:
///   Error code.  0 means success.
public function c_int FT_Outline_CubicToFunc(FT_Vector* control1, FT_Vector* control2, FT_Vector* to, void* user);

/// A function used as a call-back by the anti-aliased renderer in order
/// to let client applications draw themselves the pixel spans on each
/// scan line.
///
/// @input:
///   y ::
///     The scanline's upward y coordinate.
///
///   count ::
///     The number of spans to draw on this scanline.
///
///   spans ::
///     A table of `count` spans to draw on the scanline.
///
///   user ::
///     User-supplied data that is passed to the callback.
///
/// @note:
///   This callback allows client applications to directly render the spans
///   of the anti-aliased bitmap to any kind of surfaces.
///
///   This can be used to write anti-aliased outlines directly to a given
///   background bitmap using alpha compositing.  It can also be used for
///   oversampling and averaging.
public function void FT_SpanFunc(c_int y, c_int count, FT_Span* spans, void* user);

/// A function used to initialize (not create) a new module object.
///
/// @input:
///   module ::
///     The module to initialize.
public function FT_Error FT_Module_Constructor(FT_Module module);

/// A function used to finalize (not destroy) a given module object.
///
/// @input:
///   module ::
///     The module to finalize.
public function void FT_Module_Destructor(FT_Module module);

/// A function used to query a given module for a specific interface.
///
/// @input:
///   module ::
///     The module to be searched.
///
///   name ::
///     The name of the interface in the module.
public function FT_Module_Interface FT_Module_Requester(FT_Module module, c_char* name);

/// An FT_List iterator function that is called during a list parse by
/// FT_List_Iterate.
///
/// @input:
///   node ::
///     The current iteration list node.
///
///   user ::
///     A typeless pointer passed to FT_List_Iterate.  Can be used to point
///     to the iteration's state.
public function FT_Error FT_List_Iterator(FT_ListNode node, void* user);

/// An FT_List iterator function that is called during a list
/// finalization by FT_List_Finalize to destroy all elements in a given
/// list.
///
/// @input:
///   system ::
///     The current system object.
///
///   data ::
///     The current object to destroy.
///
///   user ::
///     A typeless pointer passed to FT_List_Iterate.  It can be used to
///     point to the iteration's state.
public function void FT_List_Destructor(FT_Memory memory, void* data, void* user);

// ====================================================================
// Structs
// ====================================================================

/// A simple structure used to store a 2D vector unit vector.  Uses
/// FT_F2Dot14 types.
[CRepr]
public struct FT_UnitVector
{
	/// Horizontal coordinate.
	public FT_F2Dot14 x;

	/// Vertical coordinate.
	public FT_F2Dot14 y;
}

/// A simple structure used to store a 2x2 matrix.  Coefficients are in
/// 16.16 fixed-point format.  The computation performed is:
///
/// ```
///   x' = x*xx + y*xy
///   y' = x*yx + y*yy
/// ```
[CRepr]
public struct FT_Matrix
{
	/// Matrix coefficient.
	public FT_Fixed xx;

	/// Matrix coefficient.
	public FT_Fixed xy;

	/// Matrix coefficient.
	public FT_Fixed yx;

	/// Matrix coefficient.
	public FT_Fixed yy;
}

/// Read-only binary data represented as a pointer and a length.
[CRepr]
public struct FT_Data
{
	/// The data.
	public FT_Byte* pointer;

	/// The length of the data in bytes.
	public FT_UInt length;
}

/// Client applications often need to associate their own data to a
/// variety of FreeType core objects.  For example, a text layout API
/// might want to associate a glyph cache to a given size object.
///
/// Some FreeType object contains a `generic` field, of type `FT_Generic`,
/// which usage is left to client applications and font servers.
///
/// It can be used to store a pointer to client-specific data, as well as
/// the address of a 'finalizer' function, which will be called by
/// FreeType when the object is destroyed (for example, the previous
/// client example would put the address of the glyph cache destructor in
/// the `finalizer` field).
[CRepr]
public struct FT_Generic
{
	/// A typeless pointer to any client-specified data. This field is
	/// completely ignored by the FreeType library.
	public void* data;

	/// A pointer to a 'generic finalizer' function, which will be called
	/// when the object is destroyed.  If this field is set to `NULL`, no
	/// code will be called.
	public FT_Generic_Finalizer finalizer;
}

/// A structure used to hold a single list element.
[CRepr]
public struct FT_ListNodeRec_
{
	/// The previous element in the list.  `NULL` if first.
	public FT_ListNode prev;

	/// The next element in the list.  `NULL` if last.
	public FT_ListNode next;

	/// A typeless pointer to the listed object.
	public void* data;
}

/// A structure used to hold a simple doubly-linked list.  These are used
/// in many parts of FreeType.
[CRepr]
public struct FT_ListRec_
{
	/// The head (first element) of doubly-linked list.
	public FT_ListNode head;

	/// The tail (last element) of doubly-linked list.
	public FT_ListNode tail;
}

/// A structure used to describe a given memory manager to FreeType 2.
[CRepr]
public struct FT_MemoryRec_
{
	/// A generic typeless pointer for user data.
	public void* user;

	/// A pointer type to an allocation function.
	public FT_Alloc_Func alloc;

	/// A pointer type to an memory freeing function.
	public FT_Free_Func free;

	/// A pointer type to a reallocation function.
	public FT_Realloc_Func realloc;
}

/// A union type used to store either a long or a pointer.  This is used
/// to store a file descriptor or a `FILE*` in an input stream.
[CRepr, Union]
public struct FT_StreamDesc
{
	public c_long value;
	public void* pointer;
}

/// A structure used to describe an input stream.
///
/// @input:
///   base ::
///     For memory-based streams, this is the address of the first stream
///     byte in memory.  This field should always be set to `NULL` for
///     disk-based streams.
///
///   size ::
///     The stream size in bytes.
///
///     In case of compressed streams where the size is unknown before
///     actually doing the decompression, the value is set to 0x7FFFFFFF.
///     (Note that this size value can occur for normal streams also; it is
///     thus just a hint.)
///
///   pos ::
///     The current position within the stream.
///
///   descriptor ::
///     This field is a union that can hold an integer or a pointer.  It is
///     used by stream implementations to store file descriptors or `FILE*`
///     pointers.
///
///   pathname ::
///     This field is completely ignored by FreeType.  However, it is often
///     useful during debugging to use it to store the stream's filename
///     (where available).
///
///   read ::
///     The stream's input function.
///
///   close ::
///     The stream's close function.
///
///   memory ::
///     The memory manager to use to preload frames.  This is set internally
///     by FreeType and shouldn't be touched by stream implementations.
///
///   cursor ::
///     This field is set and used internally by FreeType when parsing
///     frames.  In particular, the `FT_GET_XXX` macros use this instead of
///     the `pos` field.
///
///   limit ::
///     This field is set and used internally by FreeType when parsing
///     frames.
[CRepr]
public struct FT_StreamRec_
{
	public c_uchar* @base;
	public c_ulong size;
	public c_ulong pos;
	public FT_StreamDesc descriptor;
	public FT_StreamDesc pathname;
	public FT_Stream_IoFunc read;
	public FT_Stream_CloseFunc close;
	public FT_Memory memory;
	public c_uchar* cursor;
	public c_uchar* limit;
}

/// A simple structure used to store a 2D vector; coordinates are of the
/// FT_Pos type.
[CRepr]
public struct FT_Vector
{
	/// The horizontal coordinate.
	public FT_Pos x;

	/// The vertical coordinate.
	public FT_Pos y;
}

/// A structure used to hold an outline's bounding box, i.e., the
/// coordinates of its extrema in the horizontal and vertical directions.
///
/// @note:
///   The bounding box is specified with the coordinates of the lower left
///   and the upper right corner.  In PostScript, those values are often
///   called (llx,lly) and (urx,ury), respectively.
///
///   If `yMin` is negative, this value gives the glyph's descender.
///   Otherwise, the glyph doesn't descend below the baseline.  Similarly,
///   if `ymax` is positive, this value gives the glyph's ascender.
///
///   `xMin` gives the horizontal distance from the glyph's origin to the
///   left edge of the glyph's bounding box.  If `xMin` is negative, the
///   glyph extends to the left of the origin.
[CRepr]
public struct FT_BBox
{
	/// The horizontal minimum (left-most).
	public FT_Pos xMin;

	/// The vertical minimum (bottom-most).
	public FT_Pos yMin;

	/// The horizontal maximum (right-most).
	public FT_Pos xMax;

	/// The vertical maximum (top-most).
	public FT_Pos yMax;
}

/// A structure used to describe a bitmap or pixmap to the raster.  Note
/// that we now manage pixmaps of various depths through the `pixel_mode`
/// field.
///
/// @note:
///   `width` and `rows` refer to the *physical* size of the bitmap, not the
///   *logical* one.  For example, if FT_Pixel_Mode is set to
///   `FT_PIXEL_MODE_LCD`, the logical width is a just a third of the
///   physical one.
///
///   An empty bitmap with a NULL `buffer` is valid, with `rows` and/or
///   `pitch` also set to 0.  Such bitmaps might be produced while rendering
///   empty or degenerate outlines.
[CRepr]
public struct FT_Bitmap
{
	/// The number of bitmap rows.
	public c_uint rows;

	/// The number of pixels in bitmap row.
	public c_uint width;

	/// The pitch's absolute value is the number of bytes taken by one
	/// bitmap row, including padding.  However, the pitch is positive when
	/// the bitmap has a 'down' flow, and negative when it has an 'up' flow.
	/// In all cases, the pitch is an offset to add to a bitmap pointer in
	/// order to go down one row.
	///
	/// Note that 'padding' means the alignment of a bitmap to a byte
	/// border, and FreeType functions normally align to the smallest
	/// possible integer value.
	///
	/// For the B/W rasterizer, `pitch` is always an even number.
	///
	/// To change the pitch of a bitmap (say, to make it a multiple of 4),
	/// use FT_Bitmap_Convert.  Alternatively, you might use callback
	/// functions to directly render to the application's surface; see the
	/// file `example2.cpp` in the tutorial for a demonstration.
	public c_int pitch;

	/// A typeless pointer to the bitmap buffer.  This value should be
	/// aligned on 32-bit boundaries in most cases.
	public c_uchar* buffer;

	/// This field is only used with FT_PIXEL_MODE_GRAY; it gives the
	/// number of gray levels used in the bitmap.
	public c_ushort num_grays;

	/// The pixel mode, i.e., how pixel bits are stored.  See FT_Pixel_Mode
	/// for possible values.
	public FT_Pixel_Mode pixel_mode;

	/// This field is intended for paletted pixel modes; it indicates how
	/// the palette is stored.  Not used currently.
	public c_uchar palette_mode;

	/// A typeless pointer to the bitmap palette; this field is intended for
	/// paletted pixel modes.  Not used currently.
	public void* palette;
}

/// This structure is used to describe an outline to the scan-line
/// converter.
///
/// @note:
///   The B/W rasterizer only checks bit 2 in the `tags` array for the first
///   point of each contour.  The drop-out mode as given with
///   FT_OUTLINE_IGNORE_DROPOUTS, FT_OUTLINE_SMART_DROPOUTS, and
///   FT_OUTLINE_INCLUDE_STUBS in `flags` is then overridden.
[CRepr]
public struct FT_Outline
{
	/// The number of contours in the outline.
	public c_ushort n_contours;

	/// The number of points in the outline.
	public c_ushort n_points;

	/// A pointer to an array of `n_points` FT_Vector elements, giving the
	/// outline's point coordinates.
	public FT_Vector* points;

	/// A pointer to an array of `n_points` chars, giving each outline
	/// point's type.
	///
	/// If bit 0 is unset, the point is 'off' the curve, i.e., a Bezier
	/// control point, while it is 'on' if set.
	///
	/// Bit 1 is meaningful for 'off' points only.  If set, it indicates a
	/// third-order Bezier arc control point; and a second-order control
	/// point if unset.
	///
	/// If bit 2 is set, bits 5-7 contain the drop-out mode (as defined in
	/// the OpenType specification; the value is the same as the argument to
	/// the 'SCANTYPE' instruction).
	///
	/// Bits 3 and 4 are reserved for internal purposes.
	public FT_Curve_Tag* tags;

	/// An array of `n_contours` shorts, giving the end point of each
	/// contour within the outline.  For example, the first contour is
	/// defined by the points '0' to `contours[0]`, the second one is
	/// defined by the points `contours[0]+1` to `contours[1]`, etc.
	public c_ushort* contours;

	/// A set of bit flags used to characterize the outline and give hints
	/// to the scan-converter and hinter on how to convert/grid-fit it.  See
	/// FT_OUTLINE_XXX.
	public FT_Outline_Flags flags;
}

/// A structure to hold various function pointers used during outline
/// decomposition in order to emit segments, conic, and cubic Beziers.
///
/// @note:
///   The point coordinates sent to the emitters are the transformed version
///   of the original coordinates (this is important for high accuracy
///   during scan-conversion).  The transformation is simple:
///
///   ```
///     x' = (x << shift) - delta
///     y' = (y << shift) - delta
///   ```
///
///   Set the values of `shift` and `delta` to 0 to get the original point
///   coordinates.
[CRepr]
public struct FT_Outline_Funcs
{
	/// The 'move to' emitter.
	public FT_Outline_MoveToFunc move_to;

	/// The segment emitter.
	public FT_Outline_LineToFunc line_to;

	/// The second-order Bezier arc emitter.
	public FT_Outline_ConicToFunc conic_to;

	/// The third-order Bezier arc emitter.
	public FT_Outline_CubicToFunc cubic_to;

	/// The shift that is applied to coordinates before they are sent to the
	/// emitter.
	public c_int shift;

	/// The delta that is applied to coordinates before they are sent to the
	/// emitter, but after the shift.
	public FT_Pos delta;
}

/// A structure to model a single span of consecutive pixels when
/// rendering an anti-aliased bitmap.
///
/// @note:
///   This structure is used by the span drawing callback type named
///   FT_SpanFunc that takes the y coordinate of the span as a parameter.
///
///   The anti-aliased rasterizer produces coverage values from 0 to 255,
///   that is, from completely transparent to completely opaque.
[CRepr]
public struct FT_Span
{
	/// The span's horizontal start position.
	public c_short x;

	/// The span's length in pixels.
	public c_ushort len;

	/// The span color/coverage, ranging from 0 (background) to 255
	/// (foreground).
	public c_uchar coverage;
}

/// A structure to hold the parameters used by a raster's render function,
/// passed as an argument to FT_Outline_Render.
///
/// @note:
///   The FT_RASTER_FLAG_AA bit flag must be set in the `flags` to
///   generate an anti-aliased glyph bitmap, otherwise a monochrome bitmap
///   is generated.  The `target` should have appropriate pixel mode and its
///   dimensions define the clipping region.
///
///   If both FT_RASTER_FLAG_AA and FT_RASTER_FLAG_DIRECT bit flags
///   are set in `flags`, the raster calls an FT_SpanFunc callback
///   `gray_spans` with `user` data as an argument ignoring `target`.  This
///   allows direct composition over a pre-existing user surface to perform
///   the span drawing and composition.  To optionally clip the spans, set
///   the FT_RASTER_FLAG_CLIP flag and `clip_box`.  The monochrome raster
///   does not support the direct mode.
///
///   The gray-level rasterizer always uses 256 gray levels.  If you want
///   fewer gray levels, you have to use FT_RASTER_FLAG_DIRECT and reduce
///   the levels in the callback function.
[CRepr]
public struct FT_Raster_Params
{
	/// The target bitmap.
	public FT_Bitmap* target;

	/// A pointer to the source glyph image (e.g., an FT_Outline).
	public void* source;

	/// The rendering flags.
	public FT_Raster_Flag flags;

	/// The gray span drawing callback.
	public FT_SpanFunc gray_spans;

	/// Unused.
	public FT_SpanFunc black_spans;

	/// Unused.
	public void* bit_test;

	/// Unused.
	public void* bit_set;

	/// User-supplied data that is passed to each drawing callback.
	public void* user;

	/// An optional span clipping box expressed in _integer_ pixels
	/// (not in 26.6 fixed-point units).
	public FT_BBox clip_box;
}

/// A structure to model the metrics of a single glyph.  The values are
/// expressed in 26.6 fractional pixel format; if the flag
/// FT_LOAD_NO_SCALE has been used while loading the glyph, values are
/// expressed in font units instead.
///
/// @note:
///   If not disabled with FT_LOAD_NO_HINTING, the values represent
///   dimensions of the hinted glyph (in case hinting is applicable).
///
///   Stroking a glyph with an outside border does not increase
///   `horiAdvance` or `vertAdvance`; you have to manually adjust these
///   values to account for the added width and height.
///
///   FreeType doesn't use the 'VORG' table data for CFF fonts because it
///   doesn't have an interface to quickly retrieve the glyph height.  The
///   y coordinate of the vertical origin can be simply computed as
///   `vertBearingY + height` after loading a glyph.
[CRepr]
public struct FT_Glyph_Metrics
{
	/// The glyph's width.
	public FT_Pos width;

	/// The glyph's height.
	public FT_Pos height;

	/// Left side bearing for horizontal layout.
	public FT_Pos horiBearingX;

	/// Top side bearing for horizontal layout.
	public FT_Pos horiBearingY;

	/// Advance width for horizontal layout.
	public FT_Pos horiAdvance;

	/// Left side bearing for vertical layout.
	public FT_Pos vertBearingX;

	/// Top side bearing for vertical layout.  Larger positive values mean
	/// further below the vertical glyph origin.
	public FT_Pos vertBearingY;

	/// Advance height for vertical layout.  Positive values mean the glyph
	/// has a positive advance downward.
	public FT_Pos vertAdvance;
}

/// This structure models the metrics of a bitmap strike (i.e., a set of
/// glyphs for a given point size and resolution) in a bitmap font.  It is
/// used for the `available_sizes` field of FT_Face.
///
/// @note:
///   Windows FNT:
///     The nominal size given in a FNT font is not reliable.  If the driver
///     finds it incorrect, it sets `size` to some calculated values, and
///     `x_ppem` and `y_ppem` to the pixel width and height given in the
///     font, respectively.
///
///   TrueType embedded bitmaps:
///     `size`, `width`, and `height` values are not contained in the bitmap
///     strike itself.  They are computed from the global font parameters.
[CRepr]
public struct FT_Bitmap_Size
{
	/// The vertical distance, in pixels, between two consecutive baselines.
	/// It is always positive.
	public FT_Short height;

	/// The average width, in pixels, of all glyphs in the strike.
	public FT_Short width;

	/// The nominal size of the strike in 26.6 fractional points.  This
	/// field is not very useful.
	public FT_Pos size;

	/// The horizontal ppem (nominal width) in 26.6 fractional pixels.
	public FT_Pos x_ppem;

	/// The vertical ppem (nominal height) in 26.6 fractional pixels.
	public FT_Pos y_ppem;
}

/// The base charmap structure.
[CRepr]
public struct FT_CharMapRec
{
	/// A handle to the parent face object.
	public FT_Face face;

	/// An FT_Encoding tag identifying the charmap.  Use this with
	/// FT_Select_Charmap.
	public FT_Encoding encoding;

	/// An ID number describing the platform for the following encoding ID.
	/// This comes directly from the TrueType specification and gets
	/// emulated for other formats.
	public FT_UShort platform_id;

	/// A platform-specific encoding number.  This also comes from the
	/// TrueType specification and gets emulated similarly.
	public FT_UShort encoding_id;
}

/// The size metrics structure gives the metrics of a size object.
///
/// @note:
///   The scaling values, if relevant, are determined first during a size
///   changing operation.  The remaining fields are then set by the driver.
///   For scalable formats, they are usually set to scaled values of the
///   corresponding fields in FT_FaceRec.  Some values like ascender or
///   descender are rounded for historical reasons; more precise values (for
///   outline fonts) can be derived by scaling the corresponding FT_FaceRec
///   values manually, with code similar to the following.
///
///   ```
///     scaled_ascender = FT_MulFix( face->ascender,
///                                  size_metrics->y_scale );
///   ```
///
///   Note that due to glyph hinting and the selected rendering mode these
///   values are usually not exact; consequently, they must be treated as
///   unreliable with an error margin of at least one pixel!
///
///   Indeed, the only way to get the exact metrics is to render _all_
///   glyphs.  As this would be a definite performance hit, it is up to
///   client applications to perform such computations.
///
///   The `FT_Size_Metrics` structure is valid for bitmap fonts also.
///
///
///   **TrueType fonts with native bytecode hinting**
///
///   All applications that handle TrueType fonts with native hinting must
///   be aware that TTFs expect different rounding of vertical font
///   dimensions.  The application has to cater for this, especially if it
///   wants to rely on a TTF's vertical data (for example, to properly align
///   box characters vertically).
///
///   Only the application knows _in advance_ that it is going to use native
///   hinting for TTFs!  FreeType, on the other hand, selects the hinting
///   mode not at the time of creating an FT_Size object but much later,
///   namely while calling FT_Load_Glyph.
///
///   Here is some pseudo code that illustrates a possible solution.
///
///   ```
///     font_format = FT_Get_Font_Format( face );
///
///     if ( !strcmp( font_format, "TrueType" ) &&
///          do_native_bytecode_hinting         )
///     {
///       ascender  = ROUND( FT_MulFix( face->ascender,
///                                     size_metrics->y_scale ) );
///       descender = ROUND( FT_MulFix( face->descender,
///                                     size_metrics->y_scale ) );
///     }
///     else
///     {
///       ascender  = size_metrics->ascender;
///       descender = size_metrics->descender;
///     }
///
///     height      = size_metrics->height;
///     max_advance = size_metrics->max_advance;
///   ```
[CRepr]
public struct FT_Size_Metrics
{
	/// The width of the scaled EM square in pixels, hence the term 'ppem'
	/// (pixels per EM).  It is also referred to as 'nominal width'.
	public FT_UShort x_ppem;

	/// The height of the scaled EM square in pixels, hence the term 'ppem'
	/// (pixels per EM).  It is also referred to as 'nominal height'.
	public FT_UShort y_ppem;

	/// A 16.16 fractional scaling value to convert horizontal metrics from
	/// font units to 26.6 fractional pixels.  Only relevant for scalable
	/// font formats.
	public FT_Fixed x_scale;

	/// A 16.16 fractional scaling value to convert vertical metrics from
	/// font units to 26.6 fractional pixels.  Only relevant for scalable
	/// font formats.
	public FT_Fixed y_scale;

	/// The ascender in 26.6 fractional pixels, rounded up to an integer
	/// value.  See FT_FaceRec for the details.
	public FT_Pos ascender;

	/// The descender in 26.6 fractional pixels, rounded down to an integer
	/// value.  See FT_FaceRec for the details.
	public FT_Pos descender;

	/// The height in 26.6 fractional pixels, rounded to an integer value.
	/// See FT_FaceRec for the details.
	public FT_Pos height;

	/// The maximum advance width in 26.6 fractional pixels, rounded to an
	/// integer value.  See FT_FaceRec for the details.
	public FT_Pos max_advance;
}

/// FreeType root size class structure.  A size object models a face
/// object at a given size.
[CRepr]
public struct FT_SizeRec
{
	/// Handle to the parent face object.
	public FT_Face face;

	/// A typeless pointer, unused by the FreeType library or any of its
	/// drivers.  It can be used by client applications to link their own
	/// data to each size object.
	public FT_Generic generic;

	/// Metrics for this size object.  This field is read-only.
	public FT_Size_Metrics metrics;

	public FT_Size_Internal @internal;
}

/// FreeType root glyph slot class structure.  A glyph slot is a container
/// where individual glyphs can be loaded, be they in outline or bitmap
/// format.
///
/// @note:
///   If FT_Load_Glyph is called with default flags (see FT_LOAD_DEFAULT)
///   the glyph image is loaded in the glyph slot in its native format
///   (e.g., an outline glyph for TrueType and Type 1 formats).  [Since 2.9]
///   The prospective bitmap metrics are calculated according to
///   FT_LOAD_TARGET_XXX and other flags even for the outline glyph, even
///   if FT_LOAD_RENDER is not set.
///
///   This image can later be converted into a bitmap by calling
///   FT_Render_Glyph.  This function searches the current renderer for the
///   native image's format, then invokes it.
///
///   The renderer is in charge of transforming the native image through the
///   slot's face transformation fields, then converting it into a bitmap
///   that is returned in `slot->bitmap`.
///
///   Note that `slot->bitmap_left` and `slot->bitmap_top` are also used to
///   specify the position of the bitmap relative to the current pen
///   position (e.g., coordinates (0,0) on the baseline).  Of course,
///   `slot->format` is also changed to FT_GLYPH_FORMAT_BITMAP.
///
///   Here is a small pseudo code fragment that shows how to use `lsb_delta`
///   and `rsb_delta` to do fractional positioning of glyphs:
///
///   ```
///     FT_GlyphSlot  slot     = face->glyph;
///     FT_Pos        origin_x = 0;
///
///
///     for all glyphs do
///       <load glyph with `FT_Load_Glyph'>
///
///       FT_Outline_Translate( slot->outline, origin_x & 63, 0 );
///
///       <save glyph image, or render glyph, or ...>
///
///       <compute kern between current and next glyph
///        and add it to `origin_x'>
///
///       origin_x += slot->advance.x;
///       origin_x += slot->lsb_delta - slot->rsb_delta;
///     endfor
///   ```
///
///   Here is another small pseudo code fragment that shows how to use
///   `lsb_delta` and `rsb_delta` to improve integer positioning of glyphs:
///
///   ```
///     FT_GlyphSlot  slot           = face->glyph;
///     FT_Pos        origin_x       = 0;
///     FT_Pos        prev_rsb_delta = 0;
///
///
///     for all glyphs do
///       <compute kern between current and previous glyph
///        and add it to `origin_x'>
///
///       <load glyph with `FT_Load_Glyph'>
///
///       if ( prev_rsb_delta - slot->lsb_delta >  32 )
///         origin_x -= 64;
///       else if ( prev_rsb_delta - slot->lsb_delta < -31 )
///         origin_x += 64;
///
///       prev_rsb_delta = slot->rsb_delta;
///
///       <save glyph image, or render glyph, or ...>
///
///       origin_x += slot->advance.x;
///     endfor
///   ```
///
///   If you use strong auto-hinting, you **must** apply these delta values!
///   Otherwise you will experience far too large inter-glyph spacing at
///   small rendering sizes in most cases.  Note that it doesn't harm to use
///   the above code for other hinting modes also, since the delta values
///   are zero then.
[CRepr]
public struct FT_GlyphSlotRec
{
	/// A handle to the FreeType library instance this slot belongs to.
	public FT_Library library;

	/// A handle to the parent face object.
	public FT_Face face;

	/// In some cases (like some font tools), several glyph slots per face
	/// object can be a good thing.  As this is rare, the glyph slots are
	/// listed through a direct, single-linked list using its `next` field.
	public FT_GlyphSlot next;

	/// [Since 2.10] The glyph index passed as an argument to FT_Load_Glyph
	/// while initializing the glyph slot.
	public FT_UInt glyph_index;

	/// A typeless pointer unused by the FreeType library or any of its
	/// drivers.  It can be used by client applications to link their own
	/// data to each glyph slot object.
	public FT_Generic generic;

	/// The metrics of the last loaded glyph in the slot.  The returned
	/// values depend on the last load flags (see the FT_Load_Glyph API
	/// function) and can be expressed either in 26.6 fractional pixels or
	/// font units.
	///
	/// Note that even when the glyph image is transformed, the metrics are
	/// not.
	public FT_Glyph_Metrics metrics;

	/// The advance width of the unhinted glyph.  Its value is expressed in
	/// 16.16 fractional pixels, unless FT_LOAD_LINEAR_DESIGN is set when
	/// loading the glyph.  This field can be important to perform correct
	/// WYSIWYG layout.  Only relevant for scalable glyphs.
	public FT_Fixed linearHoriAdvance;

	/// The advance height of the unhinted glyph.  Its value is expressed in
	/// 16.16 fractional pixels, unless FT_LOAD_LINEAR_DESIGN is set when
	/// loading the glyph.  This field can be important to perform correct
	/// WYSIWYG layout.  Only relevant for scalable glyphs.
	public FT_Fixed linearVertAdvance;

	/// This shorthand is, depending on FT_LOAD_IGNORE_TRANSFORM, the
	/// transformed (hinted) advance width for the glyph, in 26.6 fractional
	/// pixel format.  As specified with FT_LOAD_VERTICAL_LAYOUT, it uses
	/// either the `horiAdvance` or the `vertAdvance` value of `metrics`
	/// field.
	public FT_Vector advance;

	/// This field indicates the format of the image contained in the glyph
	/// slot.  Typically FT_GLYPH_FORMAT_BITMAP, FT_GLYPH_FORMAT_OUTLINE,
	/// or FT_GLYPH_FORMAT_COMPOSITE, but other values are possible.
	public FT_Glyph_Format format;

	/// This field is used as a bitmap descriptor.  Note that the address
	/// and content of the bitmap buffer can change between calls of
	/// FT_Load_Glyph and a few other functions.
	public FT_Bitmap bitmap;

	/// The bitmap's left bearing expressed in integer pixels.
	public FT_Int bitmap_left;

	/// The bitmap's top bearing expressed in integer pixels.  This is the
	/// distance from the baseline to the top-most glyph scanline, upwards
	/// y coordinates being **positive**.
	public FT_Int bitmap_top;

	/// The outline descriptor for the current glyph image if its format is
	/// FT_GLYPH_FORMAT_OUTLINE.  Once a glyph is loaded, `outline` can be
	/// transformed, distorted, emboldened, etc.  However, it must not be
	/// freed.
	///
	/// [Since 2.10.1] If FT_LOAD_NO_SCALE is set, outline coordinates of
	/// OpenType Font Variations for a selected instance are internally
	/// handled as 26.6 fractional font units but returned as (rounded)
	/// integers, as expected.  To get unrounded font units, don't use
	/// FT_LOAD_NO_SCALE but load the glyph with FT_LOAD_NO_HINTING and
	/// scale it, using the font's `units_per_EM` value as the ppem.
	public FT_Outline outline;

	/// The number of subglyphs in a composite glyph.  This field is only
	/// valid for the composite glyph format that should normally only be
	/// loaded with the FT_LOAD_NO_RECURSE flag.
	public FT_UInt num_subglyphs;

	/// An array of subglyph descriptors for composite glyphs.  There are
	/// `num_subglyphs` elements in there.  Currently internal to FreeType.
	public FT_SubGlyph subglyphs;

	/// Certain font drivers can also return the control data for a given
	/// glyph image (e.g.  TrueType bytecode, Type 1 charstrings, etc.).
	/// This field is a pointer to such data; it is currently internal to
	/// FreeType.
	public void* control_data;

	/// This is the length in bytes of the control data.  Currently internal
	/// to FreeType.
	public c_long control_len;

	/// The difference between hinted and unhinted left side bearing while
	/// auto-hinting is active.  Zero otherwise.
	public FT_Pos lsb_delta;

	/// The difference between hinted and unhinted right side bearing while
	/// auto-hinting is active.  Zero otherwise.
	public FT_Pos rsb_delta;

	/// Reserved.
	public void* other;

	public FT_Slot_Internal @internal;
}

/// FreeType root face class structure.  A face object models a typeface
/// in a font file.
///
/// @note:
///   Fields may be changed after a call to FT_Attach_File or
///   FT_Attach_Stream.
///
///   For OpenType Font Variations, the values of the following fields can
///   change after a call to FT_Set_Var_Design_Coordinates (and friends) if
///   the font contains an 'MVAR' table: `ascender`, `descender`, `height`,
///   `underline_position`, and `underline_thickness`.
///
///   Especially for TrueType fonts see also the documentation for
///   FT_Size_Metrics.
[CRepr]
public struct FT_FaceRec
{
	/// The number of faces in the font file.  Some font formats can have
	/// multiple faces in a single font file.
	public FT_Long num_faces;

	/// This field holds two different values.  Bits 0-15 are the index of
	/// the face in the font file (starting with value 0).  They are set
	/// to 0 if there is only one face in the font file.
	///
	/// [Since 2.6.1] Bits 16-30 are relevant to TrueType GX and OpenType
	/// Font Variations only, holding the named instance index for the
	/// current face index (starting with value 1; value 0 indicates font
	/// access without a named instance).  For non-variation fonts, bits
	/// 16-30 are ignored.  If we have the third named instance of face 4,
	/// say, `face_index` is set to 0x00030004.
	///
	/// Bit 31 is always zero (that is, `face_index` is always a positive
	/// value).
	///
	/// [Since 2.9] Changing the design coordinates with
	/// FT_Set_Var_Design_Coordinates or FT_Set_Var_Blend_Coordinates does
	/// not influence the named instance index value (only
	/// FT_Set_Named_Instance does that).
	public FT_Long face_index;

	/// A set of bit flags that give important information about the face;
	/// see FT_FACE_FLAG_XXX for the details.
	public FT_Face_Flags face_flags;

	/// The lower 16 bits contain a set of bit flags indicating the style of
	/// the face; see FT_STYLE_FLAG_XXX for the details.
	///
	/// [Since 2.6.1] Bits 16-30 hold the number of named instances
	/// available for the current face if we have a TrueType GX or OpenType
	/// Font Variation.  Bit 31 is always zero (that is, `style_flags` is
	/// always a positive value).  Note that a variation font has always at
	/// least one named instance, namely the default instance.
	public FT_Style_Flags style_flags;

	/// The number of glyphs in the face.  If the face is scalable and has
	/// sbits (see `num_fixed_sizes`), it is set to the number of outline
	/// glyphs.
	///
	/// For CID-keyed fonts (not in an SFNT wrapper) this value gives the
	/// highest CID used in the font.
	public FT_Long num_glyphs;

	/// The face's family name.  This is an ASCII string, usually in
	/// English, that describes the typeface's family (like 'Times New
	/// Roman', 'Bodoni', 'Garamond', etc).  This is a least common
	/// denominator used to list fonts.  Some formats (TrueType & OpenType)
	/// provide localized and Unicode versions of this string.  Applications
	/// should use the format-specific interface to access them.  Can be
	/// `NULL` (e.g., in fonts embedded in a PDF file).
	///
	/// In case the font doesn't provide a specific family name entry,
	/// FreeType tries to synthesize one, deriving it from other name
	/// entries.
	public FT_String* family_name;

	/// The face's style name.  This is an ASCII string, usually in English,
	/// that describes the typeface's style (like 'Italic', 'Bold',
	/// 'Condensed', etc).  Not all font formats provide a style name, so
	/// this field is optional, and can be set to `NULL`.  As for
	/// `family_name`, some formats provide localized and Unicode versions
	/// of this string.  Applications should use the format-specific
	/// interface to access them.
	public FT_String* style_name;

	/// The number of bitmap strikes in the face.  Even if the face is
	/// scalable, there might still be bitmap strikes, which are called
	/// 'sbits' in that case.
	public FT_Int num_fixed_sizes;

	/// An array of FT_Bitmap_Size for all bitmap strikes in the face.  It
	/// is set to `NULL` if there is no bitmap strike.
	///
	/// Note that FreeType tries to sanitize the strike data since they are
	/// sometimes sloppy or incorrect, but this can easily fail.
	public FT_Bitmap_Size* available_sizes;

	/// The number of charmaps in the face.
	public FT_Int num_charmaps;

	/// An array of the charmaps of the face.
	public FT_CharMap* charmaps;

	/// A field reserved for client uses.  See the FT_Generic type
	/// description.
	public FT_Generic generic;

	/// The font bounding box.  Coordinates are expressed in font units (see
	/// `units_per_EM`).  The box is large enough to contain any glyph from
	/// the font.  Thus, `bbox.yMax` can be seen as the 'maximum ascender',
	/// and `bbox.yMin` as the 'minimum descender'.  Only relevant for
	/// scalable formats.
	///
	/// Note that the bounding box might be off by (at least) one pixel for
	/// hinted fonts.  See FT_Size_Metrics for further discussion.
	///
	/// Note that the bounding box does not vary in OpenType Font Variations
	/// and should only be used in relation to the default instance.
	public FT_BBox bbox;

	/// The number of font units per EM square for this face.  This is
	/// typically 2048 for TrueType fonts, and 1000 for Type 1 fonts.  Only
	/// relevant for scalable formats.
	public FT_UShort units_per_EM;

	/// The typographic ascender of the face, expressed in font units.  For
	/// font formats not having this information, it is set to `bbox.yMax`.
	/// Only relevant for scalable formats.
	public FT_Short ascender;

	/// The typographic descender of the face, expressed in font units.  For
	/// font formats not having this information, it is set to `bbox.yMin`.
	/// Note that this field is negative for values below the baseline.
	/// Only relevant for scalable formats.
	public FT_Short descender;

	/// This value is the vertical distance between two consecutive
	/// baselines, expressed in font units.  It is always positive.  Only
	/// relevant for scalable formats.
	///
	/// If you want the global glyph height, use `ascender - descender`.
	public FT_Short height;

	/// The maximum advance width, in font units, for all glyphs in this
	/// face.  This can be used to make word wrapping computations faster.
	/// Only relevant for scalable formats.
	public FT_Short max_advance_width;

	/// The maximum advance height, in font units, for all glyphs in this
	/// face.  This is only relevant for vertical layouts, and is set to
	/// `height` for fonts that do not provide vertical metrics.  Only
	/// relevant for scalable formats.
	public FT_Short max_advance_height;

	/// The position, in font units, of the underline line for this face.
	/// It is the center of the underlining stem.  Only relevant for
	/// scalable formats.
	public FT_Short underline_position;

	/// The thickness, in font units, of the underline for this face.  Only
	/// relevant for scalable formats.
	public FT_Short underline_thickness;

	/// The face's associated glyph slot(s).
	public FT_GlyphSlot glyph;

	/// The current active size for this face.
	public FT_Size size;

	/// The current active charmap for this face.
	public FT_CharMap charmap;

	public FT_Driver driver;
	public FT_Memory memory;
	public FT_Stream stream;
	public FT_ListRec sizes_list;
	public FT_Generic autohint;
	public void* extensions;
	public FT_Face_Internal @internal;
}

/// A structure to model a size request.
///
/// @note:
///   If `width` is zero, the horizontal scaling value is set equal to the
///   vertical scaling value, and vice versa.
///
///   If `type` is `FT_SIZE_REQUEST_TYPE_SCALES`, `width` and `height` are
///   interpreted directly as 16.16 fractional scaling values, without any
///   further modification, and both `horiResolution` and `vertResolution`
///   are ignored.
[CRepr]
public struct FT_Size_RequestRec
{
	/// See FT_Size_Request_Type.
	public FT_Size_Request_Type type;

	/// The desired width, given as a 26.6 fractional point value (with 72pt
	/// = 1in).
	public FT_Long width;

	/// The desired height, given as a 26.6 fractional point value (with
	/// 72pt = 1in).
	public FT_Long height;

	/// The horizontal resolution (dpi, i.e., pixels per inch).  If set to
	/// zero, `width` is treated as a 26.6 fractional **pixel** value, which
	/// gets internally rounded to an integer.
	public FT_UInt horiResolution;

	/// The vertical resolution (dpi, i.e., pixels per inch).  If set to
	/// zero, `height` is treated as a 26.6 fractional **pixel** value,
	/// which gets internally rounded to an integer.
	public FT_UInt vertResolution;
}

/// A simple structure to pass more or less generic parameters to
/// FT_Open_Face and FT_Face_Properties.
///
/// @note:
///   The ID and function of parameters are driver-specific.  See section
///   parameter_tags for more information.
[CRepr]
public struct FT_Parameter
{
	/// A four-byte identification tag.
	public FT_Param_Tag tag;

	/// A pointer to the parameter data.
	public FT_Pointer data;
}

/// A structure to indicate how to open a new font file or stream.  A
/// pointer to such a structure can be used as a parameter for the
/// functions FT_Open_Face and FT_Attach_Stream.
///
/// @note:
///   The stream type is determined by the contents of `flags`:
///
///   If the FT_OPEN_MEMORY bit is set, assume that this is a memory file
///   of `memory_size` bytes, located at `memory_address`.  The data are not
///   copied, and the client is responsible for releasing and destroying
///   them _after_ the corresponding call to FT_Done_Face.
///
///   Otherwise, if the FT_OPEN_STREAM bit is set, assume that a custom
///   input stream `stream` is used.
///
///   Otherwise, if the FT_OPEN_PATHNAME bit is set, assume that this is a
///   normal file and use `pathname` to open it.
///
///   If none of the above bits are set or if multiple are set at the same
///   time, the flags are invalid and FT_Open_Face fails.
///
///   If the FT_OPEN_DRIVER bit is set, FT_Open_Face only tries to open
///   the file with the driver whose handler is in `driver`.
///
///   If the FT_OPEN_PARAMS bit is set, the parameters given by
///   `num_params` and `params` is used.  They are ignored otherwise.
///
///   Ideally, both the `pathname` and `params` fields should be tagged as
///   'const'; this is missing for API backward compatibility.  In other
///   words, applications should treat them as read-only.
[CRepr]
public struct FT_Open_Args
{
	/// A set of bit flags indicating how to use the structure.
	public FT_Open_Flags flags;

	/// The first byte of the file in memory.
	public FT_Byte* memory_base;

	/// The size in bytes of the file in memory.
	public FT_Long memory_size;

	/// A pointer to an 8-bit file pathname, which must be a C string (i.e.,
	/// no null bytes except at the very end).  The pointer is not owned by
	/// FreeType.
	public FT_String* pathname;

	/// A handle to a source stream object.
	public FT_Stream stream;

	/// This field is exclusively used by FT_Open_Face; it simply specifies
	/// the font driver to use for opening the face.  If set to `NULL`,
	/// FreeType tries to load the face with each one of the drivers in its
	/// list.
	public FT_Module driver;

	/// The number of extra parameters.
	public FT_Int num_params;

	/// Extra parameters passed to the font driver when opening a new face.
	public FT_Parameter* @params;
}

/// The root glyph structure contains a given glyph image plus its advance
/// width in 16.16 fixed-point format.
[CRepr]
public struct FT_GlyphRec
{
	/// A handle to the FreeType library object.
	public FT_Library library;

	/// A pointer to the glyph's class.  Private.
	public FT_Glyph_Class* clazz;

	/// The format of the glyph's image.
	public FT_Glyph_Format format;

	/// A 16.16 vector that gives the glyph's advance width.
	public FT_Vector advance;
}

/// A structure used for bitmap glyph images.  This really is a
/// 'sub-class' of FT_GlyphRec.
///
/// @note:
///   You can typecast an FT_Glyph to FT_BitmapGlyph if you have
///   `glyph->format == FT_GLYPH_FORMAT_BITMAP`.  This lets you access the
///   bitmap's contents easily.
///
///   The corresponding pixel buffer is always owned by FT_BitmapGlyph and
///   is thus created and destroyed with it.
[CRepr]
public struct FT_BitmapGlyphRec
{
	/// The root fields of FT_Glyph.
	public FT_GlyphRec root;

	/// The left-side bearing, i.e., the horizontal distance from the
	/// current pen position to the left border of the glyph bitmap.
	public FT_Int left;

	/// The top-side bearing, i.e., the vertical distance from the current
	/// pen position to the top border of the glyph bitmap.  This distance
	/// is positive for upwards y!
	public FT_Int top;

	/// A descriptor for the bitmap.
	public FT_Bitmap bitmap;
}

/// A structure used for outline (vectorial) glyph images.  This really is
/// a 'sub-class' of FT_GlyphRec.
///
/// @note:
///   You can typecast an FT_Glyph to FT_OutlineGlyph if you have
///   `glyph->format == FT_GLYPH_FORMAT_OUTLINE`.  This lets you access the
///   outline's content easily.
///
///   As the outline is extracted from a glyph slot, its coordinates are
///   expressed normally in 26.6 pixels, unless the flag FT_LOAD_NO_SCALE
///   was used in FT_Load_Glyph or FT_Load_Char.
///
///   The outline's tables are always owned by the object and are destroyed
///   with it.
[CRepr]
public struct FT_OutlineGlyphRec
{
	/// The root FT_Glyph fields.
	public FT_GlyphRec root;

	/// A descriptor for the outline.
	public FT_Outline outline;
}

/// A structure used for OT-SVG glyphs.  This is a 'sub-class' of
/// FT_GlyphRec.
///
/// @note:
///   The Glyph Management API requires FT_Glyph or its 'sub-class' to have
///   all the information needed to completely define the glyph's rendering.
///   Outline-based glyphs can directly apply transformations to the outline
///   but this is not possible for an SVG document that hasn't been parsed.
///   Therefore, the transformation is stored along with the document.  In
///   the absence of a 'ViewBox' or 'Width'/'Height' attribute, the size of
///   the ViewPort should be assumed to be 'units_per_EM'.
[CRepr]
public struct FT_SvgGlyphRec
{
	/// The root FT_GlyphRec fields.
	public FT_GlyphRec root;

	/// A pointer to the SVG document.
	public FT_Byte* svg_document;

	/// The length of `svg_document`.
	public FT_ULong svg_document_length;

	/// The index of the glyph to be rendered.
	public FT_UInt glyph_index;

	/// A metrics object storing the size information.
	public FT_Size_Metrics metrics;

	/// The size of the EM square.
	public FT_UShort units_per_EM;

	/// The first glyph ID in the glyph range covered by this document.
	public FT_UShort start_glyph_id;

	/// The last glyph ID in the glyph range covered by this document.
	public FT_UShort end_glyph_id;

	/// A 2x2 transformation matrix to apply to the glyph while rendering
	/// it.
	public FT_Matrix transform;

	/// Translation to apply to the glyph while rendering.
	public FT_Vector delta;
}

/// This structure models a BGRA color value of a 'CPAL' palette entry.
///
/// The used color space is sRGB; the colors are not pre-multiplied, and
/// alpha values must be explicitly set.
///
/// @since:
///   2.10
[CRepr]
public struct FT_Color
{
	/// Blue value.
	public FT_Byte blue;

	/// Green value.
	public FT_Byte green;

	/// Red value.
	public FT_Byte red;

	/// Alpha value, giving the red, green, and blue color's opacity.
	public FT_Byte alpha;
}

/// This structure holds the data of the 'CPAL' table.
///
/// @note:
///   Use function FT_Get_Sfnt_Name to map name IDs and entry name IDs to
///   name strings.
///
///   Use function FT_Palette_Select to get the colors associated with a
///   palette entry.
///
/// @since:
///   2.10
[CRepr]
public struct FT_Palette_Data
{
	/// The number of palettes.
	public FT_UShort num_palettes;

	/// An optional read-only array of palette name IDs with `num_palettes`
	/// elements, corresponding to entries like 'dark' or 'light' in the
	/// font's 'name' table.
	///
	/// An empty name ID in the 'CPAL' table gets represented as value
	/// 0xFFFF.
	///
	/// `NULL` if the font's 'CPAL' table doesn't contain appropriate data.
	public FT_UShort* palette_name_ids;

	/// An optional read-only array of palette flags with `num_palettes`
	/// elements.  Possible values are an ORed combination of
	/// FT_PALETTE_FOR_LIGHT_BACKGROUND and
	/// FT_PALETTE_FOR_DARK_BACKGROUND.
	///
	/// `NULL` if the font's 'CPAL' table doesn't contain appropriate data.
	public FT_Palette_Flags* palette_flags;

	/// The number of entries in a single palette.  All palettes have the
	/// same size.
	public FT_UShort num_palette_entries;

	/// An optional read-only array of palette entry name IDs with
	/// `num_palette_entries`.  In each palette, entries with the same index
	/// have the same function.  For example, index 0 might correspond to
	/// string 'outline' in the font's 'name' table to indicate that this
	/// palette entry is used for outlines, index 1 might correspond to
	/// 'fill' to indicate the filling color palette entry, etc.
	///
	/// An empty entry name ID in the 'CPAL' table gets represented as value
	/// 0xFFFF.
	///
	/// `NULL` if the font's 'CPAL' table doesn't contain appropriate data.
	public FT_UShort* palette_entry_name_ids;
}

/// This iterator object is needed for FT_Get_Color_Glyph_Layer.
[CRepr]
public struct FT_LayerIterator
{
	/// The number of glyph layers for the requested glyph index.  Will be
	/// set by FT_Get_Color_Glyph_Layer.
	public FT_UInt num_layers;

	/// The current layer.  Will be set by FT_Get_Color_Glyph_Layer.
	public FT_UInt layer;

	/// An opaque pointer into 'COLR' table data.  The caller must set this
	/// to `NULL` before the first call of FT_Get_Color_Glyph_Layer.
	public FT_Byte* p;
}

/// A structure to model a given axis in design space for Adobe MM fonts.
///
/// This structure can't be used with TrueType GX or OpenType Font
/// Variations.
[CRepr]
public struct FT_MM_Axis
{
	/// The axis's name.
	public FT_String* name;

	/// The axis's minimum design coordinate.
	public FT_Long minimum;

	/// The axis's maximum design coordinate.
	public FT_Long maximum;
}

/// A structure to model the axes and space of an Adobe MM font.
///
/// This structure can't be used with TrueType GX or OpenType Font
/// Variations.
[CRepr]
public struct FT_Multi_Master
{
	/// Number of axes.  Cannot exceed 4.
	public FT_UInt num_axis;

	/// Number of designs; should be normally `2^num_axis` even though the
	/// Type 1 specification strangely allows for intermediate designs to be
	/// present.  This number cannot exceed 16.
	public FT_UInt num_designs;

	/// A table of axis descriptors.
	public FT_MM_Axis[4] axis;    // T1_MAX_MM_AXIS
}

/// A structure to model a given axis in design space for Adobe MM fonts,
/// TrueType GX, and OpenType Font Variations.
///
/// @note:
///   The fields `minimum`, `def`, and `maximum` are 16.16 fractional values
///   for TrueType GX and OpenType Font Variations.  For Adobe MM fonts, the
///   values are whole numbers (i.e., the fractional part is zero).
[CRepr]
public struct FT_Var_Axis
{
	/// The axis's name.  Not always meaningful for TrueType GX or OpenType
	/// Font Variations.
	public FT_String* name;

	/// The axis's minimum design coordinate.
	public FT_Fixed minimum;

	/// The axis's default design coordinate.  FreeType computes meaningful
	/// default values for Adobe MM fonts.
	public FT_Fixed def;

	/// The axis's maximum design coordinate.
	public FT_Fixed maximum;

	/// The axis's tag (the equivalent to 'name' for TrueType GX and
	/// OpenType Font Variations).  FreeType provides default values for
	/// Adobe MM fonts if possible.
	public FT_ULong tag;

	/// The axis name entry in the font's 'name' table.  This is another
	/// (and often better) version of the 'name' field for TrueType GX or
	/// OpenType Font Variations.  Not meaningful for Adobe MM fonts.
	public FT_UInt strid;
}

/// A structure to model a named instance in a TrueType GX or OpenType
/// Font Variations.
///
/// This structure can't be used for Adobe MM fonts.
[CRepr]
public struct FT_Var_Named_Style
{
	/// The design coordinates for this instance.  This is an array with one
	/// entry for each axis.
	public FT_Fixed* coords;

	/// An index into the 'name' table identifying this instance.
	public FT_UInt strid;

	/// An index into the 'name' table identifying a PostScript name for
	/// this instance.  Value 0xFFFF indicates a missing entry.
	public FT_UInt psid;
}

/// A structure to model the axes and space of Adobe MM fonts, TrueType
/// GX, or OpenType Font Variations.
///
/// Some fields are specific to one format and not to the others.
[CRepr]
public struct FT_MM_Var
{
	/// The number of axes.  The maximum value is 4 for Adobe MM fonts; no
	/// limit in TrueType GX or OpenType Font Variations.
	public FT_UInt num_axis;

	/// The number of designs; should be normally `2^num_axis` for Adobe MM
	/// fonts.  Not meaningful for TrueType GX or OpenType Font Variations
	/// (where every glyph could have a different number of designs).
	public FT_UInt num_designs;

	/// The number of named instances.  For Adobe MM fonts, this value is
	/// always zero.
	public FT_UInt num_namedstyles;

	/// An axis descriptor table.  TrueType GX and OpenType Font Variations
	/// contain slightly more data than Adobe MM fonts.  Memory management
	/// of this pointer is done internally by FreeType.
	public FT_Var_Axis* axis;

	/// An array of named instances.  Only meaningful for TrueType GX and
	/// OpenType Font Variations.  Memory management of this pointer is done
	/// internally by FreeType.
	public FT_Var_Named_Style* namedstyle;
}

/// A structure used to model an SFNT 'name' table entry.
///
/// @note:
///   Please refer to the TrueType or OpenType specification for more
///   details.
[CRepr]
public struct FT_SfntName
{
	/// The platform ID for `string`.  See TT_PLATFORM_XXX for possible
	/// values.
	public FT_UShort platform_id;

	/// The encoding ID for `string`.  See TT_APPLE_ID_XXX, TT_MAC_ID_XXX,
	/// TT_ISO_ID_XXX, TT_MS_ID_XXX, and TT_ADOBE_ID_XXX for possible
	/// values.
	public FT_UShort encoding_id;

	/// The language ID for `string`.  See TT_MAC_LANGID_XXX and
	/// TT_MS_LANGID_XXX for possible values.
	///
	/// Registered OpenType values for `language_id` are always smaller than
	/// 0x8000; values equal or larger than 0x8000 usually indicate a
	/// language tag string (introduced in OpenType version 1.6).  Use
	/// function FT_Get_Sfnt_LangTag with `language_id` as its argument to
	/// retrieve the associated language tag.
	public FT_UShort language_id;

	/// An identifier for `string`.  See TT_NAME_ID_XXX for possible
	/// values.
	public FT_UShort name_id;

	/// The 'name' string.  Note that its format differs depending on the
	/// (platform,encoding) pair, being either a string of bytes (without a
	/// terminating `NULL` byte) or containing UTF-16BE entities.
	public FT_Byte* @string;

	/// The length of `string` in bytes.
	public FT_UInt string_len;
}

/// A structure to model a language tag entry from an SFNT 'name' table.
///
/// @note:
///   Please refer to the TrueType or OpenType specification for more
///   details.
///
/// @since:
///   2.8
[CRepr]
public struct FT_SfntLangTag
{
	/// The language tag string, encoded in UTF-16BE (without trailing
	/// `NULL` bytes).
	public FT_Byte* @string;

	/// The length of `string` in **bytes**.
	public FT_UInt string_len;
}

/// The module class descriptor.  While being a public structure necessary
/// for FreeType's module bookkeeping, most of the fields are essentially
/// internal, not to be used directly by an application.
[CRepr]
public struct FT_Module_Class
{
	/// Bit flags describing the module.
	public FT_ULong module_flags;

	/// The size of one module object/instance in bytes.
	public FT_Long module_size;

	/// The name of the module.
	public FT_String* module_name;

	/// The version, as a 16.16 fixed number (major.minor).
	public FT_Fixed module_version;

	/// The version of FreeType this module requires, as a 16.16 fixed
	/// number (major.minor).  Starts at version 2.0, i.e., 0x20000.
	public FT_Fixed module_requires;

	/// A typeless pointer to a structure (which varies between different
	/// modules) that holds the module's interface functions.  This is
	/// essentially what `get_interface` returns.
	public void* module_interface;

	/// The initializing function.
	public FT_Module_Constructor module_init;

	/// The finalizing function.
	public FT_Module_Destructor module_done;

	/// The interface requesting function.
	public FT_Module_Requester get_interface;
}

/// A structure to model a TrueType font header table.  All fields follow
/// the OpenType specification.  The 64-bit timestamps are stored in
/// two-element arrays `Created` and `Modified`, first the upper then
/// the lower 32 bits.
[CRepr]
public struct TT_Header
{
	public FT_Fixed Table_Version;
	public FT_Fixed Font_Revision;
	public FT_Long CheckSum_Adjust;
	public FT_Long Magic_Number;
	public FT_UShort Flags;
	public FT_UShort Units_Per_EM;
	public FT_ULong[2] Created;
	public FT_ULong[2] Modified;
	public FT_Short xMin;
	public FT_Short yMin;
	public FT_Short xMax;
	public FT_Short yMax;
	public FT_UShort Mac_Style;
	public FT_UShort Lowest_Rec_PPEM;
	public FT_Short Font_Direction;
	public FT_Short Index_To_Loc_Format;
	public FT_Short Glyph_Data_Format;
}

/// A structure to model a TrueType horizontal header, the 'hhea' table,
/// as well as the corresponding horizontal metrics table, 'hmtx'.
///
/// @note:
///   For OpenType Font Variations, the values of the following fields can
///   change after a call to FT_Set_Var_Design_Coordinates (and friends) if
///   the font contains an 'MVAR' table: `caret_Slope_Rise`,
///   `caret_Slope_Run`, and `caret_Offset`.
[CRepr]
public struct TT_HoriHeader
{
	/// The table version.
	public FT_Fixed Version;

	/// The font's ascender, i.e., the distance from the baseline to the
	/// top-most of all glyph points found in the font.
	///
	/// This value is invalid in many fonts, as it is usually set by the
	/// font designer, and often reflects only a portion of the glyphs found
	/// in the font (maybe ASCII).
	///
	/// You should use the `sTypoAscender` field of the 'OS/2' table instead
	/// if you want the correct one.
	public FT_Short Ascender;

	/// The font's descender, i.e., the distance from the baseline to the
	/// bottom-most of all glyph points found in the font.  It is negative.
	///
	/// This value is invalid in many fonts, as it is usually set by the
	/// font designer, and often reflects only a portion of the glyphs found
	/// in the font (maybe ASCII).
	///
	/// You should use the `sTypoDescender` field of the 'OS/2' table
	/// instead if you want the correct one.
	public FT_Short Descender;

	/// The font's line gap, i.e., the distance to add to the ascender and
	/// descender to get the BTB, i.e., the baseline-to-baseline distance
	/// for the font.
	public FT_Short Line_Gap;

	/// This field is the maximum of all advance widths found in the font.
	/// It can be used to compute the maximum width of an arbitrary string
	/// of text.
	public FT_UShort advance_Width_Max;

	/// The minimum left side bearing of all glyphs within the font.
	public FT_Short min_Left_Side_Bearing;

	/// The minimum right side bearing of all glyphs within the font.
	public FT_Short min_Right_Side_Bearing;

	/// The maximum horizontal extent (i.e., the 'width' of a glyph's
	/// bounding box) for all glyphs in the font.
	public FT_Short xMax_Extent;

	/// The rise coefficient of the cursor's slope of the cursor
	/// (slope=rise/run).
	public FT_Short caret_Slope_Rise;

	/// The run coefficient of the cursor's slope.
	public FT_Short caret_Slope_Run;

	/// The cursor's offset for slanted fonts.
	public FT_Short caret_Offset;

	/// 8 reserved bytes.
	public FT_Short[4] Reserved;

	/// Always 0.
	public FT_Short metric_Data_Format;

	/// Number of HMetrics entries in the 'hmtx' table -- this value can be
	/// smaller than the total number of glyphs in the font.
	public FT_UShort number_Of_HMetrics;

	/// A pointer into the 'hmtx' table.
	public void* long_metrics;

	/// A pointer into the 'hmtx' table.
	public void* short_metrics;
}

/// A structure used to model a TrueType vertical header, the 'vhea'
/// table, as well as the corresponding vertical metrics table, 'vmtx'.
///
/// @note:
///   For OpenType Font Variations, the values of the following fields can
///   change after a call to FT_Set_Var_Design_Coordinates (and friends) if
///   the font contains an 'MVAR' table: `Ascender`, `Descender`,
///   `Line_Gap`, `caret_Slope_Rise`, `caret_Slope_Run`, and `caret_Offset`.
[CRepr]
public struct TT_VertHeader
{
	/// The table version.
	public FT_Fixed Version;

	/// The font's ascender, i.e., the distance from the baseline to the
	/// top-most of all glyph points found in the font.
	///
	/// This value is invalid in many fonts, as it is usually set by the
	/// font designer, and often reflects only a portion of the glyphs found
	/// in the font (maybe ASCII).
	///
	/// You should use the `sTypoAscender` field of the 'OS/2' table instead
	/// if you want the correct one.
	public FT_Short Ascender;

	/// The font's descender, i.e., the distance from the baseline to the
	/// bottom-most of all glyph points found in the font.  It is negative.
	///
	/// This value is invalid in many fonts, as it is usually set by the
	/// font designer, and often reflects only a portion of the glyphs found
	/// in the font (maybe ASCII).
	///
	/// You should use the `sTypoDescender` field of the 'OS/2' table
	/// instead if you want the correct one.
	public FT_Short Descender;

	/// The font's line gap, i.e., the distance to add to the ascender and
	/// descender to get the BTB, i.e., the baseline-to-baseline distance
	/// for the font.
	public FT_Short Line_Gap;

	/// This field is the maximum of all advance heights found in the font.
	/// It can be used to compute the maximum height of an arbitrary string
	/// of text.
	public FT_UShort advance_Height_Max;

	/// The minimum top side bearing of all glyphs within the font.
	public FT_Short min_Top_Side_Bearing;

	/// The minimum bottom side bearing of all glyphs within the font.
	public FT_Short min_Bottom_Side_Bearing;

	/// The maximum vertical extent (i.e., the 'height' of a glyph's
	/// bounding box) for all glyphs in the font.
	public FT_Short yMax_Extent;

	/// The rise coefficient of the cursor's slope of the cursor
	/// (slope=rise/run).
	public FT_Short caret_Slope_Rise;

	/// The run coefficient of the cursor's slope.
	public FT_Short caret_Slope_Run;

	/// The cursor's offset for slanted fonts.
	public FT_Short caret_Offset;

	/// 8 reserved bytes.
	public FT_Short[4] Reserved;

	/// Always 0.
	public FT_Short metric_Data_Format;

	/// Number of VMetrics entries in the 'vmtx' table -- this value can be
	/// smaller than the total number of glyphs in the font.
	public FT_UShort number_Of_VMetrics;

	/// A pointer into the 'vmtx' table.
	public void* long_metrics;

	/// A pointer into the 'vmtx' table.
	public void* short_metrics;
}

/// A structure to model a TrueType 'OS/2' table.  All fields comply to
/// the OpenType specification.
///
/// Note that we now support old Mac fonts that do not include an 'OS/2'
/// table.  In this case, the `version` field is always set to 0xFFFF.
///
/// @note:
///   For OpenType Font Variations, the values of the following fields can
///   change after a call to FT_Set_Var_Design_Coordinates (and friends) if
///   the font contains an 'MVAR' table: `sCapHeight`, `sTypoAscender`,
///   `sTypoDescender`, `sTypoLineGap`, `sxHeight`, `usWinAscent`,
///   `usWinDescent`, `yStrikeoutPosition`, `yStrikeoutSize`,
///   `ySubscriptXOffset`, `ySubScriptXSize`, `ySubscriptYOffset`,
///   `ySubscriptYSize`, `ySuperscriptXOffset`, `ySuperscriptXSize`,
///   `ySuperscriptYOffset`, and `ySuperscriptYSize`.
///
///   Possible values for bits in the `ulUnicodeRangeX` fields are given by
///   the TT_UCR_XXX macros.
[CRepr]
public struct TT_OS2
{
	public FT_UShort version;
	public FT_Short xAvgCharWidth;
	public FT_UShort usWeightClass;
	public FT_UShort usWidthClass;
	public FT_UShort fsType;
	public FT_Short ySubscriptXSize;
	public FT_Short ySubscriptYSize;
	public FT_Short ySubscriptXOffset;
	public FT_Short ySubscriptYOffset;
	public FT_Short ySuperscriptXSize;
	public FT_Short ySuperscriptYSize;
	public FT_Short ySuperscriptXOffset;
	public FT_Short ySuperscriptYOffset;
	public FT_Short yStrikeoutSize;
	public FT_Short yStrikeoutPosition;
	public FT_Short sFamilyClass;
	public FT_Byte[10] panose;
	public FT_ULong ulUnicodeRange1;
	public FT_ULong ulUnicodeRange2;
	public FT_ULong ulUnicodeRange3;
	public FT_ULong ulUnicodeRange4;
	public FT_Char[4] achVendID;
	public FT_UShort fsSelection;
	public FT_UShort usFirstCharIndex;
	public FT_UShort usLastCharIndex;
	public FT_Short sTypoAscender;
	public FT_Short sTypoDescender;
	public FT_Short sTypoLineGap;
	public FT_UShort usWinAscent;
	public FT_UShort usWinDescent;
	public FT_ULong ulCodePageRange1;
	public FT_ULong ulCodePageRange2;
	public FT_Short sxHeight;
	public FT_Short sCapHeight;
	public FT_UShort usDefaultChar;
	public FT_UShort usBreakChar;
	public FT_UShort usMaxContext;
	public FT_UShort usLowerOpticalPointSize;
	public FT_UShort usUpperOpticalPointSize;
}

/// A structure to model a TrueType 'post' table.  All fields comply to
/// the OpenType specification.  This structure does not reference a
/// font's PostScript glyph names; use FT_Get_Glyph_Name to retrieve
/// them.
///
/// @note:
///   For OpenType Font Variations, the values of the following fields can
///   change after a call to FT_Set_Var_Design_Coordinates (and friends) if
///   the font contains an 'MVAR' table: `underlinePosition` and
///   `underlineThickness`.
[CRepr]
public struct TT_Postscript
{
	public FT_Fixed FormatType;
	public FT_Fixed italicAngle;
	public FT_Short underlinePosition;
	public FT_Short underlineThickness;
	public FT_ULong isFixedPitch;
	public FT_ULong minMemType42;
	public FT_ULong maxMemType42;
	public FT_ULong minMemType1;
	public FT_ULong maxMemType1;
}

/// A structure to model a TrueType 'PCLT' table.  All fields comply to
/// the OpenType specification.
[CRepr]
public struct TT_PCLT
{
	public FT_Fixed Version;
	public FT_ULong FontNumber;
	public FT_UShort Pitch;
	public FT_UShort xHeight;
	public FT_UShort Style;
	public FT_UShort TypeFamily;
	public FT_UShort CapHeight;
	public FT_UShort SymbolSet;
	public FT_Char[16] TypeFace;
	public FT_Char[8] CharacterComplement;
	public FT_Char[6] FileName;
	public FT_Char StrokeWeight;
	public FT_Char WidthType;
	public FT_Byte SerifStyle;
	public FT_Byte Reserved;
}

/// The maximum profile ('maxp') table contains many max values, which can
/// be used to pre-allocate arrays for speeding up glyph loading and
/// hinting.
///
/// @note:
///   This structure is only used during font loading.
[CRepr]
public struct TT_MaxProfile
{
	/// The version number.
	public FT_Fixed version;

	/// The number of glyphs in this TrueType font.
	public FT_UShort numGlyphs;

	/// The maximum number of points in a non-composite TrueType glyph.  See
	/// also `maxCompositePoints`.
	public FT_UShort maxPoints;

	/// The maximum number of contours in a non-composite TrueType glyph.
	/// See also `maxCompositeContours`.
	public FT_UShort maxContours;

	/// The maximum number of points in a composite TrueType glyph.  See
	/// also `maxPoints`.
	public FT_UShort maxCompositePoints;

	/// The maximum number of contours in a composite TrueType glyph.  See
	/// also `maxContours`.
	public FT_UShort maxCompositeContours;

	/// The maximum number of zones used for glyph hinting.
	public FT_UShort maxZones;

	/// The maximum number of points in the twilight zone used for glyph
	/// hinting.
	public FT_UShort maxTwilightPoints;

	/// The maximum number of elements in the storage area used for glyph
	/// hinting.
	public FT_UShort maxStorage;

	/// The maximum number of function definitions in the TrueType bytecode
	/// for this font.
	public FT_UShort maxFunctionDefs;

	/// The maximum number of instruction definitions in the TrueType
	/// bytecode for this font.
	public FT_UShort maxInstructionDefs;

	/// The maximum number of stack elements used during bytecode
	/// interpretation.
	public FT_UShort maxStackElements;

	/// The maximum number of TrueType opcodes used for glyph hinting.
	public FT_UShort maxSizeOfInstructions;

	/// The maximum number of simple (i.e., non-composite) glyphs in a
	/// composite glyph.
	public FT_UShort maxComponentElements;

	/// The maximum nesting depth of composite glyphs.
	public FT_UShort maxComponentDepth;
}

// ====================================================================
// Pointer typedefs to the structs above
// ====================================================================

/// A handle to a given memory manager object, defined with an
/// FT_MemoryRec structure.
public typealias FT_Memory = FT_MemoryRec_*;

/// A handle to an input stream.
///
/// @also:
///   See FT_StreamRec for the publicly accessible fields of a given stream
///   object.
public typealias FT_Stream = FT_StreamRec_*;

/// A structure used to describe an input stream.
///
/// @input:
///   base ::
///     For memory-based streams, this is the address of the first stream
///     byte in memory.  This field should always be set to `NULL` for
///     disk-based streams.
///
///   size ::
///     The stream size in bytes.
///
///     In case of compressed streams where the size is unknown before
///     actually doing the decompression, the value is set to 0x7FFFFFFF.
///     (Note that this size value can occur for normal streams also; it is
///     thus just a hint.)
///
///   pos ::
///     The current position within the stream.
///
///   descriptor ::
///     This field is a union that can hold an integer or a pointer.  It is
///     used by stream implementations to store file descriptors or `FILE*`
///     pointers.
///
///   pathname ::
///     This field is completely ignored by FreeType.  However, it is often
///     useful during debugging to use it to store the stream's filename
///     (where available).
///
///   read ::
///     The stream's input function.
///
///   close ::
///     The stream's close function.
///
///   memory ::
///     The memory manager to use to preload frames.  This is set internally
///     by FreeType and shouldn't be touched by stream implementations.
///
///   cursor ::
///     This field is set and used internally by FreeType when parsing
///     frames.  In particular, the `FT_GET_XXX` macros use this instead of
///     the `pos` field.
///
///   limit ::
///     This field is set and used internally by FreeType when parsing
///     frames.
public typealias FT_StreamRec = FT_StreamRec_;

/// A structure used to hold a single list element.
public typealias FT_ListNodeRec = FT_ListNodeRec_;

/// Many elements and objects in FreeType are listed through an FT_List
/// record (see FT_ListRec).  As its name suggests, an FT_ListNode is a
/// handle to a single list element.
public typealias FT_ListNode = FT_ListNodeRec_*;

/// A structure used to hold a simple doubly-linked list.  These are used
/// in many parts of FreeType.
public typealias FT_ListRec = FT_ListRec_;

/// A handle to a list record (see FT_ListRec).
public typealias FT_List = FT_ListRec_*;

/// A handle to a character map (usually abbreviated to 'charmap').  A
/// charmap is used to translate character codes in a given encoding into
/// glyph indexes for its parent's face.  Some font formats may provide
/// several charmaps per font.
///
/// Each face object owns zero or more charmaps, but only one of them can
/// be 'active', providing the data used by FT_Get_Char_Index or
/// FT_Load_Char.
///
/// The list of available charmaps in a face is available through the
/// `face->num_charmaps` and `face->charmaps` fields of FT_FaceRec.
///
/// The currently active charmap is available as `face->charmap`.  You
/// should call FT_Set_Charmap to change it.
///
/// @note:
///   When a new face is created (either through FT_New_Face or
///   FT_Open_Face), the library looks for a Unicode charmap within the
///   list and automatically activates it.  If there is no Unicode charmap,
///   FreeType doesn't set an 'active' charmap.
///
/// @also:
///   See FT_CharMapRec for the publicly accessible fields of a given
///   character map.
public typealias FT_CharMap = FT_CharMapRec*;

/// A handle to a typographic face object.  A face object models a given
/// typeface, in a given style.
///
/// @note:
///   A face object also owns a single FT_GlyphSlot object, as well as one
///   or more FT_Size objects.
///
///   Use FT_New_Face or FT_Open_Face to create a new face object from a
///   given filepath or a custom input stream.
///
///   Use FT_Done_Face to destroy it (along with its slot and sizes).
///
///   An `FT_Face` object can only be safely used from one thread at a time.
///   Similarly, creation and destruction of `FT_Face` with the same
///   FT_Library object can only be done from one thread at a time.  On the
///   other hand, functions like FT_Load_Glyph and its siblings are
///   thread-safe and do not need the lock to be held as long as the same
///   `FT_Face` object is not used from multiple threads at the same time.
///
/// @also:
///   See FT_FaceRec for the publicly accessible fields of a given face
///   object.
public typealias FT_Face = FT_FaceRec*;

/// A handle to an object that models a face scaled to a given character
/// size.
///
/// @note:
///   An FT_Face has one _active_ `FT_Size` object that is used by
///   functions like FT_Load_Glyph to determine the scaling transformation
///   that in turn is used to load and hint glyphs and metrics.
///
///   A newly created `FT_Size` object contains only meaningless zero values.
///   You must use FT_Set_Char_Size, FT_Set_Pixel_Sizes, FT_Request_Size
///   or even FT_Select_Size to change the content (i.e., the scaling
///   values) of the active `FT_Size`.  Otherwise, the scaling and hinting
///   will not be performed.
///
///   You can use FT_New_Size to create additional size objects for a given
///   FT_Face, but they won't be used by other functions until you activate
///   it through FT_Activate_Size.  Only one size can be activated at any
///   given time per face.
///
/// @also:
///   See FT_SizeRec for the publicly accessible fields of a given size
///   object.
public typealias FT_Size = FT_SizeRec*;

/// A handle to a given 'glyph slot'.  A slot is a container that can hold
/// any of the glyphs contained in its parent face.
///
/// In other words, each time you call FT_Load_Glyph or FT_Load_Char,
/// the slot's content is erased by the new glyph data, i.e., the glyph's
/// metrics, its image (bitmap or outline), and other control information.
///
/// @also:
///   See FT_GlyphSlotRec for the publicly accessible glyph fields.
public typealias FT_GlyphSlot = FT_GlyphSlotRec*;

/// A handle to a size request structure.
public typealias FT_Size_Request = FT_Size_RequestRec*;

/// Handle to an object used to model generic glyph images.  It is a
/// pointer to the FT_GlyphRec structure and can contain a glyph bitmap
/// or pointer.
///
/// @note:
///   Glyph objects are not owned by the library.  You must thus release
///   them manually (through FT_Done_Glyph) _before_ calling
///   FT_Done_FreeType.
public typealias FT_Glyph = FT_GlyphRec*;

/// A handle to an object used to model a bitmap glyph image.  This is a
/// 'sub-class' of FT_Glyph, and a pointer to FT_BitmapGlyphRec.
public typealias FT_BitmapGlyph = FT_BitmapGlyphRec*;

/// A handle to an object used to model an outline glyph image.  This is a
/// 'sub-class' of FT_Glyph, and a pointer to FT_OutlineGlyphRec.
public typealias FT_OutlineGlyph = FT_OutlineGlyphRec*;

/// A handle to an object used to model an SVG glyph.  This is a
/// 'sub-class' of FT_Glyph, and a pointer to FT_SvgGlyphRec.
///
/// @since:
///   2.12
public typealias FT_SvgGlyph = FT_SvgGlyphRec*;

public typealias FT_Module_Interface = FT_Pointer;