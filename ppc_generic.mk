$(call inherit-product, build/target/product/ea.mk)

# Overrides
PRODUCT_BRAND := EmbeddedAlley
PRODUCT_NAME := ppc_generic
PRODUCT_DEVICE := ppc_generic
PRODUCT_PACKAGE_OVERLAYS := vendor/ea/generic
