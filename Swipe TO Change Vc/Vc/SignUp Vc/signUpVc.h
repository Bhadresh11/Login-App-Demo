//
//  signUpVc.h
//  Assel Express
//
//  Created by pc on 11/16/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface signUpVc : UIViewController
{
    NSUserDefaults *defaultuser;
    __weak IBOutlet UITextField *txtUserName;
    __weak IBOutlet UITextField *txtmailID;
    __weak IBOutlet UITextField *txtPassword;
    NSString *social_id;
    NSString *socialTypeName;
    NSString *is_social;

}
- (IBAction)btnSignup:(id)sender;
@property(retain)NSDictionary *userInfo;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
