namespace HarfBuzz;


using System;
using System.Interop;


/// The direction of a text segment or buffer.
///
/// A segment can also be tested for horizontal or vertical
/// orientation (irrespective of specific direction) with
/// HB_DIRECTION_IS_HORIZONTAL() or HB_DIRECTION_IS_VERTICAL().
public enum hb_direction_t : c_uint
{
	/// Initial, unset direction.
	HB_DIRECTION_INVALID = 0x0,

	/// Text is set horizontally from left to right.
	HB_DIRECTION_LTR = 0x4,

	/// Text is set horizontally from right to left.
	HB_DIRECTION_RTL = 0x5,

	/// Text is set vertically from top to bottom.
	HB_DIRECTION_TTB = 0x6,

	/// Text is set vertically from bottom to top.
	HB_DIRECTION_BTT = 0x7
}

/// Data type for scripts. Each hb_script_t's value is an hb_tag_t corresponding
/// to the four-letter values defined by [ISO 15924](https://unicode.org/iso15924/).
///
/// See also the Script (sc) property of the Unicode Character Database.
public enum hb_script_t : c_uint
{
	/// `Zyyy`
	HB_SCRIPT_COMMON = 0x5A797979,

	/// `Zinh`
	HB_SCRIPT_INHERITED = 0x5A696E68,

	/// `Zzzz`
	HB_SCRIPT_UNKNOWN = 0x5A7A7A7A,

	/// `Arab`
	HB_SCRIPT_ARABIC = 0x41726162,

	/// `Armn`
	HB_SCRIPT_ARMENIAN = 0x41726D6E,

	/// `Beng`
	HB_SCRIPT_BENGALI = 0x42656E67,

	/// `Cyrl`
	HB_SCRIPT_CYRILLIC = 0x4379726C,

	/// `Deva`
	HB_SCRIPT_DEVANAGARI = 0x44657661,

	/// `Geor`
	HB_SCRIPT_GEORGIAN = 0x47656F72,

	/// `Grek`
	HB_SCRIPT_GREEK = 0x4772656B,

	/// `Gujr`
	HB_SCRIPT_GUJARATI = 0x47756A72,

	/// `Guru`
	HB_SCRIPT_GURMUKHI = 0x47757275,

	/// `Hang`
	HB_SCRIPT_HANGUL = 0x48616E67,

	/// `Hani`
	HB_SCRIPT_HAN = 0x48616E69,

	/// `Hebr`
	HB_SCRIPT_HEBREW = 0x48656272,

	/// `Hira`
	HB_SCRIPT_HIRAGANA = 0x48697261,

	/// `Knda`
	HB_SCRIPT_KANNADA = 0x4B6E6461,

	/// `Kana`
	HB_SCRIPT_KATAKANA = 0x4B616E61,

	/// `Laoo`
	HB_SCRIPT_LAO = 0x4C616F6F,

	/// `Latn`
	HB_SCRIPT_LATIN = 0x4C61746E,

	/// `Mlym`
	HB_SCRIPT_MALAYALAM = 0x4D6C796D,

	/// `Orya`
	HB_SCRIPT_ORIYA = 0x4F727961,

	/// `Taml`
	HB_SCRIPT_TAMIL = 0x54616D6C,

	/// `Telu`
	HB_SCRIPT_TELUGU = 0x54656C75,

	/// `Thai`
	HB_SCRIPT_THAI = 0x54686169,

	/// `Tibt`
	HB_SCRIPT_TIBETAN = 0x54696274,

	/// `Bopo`
	HB_SCRIPT_BOPOMOFO = 0x426F706F,

	/// `Brai`
	HB_SCRIPT_BRAILLE = 0x42726169,

	/// `Cans`
	HB_SCRIPT_CANADIAN_SYLLABICS = 0x43616E73,

	/// `Cher`
	HB_SCRIPT_CHEROKEE = 0x43686572,

	/// `Ethi`
	HB_SCRIPT_ETHIOPIC = 0x45746869,

	/// `Khmr`
	HB_SCRIPT_KHMER = 0x4B686D72,

	/// `Mong`
	HB_SCRIPT_MONGOLIAN = 0x4D6F6E67,

	/// `Mymr`
	HB_SCRIPT_MYANMAR = 0x4D796D72,

	/// `Ogam`
	HB_SCRIPT_OGHAM = 0x4F67616D,

	/// `Runr`
	HB_SCRIPT_RUNIC = 0x52756E72,

	/// `Sinh`
	HB_SCRIPT_SINHALA = 0x53696E68,

	/// `Syrc`
	HB_SCRIPT_SYRIAC = 0x53797263,

	/// `Thaa`
	HB_SCRIPT_THAANA = 0x54686161,

	/// `Yiii`
	HB_SCRIPT_YI = 0x59696969,

	/// `Dsrt`
	HB_SCRIPT_DESERET = 0x44737274,

	/// `Goth`
	HB_SCRIPT_GOTHIC = 0x476F7468,

	/// `Ital`
	HB_SCRIPT_OLD_ITALIC = 0x4974616C,

	/// `Buhd`
	HB_SCRIPT_BUHID = 0x42756864,

	/// `Hano`
	HB_SCRIPT_HANUNOO = 0x48616E6F,

	/// `Tglg`
	HB_SCRIPT_TAGALOG = 0x54676C67,

	/// `Tagb`
	HB_SCRIPT_TAGBANWA = 0x54616762,

	/// `Cprt`
	HB_SCRIPT_CYPRIOT = 0x43707274,

	/// `Limb`
	HB_SCRIPT_LIMBU = 0x4C696D62,

	/// `Linb`
	HB_SCRIPT_LINEAR_B = 0x4C696E62,

	/// `Osma`
	HB_SCRIPT_OSMANYA = 0x4F736D61,

	/// `Shaw`
	HB_SCRIPT_SHAVIAN = 0x53686177,

	/// `Tale`
	HB_SCRIPT_TAI_LE = 0x54616C65,

	/// `Ugar`
	HB_SCRIPT_UGARITIC = 0x55676172,

	/// `Bugi`
	HB_SCRIPT_BUGINESE = 0x42756769,

	/// `Copt`
	HB_SCRIPT_COPTIC = 0x436F7074,

	/// `Glag`
	HB_SCRIPT_GLAGOLITIC = 0x476C6167,

	/// `Khar`
	HB_SCRIPT_KHAROSHTHI = 0x4B686172,

	/// `Talu`
	HB_SCRIPT_NEW_TAI_LUE = 0x54616C75,

	/// `Xpeo`
	HB_SCRIPT_OLD_PERSIAN = 0x5870656F,

	/// `Sylo`
	HB_SCRIPT_SYLOTI_NAGRI = 0x53796C6F,

	/// `Tfng`
	HB_SCRIPT_TIFINAGH = 0x54666E67,

	/// `Bali`
	HB_SCRIPT_BALINESE = 0x42616C69,

	/// `Xsux`
	HB_SCRIPT_CUNEIFORM = 0x58737578,

	/// `Nkoo`
	HB_SCRIPT_NKO = 0x4E6B6F6F,

	/// `Phag`
	HB_SCRIPT_PHAGS_PA = 0x50686167,

	/// `Phnx`
	HB_SCRIPT_PHOENICIAN = 0x50686E78,

	/// `Cari`
	HB_SCRIPT_CARIAN = 0x43617269,

	/// `Cham`
	HB_SCRIPT_CHAM = 0x4368616D,

	/// `Kali`
	HB_SCRIPT_KAYAH_LI = 0x4B616C69,

	/// `Lepc`
	HB_SCRIPT_LEPCHA = 0x4C657063,

	/// `Lyci`
	HB_SCRIPT_LYCIAN = 0x4C796369,

	/// `Lydi`
	HB_SCRIPT_LYDIAN = 0x4C796469,

	/// `Olck`
	HB_SCRIPT_OL_CHIKI = 0x4F6C636B,

	/// `Rjng`
	HB_SCRIPT_REJANG = 0x526A6E67,

	/// `Saur`
	HB_SCRIPT_SAURASHTRA = 0x53617572,

	/// `Sund`
	HB_SCRIPT_SUNDANESE = 0x53756E64,

	/// `Vaii`
	HB_SCRIPT_VAI = 0x56616969,

	/// `Avst`
	HB_SCRIPT_AVESTAN = 0x41767374,

	/// `Bamu`
	HB_SCRIPT_BAMUM = 0x42616D75,

	/// `Egyp`
	HB_SCRIPT_EGYPTIAN_HIEROGLYPHS = 0x45677970,

	/// `Armi`
	HB_SCRIPT_IMPERIAL_ARAMAIC = 0x41726D69,

	/// `Phli`
	HB_SCRIPT_INSCRIPTIONAL_PAHLAVI = 0x50686C69,

	/// `Prti`
	HB_SCRIPT_INSCRIPTIONAL_PARTHIAN = 0x50727469,

	/// `Java`
	HB_SCRIPT_JAVANESE = 0x4A617661,

	/// `Kthi`
	HB_SCRIPT_KAITHI = 0x4B746869,

	/// `Lisu`
	HB_SCRIPT_LISU = 0x4C697375,

	/// `Mtei`
	HB_SCRIPT_MEETEI_MAYEK = 0x4D746569,

	/// `Sarb`
	HB_SCRIPT_OLD_SOUTH_ARABIAN = 0x53617262,

	/// `Orkh`
	HB_SCRIPT_OLD_TURKIC = 0x4F726B68,

	/// `Samr`
	HB_SCRIPT_SAMARITAN = 0x53616D72,

	/// `Lana`
	HB_SCRIPT_TAI_THAM = 0x4C616E61,

	/// `Tavt`
	HB_SCRIPT_TAI_VIET = 0x54617674,

	/// `Batk`
	HB_SCRIPT_BATAK = 0x4261746B,

	/// `Brah`
	HB_SCRIPT_BRAHMI = 0x42726168,

	/// `Mand`
	HB_SCRIPT_MANDAIC = 0x4D616E64,

	/// `Cakm`
	HB_SCRIPT_CHAKMA = 0x43616B6D,

	/// `Merc`
	HB_SCRIPT_MEROITIC_CURSIVE = 0x4D657263,

	/// `Mero`
	HB_SCRIPT_MEROITIC_HIEROGLYPHS = 0x4D65726F,

	/// `Plrd`
	HB_SCRIPT_MIAO = 0x506C7264,

	/// `Shrd`
	HB_SCRIPT_SHARADA = 0x53687264,

	/// `Sora`
	HB_SCRIPT_SORA_SOMPENG = 0x536F7261,

