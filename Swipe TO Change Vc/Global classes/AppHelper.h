//
//  AppHelper.h
//  Assel Express
//
//  Created by pc on 11/15/16.
//  Copyright © 2016 Assel Express. All rights reserved.
//

#ifndef AppHelper_h
#define AppHelper_h

//AlertView
#define kalertViewErrorMsg @"Error!"

//Social SDK name
#define kFaceBookSocial @"facebook"
#define kTwitterSocial @"twitter"
#define kGoogleSocial @"google"
#define kAsselExpress @"AsselExpress"

//MfsideMenu Click At Index
#define KSideMenuSelectedIndex @"selectedIndex"

//User Login Type store in NSUserDefault
//user for type login 1.AsselExpress 2.Facebook 3.Twitter 4.Google
#define kUserLoginType @"userLoginType"

//save userLogin Key
#define kIsLogin @"isLogin"


//Twitter SDK
#define TwitterConsumerKey @"jTFTz5hSdeFnSxnXtC3HVARpv"
#define TwitterSecretKey @"miKcWhevk62kO6KR4QBIRhGasCAVpVj2KyRJUUgnIPRRa5w86x"
#define TwitterGetUserInfoURL @"https://api.twitter.com/1.1/users/show.json"

#endif /* AppHelper_h */
//login device type 2 = iOS
#define DeviceType @"2"

//Base Url
#define BaseUrl @"http://192.168.4.29/asselExpress/public/index.php/api/"

//Post Url
#define UrlLogin BaseUrl@"login"
#define UrlRegister BaseUrl@"register"
#define UrlUserProfile BaseUrl@"userProfile?userId="


//Get Url
