//
//  LoginViewController.h
//  Shopgun Login
//
//  Created by Eng Waseem on 10/06/2016.
//  Copyright © 2016 Humma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "Contants.h"

@interface LoginViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *userNameLbl;
@property (strong, nonatomic) IBOutlet UITextField *userNameTextField;
@property (strong, nonatomic) IBOutlet UILabel *passwordLbl;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UIButton *loginScreenBtn;
@property (strong,nonatomic) NSString *btnTitle;
@property (strong, nonatomic) IBOutlet UIButton *forgotPassword;


-(BOOL)isLogin;

//Configure device for multiple devices portrait view only.
-(void)configureUIforIOSDevices:(CGFloat)iosWidth setHeight:(CGFloat)iosHeight mainScreenWidth:(CGFloat)screenwidth mainScreenHeight:(CGFloat)screenHeight xCenter:(CGFloat) mainScreenCenterx
                       fontSize:(CGFloat) size;


//Check device orientation.
-(NSString*)checkDeviceOrientation;

@end
