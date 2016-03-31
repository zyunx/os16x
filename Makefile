CFLAGS=-nostdlib

.PHONY: test run

os.o: os.S
	$(CC) $(CFLAGS) -c os.S

bootsec: os.o os.lds
	ld -T os.lds -o bootsec os.o

test: bootsec
	dd if=bootsec of=/dev/sdc
	qemu-system-i386 -hdc /dev/sdc	

run:
	qemu-system-i386 -hdc /dev/sdc
