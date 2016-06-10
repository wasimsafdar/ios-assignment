//
//  LoginViewController.m
//  Shopgun Login
//
//  Created by Eng Waseem on 10/06/2016.
//  Copyright © 2016 Humma. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    NSScanner *scanner;
    BOOL authenticate;
    
    UIAlertController *incorrectCredentials;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //Add tap gesture to dismiss keyboard
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboardonTap:)];
    
    [self.view addGestureRecognizer:tap];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Login
-(BOOL)isLogin
{
    if (_userNameTextField.text <= 0 || [_userNameTextField.text rangeOfString:@"@"].location== NSNotFound || _passwordTextField.text.length <= 6)
    {
        incorrectCredentials = [UIAlertController alertControllerWithTitle:@"Incorrect Login Credentials" message:@"Please enter correct username and password" preferredStyle:UIAlertControllerStyleAlert];
        
        [incorrectCredentials addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [incorrectCredentials dismissViewControllerAnimated:YES completion:nil];
        }]];
        
        [self presentViewController:incorrectCredentials animated:YES completion:nil];
        
        return NO;
    }
    else
    return YES;
}

#pragma mark - Server
-(BOOL)authenticate
{
    NSString *saveSubstring;
    
    scanner = [NSScanner scannerWithString:_userNameTextField.text];
    [scanner scanUpToString:@"@shopgun"intoString:&saveSubstring];
    
    if (_userNameTextField.text <= 0 || [_userNameTextField.text rangeOfString:@"@shopgun"].location== NSNotFound || _passwordTextField.text.length <= 0 || ![_passwordTextField.text isEqualToString:saveSubstring])
    {
        incorrectCredentials = [UIAlertController alertControllerWithTitle:@"Server authentication failed" message:@"Please enter your correct credentials" preferredStyle:UIAlertControllerStyleAlert];
        
        [incorrectCredentials addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [incorrectCredentials dismissViewControllerAnimated:YES completion:nil];
        }]];
        
        [self presentViewController:incorrectCredentials animated:YES completion:nil];

        
        return NO;
    }
    else
        return YES;

}

- (IBAction)loginUser:(id)sender {
    
    if ([self isLogin] && [self authenticate])
    {
        //If user logged in, change button title to logout.
        _btnTitle = @"Log out";
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setBool:YES forKey:@"loginkey"];

        [self performSegueWithIdentifier:@"BacktoLogin" sender:self];
    }
}

