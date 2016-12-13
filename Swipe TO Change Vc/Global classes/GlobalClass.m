//
//  GlobalClass.m
//  Assel Express
//
//  Created by pc on 11/15/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#import "GlobalClass.h"

@implementation GlobalClass
+ (GlobalClass *)sharedInstance
{
    static GlobalClass *sharedInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = NO; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSString *laxString = @"^.+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*$";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}
-(void)SaveSelectedAtIndex:(NSString *)AtIndex
{
    [[NSUserDefaults standardUserDefaults]setValue:AtIndex forKey:KSideMenuSelectedIndex];
    [[NSUserDefaults standardUserDefaults]synchronize];
}
-(NSString *)GetSelectedAtIndexMfSideMenu
{
   NSString *SelectedIndex =  [[NSUserDefaults standardUserDefaults]valueForKey:KSideMenuSelectedIndex];
    return SelectedIndex;

}
-(void)SaveLoginUserData:(NSObject *)Userinfo
{
    NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
    [defaultUser setObject:[Userinfo valueForKey:@"userName"] forKey:@"userName"];
    [defaultUser setObject:[Userinfo valueForKey:@"email"] forKey:@"email"];
    [defaultUser setObject:[Userinfo valueForKey:@"userId"] forKey:@"userId"];
    [defaultUser synchronize];
}
-(NSDictionary *)GetUserInfo
{
    NSDictionary *dict;
    NSUserDefaults *defaultUser = [NSUserDefaults standardUserDefaults];
    NSString *userName = [defaultUser valueForKey:@"userName"];
    NSString *email = [defaultUser valueForKey:@"email"];
    NSString *userId = [defaultUser valueForKey:@"userId"];
    if (userName != nil && email != nil && userId != nil)
    {
        dict = @{@"userName":userName,
                 @"email":email,
                 @"userId":userId};
                 
    }
    
    return dict;
}
@end