	/// `Takr`
	HB_SCRIPT_TAKRI = 0x54616B72,

	/// `Bass`, Since: 0.9.30
	HB_SCRIPT_BASSA_VAH = 0x42617373,

	/// `Aghb`, Since: 0.9.30
	HB_SCRIPT_CAUCASIAN_ALBANIAN = 0x41676862,

	/// `Dupl`, Since: 0.9.30
	HB_SCRIPT_DUPLOYAN = 0x4475706C,

	/// `Elba`, Since: 0.9.30
	HB_SCRIPT_ELBASAN = 0x456C6261,

	/// `Gran`, Since: 0.9.30
	HB_SCRIPT_GRANTHA = 0x4772616E,

	/// `Khoj`, Since: 0.9.30
	HB_SCRIPT_KHOJKI = 0x4B686F6A,

	/// `Sind`, Since: 0.9.30
	HB_SCRIPT_KHUDAWADI = 0x53696E64,

	/// `Lina`, Since: 0.9.30
	HB_SCRIPT_LINEAR_A = 0x4C696E61,

	/// `Mahj`, Since: 0.9.30
	HB_SCRIPT_MAHAJANI = 0x4D61686A,

	/// `Mani`, Since: 0.9.30
	HB_SCRIPT_MANICHAEAN = 0x4D616E69,

	/// `Mend`, Since: 0.9.30
	HB_SCRIPT_MENDE_KIKAKUI = 0x4D656E64,

	/// `Modi`, Since: 0.9.30
	HB_SCRIPT_MODI = 0x4D6F6469,

	/// `Mroo`, Since: 0.9.30
	HB_SCRIPT_MRO = 0x4D726F6F,

	/// `Nbat`, Since: 0.9.30
	HB_SCRIPT_NABATAEAN = 0x4E626174,

	/// `Narb`, Since: 0.9.30
	HB_SCRIPT_OLD_NORTH_ARABIAN = 0x4E617262,

	/// `Perm`, Since: 0.9.30
	HB_SCRIPT_OLD_PERMIC = 0x5065726D,

	/// `Hmng`, Since: 0.9.30
	HB_SCRIPT_PAHAWH_HMONG = 0x486D6E67,

	/// `Palm`, Since: 0.9.30
	HB_SCRIPT_PALMYRENE = 0x50616C6D,

	/// `Pauc`, Since: 0.9.30
	HB_SCRIPT_PAU_CIN_HAU = 0x50617563,

	/// `Phlp`, Since: 0.9.30
	HB_SCRIPT_PSALTER_PAHLAVI = 0x50686C70,

	/// `Sidd`, Since: 0.9.30
	HB_SCRIPT_SIDDHAM = 0x53696464,

	/// `Tirh`, Since: 0.9.30
	HB_SCRIPT_TIRHUTA = 0x54697268,

	/// `Wara`, Since: 0.9.30
	HB_SCRIPT_WARANG_CITI = 0x57617261,

	/// `Ahom`, Since: 0.9.30
	HB_SCRIPT_AHOM = 0x41686F6D,

	/// `Hluw`, Since: 0.9.30
	HB_SCRIPT_ANATOLIAN_HIEROGLYPHS = 0x486C7577,

	/// `Hatr`, Since: 0.9.30
	HB_SCRIPT_HATRAN = 0x48617472,

	/// `Mult`, Since: 0.9.30
	HB_SCRIPT_MULTANI = 0x4D756C74,

	/// `Hung`, Since: 0.9.30
	HB_SCRIPT_OLD_HUNGARIAN = 0x48756E67,

	/// `Sgnw`, Since: 0.9.30
	HB_SCRIPT_SIGNWRITING = 0x53676E77,

	/// `Adlm`, Since: 1.3.0
	HB_SCRIPT_ADLAM = 0x41646C6D,

	/// `Bhks`, Since: 1.3.0
	HB_SCRIPT_BHAIKSUKI = 0x42686B73,

	/// `Marc`, Since: 1.3.0
	HB_SCRIPT_MARCHEN = 0x4D617263,

	/// `Osge`, Since: 1.3.0
	HB_SCRIPT_OSAGE = 0x4F736765,

	/// `Tang`, Since: 1.3.0
	HB_SCRIPT_TANGUT = 0x54616E67,

	/// `Newa`, Since: 1.3.0
	HB_SCRIPT_NEWA = 0x4E657761,

	/// `Gonm`, Since: 1.6.0
	HB_SCRIPT_MASARAM_GONDI = 0x476F6E6D,

	/// `Nshu`, Since: 1.6.0
	HB_SCRIPT_NUSHU = 0x4E736875,

	/// `Soyo`, Since: 1.6.0
	HB_SCRIPT_SOYOMBO = 0x536F796F,

	/// `Zanb`, Since: 1.6.0
	HB_SCRIPT_ZANABAZAR_SQUARE = 0x5A616E62,

	/// `Dogr`, Since: 1.8.0
	HB_SCRIPT_DOGRA = 0x446F6772,

	/// `Gong`, Since: 1.8.0
	HB_SCRIPT_GUNJALA_GONDI = 0x476F6E67,

	/// `Rohg`, Since: 1.8.0
	HB_SCRIPT_HANIFI_ROHINGYA = 0x526F6867,

	/// `Maka`, Since: 1.8.0
	HB_SCRIPT_MAKASAR = 0x4D616B61,

	/// `Medf`, Since: 1.8.0
	HB_SCRIPT_MEDEFAIDRIN = 0x4D656466,

	/// `Sogo`, Since: 1.8.0
	HB_SCRIPT_OLD_SOGDIAN = 0x536F676F,

	/// `Sogd`, Since: 1.8.0
	HB_SCRIPT_SOGDIAN = 0x536F6764,

	/// `Elym`, Since: 2.4.0
	HB_SCRIPT_ELYMAIC = 0x456C796D,

	/// `Nand`, Since: 2.4.0
	HB_SCRIPT_NANDINAGARI = 0x4E616E64,

	/// `Hmnp`, Since: 2.4.0
	HB_SCRIPT_NYIAKENG_PUACHUE_HMONG = 0x486D6E70,

	/// `Wcho`, Since: 2.4.0
	HB_SCRIPT_WANCHO = 0x5763686F,

	/// `Chrs`, Since: 2.6.7
	HB_SCRIPT_CHORASMIAN = 0x43687273,

	/// `Diak`, Since: 2.6.7
	HB_SCRIPT_DIVES_AKURU = 0x4469616B,

	/// `Kits`, Since: 2.6.7
	HB_SCRIPT_KHITAN_SMALL_SCRIPT = 0x4B697473,

	/// `Yezi`, Since: 2.6.7
	HB_SCRIPT_YEZIDI = 0x59657A69,

	/// `Cpmn`, Since: 3.0.0
	HB_SCRIPT_CYPRO_MINOAN = 0x43706D6E,

	/// `Ougr`, Since: 3.0.0
	HB_SCRIPT_OLD_UYGHUR = 0x4F756772,

	/// `Tnsa`, Since: 3.0.0
	HB_SCRIPT_TANGSA = 0x546E7361,

	/// `Toto`, Since: 3.0.0
	HB_SCRIPT_TOTO = 0x546F746F,

	/// `Vith`, Since: 3.0.0
	HB_SCRIPT_VITHKUQI = 0x56697468,

	/// `Zmth`, Since: 3.4.0
	HB_SCRIPT_MATH = 0x5A6D7468,

	/// `Kawi`, Since: 5.2.0
	HB_SCRIPT_KAWI = 0x4B617769,

	/// `Nagm`, Since: 5.2.0
	HB_SCRIPT_NAG_MUNDARI = 0x4E61676D,

	/// `Gara`, Since: 10.0.0
	HB_SCRIPT_GARAY = 0x47617261,

	/// `Gukh`, Since: 10.0.0
	HB_SCRIPT_GURUNG_KHEMA = 0x47756B68,

	/// `Krai`, Since: 10.0.0
	HB_SCRIPT_KIRAT_RAI = 0x4B726169,

	/// `Onao`, Since: 10.0.0
	HB_SCRIPT_OL_ONAL = 0x4F6E616F,

	/// `Sunu`, Since: 10.0.0
	HB_SCRIPT_SUNUWAR = 0x53756E75,

	/// `Todr`, Since: 10.0.0
	HB_SCRIPT_TODHRI = 0x546F6472,

	/// `Tutg`, Since: 10.0.0
	HB_SCRIPT_TULU_TIGALARI = 0x54757467,

	/// `Berf`, Since: 11.5.0
	HB_SCRIPT_BERIA_ERFE = 0x42657266,

	/// `Sidt`, Since: 11.5.0
	HB_SCRIPT_SIDETIC = 0x53696474,

	/// `Tayo`, Since: 11.5.0
	HB_SCRIPT_TAI_YO = 0x5461796F,

	/// `Tols`, Since: 11.5.0
	HB_SCRIPT_TOLONG_SIKI = 0x546F6C73,

	/// `Jurc`, Since: 14.5.0
	HB_SCRIPT_JURCHEN = 0x4A757263,

	/// `Pcun`, Since: 14.5.0
	HB_SCRIPT_PROTO_CUNEIFORM = 0x5063756E,

	/// `Seal`, Since: 14.5.0
	HB_SCRIPT_SEAL = 0x5365616C,

	/// No script set
	HB_SCRIPT_INVALID = 0x0
}

/// Data type holding the memory modes available to
/// client programs.
///
/// Regarding these various memory-modes:
///
/// - In no case shall the HarfBuzz client modify memory
///   that is passed to HarfBuzz in a blob.  If there is
///   any such possibility, @HB_MEMORY_MODE_DUPLICATE should be used
///   such that HarfBuzz makes a copy immediately,
///
/// - Use @HB_MEMORY_MODE_READONLY otherwise, unless you really really
///   really know what you are doing,
///
/// - @HB_MEMORY_MODE_WRITABLE is appropriate if you really made a
///   copy of data solely for the purpose of passing to
///   HarfBuzz and doing that just once (no reuse!),
///
/// - If the font is mmap()ed, it's okay to use
///   @HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE, however, using that mode
///   correctly is very tricky.  Use @HB_MEMORY_MODE_READONLY instead.
public enum hb_memory_mode_t : c_uint
{
	/// HarfBuzz immediately makes a copy of the data.
	HB_MEMORY_MODE_DUPLICATE = 0x0,

	/// HarfBuzz client will never modify the data,
	/// and HarfBuzz will never modify the data.
	HB_MEMORY_MODE_READONLY = 0x1,

	/// HarfBuzz client made a copy of the data solely
	/// for HarfBuzz, so HarfBuzz may modify the data.
	HB_MEMORY_MODE_WRITABLE = 0x2,

