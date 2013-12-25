//
//  RootViewController.m
//  JustYours
//
//  Created by Milan on 13-12-24.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import "RootViewController.h"
#import "SJAvatarBrowser.h"
#import "CustomCell.h"

static CGFloat ImageHeight  = 240.0;
static CGFloat ImageWidth   = 320.0;


@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"test";
    
    //self.view.backgroundColor = RGBA(23, 184, 209, 1.0);
    
    UIImageView *lineBg = [[UIImageView alloc]initWithFrame:CGRectMake(159, 0, 4, 640)];
    [lineBg setImage:[UIImage imageNamed:@"line"]];
    [self.view addSubview:lineBg];
    
    self.imgProfile = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IMG_2617.jpg"]];
    self.imgProfile.frame = CGRectMake(0, 0, ImageWidth, ImageHeight);

    self.mTableView = [[UITableView alloc]init];
    self.mTableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    self.mTableView.delegate = self;
    self.mTableView.dataSource = self;
    self.mTableView.separatorColor = UITableViewCellSeparatorStyleNone;
    self.mTableView.backgroundColor = [UIColor clearColor];
    self.mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.mTableView.layer.cornerRadius = 15;
    self.mTableView.layer.masksToBounds = YES;

    [self.view addSubview:self.mTableView];
    [self.view addSubview:self.imgProfile];

    NSString *path = [[NSBundle mainBundle]pathForResource:@"image.plist" ofType:nil];
    self.photoArray = [NSArray arrayWithContentsOfFile:path];
    
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [playBtn setFrame:CGRectMake(20, 0, 44, 40)];
    [playBtn setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:playBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self play];
}

- (void)playMusic:(UIButton *)sender
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"A Song for Our Fathers" ofType:@"m4a"];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    
    if (!self.audiaPlayer) {
        
        NSError *error = nil;
        
        self.audiaPlayer = [[AVAudioPlayer alloc]initWithData:fileData error:&error];
        self.audiaPlayer.delegate = self;
    }
    if ([self.audiaPlayer isPlaying]) {
        
        [sender setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        [self.audiaPlayer pause];
        
    }else
    {
        [sender setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateNormal];
        [self.audiaPlayer play];
    }
    
}

- (void)play
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"A Song for Our Fathers" ofType:@"m4a"];
    NSData *fileData = [NSData dataWithContentsOfFile:path];
    
    if (!self.audiaPlayer) {
        
        NSError *error = nil;
        
        self.audiaPlayer = [[AVAudioPlayer alloc]initWithData:fileData error:&error];
        self.audiaPlayer.delegate = self;
    }
    [self.audiaPlayer play];
    
}

- (void)updateImg
{
    CGFloat yOffset   = self.mTableView.contentOffset.y;
    
   // NSLog(@"yOffset = %f",yOffset);
    
    if (yOffset < 0) {
        
        CGFloat factor = ((ABS(yOffset)+ImageHeight)*ImageWidth)/ImageHeight;
        CGRect f = CGRectMake(-(factor-ImageWidth)/2, 0, factor, ImageHeight+ABS(yOffset));
        
        self.imgProfile.frame = f;
    } else {
        CGRect f = self.imgProfile.frame;
        f.origin.y = -yOffset;
        self.imgProfile.frame = f;
    }
}

#pragma mark - Table view data source

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self updateImg];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
        
        return 1;
    else
        return [self.photoArray count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    static NSString *FirstCellIdentifier = @"FirstCell";
    
    CustomCell *cell = nil;
    
    if (indexPath.section == 0) {
        
        cell = [tableView dequeueReusableCellWithIdentifier:FirstCellIdentifier];
        
        if (cell == nil) {
            cell = [[CustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:FirstCellIdentifier];
        }
        cell.backgroundColor = [UIColor blackColor];
        
    }else
    {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil) {
            cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

            [cell setUp];
        }

        cell.imageArray = nil;
        cell.imageArray = [self.photoArray objectAtIndex:indexPath.row ];
        [cell.stackView reloadData];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        
        return ImageHeight;
    else
        return 230;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
