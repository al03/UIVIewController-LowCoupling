//
//  SomeViewController.m
//  LowCouplingUIViewController
//
//  Created by Albert Mao on 7/28/15.
//  Copyright (c) 2015 mk. All rights reserved.
//

#import "SomeViewController.h"

@interface SomeViewController ()

@end

@implementation SomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.color;
    NSLog(@"index is %@", @(self.index));
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
