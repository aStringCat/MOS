#include <asm/asm.h>

/* ----- MOS EXERCISE 4 msyscall BEGIN ----- */
LEAF(msyscall)
	// Just use 'syscall' instruction and return.

		syscall
	jr      ra
	END(msyscall)
/* ----- MOS EXERCISE END ----- */
