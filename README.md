# UIVIewController-LowCoupling
###Low coupling of UIVIewController

Create a category of `UINavigationController`.

**UINavigationController+PushVCByName.m**

	#import <objc/runtime.h>

	@implementation UINavigationController (PushVCByName)

	- (void)pushViewControllerName:(NSString *)viewControllerName para:(NSDictionary *)para animated:(BOOL)animated
	{
	   
	    const char *name = [viewControllerName UTF8String];
	    Class vcClass = objc_getClass(name);
	    if (vcClass != NULL) {
	        UIViewController *vc = [[vcClass alloc]init];
	        
	        if (para != nil) {
	            [para enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
	                NSString *property = key;
	                [vc setValue:obj forKey:property];
	            }];
	        }
	        
	        [self pushViewController:vc animated: animated];
	    }
	}

	- (void)pushViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated
	{
	    [self pushViewControllerName:viewControllerName para:nil animated:animated];
	}

Get`viewControllerName`, use`runtime` to get the`Class` of the `UIViewController`, create an instance, then use `KVO` to set the `property` of the new UIViewController.