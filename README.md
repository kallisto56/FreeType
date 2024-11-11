# FreeType for BeefLang
This repository contains [Beef](https://www.beeflang.org) bindings for [FreeType](https://freetype.org). It is not complete, but enough for you to be able to load a font, render glyphs and extract metrics (see [example project](https://github.com/kallisto56/FreeType.UsageExample)). This repository contains only bindings and precompiled binaries.

Current version of FreeType: `2.13.3`

Precompiled binaries for:
- Windows x64 (Debug/Release);

### Notes
In FreeType, the following approach is used to define structures and their corresponding type aliases:
```C
typedef struct  FT_LibraryRec_
{
	// ...

} FT_LibraryRec;

typedef struct FT_LibraryRec_ *FT_Library;
```
In Beef, I've adapted this approach to align as closely as possible with the original to avoid any confusion.

At the same time, signature of some functions were slightly changed to make it more comfortable to use in Beef, for example: `FT_Get_Kerning` has `out` modifier instead of `FT_Vector*`.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

### FreeType License

This project uses the FreeType library, which is licensed under the FreeType License. For more information, see the [FreeType License](https://www.freetype.org/license.html)