- (IBAction)dismiss:(id)sender {
    
    _btnTitle = @"Log in";

    [self performSegueWithIdentifier:@"BacktoLogin" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([segue.identifier isEqualToString:@"BacktoLogin"])
    {
        MainViewController *mainController = segue.destinationViewController;
        mainController.loginBtnTitle = _btnTitle;
        
    }

}

#pragma mark - Configuration
-(void)configureUIforIOSDevices:(CGFloat)iosWidth setHeight:(CGFloat)iosHeight mainScreenWidth:(CGFloat)screenwidth mainScreenHeight:(CGFloat)screenHeight xCenter:(CGFloat) mainScreenCenterx

                       fontSize:(CGFloat) size
{

    //Adjust Username/email label.
    CGFloat widthRatio = iosWidth/_userNameLbl.frame.size.width;
    CGFloat heightRatio = iosHeight/_userNameLbl.frame.size.height;
    
    CGFloat userNameLblWidth = screenwidth * (1/widthRatio);
    CGFloat userNameLblHeight = screenwidth * (1/heightRatio);

    
    CGFloat mainScreen_xCenter = mainScreenCenterx/2;
    CGFloat mainScreen_yCenter = MAIN_SCREEN_HEIGHT/7;
    
    _userNameLbl.font = [UIFont fontWithName:@"Ariel" size:size];
    _userNameLbl.frame = CGRectMake(mainScreen_xCenter-(userNameLblWidth/2), mainScreen_yCenter, userNameLblWidth, userNameLblHeight);
    
    //Adjust Username text field.
    CGFloat userNameTextFieldWidthRatio = iosWidth/_userNameTextField.frame.size.width;
    CGFloat userNameTextFieldWidth = screenwidth * (1/userNameTextFieldWidthRatio);
    
    _userNameTextField.font = [UIFont fontWithName:@"Ariel" size:size];
    _userNameTextField.frame = CGRectMake(mainScreen_xCenter-(userNameTextFieldWidth/2), _userNameLbl.frame.origin.y + _userNameLbl.frame.size.height + STANDARD_GAP, userNameTextFieldWidth,_userNameTextField.frame.size.height);
    
    //Adjust password label.
    CGFloat passwordLabelWidthRatio = iosWidth/_passwordLbl.frame.size.width;
    CGFloat passwordLabelHeightRatio = iosHeight/_passwordLbl.frame.size.height;
    
    CGFloat passwordLabelWidth = screenwidth * (1/passwordLabelWidthRatio);
    CGFloat passwordLabelHeight = screenHeight * (1/passwordLabelHeightRatio);
    
    _passwordLbl.font = [UIFont fontWithName:@"Ariel" size:size];
    _passwordLbl.frame = CGRectMake(mainScreen_xCenter-(passwordLabelWidth/2),_userNameTextField.frame.origin.y + _userNameTextField.frame.size.height + STANDARD_GAP , passwordLabelWidth, passwordLabelHeight);
    
    //Adjust password text field.
    CGFloat passwordTextFieldWidthRatio = iosWidth/_passwordTextField.frame.size.width;
    
    CGFloat passwordTextFieldWidth = screenwidth * (1/passwordTextFieldWidthRatio);
    
    _passwordTextField.font = [UIFont fontWithName:@"Ariel" size:size];
    _passwordTextField.frame = CGRectMake(mainScreen_xCenter-(passwordTextFieldWidth/2),_passwordLbl.frame.origin.y + _passwordLbl.frame.size.height , passwordTextFieldWidth, _passwordTextField.frame.size.height);
    
    //Adjust Login Button.
    CGFloat loginBtnWidthRatio = iosWidth/_loginScreenBtn.frame.size.width;
    
    CGFloat loginBtnFieldWidth = screenwidth * (1/loginBtnWidthRatio);
    
    _loginScreenBtn.titleLabel.font = [UIFont fontWithName:@"Ariel" size:size];
    _loginScreenBtn.layer.frame = CGRectMake(mainScreen_xCenter-(loginBtnFieldWidth/2),_passwordTextField.frame.origin.y + _passwordTextField.frame.size.height + (STANDARD_GAP*5) , loginBtnFieldWidth, _loginScreenBtn.frame.size.height);
    
}

#pragma mark - DeviceOrientation
-(NSString*)checkDeviceOrientation
{
    NSString *deviceOrientation;
    
    if ([[UIDevice currentDevice]orientation]== UIInterfaceOrientationLandscapeLeft ) {
        
        deviceOrientation = @"landscape left mode";
    }
    else if ([[UIDevice currentDevice]orientation]==UIInterfaceOrientationLandscapeRight){
        deviceOrientation = @"landscape right mode";
    }
    else{
        deviceOrientation = @"potrait mode";
    }
    return deviceOrientation;
}

//Adjust layout here.
-(void)viewDidLayoutSubviews
{
    //Add code here when you view changes
    if (IS_IPHONE4)
    {
        
        //Configure layout for iPhone 4 and 4s
        
        if ([[self checkDeviceOrientation]isEqualToString:@"landscape right mode"]) {
            
            //Landscape right mode configuration.
        }
        else if ([[self checkDeviceOrientation]isEqualToString:@"landscape left mode"]){
            
            //Landscape left mode configuration.
        }
        else{
            NSLog(@"The device is in %@",[self checkDeviceOrientation]);
            
            //Potrait mode configuartion.
            
            [self configureUIforIOSDevices:STANDARD_WIDTH setHeight:STANDARD_HEIGHT mainScreenWidth:MAIN_SCREEN_WIDTH mainScreenHeight:MAIN_SCREEN_HEIGHT xCenter:MAIN_SCREEN_WIDTH fontSize:11];
            
        }
    }
    
    if(IS_IPHONE5){
        
        //Configure layout for iPhone 5 and 5s.
        
        if ([[self checkDeviceOrientation]isEqualToString:@"landscape right mode"]) {
            
            //Landscape right mode configuration.
            
        }
        else if ([[self checkDeviceOrientation]isEqualToString:@"landscape left mode"]){
            
            //Landscape left mode configuration.
        }
        else{
            NSLog(@"The device is in %@",[self checkDeviceOrientation]);
            
            //Portrait mode configuration.
            
            [self configureUIforIOSDevices:STANDARD_WIDTH setHeight:STANDARD_HEIGHT mainScreenWidth:MAIN_SCREEN_WIDTH mainScreenHeight:MAIN_SCREEN_HEIGHT xCenter:MAIN_SCREEN_WIDTH fontSize:13];
        }
        
    }
    
    if (IS_IPHONE6) {
        
        //Configure layoutout for iPhone 6 and 6s
        if ([[self checkDeviceOrientation]isEqualToString:@"landscape right mode"]) {
            
            //Landscape right mode configuration.
            //Replace height with width for landscape orientation.
            [self configureUIforIOSDevices:STANDARD_HEIGHT setHeight:STANDARD_WIDTH mainScreenWidth:MAIN_SCREEN_WIDTH mainScreenHeight:MAIN_SCREEN_HEIGHT xCenter:MAIN_SCREEN_WIDTH fontSize:0];
            
        }
        else if ([[self checkDeviceOrientation]isEqualToString:@"landscape left mode"]){
            
            //Landscape left mode configuration.
            
        }
        else{
            
            //Portrait mode configuration.
            
            [self configureUIforIOSDevices:STANDARD_WIDTH setHeight:STANDARD_HEIGHT mainScreenWidth:MAIN_SCREEN_WIDTH mainScreenHeight:MAIN_SCREEN_HEIGHT xCenter:MAIN_SCREEN_WIDTH fontSize:15];
        }
        
    }
    
    if (IS_IPHONE6PLUS) {
        
        //Configure layout for iPhone6 Plus and iPhone 6s Plus.
        if ([[self checkDeviceOrientation]isEqualToString:@"landscape right mode"]) {
            
            //Landscape right mode configuration.
        }
        else if ([[self checkDeviceOrientation]isEqualToString:@"landscape left mode"]){
            
            //Landscape left mode configuration.
            
        }
        else{
            
            //Portrait mode configuration.
            
            [self configureUIforIOSDevices:STANDARD_WIDTH setHeight:STANDARD_HEIGHT mainScreenWidth:MAIN_SCREEN_WIDTH mainScreenHeight:MAIN_SCREEN_HEIGHT xCenter:MAIN_SCREEN_WIDTH fontSize:16];
        }
        
    }
    
    if (IS_IPAD) {
        
        //Configure layout for iPAD.
        if ([[self checkDeviceOrientation]isEqualToString:@"landscape right mode"]) {
            
            //Landscape right mode configuation.
        }
        else if ([[self checkDeviceOrientation]isEqualToString:@"landscape left mode"]){
            
            //Landscape left mode configuartion.
        }
        else{
            
            //Portrait mode configuration.
            [self configureUIforIOSDevices:STANDARD_WIDTH setHeight:STANDARD_HEIGHT mainScreenWidth:MAIN_SCREEN_WIDTH mainScreenHeight:MAIN_SCREEN_HEIGHT xCenter:MAIN_SCREEN_WIDTH fontSize:18];
            
        }
        
    }

}

-(void)dismissKeyboardonTap:(UITapGestureRecognizer *)sender
{
    [_userNameTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

@end




































