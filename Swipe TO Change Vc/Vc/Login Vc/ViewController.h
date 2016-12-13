//
//  ViewController.h
//  Assel Express
//
//  Created by pc on 11/18/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSUserDefaults *defaultUser;
   
    __weak IBOutlet UITextField *txtUserName;
    
    __weak IBOutlet UITextField *txtPassword;
}
- (IBAction)btnAsselExpressLogin:(id)sender;
- (IBAction)btnFaceBookLogin:(id)sender;
- (IBAction)btnGooglePLogin:(id)sender;
- (IBAction)btnTwitterLogin:(id)sender;
- (IBAction)btnSignUpNowPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (readonly, copy) NSString *accessToken;

@end

