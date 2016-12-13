//
//  MenuViewController.h
//  Assel Express
//
//  Created by pc on 11/17/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//https://github.com/romaonthego/RESideMenu

#import <UIKit/UIKit.h>
#import "RESideMenu.h"
#import "HomeVC.h"
#import "ProfileVc.h"

@interface MenuViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>
{
    NSArray *NsArryTitles;
    NSArray *NsArryImages;
    NSUserDefaults *defaultUser;
}

@end
