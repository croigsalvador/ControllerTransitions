//
//  CRDismissViewController.m
//  ControllerTransitions
//
//  Created by Carlos Roig Salvador on 20/06/14.
//  Copyright (c) 2014 IronHack. All rights reserved.
//

#import "CRDismissAnimation.h"
#import "CRSecondViewController.h"
#import "CRViewController.h"

#define SPINS              6.0f
#define DURATION           1.0f
#define TRANSITION_OUT_KEY @"transition out"
#define TRANSITION_IN_KEY  @"transition in"
#define TRANSITION_IDENT   @"transition type"

@interface CRDismissAnimation ()
@property (strong, nonatomic) id <UIViewControllerContextTransitioning> transitionContext;
@property (strong, nonatomic)CALayer *sourceLayer;
@property (strong, nonatomic)CALayer *destinationLayer;

@end

@implementation CRDismissAnimation


-(CALayer *)sourceLayer{
    CRSecondViewController *sourceViewController = (CRSecondViewController *)[self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    return sourceViewController.view.layer;
}

-(CALayer *)destinationLayer{
    CRViewController *destinationViewController = (CRViewController *)[self.transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    return destinationViewController.view.layer;
}

- (void)perform{
    
    CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0.0f];
    rotation.toValue   = [NSNumber numberWithFloat:M_PI * SPINS];
    
    CABasicAnimation *scaleDown = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleDown.fromValue = [NSNumber numberWithFloat:1.0f];
    scaleDown.toValue   = [NSNumber numberWithFloat:0.0f];
    
    CABasicAnimation *fadeOut = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeOut.fromValue = [NSNumber numberWithFloat:1.0f];
    fadeOut.toValue   = [NSNumber numberWithFloat:0.0f];
    
    CAAnimationGroup *transitionOut = [CAAnimationGroup animation];
    transitionOut.animations          = [NSArray arrayWithObjects:rotation, scaleDown, fadeOut, nil];
    transitionOut.duration            = DURATION;
    transitionOut.delegate            = self;
    transitionOut.removedOnCompletion = NO;
    transitionOut.fillMode            = kCAFillModeForwards;
    [transitionOut setValue:TRANSITION_OUT_KEY forKey:TRANSITION_IDENT];
    
    [self.sourceLayer addAnimation:transitionOut forKey:TRANSITION_OUT_KEY];
}

- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag{
    
    
    NSString *type = [theAnimation valueForKey:TRANSITION_IDENT];
    
    if ([type isEqualToString:TRANSITION_OUT_KEY]) {
        
        CABasicAnimation *rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
        rotation.fromValue = [NSNumber numberWithFloat:0.0f];
        rotation.toValue   = [NSNumber numberWithFloat:M_PI * SPINS];
        
        CABasicAnimation *scaleUp = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleUp.fromValue = [NSNumber numberWithFloat:0.0f];
        scaleUp.toValue   = [NSNumber numberWithFloat:1.0f];
        
        CAAnimationGroup *transitionIn = [CAAnimationGroup animation];
        transitionIn.animations = [NSArray arrayWithObjects:rotation, scaleUp, nil];
        transitionIn.duration   = DURATION;
        transitionIn.delegate   = self;
        [transitionIn setValue:TRANSITION_IN_KEY forKey:TRANSITION_IDENT];
        
        [self.destinationLayer addAnimation:transitionIn forKey:TRANSITION_IN_KEY];
        

    }
    
    if ([type isEqualToString:TRANSITION_IN_KEY]) {
        [self.sourceLayer removeAnimationForKey:TRANSITION_OUT_KEY];
        [self.transitionContext completeTransition:![self.transitionContext transitionWasCancelled]];
    }

    
}



- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    self.transitionContext = transitionContext;
    [self perform];
   
    
}


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 1.0;
}

@end
