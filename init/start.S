#include <asm/asm.h>
#include <mmu.h>

.text
EXPORT(_start)
.set at
.set reorder
/* ----- MOS KEY-CODE 1 enter-kernel AFTER readelf-main BEGIN ----- */
	/* clear .bss segment */
	la      v0, bss_start
	la      v1, bss_end
clear_bss_loop:
	beq     v0, v1, clear_bss_done
	sb      zero, 0(v0)
	addiu   v0, v0, 1
	j       clear_bss_loop
/* ----- MOS KEY-CODE END ----- */

clear_bss_done:
	/* disable interrupts */
	mtc0    zero, CP0_STATUS

	/* ----- MOS EXERCISE 1 boot AFTER basic-lds BEGIN ----- */
	/* hint: you can refer to the memory layout in include/mmu.h */
	/* set up the kernel stack */
		li      sp, KSTACKTOP
	
	/* jump to mips_init */
		j       mips_init
		/* ----- MOS EXERCISE END ----- */
