//
//  HomeVC.h
//  Swipe TO Change Vc
//
//  Created by pc on 12/7/16.
//  Copyright © 2016 Bhadresh Patoliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scheduleVC.h"
#import "NewsVc.h"
#import "LogVc.h"
#import "YSLContainerViewController.h"

@interface HomeVC : UIViewController<YSLContainerViewControllerDelegate>
{
    scheduleVC *schedul;
    NewsVc *news;
    LogVc *log;
    YSLContainerViewController *containerVC;
    __weak IBOutlet UIView *viewAddVC;
}
@end
