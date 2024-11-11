namespace FreeType;


using System;
using System.Interop;


/**
 * The FreeType error code type.  A value of~0 is always interpreted as a
 * successful operation.
**/
enum FT_Err : System.Interop.c_int
{
	/** no error */
	FT_Err_Ok = 0x00,
	/** cannot open resource */
	FT_Err_Cannot_Open_Resource = 0x01,
	/** unknown file format */
	FT_Err_Unknown_File_Format = 0x02,
	/** broken file */
	FT_Err_Invalid_File_Format = 0x03,
	/** invalid FreeType version */
	FT_Err_Invalid_Version = 0x04,
	/** module version is too low */
	FT_Err_Lower_Module_Version = 0x05,
	/** invalid argument */
	FT_Err_Invalid_Argument = 0x06,
	/** unimplemented feature */
	FT_Err_Unimplemented_Feature = 0x07,
	/** broken table */
	FT_Err_Invalid_Table = 0x08,
	/** broken offset within table */
	FT_Err_Invalid_Offset = 0x09,
	/** array allocation size too large */
	FT_Err_Array_Too_Large = 0x0A,
	/** missing module */
	FT_Err_Missing_Module = 0x0B,
	/** missing property */
	FT_Err_Missing_Property = 0x0C,

	/* glyph/character errors */

	/** invalid glyph index */
	FT_Err_Invalid_Glyph_Index = 0x10,
	/** invalid character code */
	FT_Err_Invalid_Character_Code = 0x11,
	/** unsupported glyph image format */
	FT_Err_Invalid_Glyph_Format = 0x12,
	/** cannot render this glyph format */
	FT_Err_Cannot_Render_Glyph = 0x13,
	/** invalid outline */
	FT_Err_Invalid_Outline = 0x14,
	/** invalid composite glyph */
	FT_Err_Invalid_Composite = 0x15,
	/** too many hints */
	FT_Err_Too_Many_Hints = 0x16,
	/** invalid pixel size */
	FT_Err_Invalid_Pixel_Size = 0x17,
	/** invalid SVG document */
	FT_Err_Invalid_SVG_Document = 0x18,

	/* handle errors */

	/** invalid object handle */
	FT_Err_Invalid_Handle = 0x20,
	/** invalid library handle */
	FT_Err_Invalid_Library_Handle = 0x21,
	/** invalid module handle */
	FT_Err_Invalid_Driver_Handle = 0x22,
	/** invalid face handle */
	FT_Err_Invalid_Face_Handle = 0x23,
	/** invalid size handle */
	FT_Err_Invalid_Size_Handle = 0x24,
	/** invalid glyph slot handle */
	FT_Err_Invalid_Slot_Handle = 0x25,
	/** invalid charmap handle */
	FT_Err_Invalid_CharMap_Handle = 0x26,
	/** invalid cache manager handle */
	FT_Err_Invalid_Cache_Handle = 0x27,
	/** invalid stream handle */
	FT_Err_Invalid_Stream_Handle = 0x28,

	/* driver errors */

	/** too many modules */
	FT_Err_Too_Many_Drivers = 0x30,
	/** too many extensions */
	FT_Err_Too_Many_Extensions = 0x31,

	/* memory errors */

	/** out of memory */
	FT_Err_Out_Of_Memory = 0x40,
	/** unlisted object */
	FT_Err_Unlisted_Object = 0x41,

	/* stream errors */

	/** cannot open stream */
	FT_Err_Cannot_Open_Stream = 0x51,
	/** invalid stream seek */
	FT_Err_Invalid_Stream_Seek = 0x52,
	/** invalid stream skip */
	FT_Err_Invalid_Stream_Skip = 0x53,
	/** invalid stream read */
	FT_Err_Invalid_Stream_Read = 0x54,
	/** invalid stream operation */
	FT_Err_Invalid_Stream_Operation = 0x55,
	/** invalid frame operation */
	FT_Err_Invalid_Frame_Operation = 0x56,
	/** nested frame access */
	FT_Err_Nested_Frame_Access = 0x57,
	/** invalid frame read */
	FT_Err_Invalid_Frame_Read = 0x58,

	/* raster errors */

	/** raster uninitialized */
	FT_Err_Raster_Uninitialized = 0x60,
	/** raster corrupted */
	FT_Err_Raster_Corrupted = 0x61,
	/** raster overflow */
	FT_Err_Raster_Overflow = 0x62,
	/** negative height while rastering */
	FT_Err_Raster_Negative_Height = 0x63,

	/* cache errors */

	/** too many registered caches */
	FT_Err_Too_Many_Caches = 0x70,

	/* TrueType and SFNT errors */

