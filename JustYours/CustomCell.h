//
//  CustomCell.h
//  JustYours
//
//  Created by Milan on 13-12-23.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStackView.h"

@interface CustomCell : UITableViewCell<PhotoStackViewDataSource,PhotoStackViewDelegate>

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) PhotoStackView *stackView;

- (void)setUp;

@end
