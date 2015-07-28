//
//  UINavigationController+PushVCByName.h
//  LowCouplingUIViewController
//
//  Created by Albert Mao on 7/28/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface  UINavigationController (PushVCByName)
- (void)pushViewControllerName:(NSString *)viewControllerName para:(NSDictionary *)para animated:(BOOL)animated;
- (void)pushViewControllerName:(NSString *)viewControllerName animated:(BOOL)animated;
@end
