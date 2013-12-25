//
//  RootViewController.h
//  JustYours
//
//  Created by Milan on 13-12-24.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface RootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AVAudioPlayerDelegate>

@property (nonatomic, strong) NSArray *photoArray;
@property (nonatomic, strong) AVAudioPlayer *audiaPlayer;
@property (nonatomic, strong) UIImageView *imgProfile;
@property (nonatomic, strong) UITableView *mTableView;
@end
