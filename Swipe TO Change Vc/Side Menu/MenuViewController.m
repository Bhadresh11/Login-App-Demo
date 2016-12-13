//
//  MenuViewController.m
//  Assel Express
//
//  Created by pc on 11/17/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#import "MenuViewController.h"
#import "UIViewController+RESideMenu.h"
#import "AppHelper.h"
#import "AppDelegate.h"

@interface MenuViewController ()
@property (strong, readwrite, nonatomic) UITableView *tableView;

@end

@implementation MenuViewController



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NsArryTitles = @[@"Home",@"My Profile", @"My Reviews", @"My Wishlist", @"My Address", @"Notification",@"Setting",@"Sign out"];
    NsArryImages = @[@"IconHome",@"IconHome", @"IconCalendar", @"IconProfile", @"IconSettings", @"IconHome", @"IconSettings", @"IconCalendar"];
    
    self.tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, (self.view.frame.size.height - 54 * NsArryTitles.count) / 2.0f, self.view.frame.size.width, 54 * NsArryTitles.count) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.opaque = NO;
        tableView.backgroundColor = [UIColor clearColor];
        tableView.backgroundView = nil;
        //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        tableView.bounces = NO;
        tableView.scrollsToTop = NO;
        tableView;
    });
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
}

#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *strSelectedIndex =[NSString stringWithFormat:@"%ld",(long)indexPath.row];
    [Global SaveSelectedAtIndex:strSelectedIndex];
    switch (indexPath.row) {
        case 0:
        
//            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"firstViewController"]]
//                                                         animated:YES];

            // [self.sideMenuViewController setContentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"]animated:YES];
            
            [self.sideMenuViewController hideMenuViewController];
             break;
            
        case 1:
                       
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVc"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        case 2:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVc"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        case 3:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVc"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
            
        case 4:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ProfileVc"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 7:
            if (indexPath.row == 7)
            {
                defaultUser = [NSUserDefaults standardUserDefaults];
                NSString *strUserLiginType = [defaultUser valueForKey:kUserLoginType];
                
               
                [defaultUser setValue:nil forKey:kIsLogin];
                [Global SaveLoginUserData:nil];

                [defaultUser synchronize];
                
                [self.sideMenuViewController hideMenuViewController];

                UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
                UIViewController *initViewController = [storyBoard instantiateInitialViewController];
                [self presentViewController:initViewController animated:YES completion:nil];
                

            }
            break;
            
        default:
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return NsArryTitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:21];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
        cell.selectedBackgroundView.backgroundColor = [UIColor orangeColor];

    }
    cell.textLabel.text = NsArryTitles[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:NsArryImages[indexPath.row]];
    
    NSString *strSelectedIndex = [Global GetSelectedAtIndexMfSideMenu];
    if (indexPath.row == [strSelectedIndex integerValue])
    {
        cell.backgroundColor = [UIColor orangeColor];
    }
    
    return cell;
}


@end
