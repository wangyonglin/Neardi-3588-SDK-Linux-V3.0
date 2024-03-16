#loongify.mk
################################################################################
#
# loongify
#
################################################################################

LOONGIFY_VERSION = 1.0
LOONGIFY_SITE = $(TOPDIR)/../app/loongify
LOONGIFY_SITE_METHOD = local

LOONGIFY_LICENSE = Apache V2.0
LOONGIFY_LICENSE_FILES = NOTICE

define LOONGIFY_CONFIGURE_CMDS
	cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/bin/qmake
endef

define LOONGIFY_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define LOONGIFY_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/share/applications $(TARGET_DIR)/usr/share/icon
	$(INSTALL) -D -m 0644 $(@D)/designer.png $(TARGET_DIR)/usr/share/icon/
	$(INSTALL) -D -m 0755 $(@D)/loongify $(TARGET_DIR)/usr/bin/
	$(INSTALL) -D -m 0755 $(@D)/loongify.desktop $(TARGET_DIR)/usr/share/applications/

endef

$(eval $(generic-package))