	/// See above
	HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE = 0x3
}

/// Flags for hb_glyph_info_t.
///
/// Since: 1.5.0
public enum hb_glyph_flags_t : c_uint
{
	/// Indicates that if input text is broken at the
	/// beginning of the cluster this glyph is part of,
	/// then both sides need to be re-shaped, as the
	/// result might be different.
	/// On the flip side, it means that when this
	/// flag is not present, then it is safe to break
	/// the glyph-run at the beginning of this
	/// cluster, and the two sides will represent the
	/// exact same result one would get if breaking
	/// input text at the beginning of this cluster
	/// and shaping the two sides separately.
	/// This can be used to optimize paragraph
	/// layout, by avoiding re-shaping of each line
	/// after line-breaking.
	HB_GLYPH_FLAG_UNSAFE_TO_BREAK = 0x1,

	/// Indicates that if input text is changed on one
	/// side of the beginning of the cluster this glyph
	/// is part of, then the shaping results for the
	/// other side might change.
	/// Note that the absence of this flag will NOT by
	/// itself mean that it IS safe to concat text.
	/// Only two pieces of text both of which clear of
	/// this flag can be concatenated safely.
	/// This can be used to optimize paragraph
	/// layout, by avoiding re-shaping of each line
	/// after line-breaking, by limiting the
	/// reshaping to a small piece around the
	/// breaking position only, even if the breaking
	/// position carries the
	/// HB_GLYPH_FLAG_UNSAFE_TO_BREAK or when
	/// hyphenation or other text transformation
	/// happens at line-break position, in the following
	/// way:
	/// 1. Iterate back from the line-break position
	/// until the first cluster start position that is
	/// NOT unsafe-to-concat, 2. shape the segment from
	/// there till the end of line, 3. check whether the
	/// resulting glyph-run also is clear of the
	/// unsafe-to-concat at its start-of-text position;
	/// if it is, just splice it into place and the line
	/// is shaped; If not, move on to a position further
	/// back that is clear of unsafe-to-concat and retry
	/// from there, and repeat.
	/// At the start of next line a similar algorithm can
	/// be implemented. That is: 1. Iterate forward from
	/// the line-break position until the first cluster
	/// start position that is NOT unsafe-to-concat, 2.
	/// shape the segment from beginning of the line to
	/// that position, 3. check whether the resulting
	/// glyph-run also is clear of the unsafe-to-concat
	/// at its end-of-text position; if it is, just splice
	/// it into place and the beginning is shaped; If not,
	/// move on to a position further forward that is clear
	/// of unsafe-to-concat and retry up to there, and repeat.
	/// A slight complication will arise in the
	/// implementation of the algorithm above,
	/// because while our buffer API has a way to
	/// return flags for position corresponding to
	/// start-of-text, there is currently no position
	/// corresponding to end-of-text.  This limitation
	/// can be alleviated by shaping more text than needed
	/// and looking for unsafe-to-concat flag within text
	/// clusters.
	/// The HB_GLYPH_FLAG_UNSAFE_TO_BREAK flag will
	/// always imply this flag.
	/// To use this flag, you must enable the buffer flag
	/// @HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT during
	/// shaping, otherwise the buffer flag will not be
	/// reliably produced.
	/// Since: 4.0.0
	HB_GLYPH_FLAG_UNSAFE_TO_CONCAT = 0x2,

	/// In scripts that use elongation (Arabic,
	/// Mongolian, Syriac, etc.), this flag signifies
	/// that it is safe to insert a U+0640 TATWEEL
	/// character before this cluster for elongation.
	/// This flag does not determine the
	/// script-specific elongation places, but only
	/// when it is safe to do the elongation without
	/// interrupting text shaping.
	/// Since: 5.1.0
	HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL = 0x4,

	/// All the currently defined flags.
	HB_GLYPH_FLAG_DEFINED = 0x7
}

/// The type of hb_buffer_t contents.
public enum hb_buffer_content_type_t : c_uint
{
	/// Initial value for new buffer.
	HB_BUFFER_CONTENT_TYPE_INVALID = 0x0,

	/// The buffer contains input characters (before shaping).
	HB_BUFFER_CONTENT_TYPE_UNICODE = 0x1,

	/// The buffer contains output glyphs (after shaping).
	HB_BUFFER_CONTENT_TYPE_GLYPHS = 0x2
}

/// Flags for hb_buffer_t.
///
/// Since: 0.9.20
public enum hb_buffer_flags_t : c_uint
{
	/// the default buffer flag.
	HB_BUFFER_FLAG_DEFAULT = 0x0,

	/// flag indicating that special handling of the beginning
	/// of text paragraph can be applied to this buffer. Should usually
	/// be set, unless you are passing to the buffer only part
	/// of the text without the full context.
	HB_BUFFER_FLAG_BOT = 0x1,

	/// flag indicating that special handling of the end of text
	/// paragraph can be applied to this buffer, similar to
	/// @HB_BUFFER_FLAG_BOT.
	HB_BUFFER_FLAG_EOT = 0x2,

	///
	/// flag indication that character with Default_Ignorable
	/// Unicode property should use the corresponding glyph
	/// from the font, instead of hiding them (done by
	/// replacing them with the space glyph and zeroing the
	/// advance width.)  This flag takes precedence over
	/// @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES.
	HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES = 0x4,

	///
	/// flag indication that character with Default_Ignorable
	/// Unicode property should be removed from glyph string
	/// instead of hiding them (done by replacing them with the
	/// space glyph and zeroing the advance width.)
	/// @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES takes
	/// precedence over this flag. Since: 1.8.0
	HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES = 0x8,

	///
	/// flag indicating that a dotted circle should
	/// not be inserted in the rendering of incorrect
	/// character sequences (such at <0905 093E>). Since: 2.4.0
	HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE = 0x10,

	///
	/// flag indicating that the hb_shape() call and its variants
	/// should perform various verification processes on the results
	/// of the shaping operation on the buffer.  If the verification
	/// fails, then either a buffer message is sent, if a message
	/// handler is installed on the buffer, or a message is written
	/// to standard error.  In either case, the shaping result might
	/// be modified to show the failed output. Since: 3.4.0
	HB_BUFFER_FLAG_VERIFY = 0x20,

	///
	/// flag indicating that the @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT
	/// glyph-flag should be produced by the shaper. By default
	/// it will not be produced since it incurs a cost. Since: 4.0.0
	HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT = 0x40,

	///
	/// flag indicating that the @HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL
	/// glyph-flag should be produced by the shaper. By default
	/// it will not be produced. Since: 5.1.0
	HB_BUFFER_FLAG_PRODUCE_SAFE_TO_INSERT_TATWEEL = 0x80,

	/// All currently defined flags: Since: 4.4.0
	HB_BUFFER_FLAG_DEFINED = 0xFF
}

/// Data type for holding HarfBuzz's clustering behavior options. The cluster level
/// dictates one aspect of how HarfBuzz will treat non-base characters
/// during shaping.
///
/// In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES, non-base
/// characters are merged into the cluster of the base character that precedes them.
/// There is also cluster merging every time the clusters will otherwise become non-monotone.
///
/// In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS, non-base characters are initially
/// assigned their own cluster values, which are not merged into preceding base
/// clusters. This allows HarfBuzz to perform additional operations like reorder
/// sequences of adjacent marks. The output is still monotone, but the cluster
/// values are more granular.
///
/// In @HB_BUFFER_CLUSTER_LEVEL_CHARACTERS, non-base characters are assigned their
/// own cluster values, which are not merged into preceding base clusters. Moreover,
/// the cluster values are not merged into monotone order. This is the most granular
/// cluster level, and it is useful for clients that need to know the exact cluster
/// values of each character, but is harder to use for clients, since clusters
/// might appear in any order.
///
/// In @HB_BUFFER_CLUSTER_LEVEL_GRAPHEMES, non-base characters are merged into the
/// cluster of the base character that precedes them. This is similar to the Unicode
/// Grapheme Cluster algorithm, but it is not exactly the same. The output is
/// not forced to be monotone. This is useful for clients that want to use HarfBuzz
/// as a cheap implementation of the Unicode Grapheme Cluster algorithm.
///
/// @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES is the default, because it maintains
/// backward compatibility with older versions of HarfBuzz. New client programs that
/// do not need to maintain such backward compatibility are recommended to use
/// @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS instead of the default.
///
/// Since: 0.9.42
[AllowDuplicates]
public enum hb_buffer_cluster_level_t : c_uint
{
	/// Return cluster values grouped by graphemes into
	/// monotone order.
	HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES = 0x0,

	/// Return cluster values grouped into monotone order.
	HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS = 0x1,

	/// Don't group cluster values.
	HB_BUFFER_CLUSTER_LEVEL_CHARACTERS = 0x2,

	/// Only group clusters, but don't enforce monotone order.
	HB_BUFFER_CLUSTER_LEVEL_GRAPHEMES = 0x3,

	/// Default cluster level,
	/// equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES.
	HB_BUFFER_CLUSTER_LEVEL_DEFAULT = 0x0
}

/// Flags that control what glyph information are serialized in hb_buffer_serialize_glyphs().
///
/// Since: 0.9.20
public enum hb_buffer_serialize_flags_t : c_uint
{
	/// serialize glyph names, clusters and positions.
	HB_BUFFER_SERIALIZE_FLAG_DEFAULT = 0x0,

	/// do not serialize glyph cluster.
	HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS = 0x1,

	/// do not serialize glyph position information.
	HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS = 0x2,

	/// do no serialize glyph name.
	HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES = 0x4,

	/// serialize glyph extents.
	HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS = 0x8,

	/// serialize glyph flags. Since: 1.5.0
	HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS = 0x10,

	/// do not serialize glyph advances,
	/// glyph offsets will reflect absolute glyph positions. Since: 1.8.0.
	/// Note: when this flag is used with a partial range of the buffer (i.e.
	/// @start is not 0), calculating the absolute positions has a cost
	/// proportional to @start. If the buffer is serialized in many small
	/// chunks, this can lead to quadratic behavior. It is recommended to
	/// use a larger @buf_size to minimize this cost.
	HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES = 0x20,

	/// All currently defined flags. Since: 4.4.0
	HB_BUFFER_SERIALIZE_FLAG_DEFINED = 0x3F
}

/// The buffer serialization and de-serialization format used in
/// hb_buffer_serialize_glyphs() and hb_buffer_deserialize_glyphs().
///
/// Since: 0.9.2
public enum hb_buffer_serialize_format_t : c_uint
{
	/// a human-readable, plain text format.
	HB_BUFFER_SERIALIZE_FORMAT_TEXT = 0x54455854,

