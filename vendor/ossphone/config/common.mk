# oss-phone common product configuration.
# Inherited by every device target.

PRODUCT_BRAND := ossphone
PRODUCT_MANUFACTURER ?= ossphone

# Version: <major>.<minor> tracking AOSP dessert + our iteration.
OSSPHONE_VERSION_MAJOR := 0
OSSPHONE_VERSION_MINOR := 1
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ossphone.version=$(OSSPHONE_VERSION_MAJOR).$(OSSPHONE_VERSION_MINOR)

# Privacy / telemetry defaults
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.setupwizard.mode=OPTIONAL \
    ro.com.google.clientidbase= \
    ro.config.nocheckin=1

# Framework defaults via RRO
PRODUCT_PACKAGES += \
    OssPhoneFrameworkOverlay

# No GMS. MicroG/sandboxed play services are user-installed, never bundled.

# Signing hook: release builds must set these to offline keys.
PRODUCT_DEFAULT_DEV_CERTIFICATE ?= build/make/target/product/security/testkey
