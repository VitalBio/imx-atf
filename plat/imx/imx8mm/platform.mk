PLAT_INCLUDES		:=	-Iplat/imx/imx8mm/include		\
				-Iplat/imx/common/include		\

PLAT_GIC_SOURCES	:=	drivers/arm/gic/v3/gicv3_helpers.c	\
				drivers/arm/gic/v3/arm_gicv3_common.c   \
				drivers/arm/gic/v3/gic500.c             \
				drivers/arm/gic/v3/gicv3_main.c		\
				drivers/arm/gic/common/gic_common.c	\
				plat/common/plat_gicv3.c		\
				plat/imx/common/plat_imx8_gic.c

BL31_SOURCES		+=	plat/imx/common/imx8_helpers.S		\
				plat/imx/common/mxcuart_console.S	\
				plat/imx/common/imx8_sip_svc.c		\
				plat/imx/common/misc.c			\
				plat/imx/imx8mm/imx8mm_bl31_setup.c	\
				plat/imx/imx8mm/gpc.c			\
				plat/imx/imx8mm/imx8mm_misc.c			\
				plat/imx/common/imx8m/hab.c		\
				plat/imx/imx8mm/imx8mm_psci.c		\
				plat/imx/common/imx8_topology.c		\
				plat/common/plat_psci_common.c		\
				lib/xlat_tables/aarch64/xlat_tables.c	\
				lib/xlat_tables/xlat_tables_common.c	\
				lib/cpus/aarch64/cortex_a53.S		\
				drivers/console/aarch64/console.S	\
				${PLAT_GIC_SOURCES}			\
				${PLAT_DDR_SOURCES}			\
				drivers/arm/tzc/tzc380.c

ENABLE_PLAT_COMPAT	:=	0
USE_COHERENT_MEM	:=	0
MULTI_CONSOLE_API	:=	1
RESET_TO_BL31		:=	1
ERROR_DEPRECATED	:=	1

ifneq (${SPD},none)
$(eval $(call add_define,TEE_IMX8))
endif