	/// a machine-readable JSON format.
	HB_BUFFER_SERIALIZE_FORMAT_JSON = 0x4A534F4E,

	/// invalid format.
	HB_BUFFER_SERIALIZE_FORMAT_INVALID = 0x0
}

/// Flags from comparing two hb_buffer_t's.
///
/// Buffer with different hb_buffer_content_type_t cannot be meaningfully
/// compared in any further detail.
///
/// For buffers with differing length, the per-glyph comparison is not
/// attempted, though we do still scan reference buffer for dotted circle and
/// `.notdef` glyphs.
///
/// If the buffers have the same length, we compare them glyph-by-glyph and
/// report which aspect(s) of the glyph info/position are different.
///
/// Since: 1.5.0
public enum hb_buffer_diff_flags_t : c_uint
{
	/// equal buffers.
	HB_BUFFER_DIFF_FLAG_EQUAL = 0x0,

	/// buffers with different
	/// hb_buffer_content_type_t.
	HB_BUFFER_DIFF_FLAG_CONTENT_TYPE_MISMATCH = 0x1,

	/// buffers with differing length.
	HB_BUFFER_DIFF_FLAG_LENGTH_MISMATCH = 0x2,

	/// `.notdef` glyph is present in the
	/// reference buffer.
	HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT = 0x4,

	/// dotted circle glyph is present
	/// in the reference buffer.
	HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT = 0x8,

	/// difference in hb_glyph_info_t.codepoint
	HB_BUFFER_DIFF_FLAG_CODEPOINT_MISMATCH = 0x10,

	/// difference in hb_glyph_info_t.cluster
	HB_BUFFER_DIFF_FLAG_CLUSTER_MISMATCH = 0x20,

	/// difference in hb_glyph_flags_t.
	HB_BUFFER_DIFF_FLAG_GLYPH_FLAGS_MISMATCH = 0x40,

	/// difference in hb_glyph_position_t.
	HB_BUFFER_DIFF_FLAG_POSITION_MISMATCH = 0x80
}

/// End-cap shape for hb_draw_line().
///
/// Since: 14.2.0
public enum hb_draw_line_cap_t : c_uint
{
	///   No cap; the line ends exactly at
	/// its endpoint.
	HB_DRAW_LINE_CAP_BUTT = 0x0,

	/// Square cap; the line is extended
	/// past its endpoint by half the local stroke width.  Useful
	/// for composing closed shapes from line segments (e.g. a
	/// rectangle made from four lines).
	HB_DRAW_LINE_CAP_SQUARE = 0x1
}

/// The values of this enumeration determine how color values
/// outside the minimum and maximum defined offset on a hb_color_line_t
/// are determined.
///
/// See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
/// section for details.
///
/// Since: 7.0.0
public enum hb_paint_extend_t : c_uint
{
	/// Outside the defined interval,
	/// the color of the closest color stop is used.
	HB_PAINT_EXTEND_PAD = 0x0,

	/// The color line is repeated over
	/// repeated multiples of the defined interval
	HB_PAINT_EXTEND_REPEAT = 0x1,

	/// The color line is repeated over
	/// repeated intervals, as for the repeat mode.
	/// However, in each repeated interval, the ordering of
	/// color stops is the reverse of the adjacent interval.
	HB_PAINT_EXTEND_REFLECT = 0x2
}

/// The values of this enumeration describe the compositing modes
/// that can be used when combining temporary redirected drawing
/// with the backdrop.
///
/// See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
/// section for details.
///
/// Since: 7.0.0
public enum hb_paint_composite_mode_t : c_uint
{
	/// clear destination layer (bounded)
	HB_PAINT_COMPOSITE_MODE_CLEAR = 0x0,

	/// replace destination layer (bounded)
	HB_PAINT_COMPOSITE_MODE_SRC = 0x1,

	/// ignore the source
	HB_PAINT_COMPOSITE_MODE_DEST = 0x2,

	/// draw source layer on top of destination layer
	/// (bounded)
	HB_PAINT_COMPOSITE_MODE_SRC_OVER = 0x3,

	/// draw destination on top of source
	HB_PAINT_COMPOSITE_MODE_DEST_OVER = 0x4,

	/// draw source where there was destination content
	/// (unbounded)
	HB_PAINT_COMPOSITE_MODE_SRC_IN = 0x5,

	/// leave destination only where there was
	/// source content (unbounded)
	HB_PAINT_COMPOSITE_MODE_DEST_IN = 0x6,

	/// draw source where there was no destination
	/// content (unbounded)
	HB_PAINT_COMPOSITE_MODE_SRC_OUT = 0x7,

	/// leave destination only where there was no
	/// source content
	HB_PAINT_COMPOSITE_MODE_DEST_OUT = 0x8,

	/// draw source on top of destination content and
	/// only there
	HB_PAINT_COMPOSITE_MODE_SRC_ATOP = 0x9,

	/// leave destination on top of source content
	/// and only there (unbounded)
	HB_PAINT_COMPOSITE_MODE_DEST_ATOP = 0xA,

	/// source and destination are shown where there is only
	/// one of them
	HB_PAINT_COMPOSITE_MODE_XOR = 0xB,

	/// source and destination layers are accumulated
	HB_PAINT_COMPOSITE_MODE_PLUS = 0xC,

	/// source and destination are complemented and
	/// multiplied. This causes the result to be at least as light as the lighter
	/// inputs.
	HB_PAINT_COMPOSITE_MODE_SCREEN = 0xD,

	/// multiplies or screens, depending on the
	/// lightness of the destination color.
	HB_PAINT_COMPOSITE_MODE_OVERLAY = 0xE,

	/// replaces the destination with the source if it
	/// is darker, otherwise keeps the source.
	HB_PAINT_COMPOSITE_MODE_DARKEN = 0xF,

	/// replaces the destination with the source if it
	/// is lighter, otherwise keeps the source.
	HB_PAINT_COMPOSITE_MODE_LIGHTEN = 0x10,

	/// brightens the destination color to reflect
	/// the source color.
	HB_PAINT_COMPOSITE_MODE_COLOR_DODGE = 0x11,

	/// darkens the destination color to reflect
	/// the source color.
	HB_PAINT_COMPOSITE_MODE_COLOR_BURN = 0x12,

	/// Multiplies or screens, dependent on source
	/// color.
	HB_PAINT_COMPOSITE_MODE_HARD_LIGHT = 0x13,

	/// Darkens or lightens, dependent on source
	/// color.
	HB_PAINT_COMPOSITE_MODE_SOFT_LIGHT = 0x14,

	/// Takes the difference of the source and
	/// destination color.
	HB_PAINT_COMPOSITE_MODE_DIFFERENCE = 0x15,

	/// Produces an effect similar to difference, but
	/// with lower contrast.
	HB_PAINT_COMPOSITE_MODE_EXCLUSION = 0x16,

	/// source and destination layers are multiplied.
	/// This causes the result to be at least as dark as the darker inputs.
	HB_PAINT_COMPOSITE_MODE_MULTIPLY = 0x17,

	/// Creates a color with the hue of the source
	/// and the saturation and luminosity of the target.
	HB_PAINT_COMPOSITE_MODE_HSL_HUE = 0x18,

	/// Creates a color with the saturation
	/// of the source and the hue and luminosity of the target. Painting with
	/// this mode onto a gray area produces no change.
	HB_PAINT_COMPOSITE_MODE_HSL_SATURATION = 0x19,

	/// Creates a color with the hue and saturation
	/// of the source and the luminosity of the target. This preserves the gray
	/// levels of the target and is useful for coloring monochrome images or
	/// tinting color images.
	HB_PAINT_COMPOSITE_MODE_HSL_COLOR = 0x1A,

	/// Creates a color with the luminosity of
	/// the source and the hue and saturation of the target. This produces an
	/// inverse effect to @HB_PAINT_COMPOSITE_MODE_HSL_COLOR.
	HB_PAINT_COMPOSITE_MODE_HSL_LUMINOSITY = 0x1B
}

/// Defined by [OpenType Design-Variation Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
///
/// Since: 3.0.0
public enum hb_style_tag_t : c_uint
{
	/// Used to vary between non-italic and italic.
	/// A value of 0 can be interpreted as "Roman" (non-italic); a value of 1 can
	/// be interpreted as (fully) italic.
	HB_STYLE_TAG_ITALIC = 0x6974616C,

	/// Used to vary design to suit different text sizes.
	/// Non-zero. Values can be interpreted as text size, in points.
	HB_STYLE_TAG_OPTICAL_SIZE = 0x6F70737A,

	/// Used to vary between upright and slanted text. Values
	/// must be greater than -90 and less than +90. Values can be interpreted as
	/// the angle, in counter-clockwise degrees, of oblique slant from whatever the
	/// designer considers to be upright for that font design. Typical right-leaning
	/// Italic fonts have a negative slant angle (typically around -12)
	HB_STYLE_TAG_SLANT_ANGLE = 0x736C6E74,

	/// same as @HB_STYLE_TAG_SLANT_ANGLE expression as ratio.
	/// Typical right-leaning Italic fonts have a positive slant ratio (typically around 0.2)
	HB_STYLE_TAG_SLANT_RATIO = 0x536C6E74,

	/// Used to vary width of text from narrower to wider.
	/// Non-zero. Values can be interpreted as a percentage of whatever the font
	/// designer considers “normal width” for that font design.
	HB_STYLE_TAG_WIDTH = 0x77647468,

	/// Used to vary stroke thicknesses or other design details
	/// to give variation from lighter to blacker. Values can be interpreted in direct
	/// comparison to values for usWeightClass in the OS/2 table,
	/// or the CSS font-weight property.
	HB_STYLE_TAG_WEIGHT = 0x77676874
}

/// Data type for the "General_Category" (gc) property from
/// the Unicode Character Database.
public enum hb_unicode_general_category_t : c_uint
{
	///              [Cc]
	HB_UNICODE_GENERAL_CATEGORY_CONTROL = 0x0,

	/// 	      [Cf]
	HB_UNICODE_GENERAL_CATEGORY_FORMAT = 0x1,

	///       [Cn]
	HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED = 0x2,

	///       [Co]
	HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE = 0x3,

	///       [Cs]
	HB_UNICODE_GENERAL_CATEGORY_SURROGATE = 0x4,

	///     [Ll]
	HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER = 0x5,

	///      [Lm]
	HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER = 0x6,

	///       [Lo]
	HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER = 0x7,

	///     [Lt]
	HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER = 0x8,

