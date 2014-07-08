//
//  CRSecondViewController.m
//  ControllerTransitions
//
//  Created by Carlos Roig Salvador on 20/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "CRSecondViewController.h"

@interface CRSecondViewController ()

@end

@implementation CRSecondViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(60, self.view.frame.size.height- 100, 200, 44)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"Back" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)goBack {
    if([self.transitioningDelegate respondsToSelector:@selector(animationControllerForDismissedController:)]){
        [self.transitioningDelegate animationControllerForDismissedController:self];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
