#include <string.h>
/* $Id: strchr.c,v 1.3 93/05/05 21:18:33 sjg Exp $ */

/*
 * strchr - find first occurrence of a character in a string
 */

char *				/* found char, or NULL if none */
strchr(s, charwanted)
const char *s;
register char charwanted;
{
	register const char *scan;

	/*
	 * The odd placement of the two tests is so NUL is findable.
	 */
	for (scan = s; *scan != charwanted;)	/* ++ moved down for opt. */
		if (*scan++ == '\0')
			return(NULL);
	return(scan);
}
