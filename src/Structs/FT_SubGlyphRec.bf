namespace FreeType;


using System;
using System.Interop;


/**
 * The glyph loader is an internal object used to load several glyphs
 * together (for example, in the case of composites).
 */
[CRepr]
struct FT_SubGlyphRec;


/**
 * The subglyph structure is an internal object used to describe
 * subglyphs (for example, in the case of composites).
 */
typealias FT_SubGlyph = FT_SubGlyphRec*;