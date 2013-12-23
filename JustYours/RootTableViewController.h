//
//  RootTableViewController.h
//  JustYours
//
//  Created by Milan on 13-12-23.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoStackView.h"
#import <AVFoundation/AVFoundation.h>

@interface RootTableViewController : UITableViewController<AVAudioPlayerDelegate>

@property (nonatomic, strong) NSArray *photoArray;
@property (nonatomic, strong) AVAudioPlayer *audiaPlayer;
@end
