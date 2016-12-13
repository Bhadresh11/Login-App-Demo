//
//  AppDelegate.h
//  Swipe TO Change Vc
//
//  Created by pc on 12/7/16.
//  Copyright © 2016 Bhadresh Patoliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalClass.h"

#define Global [GlobalClass sharedInstance]

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

