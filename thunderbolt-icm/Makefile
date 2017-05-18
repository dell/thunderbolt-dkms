KVER?= $(shell uname -r)
obj-m := thunderbolt.o
thunderbolt-objs := nhi.o ctl.o tb.o switch.o cap.o path.o tunnel_pci.o eeprom.o
thunderbolt-objs += domain.o dma_port.o icm.o

all:
	make -C /lib/modules/$(KVER)/build M=`pwd` modules

clean:
	make -C /lib/modules/$(KVER)/build M=`pwd` clean
