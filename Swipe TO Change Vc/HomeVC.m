//
//  HomeVC.m
//  Swipe TO Change Vc
//
//  Created by pc on 12/7/16.
//  Copyright © 2016 Bhadresh Patoliya. All rights reserved.
//

#import "HomeVC.h"

@interface HomeVC ()

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self dataPassInSubView_productDetail_ProductReview_Related_product];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dataPassInSubView_productDetail_ProductReview_Related_product
{
    // SetUp ViewControllers
    schedul = [[scheduleVC alloc]initWithNibName:@"scheduleVC" bundle:nil];
    schedul.title = @"Product Detail";
    
    news= [[NewsVc alloc]initWithNibName:@"NewsVc" bundle:nil];
    news.title = @"Rate & Review";
    
    log = [[LogVc alloc]initWithNibName:@"LogVc" bundle:nil];
    log.title = @"Related Products";
    
    containerVC = [[YSLContainerViewController alloc]initWithControllers:@[schedul,news,log]
                                                            topBarHeight:0
                                                    parentViewController:self];
    containerVC.delegate = self;
    
    
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:11];
    containerVC.menuBackGroudColor = [UIColor orangeColor];
    containerVC.menuItemSelectedTitleColor = [UIColor whiteColor];
    [viewAddVC addSubview:containerVC.view];
    
    
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
     [controller viewWillAppear:YES];
}

@end
