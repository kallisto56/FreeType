namespace FreeType;


using System;
using System.Interop;


/**
 * A structure used to describe a given memory manager to FreeType~2.
 */
[CRepr]
struct FT_MemoryRec_;


/**
* A handle to a given memory manager object, defined with an
* @FT_MemoryRec structure.
*/
typealias FT_Memory = FT_MemoryRec_*;