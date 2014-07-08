//
//  CRNavigationViewController.m
//  ControllerTransitions
//
//  Created by Carlos Roig Salvador on 20/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "CRNavigationViewController.h"

@interface CRNavigationViewController ()<UINavigationControllerDelegate>

@end

@implementation CRNavigationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if ([fromVC isKindOfClass:[CRViewController class]]) {
        CRAnimationTransition *animationTransition = [[CRAnimationTransition alloc] init];
        return animationTransition;
    } else {
        CRDismissAnimation *animationTransition = [[CRDismissAnimation alloc] init];
        return animationTransition;
    }
    
}

@end
