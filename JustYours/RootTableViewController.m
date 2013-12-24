//
//  RootTableViewController.m
//  JustYours
//
//  Created by Milan on 13-12-23.
//  Copyright (c) 2013年 A4A. All rights reserved.
//

#import "RootTableViewController.h"
#import "CustomCell.h"

static CGFloat ImageHeight  = 240.0;
static CGFloat ImageWidth   = 320.0;

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];

    self.title = @"test";
    
    self.imgProfile = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"IMG_2617.jpg"]];
    self.imgProfile.frame = CGRectMake(0, 0, ImageWidth, ImageHeight);
    [self.view addSubview:self.imgProfile];

    
  //  self.tableView.frame = CGRectMake(0, -64, self.view.bounds.size.width, self.view.bounds.size.height);
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"image.plist" ofType:nil];
    self.photoArray = [NSArray arrayWithContentsOfFile:path];
 
    UIButton *playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [playBtn setFrame:CGRectMake(0, 0, 50, 50)];
    [playBtn setTitle:@"播放" forState:UIControlStateNormal];
    [playBtn addTarget:self action:@selector(playMusic:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:playBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        
        [sender setTitle:@"播放" forState:UIControlStateNormal];
        [self.audiaPlayer pause];
        
    }else
    {
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [self.audiaPlayer play];
    }
    
}

- (void)updateImg
{
    CGFloat yOffset   = self.tableView.contentOffset.y;
    
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
        }

        cell.imageArray = nil;
        cell.imageArray = [self.photoArray objectAtIndex:indexPath.row ];
        [cell setUp];
        
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
        
        return ImageHeight;
    else
        return 250;
    
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];

    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
 
 */

@end
