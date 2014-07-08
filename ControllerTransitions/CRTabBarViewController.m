//
//  CRTabBarViewController.m
//  ControllerTransitions
//
//  Created by Carlos Roig Salvador on 20/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "CRTabBarViewController.h"
#import "CRAnimationTransition.h"
#import "CRSecondViewController.h"
#import "CRViewController.h"
#import "CRDismissAnimation.h"

@interface CRTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation CRTabBarViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.delegate = self;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController animationControllerForTransitionFromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    
    if ([fromVC isKindOfClass:[CRViewController class]]) {
        CRAnimationTransition *animationTransition = [[CRAnimationTransition alloc] init];
        return animationTransition;
    } else {
        CRDismissAnimation *animationTransition = [[CRDismissAnimation alloc] init];
        return animationTransition;
    }

}


- (void)didReceiveMemoryWarning
{
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
