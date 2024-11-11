namespace FreeType;


using System;


/**
 * Render modes supported by FreeType~2.  Each mode corresponds to a
 * specific type of scanline conversion performed on the outline.
 *
 * For bitmap fonts and embedded bitmaps the `bitmap->pixel_mode` field
 * in the @FT_GlyphSlotRec structure gives the format of the returned
 * bitmap.
 *
 * All modes except @FT_RENDER_MODE_MONO use 256 levels of opacity,
 * indicating pixel coverage.  Use linear alpha blending and gamma
 * correction to correctly render non-monochrome glyph bitmaps onto a
 * surface; see @FT_Render_Glyph.
 *
 * The @FT_RENDER_MODE_SDF is a special render mode that uses up to 256
 * distance values, indicating the signed distance from the grid position
 * to the nearest outline.
 */
enum FT_Render_Mode : FT_UInt
{
	FT_RENDER_MODE_NORMAL = 0,
	FT_RENDER_MODE_LIGHT,
	FT_RENDER_MODE_MONO,
	FT_RENDER_MODE_LCD,
	FT_RENDER_MODE_LCD_V,
	FT_RENDER_MODE_SDF,

	FT_RENDER_MODE_MAX
}