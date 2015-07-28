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
	                 NSString *propertyName = key;
	                objc_property_t property = class_getProperty(vcClass, [propertyName UTF8String]);
	                if (property != NULL) {
	                  [vc setValue:obj forKey:propertyName];
	                }else{
	                    @throw [NSException exceptionWithName:@"UIViewController set Wrong property" reason:[NSString stringWithFormat:@"%@ don't have property %@", viewControllerName, propertyName] userInfo:nil];
	                }
	               
	            }];
	        }
	        
	        [self pushViewController:vc animated:YES];
	    }
	}


	- (void)pushViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated
	{
	    [self pushViewControllerName:viewControllerName para:nil animated:animated];
	}

Get`viewControllerName`, use`runtime` to get the`Class` of the `UIViewController`, create an instance, detect the property, then use `KVO` to set the `property` of the new UIViewController.