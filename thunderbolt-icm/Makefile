KVER?= $(shell uname -r)
obj-m += thunderbolt-icm.o
thunderbolt-icm-objs := icm_nhi.o net.o

all:
	make -C /lib/modules/$(KVER)/build M=`pwd` modules

clean:
	make -C /lib/modules/$(KVER)/build M=`pwd` clean
