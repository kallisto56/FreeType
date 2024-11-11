namespace FreeType;


using System;
using System.Interop;


/**
 * A structure used to describe an input stream.
 */
[CRepr]
struct FT_StreamRec;


/**
 * A handle to an input stream.
 */
typealias FT_Stream = FT_StreamRec*;