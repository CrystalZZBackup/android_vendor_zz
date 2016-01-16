# Common settings and files
-include vendor/zz/config/common.mk

# Add tablet overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/zz/overlay/common_tablet

PRODUCT_CHARACTERISTICS := tablet
