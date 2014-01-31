#/usr/bin/make
SRC = $(DESTDIR)/usr/src
SHARE = $(DESTDIR)/usr/share/$(NAME)-dkms

all:

clean:

install:

#source tree
ifeq ("$(wildcard $(NAME))", "$(NAME)")
	cp -a "$(NAME)" "$(SRC)/$(NAME)-$(VERSION)"
	chmod 644 -R "$(SRC)/$(NAME)-$(VERSION)"
endif

#tarball, possibly with binaries
ifeq ("$(wildcard $(NAME)-$(VERSION).dkms.tar.gz)", "$(NAME)-$(VERSION).dkms.tar.gz")
	install -d "$(SHARE)"
	install -m 644 $(NAME)-$(VERSION).dkms.tar.gz "$(SHARE)"
endif

#postinst, only if we are supporting legacy mode
ifeq ("$(wildcard common.postinst)", "common.postinst")
	install -d "$(SHARE)"
	install -m 755 $(PREFIX)/usr/lib/dkms/common.postinst $(SHARE)/postinst
endif

#force, force install modules
ifeq ("$(wildcard $(NAME).force)", "$(NAME).force")
	install -d $(DESTDIR)/usr/share/dkms/modules_to_force_install
	install -m 644 $(NAME).force $(DESTDIR)/usr/share/dkms/modules_to_force_install
endif
