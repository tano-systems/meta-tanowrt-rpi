# This file Copyright (C) 2019 Anton Kikin <a.kikin@tano-systems.com>

PR_append = ".rpi0"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/patches:${THISDIR}/${PN}/files:"

COMPATIBLE_MACHINE = "^rpi$"

do_install() {
	install -d ${D}${sysconfdir}
	install -m 0644 ${WORKDIR}/inittab ${D}${sysconfdir}/inittab
}
