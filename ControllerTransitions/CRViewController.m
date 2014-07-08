//
//  CRViewController.m
//  ControllerTransitions
//
//  Created by Carlos Roig Salvador on 20/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "CRViewController.h"
#import "CRSecondViewController.h"
#import "CRAnimationTransition.h"
#import "CRDismissAnimation.h"

@interface CRViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation CRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(60, self.view.frame.size.height- 100, 200, 44)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"Next" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(openNextViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}


- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    CRAnimationTransition *animationTransition = [[CRAnimationTransition alloc] init];
    return animationTransition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    CRDismissAnimation *dismissAnimation = [[CRDismissAnimation alloc] init];
    
    return dismissAnimation;
}

-  (void)openNextViewController {
    CRSecondViewController *second = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    second.transitioningDelegate = self;
    [self.navigationController pushViewController:second animated:YES];
}


@end
