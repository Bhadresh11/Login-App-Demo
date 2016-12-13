//
//  ViewController.m
//  Assel Express
//
//  Created by pc on 11/18/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#import "ViewController.h"
#import "AppHelper.h"
#import "AFNetworking.h"
#import "signUpVc.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    defaultUser  = [NSUserDefaults standardUserDefaults];
    // Do any additional setup after loading the view, typically from a nib.
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnAsselExpressLogin:(id)sender {
    
    [defaultUser setValue:kIsLogin forKey:kIsLogin];
    [defaultUser synchronize];
    NSString *strSaveIsLoginVal = [defaultUser valueForKey:kIsLogin];
    NSLog(@"srt val:%@",strSaveIsLoginVal);
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"dashBoard" bundle:nil];
    UIViewController *initViewController = [storyBoard instantiateInitialViewController];
    [self presentViewController:initViewController animated:YES completion:nil];
}
//Starts Facebook Sdk
- (IBAction)btnFaceBookLogin:(id)sender {
    
}
- (IBAction)btnGooglePLogin:(id)sender {
    
}

- (IBAction)btnTwitterLogin:(id)sender {
    
}

-(void)AFnetWorkingLoginEmailId:(NSString *)EmailId userName:(NSString *)UserName passwod:(NSString *)password is_social:(NSString *)IsSocial social_id:(NSString *)social_id
{
 
    NSString *DeviceId = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSDictionary * parameters=@{@"email":EmailId,
                                @"userName":UserName,
                                @"password":password,
                                @"is_social":IsSocial,
                                @"social_id":social_id,
                                @"deviceId":DeviceId,
                                @"deviceType":DeviceType                                };
    NSLog(@"parameters:%@",parameters);
    
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:UrlLogin]];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
   [manager POST:UrlLogin parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"responseObject = %@", responseObject );
         NSString *ResponseMrg = responseObject[@"message"];
         if ([ResponseMrg isEqualToString:@"Email or password are incorrect."])
         {
             UIAlertView *alert = [[UIAlertView alloc]initWithTitle:kalertViewErrorMsg message:ResponseMrg delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
      
             [alert show];
             return ;
         }
         if ([ResponseMrg isEqualToString:@"Social account not registred."])
         {
             [self performSegueWithIdentifier:@"SignUpVc" sender:self];
             return;
         }
         [defaultUser setValue:kIsLogin forKey:kIsLogin];
         [defaultUser synchronize];
         [Global SaveLoginUserData:responseObject[@"data"]];
         NSString *strSaveIsLoginVal = [defaultUser valueForKey:kIsLogin];
         NSLog(@"srt val:%@",strSaveIsLoginVal);
         UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"DashBoard" bundle:nil];
         UIViewController *initViewController = [storyBoard instantiateInitialViewController];
         [self presentViewController:initViewController animated:YES completion:nil];

     }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"error = %@", error);
                
     }];
}
- (IBAction)btnSignUpNowPressed:(id)sender
{
    [self performSegueWithIdentifier:@"SignUpVc" sender:self];
}

@end
