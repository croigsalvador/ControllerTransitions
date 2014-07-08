//
//  CRAnimationTransition.m
//  ControllerTransitions
//
//  Created by Carlos Roig Salvador on 20/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "CRAnimationTransition.h"
#import "CRViewController.h"
#import "CRSecondViewController.h"

@implementation CRAnimationTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    CRViewController* toViewController = (CRViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    CRSecondViewController* fromViewController = (CRSecondViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    [[transitionContext containerView] addSubview:toViewController.view];
    toViewController.view.alpha = 0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toViewController.view.alpha = 1;
    } completion:^(BOOL finished) {
        fromViewController.view.transform = CGAffineTransformIdentity;
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return 1.0;
}


@end
