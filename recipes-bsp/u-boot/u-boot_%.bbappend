FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI:append:sun50i = " file://boot.cmd"

DEPENDS:append = " atf"

EXTRA_OEMAKE:append:sun50i = " BL31=${DEPLOY_DIR_IMAGE}/bl31.bin SCP=/dev/null "

do_compile_sun50i[depends] += "atf:do_deploy"

UBOOT_ENV_SUFFIX:sun50i = "scr"
UBOOT_ENV:sun50i = "boot"

do_compile:append:sun50i() {
    ${B}/tools/mkimage -C none -A arm -T script -d ${WORKDIR}/boot.cmd ${WORKDIR}/${UBOOT_ENV_BINARY}
}
