namespace FreeType;


using System;
using System.Interop;


/**
 * The FreeType library class. This is the root of all FreeType data.
 * Use FT_New_Library() to create a library object, and FT_Done_Library()
 * to discard it and all child objects.
 */
[CRepr]
struct FT_LibraryRec;


/**
 * A handle to a FreeType library instance. Each 'library' is completely
 * independent from the others; it is the 'root' of a set of objects like
 * fonts, faces, sizes, etc.
 */
typealias FT_Library = FT_LibraryRec*;