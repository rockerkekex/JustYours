//
//  CustomCell.m
//  JustYours
//
//  Created by Milan on 13-12-23.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setUp
{
    [self.contentView addSubview:self.stackView];
}

- (PhotoStackView *)stackView
{
    if (!_stackView) {
        
        _stackView = [[PhotoStackView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        _stackView.center = CGPointMake(160, 120);
        _stackView.dataSource = self;
        _stackView.delegate = self;
        
    }
    
    return _stackView;
}


#pragma mark - photoStack Datasource
- (NSUInteger)numberOfPhotosInPhotoStackView:(PhotoStackView *)photoStack
{
   
    return [self.imageArray count];
}


- (UIImage *)photoStackView:(PhotoStackView *)photoStack photoForIndex:(NSUInteger)index
{
    UIImage *image;
    NSString *path = [[NSBundle mainBundle]pathForResource:[self.imageArray objectAtIndex:index] ofType:nil];
    image = [UIImage imageWithContentsOfFile:path];
    
    return image;
}

- (void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
