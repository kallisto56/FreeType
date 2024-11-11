namespace FreeType;


using System;
using System.Interop;


/**
 * A structure used to hold a single list element.
 */
[CRepr]
struct FT_ListNodeRec
{
	public FT_ListNode prev;
	public FT_ListNode next;
	public void* data;
}


/**
 * Many elements and objects in FreeType are listed through an @FT_List
 * record (see @FT_ListRec).  As its name suggests, an FT_ListNode is a
 * handle to a single list element.
 */
typealias FT_ListNode = FT_ListNodeRec*;