//
//  SEVLogoutViewController.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 17/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVLogoutViewController.h"
#import "SCProfilePictureButton.h"
#import "SEVMainTabBarController.h"
#import "SEVLoginViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "SEVServicoNavigationController.h"
#import <Parse/Parse.h>

@interface SEVLogoutViewController ()
@property (strong, nonatomic) IBOutlet SCProfilePictureButton *profilePictureButton;
@property (strong, nonatomic) IBOutlet UILabel *profileNameLabel;

@end

@implementation SEVLogoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.profilePictureButton.profileID = @"me";
    self.profilePictureButton.pictureCropping = FBSDKProfilePictureModeSquare;
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        NSDictionary *userData = (NSDictionary *)result;
        
        NSString *name = userData[@"name"];
        
        self.profileNameLabel.text = name;
    }];
    
    
    FBSDKGraphRequest *request2 = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil];
    [request2 startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
        NSDictionary *userData = (NSDictionary *)result;
        for(NSString *key in [userData allKeys]) {
            NSLog(@"%@",[userData objectForKey:key]);
        }
        //NSLog(@"%@",email);
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logout:(id)sender {
    
    
   [PFUser logOut];
   
    // put us on the stack, too
    
    SEVLoginViewController *loginController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginController"]; //or the homeController
     SEVServicoNavigationController *servicoController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"servicoNavController"]; //or the homeController
    SEVMainTabBarController *tabBar = [[SEVMainTabBarController alloc] init];
    loginController.title = @"Perfil";
       tabBar.viewControllers=[NSArray arrayWithObjects:servicoController,loginController, nil];
    
   
    [self presentViewController:tabBar animated:NO completion:nil];
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
