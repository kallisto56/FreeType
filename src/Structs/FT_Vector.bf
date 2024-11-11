namespace FreeType;


using System;
using System.Interop;


/**
 * A simple structure used to store a 2D vector; coordinates are of the
 * FT_Pos type.
 */
[CRepr]
struct FT_Vector
{
	public FT_Pos x;
	public FT_Pos y;
}