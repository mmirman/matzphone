# MatzPhone common product configuration.
# Inherited by every device target.

PRODUCT_BRAND := matzphone
PRODUCT_MANUFACTURER ?= matzphone

# Version: <major>.<minor> tracking AOSP dessert + our iteration.
MATZPHONE_VERSION_MAJOR := 0
MATZPHONE_VERSION_MINOR := 1
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.matzphone.version=$(MATZPHONE_VERSION_MAJOR).$(MATZPHONE_VERSION_MINOR)

# Privacy / telemetry defaults
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.setupwizard.mode=OPTIONAL \
    ro.com.google.clientidbase= \
    ro.config.nocheckin=1

# Framework defaults via RRO
PRODUCT_PACKAGES += \
    MatzPhoneFrameworkOverlay

# No GMS. MicroG/sandboxed play services are user-installed, never bundled.

# Signing hook: release builds must set these to offline keys.
PRODUCT_DEFAULT_DEV_CERTIFICATE ?= build/make/target/product/security/testkey
