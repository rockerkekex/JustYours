//
//  CustomCell.m
//  JustYours
//
//  Created by Milan on 13-12-23.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import "CustomCell.h"
#import "SJAvatarBrowser.h"

@implementation CustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
    
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
  //  NSLog(@"path = %@",path);
    image = [UIImage imageWithContentsOfFile:path];
    
  
    return image;
}

- (void)photoStackView:(PhotoStackView *)photoStackView didSelectPhotoAtIndex:(NSUInteger)index
{
    UIImage *image = [self photoStackView:photoStackView photoForIndex:index];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(photoStackView.center.x,photoStackView.center.y,image.size.width/3, image.size.height/3);
    
    
    [SJAvatarBrowser showImage:imageView];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
