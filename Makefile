objects = boot.o kernel.o

kernel.bin: $(objects) linker.ld
	i686-elf-gcc -T linker.ld -o kernel.bin -ffreestanding -O2 -nostdlib $(objects) -lgcc

%.o: %.s
	i686-elf-as $< -o $@

%.o: %.c
	i686-elf-gcc -c $< -o $@ -std=gnu99 -ffreestanding -O2 -Wall -Wextra

clean:
	rm -f kernel.bin $(objects)
