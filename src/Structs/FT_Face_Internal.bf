namespace FreeType;


using System;
using System.Interop;


/**
 * This structure contains the internal fields of each FT_Face object.
 * These fields may change between different releases of FreeType.
 */
[CRepr]
struct FT_Face_InternalRec;


/**
 * An opaque handle to an `FT_Face_InternalRec` structure that models the
 * private data of a given @FT_Face object.
 *
 * This structure might change between releases of FreeType~2 and is not
 * generally available to client applications.
 */
typealias FT_Face_Internal = FT_Face_InternalRec*;