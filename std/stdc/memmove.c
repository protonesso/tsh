/* $Id: memmove.c,v 1.3 93/05/05 21:18:14 sjg Exp $ */

#include "stdh.h"

void *
memmove(dap, sap, n)
	void *dap;
	const void *sap;
	register size_t n;
{
	register char *dp = dap, *sp = (void*) sap;

	if (n <= 0)
		;
	else if (dp < sp)
		do *dp++ = *sp++; while (--n > 0);
	else if (dp > sp) {
		dp += n;
		sp += n;
		do *--dp = *--sp; while (--n > 0);
	}
	return dap;
}


