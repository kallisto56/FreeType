namespace FreeType;


using System;
using System.Interop;


/**
 * FreeType root glyph slot class structure. A glyph slot is a container
 * where individual glyphs can be loaded, be they in outline or bitmap
 * format.
 */
[CRepr]
struct FT_GlyphSlotRec
{
	public FT_Library library;
	public FT_Face face;
	public FT_GlyphSlot next;
	public FT_UInt glyph_index; /* new in 2.10; was reserved previously */
	public FT_Generic generic;

	public FT_Glyph_Metrics metrics;
	public FT_Fixed linearHoriAdvance;
	public FT_Fixed linearVertAdvance;
	public FT_Vector advance;

	public FT_Glyph_Format format;

	public FT_Bitmap bitmap;
	public FT_Int bitmap_left;
	public FT_Int bitmap_top;

	public FT_Outline outline;

	public FT_UInt num_subglyphs;
	public FT_SubGlyph subglyphs;

	public void* control_data;
	public c_long control_len;

	public FT_Pos lsb_delta;
	public FT_Pos rsb_delta;

	public void* other;

	public FT_Slot_Internal @internal;
}


/**
 * A handle to a given 'glyph slot'. A slot is a container that can hold
 * any of the glyphs contained in its parent face.
 *
 * In other words, each time you call @FT_Load_Glyph or @FT_Load_Char,
 * the slot's content is erased by the new glyph data, i.e., the glyph's
 * metrics, its image (bitmap or outline), and other control information.
 */
typealias FT_GlyphSlot = FT_GlyphSlotRec*;