	/** invalid opcode */
	FT_Err_Invalid_Opcode = 0x80,
	/** too few arguments */
	FT_Err_Too_Few_Arguments = 0x81,
	/** stack overflow */
	FT_Err_Stack_Overflow = 0x82,
	/** code overflow */
	FT_Err_Code_Overflow = 0x83,
	/** bad argument */
	FT_Err_Bad_Argument = 0x84,
	/** division by zero */
	FT_Err_Divide_By_Zero = 0x85,
	/** invalid reference */
	FT_Err_Invalid_Reference = 0x86,
	/** found debug opcode */
	FT_Err_Debug_OpCode = 0x87,
	/** found ENDF opcode in execution stream */
	FT_Err_ENDF_In_Exec_Stream = 0x88,
	/** nested DEFS */
	FT_Err_Nested_DEFS = 0x89,
	/** invalid code range */
	FT_Err_Invalid_CodeRange = 0x8A,
	/** execution context too long */
	FT_Err_Execution_Too_Long = 0x8B,
	/** too many function definitions */
	FT_Err_Too_Many_Function_Defs = 0x8C,
	/** too many instruction definitions */
	FT_Err_Too_Many_Instruction_Defs = 0x8D,
	/** SFNT font table missing */
	FT_Err_Table_Missing = 0x8E,
	/** horizontal header (hhea) table missing */
	FT_Err_Horiz_Header_Missing = 0x8F,
	/** locations (loca) table missing */
	FT_Err_Locations_Missing = 0x90,
	/** name table missing */
	FT_Err_Name_Table_Missing = 0x91,
	/** character map (cmap) table missing */
	FT_Err_CMap_Table_Missing = 0x92,
	/** horizontal metrics (hmtx) table missing */
	FT_Err_Hmtx_Table_Missing = 0x93,
	/** PostScript (post) table missing */
	FT_Err_Post_Table_Missing = 0x94,
	/** invalid horizontal metrics */
	FT_Err_Invalid_Horiz_Metrics = 0x95,
	/** invalid character map (cmap) format */
	FT_Err_Invalid_CharMap_Format = 0x96,
	/** invalid ppem value */
	FT_Err_Invalid_PPem = 0x97,
	/** invalid vertical metrics */
	FT_Err_Invalid_Vert_Metrics = 0x98,
	/** could not find context */
	FT_Err_Could_Not_Find_Context = 0x99,
	/** invalid PostScript (post) table format */
	FT_Err_Invalid_Post_Table_Format = 0x9A,
	/** invalid PostScript (post) table */
	FT_Err_Invalid_Post_Table = 0x9B,
	/** found FDEF or IDEF opcode in glyf bytecode */
	FT_Err_DEF_In_Glyf_Bytecode = 0x9C,
	/** missing bitmap in strike */
	FT_Err_Missing_Bitmap = 0x9D,
	/** SVG hooks have not been set */
	FT_Err_Missing_SVG_Hooks = 0x9E,

	/* CFF, CID, and Type 1 errors */

	/** opcode syntax error */
	FT_Err_Syntax_Error = 0xA0,
	/** argument stack underflow */
	FT_Err_Stack_Underflow = 0xA1,
	/** ignore */
	FT_Err_Ignore = 0xA2,
	/** no Unicode glyph name found */
	FT_Err_No_Unicode_Glyph_Name = 0xA3,
	/** glyph too big for hinting */
	FT_Err_Glyph_Too_Big = 0xA4,

	/* BDF errors */

	/** `STARTFONT' field missing */
	FT_Err_Missing_Startfont_Field = 0xB0,
	/** `FONT' field missing */
	FT_Err_Missing_Font_Field = 0xB1,
	/** `SIZE' field missing */
	FT_Err_Missing_Size_Field = 0xB2,
	/** `FONTBOUNDINGBOX' field missing */
	FT_Err_Missing_Fontboundingbox_Field = 0xB3,
	/** `CHARS' field missing */
	FT_Err_Missing_Chars_Field = 0xB4,
	/** `STARTCHAR' field missing */
	FT_Err_Missing_Startchar_Field = 0xB5,
	/** `ENCODING' field missing */
	FT_Err_Missing_Encoding_Field = 0xB6,
	/** `BBX' field missing */
	FT_Err_Missing_Bbx_Field = 0xB7,
	/** `BBX' too big */
	FT_Err_Bbx_Too_Big = 0xB8,
	/** Font header corrupted or missing fields */
	FT_Err_Corrupted_Font_Header = 0xB9,
	/** Font glyphs corrupted or missing fields */
	FT_Err_Corrupted_Font_Glyphs = 0xBA,
}