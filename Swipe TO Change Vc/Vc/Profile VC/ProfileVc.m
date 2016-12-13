//
//  ProfileVc.m
//  Swipe TO Change Vc
//
//  Created by pc on 12/7/16.
//  Copyright © 2016 Bhadresh Patoliya. All rights reserved.
//

#import "ProfileVc.h"

@interface ProfileVc ()

@end

@implementation ProfileVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    arrUserInfo = [[NSMutableArray alloc]initWithObjects:@"Bhadresh Patoliya",@"patoliyabhadresh@hotmail.com",@"+91 8000123993",@"Change Password", nil];
    arrImgIcon = [[NSMutableArray alloc]initWithObjects:@"user_icon",@"email_icon",@"mobile_icon",@"password_icon", nil];
    
    imgProfilePic.layer.cornerRadius = imgProfilePic.frame.size.width / 2;
    imgProfilePic.clipsToBounds = YES;
    [tblMyProfile reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBackToHome:(id)sender {

    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"dashBoard" bundle:nil];
    UIViewController *initViewController = [storyBoard instantiateInitialViewController];
    [self presentViewController:initViewController animated:NO completion:nil];

}

#pragma mark -UITableview Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrUserInfo.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifire =@"MyProfileCustCell";
    
    MyProfileCustCell *cell = (MyProfileCustCell *)[tableView dequeueReusableCellWithIdentifier:identifire];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"MyProfileCustCell" owner:self options:nil];
        cell =[nib objectAtIndex:0];
    }
    cell.lblTitle.text =[arrUserInfo objectAtIndex:indexPath.row];
    cell.imgView.image = [UIImage imageNamed:[arrImgIcon objectAtIndex:indexPath.row]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3)
    {
        NSLog(@"Change Passwork Click");
    }
    [tblMyProfile reloadData];
    
}


-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    if (buttonIndex == 0)
    {
        if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.delegate = self;
            picker.allowsEditing = YES;
            [self presentViewController:picker animated:YES completion:nil];
        }
        else
        {
            NSLog(@"Camera not found");
        }
        
    }
    else if (buttonIndex == 1)
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = YES;
        [self presentViewController:picker animated:YES completion:nil];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    
    imgProfilePic.image = [self imageWithImage:chosenImage scaledToFillSize:CGSizeMake(150, 150)];
    [picker dismissViewControllerAnimated:YES completion:nil];
}
- (UIImage *)imageWithImage:(UIImage *)image scaledToFillSize:(CGSize)size
{
    CGFloat scale = MAX(size.width/image.size.width, size.height/image.size.height);
    CGFloat width = image.size.width * scale;
    CGFloat height = image.size.height * scale;
    CGRect imageRect = CGRectMake((size.width - width)/2.0f,
                                  (size.height - height)/2.0f,
                                  width,
                                  height);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [image drawInRect:imageRect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
