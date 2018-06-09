VERSION=c2.0.0

DESTDIR=
INSTALL=install
SED=sed
LANGUAGES=es el uk it sv fa nl ru nb id tr fr de pl pt_PT pt_BR

install: install-bin install-doc

install-bin:
	$(INSTALL) -d -m 755 $(DESTDIR)/sbin
	$(INSTALL) -p -m 755 src/sbin/* $(DESTDIR)/sbin
	$(SED) -i $(DESTDIR)/sbin/pkgtool -e 's/@VERSION@/$(VERSION)/g'
	$(INSTALL) -d -m 755 $(DESTDIR)/var/log/setup
	$(INSTALL) -d -m 700 $(DESTDIR)/var/log/setup/tmp
	$(INSTALL) -p -m 755 src/var/log/setup/setup.* $(DESTDIR)/var/log/setup

install-doc:
	$(INSTALL) -d -m 755 $(DESTDIR)/usr/share/man/man8
	$(INSTALL) -p -m 644 src/usr/share/man/man8/*.8 $(DESTDIR)/usr/share/man/man8
	for language in $(LANGUAGES); do \
		$(INSTALL) -d -m 755 $(DESTDIR)/usr/share/man/$$language/man8; \
		$(INSTALL) -p -m 644 src/usr/share/man/$$language/man8/*.8 $(DESTDIR)/usr/share/man/$$language/man8; \
	done