	///     [Lu]
	HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER = 0x9,

	///       [Mc]
	HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK = 0xA,

	///       [Me]
	HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK = 0xB,

	///     [Mn]
	HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK = 0xC,

	///       [Nd]
	HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER = 0xD,

	///       [Nl]
	HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER = 0xE,

	///       [No]
	HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER = 0xF,

	///  [Pc]
	HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION = 0x10,

	///     [Pd]
	HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION = 0x11,

	///    [Pe]
	HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION = 0x12,

	///    [Pf]
	HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION = 0x13,

	///  [Pi]
	HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION = 0x14,

	///    [Po]
	HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION = 0x15,

	///     [Ps]
	HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION = 0x16,

	///      [Sc]
	HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL = 0x17,

	///      [Sk]
	HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL = 0x18,

	///       [Sm]
	HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL = 0x19,

	///       [So]
	HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL = 0x1A,

	///       [Zl]
	HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR = 0x1B,

	///  [Zp]
	HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR = 0x1C,

	///      [Zs]
	HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR = 0x1D
}

/// Data type for the Canonical_Combining_Class (ccc) property
/// from the Unicode Character Database.
///
/// <note>Note: newer versions of Unicode may add new values.
/// Client programs should be ready to handle any value in the 0..254 range
/// being returned from hb_unicode_combining_class().</note>
public enum hb_unicode_combining_class_t : c_uint
{
	/// Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing
	HB_UNICODE_COMBINING_CLASS_NOT_REORDERED = 0x0,

	/// Marks which overlay a base letter or symbol
	HB_UNICODE_COMBINING_CLASS_OVERLAY = 0x1,

	/// Diacritic nukta marks in Brahmi-derived scripts
	HB_UNICODE_COMBINING_CLASS_NUKTA = 0x7,

	/// Hiragana/Katakana voicing marks
	HB_UNICODE_COMBINING_CLASS_KANA_VOICING = 0x8,

	/// Viramas
	HB_UNICODE_COMBINING_CLASS_VIRAMA = 0x9,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC10 = 0xA,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC11 = 0xB,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC12 = 0xC,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC13 = 0xD,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC14 = 0xE,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC15 = 0xF,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC16 = 0x10,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC17 = 0x11,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC18 = 0x12,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC19 = 0x13,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC20 = 0x14,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC21 = 0x15,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC22 = 0x16,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC23 = 0x17,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC24 = 0x18,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC25 = 0x19,

	/// [Hebrew]
	HB_UNICODE_COMBINING_CLASS_CCC26 = 0x1A,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC27 = 0x1B,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC28 = 0x1C,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC29 = 0x1D,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC30 = 0x1E,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC31 = 0x1F,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC32 = 0x20,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC33 = 0x21,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC34 = 0x22,

	/// [Arabic]
	HB_UNICODE_COMBINING_CLASS_CCC35 = 0x23,

	/// [Syriac]
	HB_UNICODE_COMBINING_CLASS_CCC36 = 0x24,

	/// [Telugu]
	HB_UNICODE_COMBINING_CLASS_CCC84 = 0x54,

	/// [Telugu]
	HB_UNICODE_COMBINING_CLASS_CCC91 = 0x5B,

	/// [Thai]
	HB_UNICODE_COMBINING_CLASS_CCC103 = 0x67,

	/// [Thai]
	HB_UNICODE_COMBINING_CLASS_CCC107 = 0x6B,

	/// [Lao]
	HB_UNICODE_COMBINING_CLASS_CCC118 = 0x76,

	/// [Lao]
	HB_UNICODE_COMBINING_CLASS_CCC122 = 0x7A,

	/// [Tibetan]
	HB_UNICODE_COMBINING_CLASS_CCC129 = 0x81,

	/// [Tibetan]
	HB_UNICODE_COMBINING_CLASS_CCC130 = 0x82,

	/// [Tibetan] Since: 7.2.0
	HB_UNICODE_COMBINING_CLASS_CCC132 = 0x84,

	/// Marks attached at the bottom left
	HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT = 0xC8,

	/// Marks attached directly below
	HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW = 0xCA,

	/// Marks attached directly above
	HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE = 0xD6,

	/// Marks attached at the top right
	HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT = 0xD8,

	/// Distinct marks at the bottom left
	HB_UNICODE_COMBINING_CLASS_BELOW_LEFT = 0xDA,

	/// Distinct marks directly below
	HB_UNICODE_COMBINING_CLASS_BELOW = 0xDC,

	/// Distinct marks at the bottom right
	HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT = 0xDE,

	/// Distinct marks to the left
	HB_UNICODE_COMBINING_CLASS_LEFT = 0xE0,

	/// Distinct marks to the right
	HB_UNICODE_COMBINING_CLASS_RIGHT = 0xE2,

	/// Distinct marks at the top left
	HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT = 0xE4,

	/// Distinct marks directly above
	HB_UNICODE_COMBINING_CLASS_ABOVE = 0xE6,

	/// Distinct marks at the top right
	HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT = 0xE8,

	/// Distinct marks subtending two bases
	HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW = 0xE9,

	/// Distinct marks extending above two bases
	HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE = 0xEA,

	/// Greek iota subscript only
	HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT = 0xF0,

	/// Invalid combining class
	HB_UNICODE_COMBINING_CLASS_INVALID = 0xFF
}

/// Flags that describe the properties of color palette.
///
/// Since: 2.1.0
public enum hb_ot_color_palette_flags_t : c_uint
{
	/// Default indicating that there is nothing special
	/// to note about a color palette.
	HB_OT_COLOR_PALETTE_FLAG_DEFAULT = 0x0,

	/// Flag indicating that the color
	/// palette is appropriate to use when displaying the font on a light background such as white.
	HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_LIGHT_BACKGROUND = 0x1,

	/// Flag indicating that the color
	/// palette is appropriate to use when displaying the font on a dark background such as black.
	HB_OT_COLOR_PALETTE_FLAG_USABLE_WITH_DARK_BACKGROUND = 0x2
}

/// The GDEF classes defined for glyphs.
public enum hb_ot_layout_glyph_class_t : c_uint
{
	/// Glyphs not matching the other classifications
	HB_OT_LAYOUT_GLYPH_CLASS_UNCLASSIFIED = 0x0,

	/// Spacing, single characters, capable of accepting marks
	HB_OT_LAYOUT_GLYPH_CLASS_BASE_GLYPH = 0x1,

	/// Glyphs that represent ligation of multiple characters
	HB_OT_LAYOUT_GLYPH_CLASS_LIGATURE = 0x2,

	/// Non-spacing, combining glyphs that represent marks
	HB_OT_LAYOUT_GLYPH_CLASS_MARK = 0x3,

	/// Spacing glyphs that represent part of a single character
	HB_OT_LAYOUT_GLYPH_CLASS_COMPONENT = 0x4
}

/// Baseline tags from [Baseline Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/baselinetags) registry.
///
/// Since: 2.6.0
public enum hb_ot_layout_baseline_tag_t : c_uint
{
	/// The baseline used by alphabetic scripts such as Latin, Cyrillic and Greek.
	/// In vertical writing mode, the alphabetic baseline for characters rotated 90 degrees clockwise.
	/// (This would not apply to alphabetic characters that remain upright in vertical writing mode, since these
	/// characters are not rotated.)
	HB_OT_LAYOUT_BASELINE_TAG_ROMAN = 0x726F6D6E,

	/// The hanging baseline. In horizontal direction, this is the horizontal
	/// line from which syllables seem, to hang in Tibetan and other similar scripts. In vertical writing mode,
	/// for Tibetan (or some other similar script) characters rotated 90 degrees clockwise.
	HB_OT_LAYOUT_BASELINE_TAG_HANGING = 0x68616E67,

	/// Ideographic character face bottom or left edge,
	/// if the direction is horizontal or vertical, respectively.
	HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_BOTTOM_OR_LEFT = 0x69636662,

	/// Ideographic character face top or right edge,
	/// if the direction is horizontal or vertical, respectively.
	HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_TOP_OR_RIGHT = 0x69636674,

	/// The center of the ideographic character face. Since: 4.0.0
	HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_CENTRAL = 0x49636663,

	/// Ideographic em-box bottom or left edge,
	/// if the direction is horizontal or vertical, respectively.
	HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_BOTTOM_OR_LEFT = 0x6964656F,

	/// Ideographic em-box top or right edge baseline,
	HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_TOP_OR_RIGHT = 0x69647470,

	/// The center of the ideographic em-box. Since: 4.0.0
	/// if the direction is horizontal or vertical, respectively.
	HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_CENTRAL = 0x49646365,

	/// The baseline about which mathematical characters are centered.
	/// In vertical writing mode when mathematical characters rotated 90 degrees clockwise, are centered.
	HB_OT_LAYOUT_BASELINE_TAG_MATH = 0x6D617468
}

/// The 'MATH' table constants, refer to
/// [OpenType documentation](https://docs.microsoft.com/en-us/typography/opentype/spec/mathmathconstants-table)
/// For more explanations.
///
/// Since: 1.3.3
public enum hb_ot_math_constant_t : c_uint
{
	/// scriptPercentScaleDown
	HB_OT_MATH_CONSTANT_SCRIPT_PERCENT_SCALE_DOWN = 0x0,

	/// scriptScriptPercentScaleDown
	HB_OT_MATH_CONSTANT_SCRIPT_SCRIPT_PERCENT_SCALE_DOWN = 0x1,

	/// delimitedSubFormulaMinHeight
	HB_OT_MATH_CONSTANT_DELIMITED_SUB_FORMULA_MIN_HEIGHT = 0x2,

	/// displayOperatorMinHeight
	HB_OT_MATH_CONSTANT_DISPLAY_OPERATOR_MIN_HEIGHT = 0x3,

	/// mathLeading
	HB_OT_MATH_CONSTANT_MATH_LEADING = 0x4,

	/// axisHeight
	HB_OT_MATH_CONSTANT_AXIS_HEIGHT = 0x5,

	/// accentBaseHeight
	HB_OT_MATH_CONSTANT_ACCENT_BASE_HEIGHT = 0x6,

	/// flattenedAccentBaseHeight
	HB_OT_MATH_CONSTANT_FLATTENED_ACCENT_BASE_HEIGHT = 0x7,

	/// subscriptShiftDown
	HB_OT_MATH_CONSTANT_SUBSCRIPT_SHIFT_DOWN = 0x8,

	/// subscriptTopMax
	HB_OT_MATH_CONSTANT_SUBSCRIPT_TOP_MAX = 0x9,

