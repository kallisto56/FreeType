namespace FreeType;


using System;
using System.Interop;


/**
 * Client applications often need to associate their own data to a
 * variety of FreeType core objects.  For example, a text layout API
 * might want to associate a glyph cache to a given size object.
 * Some FreeType object contains a `generic` field, of type `FT_Generic`,
 * which usage is left to client applications and font servers.
 * It can be used to store a pointer to client-specific data, as well as
 * the address of a 'finalizer' function, which will be called by
 * FreeType when the object is destroyed (for example, the previous
 * client example would put the address of the glyph cache destructor in
 * the `finalizer` field).
**/
[CRepr]
struct FT_Generic
{
	public void* data;
	public FT_Generic_Finalizer finalizer;
}


/**
 * Describe a function used to destroy the 'client' data of any FreeType
 * object. See the description of the @FT_Generic type for details of
 * usage.
**/
function void FT_Generic_Finalizer (void* object);