//
//  signUpVc.m
//  Assel Express
//
//  Created by pc on 11/16/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#import "signUpVc.h"
#import "AppHelper.h"
#import "AFNetworking.h"
#import "AppDelegate.h"

@interface signUpVc ()

@end

@implementation signUpVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    is_social = @"0";
    social_id = @"nil";
    NSLog(@"user info:%@",_userInfo);
    if ([_userInfo valueForKey:@"socialTypeName"]!= nil)
    {
         is_social = @"1";
         social_id = [_userInfo valueForKey:@"social_id"];
        socialTypeName = [_userInfo valueForKey:@"socialTypeName"];
        NSString *EmailId = [_userInfo valueForKey:@"email"];
        NSString *UserName =[_userInfo valueForKey:@"UserName"];
        
        if ([socialTypeName isEqualToString:kFaceBookSocial] ||[socialTypeName isEqualToString:kGoogleSocial])
        {
            txtmailID.text =EmailId;
        }
        if ([socialTypeName isEqualToString:kTwitterSocial])
        {
            txtUserName.text =UserName;
        }
        
    }
    
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height)];

}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnSignup:(id)sender {
    
    BOOL isValidEmailId = [Global NSStringIsValidEmail:txtmailID.text];
    if (!isValidEmailId)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kalertViewErrorMsg message:@"enter valid email id." delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        
        [alert show];
        return ;
    }

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:UrlLogin]];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    /*
     email
     userName
     is_social
     social_id
     password
     deviceId
     deviceType
     */
    NSString *DeviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSDictionary * parameters=@{@"email":txtmailID.text,
                                @"userName":txtUserName.text,
                                @"password":txtPassword.text,
                                @"is_social":is_social,
                                @"social_id":social_id,
                                @"deviceId":DeviceId,
                                @"deviceType":DeviceType                                };
    NSLog(@"parameters:%@",parameters);
    
    [manager POST:UrlRegister parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"responseObject = %@", responseObject );
         NSString *ResponseMrg = responseObject[@"message"];
         if ([ResponseMrg isEqualToString:@"Email or password are incorrect."])
         {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kalertViewErrorMsg message:ResponseMrg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
             
             [alert show];
             return ;
         }
         if ([ResponseMrg isEqualToString:@"Email id is already exists."])
         {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kalertViewErrorMsg message:ResponseMrg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
             
             [alert show];
             return ;
         }
         if (responseObject[@"status"])
         {
             [self dismissViewControllerAnimated:YES completion:nil];
             [defaultuser setValue:kIsLogin forKey:kIsLogin];
             [defaultuser synchronize];
             [Global SaveLoginUserData:responseObject[@"data"]];
             
             UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"DashBoard" bundle:nil];
             UIViewController *initViewController = [storyBoard instantiateInitialViewController];
             [self presentViewController:initViewController animated:YES completion:nil];

         }
         else
         {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kalertViewErrorMsg message:ResponseMrg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
             
             [alert show];
         }
         
         
     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"error = %@", error);
         
     }];
}

@end
