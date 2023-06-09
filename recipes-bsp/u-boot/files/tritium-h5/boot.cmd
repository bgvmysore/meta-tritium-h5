part uuid mmc 0:2 partuuid
setenv bootargs console=${console} console=tty1 root=PARTUUID=${partuuid} rw rootwait panic=10 earlycon ${extra}
load mmc 0:1 ${fdt_addr_r} sun50i-h5-libretech-all-h3-cc.dtb
load mmc 0:1 ${kernel_addr_r} Image
booti ${kernel_addr_r} - ${fdt_addr_r}
