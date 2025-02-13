#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/init.h>

static int __init driver_init(void) {
    printk(KERN_INFO "Driver initialized\n");
    return 0;
}

static void __exit driver_exit(void) {
    printk(KERN_INFO "Driver exited\n");
}

module_init(driver_init);
module_exit(driver_exit);

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Your Name");
MODULE_DESCRIPTION("A simple Linux driver");
