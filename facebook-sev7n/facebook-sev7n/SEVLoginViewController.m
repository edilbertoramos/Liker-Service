//
//  SEVLoginViewController.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 17/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVLoginViewController.h"
#import "SEVServicoNavigationController.h"
#import "SEVLogoutViewController.h"
#import "SEVMainTabBarController.h"
#import "SEVPerfilNavigationController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>

@interface SEVLoginViewController ()
{
}
@end

@implementation SEVLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginButtonPressed:(id)sender {
   // FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
//    [login logInWithReadPermissions:@[@"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
//        if (error) {
//            
//        } else if (result.isCancelled) {
//            // Handle cancellations
//        } else {
//            // If you ask for multiple permissions at once, you
//            // should check if specific permissions missing
//            if ([result.grantedPermissions containsObject:@"email"]) {
    
                [PFFacebookUtils logInInBackgroundWithReadPermissions:[NSArray arrayWithObject:@"email"] block:^(PFUser *user, NSError *error) {
                    if (!user) {
                        NSLog(@"Uh oh. The user cancelled the Facebook login.");
                    } else if (user.isNew) {
                        NSLog(@"User signed up and logged in through Facebook!");
                        
                        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields" : @"email,name"}];
                        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                            NSDictionary *userData = (NSDictionary *)result;
                            NSString *email = userData[@"email"];
                            NSLog(@"%@",email);
                            PFUser *currentUser = [PFUser currentUser];
                            currentUser[@"email"] = email;
                            [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                if (succeeded) {
                                    // The object has been saved.
                                } else {
                                    // There was a problem, check error.description
                                }
                            }];
                        }];

                    }
                    else if (user){
                        
                        FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields" : @"email,name"}];
                        [request startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                            NSDictionary *userData = (NSDictionary *)result;
                            NSString *email = userData[@"email"];
                            NSLog(@"%@",email);
                            PFUser *currentUser = [PFUser currentUser];
                            currentUser[@"email"] = email;
                            [currentUser saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                                if (succeeded) {
                                    // The object has been saved.
                                } else {
                                    // There was a problem, check error.description
                                }
                            }];
                        }];

                    }
                    else {
                        NSLog(@"User logged in through Facebook!");
                    }
                    
                }];
    
    

                //FIM DA INTEGRACAO DO FACEBOOK COM PARSE
    
    
                SEVPerfilNavigationController *logoutController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"logoutController"]; //or the homeController
                SEVServicoNavigationController *servicoController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"servicoNavController"]; //or the homeController
                SEVMainTabBarController *tabBar = [[SEVMainTabBarController alloc] init];
                logoutController.title = @"Perfil";
                tabBar.viewControllers=[NSArray arrayWithObjects:servicoController,logoutController, nil];
                
                
                [self presentViewController:tabBar animated:NO completion:nil];
//            }
//        }
//    }];
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
