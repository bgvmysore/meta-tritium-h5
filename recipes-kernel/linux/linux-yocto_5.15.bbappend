FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://defconfig"

COMPATIBLE_MACHINE = "tritium-h5"

KCONFIG_MODE="--alldefconfig"
KMACHINE:tritium-h5 ?= "tritium-h5"
KERNEL_DEFCONFIG:tritium-h5 = "defconfig"

LINUX_VERSION:tritium-h5 = "5.15.108"

