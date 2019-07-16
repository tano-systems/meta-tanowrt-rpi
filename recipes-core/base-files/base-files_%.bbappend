# This file Copyright (C) 2019 Anton Kikin <a.kikin@tano-systems.com>

PR_append = ".rpi0"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}/patches:${THISDIR}/${PN}/files:"

RDEPENDS_${PN} += "util-linux-partx"

COMPATIBLE_MACHINE = "^rpi$"

SRC_URI += "\
	file://rootfs/etc/diag.sh \
	file://rootfs/etc/board.d/02_network \
	file://rootfs/lib/preinit/05_set_preinit_iface_brcm2708 \
	file://rootfs/lib/preinit/79_move_config \
"

do_install_append () {
	install -d ${D}${sysconfdir}
	install -m 0755 ${WORKDIR}/rootfs/etc/diag.sh ${D}${sysconfdir}/

	install -d ${D}${sysconfdir}/board.d
	install -m 0755 ${WORKDIR}/rootfs/etc/board.d/02_network ${D}${sysconfdir}/board.d/

	install -d ${D}${base_libdir}/preinit
	install -m 0755 ${WORKDIR}/rootfs/lib/preinit/05_set_preinit_iface_brcm2708 ${D}${base_libdir}/preinit/
	install -m 0755 ${WORKDIR}/rootfs/lib/preinit/79_move_config ${D}${base_libdir}/preinit/
}
