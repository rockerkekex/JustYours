//
//  AppStart.m
//  JustYours
//
//  Created by Milan on 13-12-9.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import "AppStart.h"


@implementation AppStart

static UIWindow *startImageWindow = nil;

#define AppStartView_Tag 10086

+ (void)show
{
    if (startImageWindow == nil) {
        
        startImageWindow = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
        startImageWindow.backgroundColor = [UIColor clearColor];
        startImageWindow.userInteractionEnabled = NO;
        startImageWindow.windowLevel = UIWindowLevelStatusBar + 1;
    }
    
    JBKenBurnsView *burnsView = [[JBKenBurnsView alloc]initWithFrame:CGRectMake(0, 0, 568, 568)];
    burnsView.layer.borderWidth = 1;
    burnsView.layer.borderColor = [UIColor blackColor].CGColor;
   // burnsView.delegate = self;
    burnsView.tag = AppStartView_Tag;
    
    NSArray *myImages = [NSArray arrayWithObjects:
                         [UIImage imageNamed:@"image1.jpeg"],
                         [UIImage imageNamed:@"image2.jpeg"],
                         [UIImage imageNamed:@"image3.jpeg"],
                         [UIImage imageNamed:@"image4.png"],
                         [UIImage imageNamed:@"image5.png"], nil];
    

    [burnsView animateWithImages:myImages
              transitionDuration:12
                            loop:NO
                     isLandscape:NO];
    
    [startImageWindow addSubview:burnsView];
    [startImageWindow setHidden:NO];
}

#pragma KenBurnsViewDelegate
- (void)didShowImageAtIndex:(NSUInteger)index
{
    NSLog(@"Finished image: %lu", (unsigned long)index);
}

- (void)didFinishAllAnimations
{
    NSLog(@"Yay all done!");
}

+ (void)hide
{
    JBKenBurnsView *burnsView = (JBKenBurnsView *)[startImageWindow viewWithTag:AppStartView_Tag];
    if (burnsView) {
        
    [UIView animateWithDuration:0.5 animations:^{
        
        burnsView.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [burnsView removeFromSuperview];
        
    }];
        
    }
}
+ (void)clear
{
    
}


@end
