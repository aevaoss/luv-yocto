FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

PACKAGECONFIG_append = "networkd"

SRC_URI += "file://50-oe-core.network \
            file://0001-tty1-only-when-splash-enabled.patch \
           "

do_install_append() {
        install -d ${D}${sysconfdir}/systemd/network/
        install -m 0644 ${WORKDIR}/50-oe-core.network ${D}${sysconfdir}/systemd/network/
}

RDEPENDS_${PN} +="ifupdown debianutils"

FILES_${PN} += "${sysconfdir}/systemd/network/50-oe-core.network \
               "
