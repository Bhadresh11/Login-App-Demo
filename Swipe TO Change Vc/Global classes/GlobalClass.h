//
//  GlobalClass.h
//  Assel Express
//
//  Created by pc on 11/15/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppHelper.h"

@interface GlobalClass : NSObject
+ (GlobalClass *)sharedInstance;



-(BOOL) NSStringIsValidEmail:(NSString *)checkString;

-(void)SaveSelectedAtIndex:(NSString *)AtIndex;
-(NSString *)GetSelectedAtIndexMfSideMenu;
-(void)SaveLoginUserData:(NSObject *)Userinfo;
-(NSDictionary *)GetUserInfo;


@end
