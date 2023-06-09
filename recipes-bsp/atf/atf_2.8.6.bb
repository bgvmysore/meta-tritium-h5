inherit deploy kernel-arch

SECTION = "base"
DESCRIPTION = "Arm Trusted Firmware"
LICENSE = "BSD-3-Clause"

SRC_URI = "git://github.com/ARM-software/arm-trusted-firmware.git;protocol=https;nobranch=1"
SRCREV = "ff0bd5f9bb2ba2f31fb9cec96df917747af9e92d"
LIC_FILES_CHKSUM = "file://docs/license.rst;md5=b2c740efedc159745b9b31f88ff03dde"

S = "${WORKDIR}/git"
B = "${WORKDIR}/build"

COMPATIBLE_MACHINE = "tritium-h5"
PLATFORM:tritium-h5 = "sun50i_a64"

LDFLAGS[unexport] = "1"

do_compile() {
    oe_runmake -C ${S} BUILD_BASE=${B} CROSS_COMPILE=${TARGET_PREFIX} PLAT=${PLATFORM} bl31
}

do_deploy() {
    install -D -p -m 0644 ${B}/${PLATFORM}/release/bl31.bin ${DEPLOYDIR}/bl31.bin
}

addtask deploy after do_compile
PACKAGE_ARCH = "${MACHINE_ARCH}"