	/// subscriptBaselineDropMin
	HB_OT_MATH_CONSTANT_SUBSCRIPT_BASELINE_DROP_MIN = 0xA,

	/// superscriptShiftUp
	HB_OT_MATH_CONSTANT_SUPERSCRIPT_SHIFT_UP = 0xB,

	/// superscriptShiftUpCramped
	HB_OT_MATH_CONSTANT_SUPERSCRIPT_SHIFT_UP_CRAMPED = 0xC,

	/// superscriptBottomMin
	HB_OT_MATH_CONSTANT_SUPERSCRIPT_BOTTOM_MIN = 0xD,

	/// superscriptBaselineDropMax
	HB_OT_MATH_CONSTANT_SUPERSCRIPT_BASELINE_DROP_MAX = 0xE,

	/// subSuperscriptGapMin
	HB_OT_MATH_CONSTANT_SUB_SUPERSCRIPT_GAP_MIN = 0xF,

	/// superscriptBottomMaxWithSubscript
	HB_OT_MATH_CONSTANT_SUPERSCRIPT_BOTTOM_MAX_WITH_SUBSCRIPT = 0x10,

	/// spaceAfterScript
	HB_OT_MATH_CONSTANT_SPACE_AFTER_SCRIPT = 0x11,

	/// upperLimitGapMin
	HB_OT_MATH_CONSTANT_UPPER_LIMIT_GAP_MIN = 0x12,

	/// upperLimitBaselineRiseMin
	HB_OT_MATH_CONSTANT_UPPER_LIMIT_BASELINE_RISE_MIN = 0x13,

	/// lowerLimitGapMin
	HB_OT_MATH_CONSTANT_LOWER_LIMIT_GAP_MIN = 0x14,

	/// lowerLimitBaselineDropMin
	HB_OT_MATH_CONSTANT_LOWER_LIMIT_BASELINE_DROP_MIN = 0x15,

	/// stackTopShiftUp
	HB_OT_MATH_CONSTANT_STACK_TOP_SHIFT_UP = 0x16,

	/// stackTopDisplayStyleShiftUp
	HB_OT_MATH_CONSTANT_STACK_TOP_DISPLAY_STYLE_SHIFT_UP = 0x17,

	/// stackBottomShiftDown
	HB_OT_MATH_CONSTANT_STACK_BOTTOM_SHIFT_DOWN = 0x18,

	/// stackBottomDisplayStyleShiftDown
	HB_OT_MATH_CONSTANT_STACK_BOTTOM_DISPLAY_STYLE_SHIFT_DOWN = 0x19,

	/// stackGapMin
	HB_OT_MATH_CONSTANT_STACK_GAP_MIN = 0x1A,

	/// stackDisplayStyleGapMin
	HB_OT_MATH_CONSTANT_STACK_DISPLAY_STYLE_GAP_MIN = 0x1B,

	/// stretchStackTopShiftUp
	HB_OT_MATH_CONSTANT_STRETCH_STACK_TOP_SHIFT_UP = 0x1C,

	/// stretchStackBottomShiftDown
	HB_OT_MATH_CONSTANT_STRETCH_STACK_BOTTOM_SHIFT_DOWN = 0x1D,

	/// stretchStackGapAboveMin
	HB_OT_MATH_CONSTANT_STRETCH_STACK_GAP_ABOVE_MIN = 0x1E,

	/// stretchStackGapBelowMin
	HB_OT_MATH_CONSTANT_STRETCH_STACK_GAP_BELOW_MIN = 0x1F,

	/// fractionNumeratorShiftUp
	HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_SHIFT_UP = 0x20,

	/// fractionNumeratorDisplayStyleShiftUp
	HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_DISPLAY_STYLE_SHIFT_UP = 0x21,

	/// fractionDenominatorShiftDown
	HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_SHIFT_DOWN = 0x22,

	/// fractionDenominatorDisplayStyleShiftDown
	HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_DISPLAY_STYLE_SHIFT_DOWN = 0x23,

	/// fractionNumeratorGapMin
	HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_GAP_MIN = 0x24,

	/// fractionNumDisplayStyleGapMin
	HB_OT_MATH_CONSTANT_FRACTION_NUM_DISPLAY_STYLE_GAP_MIN = 0x25,

	/// fractionRuleThickness
	HB_OT_MATH_CONSTANT_FRACTION_RULE_THICKNESS = 0x26,

	/// fractionDenominatorGapMin
	HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_GAP_MIN = 0x27,

	/// fractionDenomDisplayStyleGapMin
	HB_OT_MATH_CONSTANT_FRACTION_DENOM_DISPLAY_STYLE_GAP_MIN = 0x28,

	/// skewedFractionHorizontalGap
	HB_OT_MATH_CONSTANT_SKEWED_FRACTION_HORIZONTAL_GAP = 0x29,

	/// skewedFractionVerticalGap
	HB_OT_MATH_CONSTANT_SKEWED_FRACTION_VERTICAL_GAP = 0x2A,

	/// overbarVerticalGap
	HB_OT_MATH_CONSTANT_OVERBAR_VERTICAL_GAP = 0x2B,

	/// overbarRuleThickness
	HB_OT_MATH_CONSTANT_OVERBAR_RULE_THICKNESS = 0x2C,

	/// overbarExtraAscender
	HB_OT_MATH_CONSTANT_OVERBAR_EXTRA_ASCENDER = 0x2D,

	/// underbarVerticalGap
	HB_OT_MATH_CONSTANT_UNDERBAR_VERTICAL_GAP = 0x2E,

	/// underbarRuleThickness
	HB_OT_MATH_CONSTANT_UNDERBAR_RULE_THICKNESS = 0x2F,

	/// underbarExtraDescender
	HB_OT_MATH_CONSTANT_UNDERBAR_EXTRA_DESCENDER = 0x30,

	/// radicalVerticalGap
	HB_OT_MATH_CONSTANT_RADICAL_VERTICAL_GAP = 0x31,

	/// radicalDisplayStyleVerticalGap
	HB_OT_MATH_CONSTANT_RADICAL_DISPLAY_STYLE_VERTICAL_GAP = 0x32,

	/// radicalRuleThickness
	HB_OT_MATH_CONSTANT_RADICAL_RULE_THICKNESS = 0x33,

	/// radicalExtraAscender
	HB_OT_MATH_CONSTANT_RADICAL_EXTRA_ASCENDER = 0x34,

	/// radicalKernBeforeDegree
	HB_OT_MATH_CONSTANT_RADICAL_KERN_BEFORE_DEGREE = 0x35,

	/// radicalKernAfterDegree
	HB_OT_MATH_CONSTANT_RADICAL_KERN_AFTER_DEGREE = 0x36,

	/// radicalDegreeBottomRaisePercent
	HB_OT_MATH_CONSTANT_RADICAL_DEGREE_BOTTOM_RAISE_PERCENT = 0x37
}

/// The math kerning-table types defined for the four corners
/// of a glyph.
///
/// Since: 1.3.3
public enum hb_ot_math_kern_t : c_uint
{
	/// The top right corner of the glyph.
	HB_OT_MATH_KERN_TOP_RIGHT = 0x0,

	/// The top left corner of the glyph.
	HB_OT_MATH_KERN_TOP_LEFT = 0x1,

	/// The bottom right corner of the glyph.
	HB_OT_MATH_KERN_BOTTOM_RIGHT = 0x2,

	/// The bottom left corner of the glyph.
	HB_OT_MATH_KERN_BOTTOM_LEFT = 0x3
}

/// Flags for math glyph parts.
///
/// Since: 1.3.3
public enum hb_ot_math_glyph_part_flags_t : c_uint
{
	/// This is an extender glyph part that
	/// can be repeated to reach the desired length.
	HB_OT_MATH_GLYPH_PART_FLAG_EXTENDER = 0x1
}

/// Known metadata tags from https://docs.microsoft.com/en-us/typography/opentype/spec/meta
///
/// Since: 2.6.0
public enum hb_ot_meta_tag_t : c_uint
{
	/// Design languages. Text, using only
	/// Basic Latin (ASCII) characters. Indicates languages and/or scripts
	/// for the user audiences that the font was primarily designed for.
	HB_OT_META_TAG_DESIGN_LANGUAGES = 0x646C6E67,

	/// Supported languages. Text, using
	/// only Basic Latin (ASCII) characters. Indicates languages and/or scripts
	/// that the font is declared to be capable of supporting.
	HB_OT_META_TAG_SUPPORTED_LANGUAGES = 0x736C6E67
}

/// Metric tags corresponding to [MVAR Value
/// Tags](https://docs.microsoft.com/en-us/typography/opentype/spec/mvarvalue-tags)
///
/// Since: 2.6.0
public enum hb_ot_metrics_tag_t : c_uint
{
	/// horizontal ascender.
	HB_OT_METRICS_TAG_HORIZONTAL_ASCENDER = 0x68617363,

	/// horizontal descender.
	HB_OT_METRICS_TAG_HORIZONTAL_DESCENDER = 0x68647363,

	/// horizontal line gap.
	HB_OT_METRICS_TAG_HORIZONTAL_LINE_GAP = 0x686C6770,

	/// horizontal clipping ascent.
	HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_ASCENT = 0x68636C61,

	/// horizontal clipping descent.
	HB_OT_METRICS_TAG_HORIZONTAL_CLIPPING_DESCENT = 0x68636C64,

	/// vertical ascender.
	HB_OT_METRICS_TAG_VERTICAL_ASCENDER = 0x76617363,

	/// vertical descender.
	HB_OT_METRICS_TAG_VERTICAL_DESCENDER = 0x76647363,

	/// vertical line gap.
	HB_OT_METRICS_TAG_VERTICAL_LINE_GAP = 0x766C6770,

	/// horizontal caret rise.
	HB_OT_METRICS_TAG_HORIZONTAL_CARET_RISE = 0x68637273,

	/// horizontal caret run.
	HB_OT_METRICS_TAG_HORIZONTAL_CARET_RUN = 0x6863726E,

	/// horizontal caret offset.
	HB_OT_METRICS_TAG_HORIZONTAL_CARET_OFFSET = 0x68636F66,

	/// vertical caret rise.
	HB_OT_METRICS_TAG_VERTICAL_CARET_RISE = 0x76637273,

	/// vertical caret run.
	HB_OT_METRICS_TAG_VERTICAL_CARET_RUN = 0x7663726E,

	/// vertical caret offset.
	HB_OT_METRICS_TAG_VERTICAL_CARET_OFFSET = 0x76636F66,

	/// x height.
	HB_OT_METRICS_TAG_X_HEIGHT = 0x78686774,

