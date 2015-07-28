//
//  UINavigationController+PushVCByName.m
//  LowCouplingUIViewController
//
//  Created by Albert Mao on 7/28/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import "UINavigationController+PushVCByName.h"

#import <objc/runtime.h>

@implementation UINavigationController (PushVCByName)

- (void)pushViewControllerName:(NSString *)viewControllerName para:(NSDictionary *)para animated:(BOOL)animated
{
    //需要加载视图文件？（xib，storyboard）
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
        
        [self pushViewController:vc animated:YES];
    }
}

- (void)pushViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated
{
    [self pushViewControllerName:viewControllerName para:nil animated:animated];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
