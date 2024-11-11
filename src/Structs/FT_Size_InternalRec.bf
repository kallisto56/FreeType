namespace FreeType;


using System;
using System.Interop;


/**
 * This structure contains the internal fields of each FT_Size object.
 */
[CRepr]
struct FT_Size_InternalRec;


/**
 * An opaque handle to an `FT_Size_InternalRec` structure, used to model
 * private data of a given @FT_Size object.
 */
typealias FT_Size_Internal = FT_Size_InternalRec*;