	/// cap height.
	HB_OT_METRICS_TAG_CAP_HEIGHT = 0x63706874,

	/// subscript em x size.
	HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_SIZE = 0x73627873,

	/// subscript em y size.
	HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_SIZE = 0x73627973,

	/// subscript em x offset.
	HB_OT_METRICS_TAG_SUBSCRIPT_EM_X_OFFSET = 0x7362786F,

	/// subscript em y offset.
	HB_OT_METRICS_TAG_SUBSCRIPT_EM_Y_OFFSET = 0x7362796F,

	/// superscript em x size.
	HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_SIZE = 0x73707873,

	/// superscript em y size.
	HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_SIZE = 0x73707973,

	/// superscript em x offset.
	HB_OT_METRICS_TAG_SUPERSCRIPT_EM_X_OFFSET = 0x7370786F,

	/// superscript em y offset.
	HB_OT_METRICS_TAG_SUPERSCRIPT_EM_Y_OFFSET = 0x7370796F,

	/// strikeout size.
	HB_OT_METRICS_TAG_STRIKEOUT_SIZE = 0x73747273,

	/// strikeout offset.
	HB_OT_METRICS_TAG_STRIKEOUT_OFFSET = 0x7374726F,

	/// underline size.
	HB_OT_METRICS_TAG_UNDERLINE_SIZE = 0x756E6473,

	/// underline offset.
	HB_OT_METRICS_TAG_UNDERLINE_OFFSET = 0x756E646F
}

/// An enum type representing the pre-defined name IDs.
///
/// For more information on these fields, see the
/// [OpenType spec](https://docs.microsoft.com/en-us/typography/opentype/spec/namename-ids).
///
/// Since: 7.0.0
public enum hb_ot_name_id_predefined_t : c_uint
{
	/// Copyright notice
	HB_OT_NAME_ID_COPYRIGHT = 0x0,

	/// Font Family name
	HB_OT_NAME_ID_FONT_FAMILY = 0x1,

	/// Font Subfamily name
	HB_OT_NAME_ID_FONT_SUBFAMILY = 0x2,

	/// Unique font identifier
	HB_OT_NAME_ID_UNIQUE_ID = 0x3,

	/// Full font name that reflects
	/// all family and relevant subfamily descriptors
	HB_OT_NAME_ID_FULL_NAME = 0x4,

	/// Version string
	HB_OT_NAME_ID_VERSION_STRING = 0x5,

	/// PostScript name for the font
	HB_OT_NAME_ID_POSTSCRIPT_NAME = 0x6,

	/// Trademark
	HB_OT_NAME_ID_TRADEMARK = 0x7,

	/// Manufacturer Name
	HB_OT_NAME_ID_MANUFACTURER = 0x8,

	/// Designer
	HB_OT_NAME_ID_DESIGNER = 0x9,

	/// Description
	HB_OT_NAME_ID_DESCRIPTION = 0xA,

	/// URL of font vendor
	HB_OT_NAME_ID_VENDOR_URL = 0xB,

	/// URL of typeface designer
	HB_OT_NAME_ID_DESIGNER_URL = 0xC,

	/// License Description
	HB_OT_NAME_ID_LICENSE = 0xD,

	/// URL where additional licensing
	/// information can be found
	HB_OT_NAME_ID_LICENSE_URL = 0xE,

	/// Typographic Family name
	HB_OT_NAME_ID_TYPOGRAPHIC_FAMILY = 0x10,

	/// Typographic Subfamily name
	HB_OT_NAME_ID_TYPOGRAPHIC_SUBFAMILY = 0x11,

	/// Compatible Full Name for MacOS
	HB_OT_NAME_ID_MAC_FULL_NAME = 0x12,

	/// Sample text
	HB_OT_NAME_ID_SAMPLE_TEXT = 0x13,

	/// PostScript CID findfont name
	HB_OT_NAME_ID_CID_FINDFONT_NAME = 0x14,

	/// WWS Family Name
	HB_OT_NAME_ID_WWS_FAMILY = 0x15,

	/// WWS Subfamily Name
	HB_OT_NAME_ID_WWS_SUBFAMILY = 0x16,

	/// Light Background Palette
	HB_OT_NAME_ID_LIGHT_BACKGROUND = 0x17,

	/// Dark Background Palette
	HB_OT_NAME_ID_DARK_BACKGROUND = 0x18,

	/// Variations PostScript Name Prefix
	HB_OT_NAME_ID_VARIATIONS_PS_PREFIX = 0x19,

	/// Value to represent a nonexistent name ID.
	HB_OT_NAME_ID_INVALID = 0xFFFF
}

/// Flags for hb_ot_var_axis_info_t.
///
/// Since: 2.2.0
public enum hb_ot_var_axis_flags_t : c_uint
{
	/// The axis should not be exposed directly in user interfaces.
	HB_OT_VAR_AXIS_FLAG_HIDDEN = 0x1
}

/// The possible feature types defined for AAT shaping, from Apple [Font Feature Registry](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.html).
///
/// Since: 2.2.0
public enum hb_aat_layout_feature_type_t : c_uint
{
	/// Initial, unset feature type
	HB_AAT_LAYOUT_FEATURE_TYPE_INVALID = 0xFFFF,

	/// [All Typographic Features](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType0)
	HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC = 0x0,

	/// [Ligatures](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType1)
	HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES = 0x1,

	/// [Cursive Connection](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType2)
	HB_AAT_LAYOUT_FEATURE_TYPE_CURSIVE_CONNECTION = 0x2,

	/// [Letter Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType3)
	HB_AAT_LAYOUT_FEATURE_TYPE_LETTER_CASE = 0x3,

	/// [Vertical Substitution](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType4)
	HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION = 0x4,

	/// [Linguistic Rearrangement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType5)
	HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT = 0x5,

	/// [Number Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType6)
	HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING = 0x6,

	/// [Smart Swash](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType8)
	HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE = 0x8,

	/// [Diacritics](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType9)
	HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE = 0x9,

	/// [Vertical Position](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType10)
	HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION = 0xA,

	/// [Fractions](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType11)
	HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS = 0xB,

	/// [Overlapping Characters](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType13)
	HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE = 0xD,

	/// [Typographic Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType14)
	HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS = 0xE,

	/// [Mathematical Extras](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType15)
	HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS = 0xF,

	/// [Ornament Sets](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType16)
	HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE = 0x10,

	/// [Character Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType17)
	HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_ALTERNATIVES = 0x11,

	/// [Design Complexity](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType18)
	HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE = 0x12,

	/// [Style Options](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType19)
	HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS = 0x13,

	/// [Character Shape](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType20)
	HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE = 0x14,

	/// [Number Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType21)
	HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE = 0x15,

	/// [Text Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType22)
	HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING = 0x16,

	/// [Transliteration](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType23)
	HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION = 0x17,

	/// [Annotation](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType24)
	HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE = 0x18,

	/// [Kana Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType25)
	HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE = 0x19,

	/// [Ideographic Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType26)
	HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE = 0x1A,

	/// [Unicode Decomposition](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType27)
	HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE = 0x1B,

	/// [Ruby Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType28)
	HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA = 0x1C,

	/// [CJK Symbol Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType29)
	HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE = 0x1D,

	/// [Ideographic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType30)
	HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE = 0x1E,

	/// [CJK Vertical Roman Placement](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType31)
	HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE = 0x1F,

	/// [Italic CJK Roman](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType32)
	HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN = 0x20,

	/// [Case Sensitive Layout](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType33)
	HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT = 0x21,

	/// [Alternate Kana](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType34)
	HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA = 0x22,

	/// [Stylistic Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType35)
	HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES = 0x23,

	/// [Contextual Alternatives](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType36)
	HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES = 0x24,

	/// [Lower Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType37)
	HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE = 0x25,

	/// [Upper Case](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType38)
	HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE = 0x26,

	/// [Language Tag](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType39)
	HB_AAT_LAYOUT_FEATURE_TYPE_LANGUAGE_TAG_TYPE = 0x27,

	/// [CJK Roman Spacing](https://developer.apple.com/fonts/TrueType-Reference-Manual/RM09/AppendixF.htmlType103)
	HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE = 0x67
}

/// The selectors defined for specifying AAT feature settings.
///
/// Since: 2.2.0
[AllowDuplicates]
public enum hb_aat_layout_feature_selector_t : c_uint
{
	/// Initial, unset feature selector
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INVALID = 0xFFFF,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALL_TYPE_FEATURES_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ALL_TYPOGRAPHIC
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALL_TYPE_FEATURES_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_REQUIRED_LIGATURES_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_REQUIRED_LIGATURES_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_COMMON_LIGATURES_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_COMMON_LIGATURES_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_RARE_LIGATURES_ON = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_RARE_LIGATURES_OFF = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LOGOS_ON = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LOGOS_OFF = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_REBUS_PICTURES_ON = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_REBUS_PICTURES_OFF = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DIPHTHONG_LIGATURES_ON = 0xA,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DIPHTHONG_LIGATURES_OFF = 0xB,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SQUARED_LIGATURES_ON = 0xC,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SQUARED_LIGATURES_OFF = 0xD,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ABBREV_SQUARED_LIGATURES_ON = 0xE,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ABBREV_SQUARED_LIGATURES_OFF = 0xF,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SYMBOL_LIGATURES_ON = 0x10,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SYMBOL_LIGATURES_OFF = 0x11,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CONTEXTUAL_LIGATURES_ON = 0x12,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CONTEXTUAL_LIGATURES_OFF = 0x13,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HISTORICAL_LIGATURES_ON = 0x14,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HISTORICAL_LIGATURES_OFF = 0x15,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_UNCONNECTED = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PARTIALLY_CONNECTED = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LIGATURES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CURSIVE = 0x2,

	/// Deprecated
	HB_AAT_LAYOUT_FEATURE_SELECTOR_UPPER_AND_LOWER_CASE = 0x0,

	/// Deprecated
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALL_CAPS = 0x1,

	/// Deprecated
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALL_LOWER_CASE = 0x2,

	/// Deprecated
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SMALL_CAPS = 0x3,

	/// Deprecated
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INITIAL_CAPS = 0x4,

