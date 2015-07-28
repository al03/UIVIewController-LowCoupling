//
//  ViewController.m
//  LowCouplingUIViewController
//
//  Created by Albert Mao on 7/28/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import "ViewController.h"
#import "UINavigationController+PushVCByName.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btnClick:(id)sender {
    
    NSDictionary *para = nil;
    
    
    UIButton *btn = sender;
    switch (btn.tag) {
        case 0:
            para = @{@"color":[UIColor redColor], @"index":@11};
            break;
        case 1:
            para = @{@"color":[UIColor greenColor]};
            break;
        case 2:
            para = @{@"color":[UIColor blueColor]};
            break;
        default:
            break;
    }
    
    
    [self.navigationController pushViewControllerName:@"SomeViewController" para:para animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
