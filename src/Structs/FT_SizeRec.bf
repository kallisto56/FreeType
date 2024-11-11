namespace FreeType;


using System;
using System.Interop;


/**
 * FreeType root size class structure. A size object models a face
 * object at a given size.
 */
[CRepr]
struct FT_SizeRec
{
	public FT_Face face;      /* parent face object              */
	public FT_Generic generic;   /* generic pointer for client uses */
	public FT_Size_Metrics metrics;   /* size metrics                    */
	public FT_Size_Internal @internal;
}


/**
 * A handle to an object that models a face scaled to a given character
 * size.
 */
typealias FT_Size = FT_SizeRec*;