	/// Deprecated
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INITIAL_CAPS_AND_SMALL_CAPS = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SUBSTITUTE_VERTICAL_FORMS_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_SUBSTITUTION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SUBSTITUTE_VERTICAL_FORMS_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LINGUISTIC_REARRANGEMENT_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LINGUISTIC_REARRANGEMENT
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LINGUISTIC_REARRANGEMENT_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_MONOSPACED_NUMBERS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PROPORTIONAL_NUMBERS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_THIRD_WIDTH_NUMBERS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_QUARTER_WIDTH_NUMBERS = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_WORD_INITIAL_SWASHES_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_WORD_INITIAL_SWASHES_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_WORD_FINAL_SWASHES_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_WORD_FINAL_SWASHES_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LINE_INITIAL_SWASHES_ON = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LINE_INITIAL_SWASHES_OFF = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LINE_FINAL_SWASHES_ON = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LINE_FINAL_SWASHES_OFF = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NON_FINAL_SWASHES_ON = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_SMART_SWASH_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NON_FINAL_SWASHES_OFF = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SHOW_DIACRITICS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HIDE_DIACRITICS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DIACRITICS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DECOMPOSE_DIACRITICS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NORMAL_POSITION = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SUPERIORS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INFERIORS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ORDINALS = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_VERTICAL_POSITION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SCIENTIFIC_INFERIORS = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_FRACTIONS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_VERTICAL_FRACTIONS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_FRACTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DIAGONAL_FRACTIONS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PREVENT_OVERLAP_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_OVERLAPPING_CHARACTERS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PREVENT_OVERLAP_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HYPHENS_TO_EM_DASH_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HYPHENS_TO_EM_DASH_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HYPHEN_TO_EN_DASH_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HYPHEN_TO_EN_DASH_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SLASHED_ZERO_ON = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SLASHED_ZERO_OFF = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_FORM_INTERROBANG_ON = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_FORM_INTERROBANG_OFF = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SMART_QUOTES_ON = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SMART_QUOTES_OFF = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PERIODS_TO_ELLIPSIS_ON = 0xA,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TYPOGRAPHIC_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PERIODS_TO_ELLIPSIS_OFF = 0xB,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HYPHEN_TO_MINUS_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HYPHEN_TO_MINUS_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ASTERISK_TO_MULTIPLY_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ASTERISK_TO_MULTIPLY_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SLASH_TO_DIVIDE_ON = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SLASH_TO_DIVIDE_OFF = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INEQUALITY_LIGATURES_ON = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INEQUALITY_LIGATURES_OFF = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_EXPONENTS_ON = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_EXPONENTS_OFF = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_MATHEMATICAL_GREEK_ON = 0xA,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_MATHEMATICAL_EXTRAS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_MATHEMATICAL_GREEK_OFF = 0xB,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_ORNAMENTS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DINGBATS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PI_CHARACTERS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_FLEURONS = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DECORATIVE_BORDERS = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INTERNATIONAL_SYMBOLS = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ORNAMENT_SETS_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_MATH_SYMBOLS = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_ALTERNATES = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DESIGN_LEVEL1 = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DESIGN_LEVEL2 = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DESIGN_LEVEL3 = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DESIGN_LEVEL4 = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_DESIGN_COMPLEXITY_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DESIGN_LEVEL5 = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_STYLE_OPTIONS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DISPLAY_TEXT = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ENGRAVED_TEXT = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ILLUMINATED_CAPS = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TITLING_CAPS = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLE_OPTIONS
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TALL_CAPS = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRADITIONAL_CHARACTERS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SIMPLIFIED_CHARACTERS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_JIS1978_CHARACTERS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_JIS1983_CHARACTERS = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_JIS1990_CHARACTERS = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRADITIONAL_ALT_ONE = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRADITIONAL_ALT_TWO = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRADITIONAL_ALT_THREE = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRADITIONAL_ALT_FOUR = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRADITIONAL_ALT_FIVE = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_EXPERT_CHARACTERS = 0xA,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_JIS2004_CHARACTERS = 0xB,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HOJO_CHARACTERS = 0xC,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NLCCHARACTERS = 0xD,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CHARACTER_SHAPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRADITIONAL_NAMES_CHARACTERS = 0xE,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LOWER_CASE_NUMBERS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_NUMBER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_UPPER_CASE_NUMBERS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PROPORTIONAL_TEXT = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_MONOSPACED_TEXT = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HALF_WIDTH_TEXT = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_THIRD_WIDTH_TEXT = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_QUARTER_WIDTH_TEXT = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALT_PROPORTIONAL_TEXT = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TEXT_SPACING
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALT_HALF_WIDTH_TEXT = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_TRANSLITERATION = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HANJA_TO_HANGUL = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HIRAGANA_TO_KATAKANA = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_KATAKANA_TO_HIRAGANA = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_KANA_TO_ROMANIZATION = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ROMANIZATION_TO_HIRAGANA = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ROMANIZATION_TO_KATAKANA = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HANJA_TO_HANGUL_ALT_ONE = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HANJA_TO_HANGUL_ALT_TWO = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_TRANSLITERATION
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HANJA_TO_HANGUL_ALT_THREE = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_ANNOTATION = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_BOX_ANNOTATION = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ROUNDED_BOX_ANNOTATION = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CIRCLE_ANNOTATION = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INVERTED_CIRCLE_ANNOTATION = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PARENTHESIS_ANNOTATION = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PERIOD_ANNOTATION = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ROMAN_NUMERAL_ANNOTATION = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DIAMOND_ANNOTATION = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INVERTED_BOX_ANNOTATION = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ANNOTATION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_INVERTED_ROUNDED_BOX_ANNOTATION = 0xA,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_FULL_WIDTH_KANA = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_KANA_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PROPORTIONAL_KANA = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_FULL_WIDTH_IDEOGRAPHS = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PROPORTIONAL_IDEOGRAPHS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HALF_WIDTH_IDEOGRAPHS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CANONICAL_COMPOSITION_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CANONICAL_COMPOSITION_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_COMPATIBILITY_COMPOSITION_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_COMPATIBILITY_COMPOSITION_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRANSCODING_COMPOSITION_ON = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UNICODE_DECOMPOSITION_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_TRANSCODING_COMPOSITION_OFF = 0x5,

	/// Deprecated; use HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_OFF instead
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_RUBY_KANA = 0x0,

	/// Deprecated; use HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_ON instead
	HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
	HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_RUBY_KANA
	HB_AAT_LAYOUT_FEATURE_SELECTOR_RUBY_KANA_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_CJK_SYMBOL_ALTERNATIVES = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_SYMBOL_ALT_ONE = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_SYMBOL_ALT_TWO = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_SYMBOL_ALT_THREE = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_SYMBOL_ALT_FOUR = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_SYMBOL_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_SYMBOL_ALT_FIVE = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_IDEOGRAPHIC_ALTERNATIVES = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_IDEOGRAPHIC_ALT_ONE = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_IDEOGRAPHIC_ALT_TWO = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_IDEOGRAPHIC_ALT_THREE = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_IDEOGRAPHIC_ALT_FOUR = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_IDEOGRAPHIC_ALTERNATIVES_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_IDEOGRAPHIC_ALT_FIVE = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_VERTICAL_ROMAN_CENTERED = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_VERTICAL_ROMAN_PLACEMENT_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_VERTICAL_ROMAN_HBASELINE = 0x1,

	/// Deprecated; use HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_OFF instead
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_CJK_ITALIC_ROMAN = 0x0,

	/// Deprecated; use HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_ON instead
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ITALIC_CJK_ROMAN
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CJK_ITALIC_ROMAN_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CASE_SENSITIVE_LAYOUT_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CASE_SENSITIVE_LAYOUT_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CASE_SENSITIVE_SPACING_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CASE_SENSITIVE_LAYOUT
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CASE_SENSITIVE_SPACING_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALTERNATE_HORIZ_KANA_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALTERNATE_HORIZ_KANA_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALTERNATE_VERT_KANA_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_ALTERNATE_KANA
	HB_AAT_LAYOUT_FEATURE_SELECTOR_ALTERNATE_VERT_KANA_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_NO_STYLISTIC_ALTERNATES = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_ONE_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_ONE_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TWO_ON = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TWO_OFF = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_THREE_ON = 0x6,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_THREE_OFF = 0x7,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FOUR_ON = 0x8,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FOUR_OFF = 0x9,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FIVE_ON = 0xA,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FIVE_OFF = 0xB,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SIX_ON = 0xC,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SIX_OFF = 0xD,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SEVEN_ON = 0xE,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SEVEN_OFF = 0xF,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_EIGHT_ON = 0x10,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_EIGHT_OFF = 0x11,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_NINE_ON = 0x12,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_NINE_OFF = 0x13,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TEN_ON = 0x14,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TEN_OFF = 0x15,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_ELEVEN_ON = 0x16,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_ELEVEN_OFF = 0x17,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TWELVE_ON = 0x18,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TWELVE_OFF = 0x19,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_THIRTEEN_ON = 0x1A,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_THIRTEEN_OFF = 0x1B,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FOURTEEN_ON = 0x1C,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FOURTEEN_OFF = 0x1D,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FIFTEEN_ON = 0x1E,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_FIFTEEN_OFF = 0x1F,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SIXTEEN_ON = 0x20,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SIXTEEN_OFF = 0x21,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SEVENTEEN_ON = 0x22,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_SEVENTEEN_OFF = 0x23,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_EIGHTEEN_ON = 0x24,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_EIGHTEEN_OFF = 0x25,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_NINETEEN_ON = 0x26,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_NINETEEN_OFF = 0x27,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TWENTY_ON = 0x28,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_STYLISTIC_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_STYLISTIC_ALT_TWENTY_OFF = 0x29,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CONTEXTUAL_ALTERNATES_ON = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CONTEXTUAL_ALTERNATES_OFF = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SWASH_ALTERNATES_ON = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_SWASH_ALTERNATES_OFF = 0x3,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CONTEXTUAL_SWASH_ALTERNATES_ON = 0x4,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CONTEXTUAL_ALTERNATIVES
	HB_AAT_LAYOUT_FEATURE_SELECTOR_CONTEXTUAL_SWASH_ALTERNATES_OFF = 0x5,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DEFAULT_LOWER_CASE = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LOWER_CASE_SMALL_CAPS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_LOWER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_LOWER_CASE_PETITE_CAPS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DEFAULT_UPPER_CASE = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_UPPER_CASE_SMALL_CAPS = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_UPPER_CASE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_UPPER_CASE_PETITE_CAPS = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_HALF_WIDTH_CJK_ROMAN = 0x0,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_PROPORTIONAL_CJK_ROMAN = 0x1,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_DEFAULT_CJK_ROMAN = 0x2,

	/// for HB_AAT_LAYOUT_FEATURE_TYPE_CJK_ROMAN_SPACING_TYPE
	HB_AAT_LAYOUT_FEATURE_SELECTOR_FULL_WIDTH_CJK_ROMAN = 0x3
}
