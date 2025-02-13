BUILD_DIR = $(PWD)/build
BUILD_DIR_MAKEFILE = $(PWD)/build/Makefile
PRODUCT_DIR = $(PWD)/product
$(BUILD_DIR):
	mkdir -p "$@"

$(PRODUCT_DIR):
	mkdir -p "$@"

$(BUILD_DIR_MAKEFILE): $(BUILD_DIR)
	touch "$@"
# user settings
EXARGS = LLVM=1 LLVM_IAS=1
ARCH = arm64
CROSS_COMPILE = aarch64-linux-gnu-
##################################
MAKE = /home/jinx/gki5.10/prebuilts/build-tools/linux-x86/bin/make
KDIR = /home/jinx/gki5.10/out/android12-5.10/common
MODULE_NAME = example


all: $(BUILD_DIR_MAKEFILE) $(PRODUCT_DIR)
	$(MAKE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH) $(EXARGS) -C $(KDIR) M=$(BUILD_DIR)  src=$(PWD) modules
	cp $(BUILD_DIR)/*.ko $(PRODUCT_DIR)

clean:
	make -C $(KDIR) M=$(BUILD_DIR)  clean
	rm -r $(BUILD_DIR) $(PRODUCT_DIR)


obj-m := $(MODULE_NAME).o
$(MODULE_NAME)-objs:= test.o