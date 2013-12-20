//
//  AppStart.h
//  JustYours
//
//  Created by Milan on 13-12-9.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JBKenBurnsView.h"

@interface AppStart : NSObject<JBKenBurnsViewDelegate>


+ (void)show;
+ (void)hide;
+ (void)clear;


@end
