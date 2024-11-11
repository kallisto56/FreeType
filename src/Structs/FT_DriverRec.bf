namespace FreeType;


using System;
using System.Interop;


/**
 * The root font driver class.  A font driver is responsible for managing
 * and loading font files of a given format.
 */
[CRepr]
struct FT_DriverRec;


/**
 * A handle to a given FreeType font driver object.  A font driver is a
 * module capable of creating faces from font files.
 */
typealias FT_Driver = FT_DriverRec*;