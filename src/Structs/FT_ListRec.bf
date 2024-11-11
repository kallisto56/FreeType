namespace FreeType;


using System;
using System.Interop;


/**
 * A structure used to hold a simple doubly-linked list. These are used
 * in many parts of FreeType.
 */
[CRepr]
struct FT_ListRec
{
	public FT_ListNode head;
	public FT_ListNode tail;
}