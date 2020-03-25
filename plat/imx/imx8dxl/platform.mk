#
# Copyright 2020 NXP
#
# SPDX-License-Identifier: BSD-3-Clause
#

# Translation tables library
include lib/xlat_tables_v2/xlat_tables.mk

PLAT_INCLUDES		:=	-Iplat/imx/imx8dxl/include		\
				-Iplat/imx/common/include		\

# Include GICv3 driver files
include drivers/arm/gic/v3/gicv3.mk

IMX_GIC_SOURCES	:=		${GICV3_SOURCES}			\
				plat/common/plat_gicv3.c		\
				plat/imx/common/plat_imx8_gic.c

BL31_SOURCES		+=	plat/imx/common/lpuart_console.S	\
				plat/imx/common/imx8_helpers.S		\
				plat/imx/imx8dxl/imx8dxl_bl31_setup.c	\
				plat/imx/imx8dxl/imx8dxl_psci.c		\
				plat/imx/common/imx8_topology.c		\
				plat/imx/common/imx8_psci.c		\
				plat/imx/common/imx_sip_svc.c		\
				plat/imx/common/imx_sip_handler.c	\
				plat/common/plat_psci_common.c		\
				lib/cpus/aarch64/cortex_a35.S		\
				${XLAT_TABLES_LIB_SRCS}			\
				${IMX_GIC_SOURCES}			\

include plat/imx/common/sci/sci_api.mk

USE_COHERENT_MEM	:=	1
RESET_TO_BL31		:=	1

ifeq (${SPD},trusty)
	BL31_CFLAGS    +=      -DPLAT_XLAT_TABLES_DYNAMIC=1
endif