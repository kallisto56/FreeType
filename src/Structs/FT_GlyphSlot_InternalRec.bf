namespace FreeType;


using System;
using System.Interop;


/**
 * This structure contains the internal fields of each FT_GlyphSlot
 * object.  These fields may change between different releases of
 * FreeType.
 */
[CRepr]
struct FT_GlyphSlot_InternalRec;


/**
 * An opaque handle to an `FT_Slot_InternalRec` structure, used to model
 * private data of a given @FT_GlyphSlot object.
 */
typealias FT_Slot_Internal = FT_GlyphSlot_InternalRec*;