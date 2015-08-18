//
//  SEVMainTabBarController.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 28/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVMainTabBarController.h"
#import "SEVLogoutViewController.h"
#import "SEVLoginViewController.h"

@interface SEVMainTabBarController ()

@end

@implementation SEVMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if ([item.title  isEqual: @"Item"]) {
//        NSMutableArray* viewControllers = [NSMutableArray arrayWithCapacity:2];
//        // put us on the stack, too
//        [viewControllers addObject:self];
//        
//        SEVLogoutViewController *logoutController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"logoutController"]; //or the homeController
//        
//        [viewControllers addObject:logoutController];
//        
//        
//        [viewControllers addObject:logoutController];
//        
//        //    if (someCondition == YES)
//        //    {
//        //        [viewControllers addObject:viewController2];
//        //    }
//        
//        [self setViewControllers:[NSArray arrayWithArray:viewControllers] animated:YES];
    }
//    else
//    {
//        item.title = @"Race";
//    }
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
