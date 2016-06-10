//
//  MainViewController.m
//  Shopgun Login
//
//  Created by Eng Waseem on 10/06/2016.
//  Copyright © 2016 Humma. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    BOOL loggedIn = [defaults boolForKey:@"loginkey"];
    
    //Check if view controller is already runned
    if (loggedIn)
    {
        //Assign title label
        [defaults setBool:NO forKey:@"loginkey"];
        [_loginBarBtn setTitle:_loginBtnTitle forState:UIControlStateNormal];

    }
    else
    {
        //Assign title label
        [defaults setBool:YES forKey:@"loginkey"];
        [_loginBarBtn setTitle:@"Log in" forState:UIControlStateNormal];
    }
    
    [defaults synchronize];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
