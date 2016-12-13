//
//  ProfileVc.h
//  Swipe TO Change Vc
//
//  Created by pc on 12/7/16.
//  Copyright © 2016 Bhadresh Patoliya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyProfileCustCell.h"

@interface ProfileVc : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrUserInfo;
    NSMutableArray *arrImgIcon;
    __weak IBOutlet UIImageView *imgProfilePic;
    __weak IBOutlet UITableView *tblMyProfile;
}

- (IBAction)btnBackToHome:(id)sender;
@end
