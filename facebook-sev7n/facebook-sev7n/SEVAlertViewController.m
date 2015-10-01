//
//  SEVAlertViewController.m
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 9/29/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import "SEVAlertViewController.h"

@interface SEVAlertViewController ()

@end

@implementation SEVAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

+ (UIAlertController *)styleSimpleWithTitle:(NSString *)title andWithMessage:(NSString *)message
{
    UIAlertController * alert =  [UIAlertController
                                  alertControllerWithTitle:title
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:NO completion:nil];
                             
                         }];
    [alert addAction:ok];
    
    return alert;
    
}


@end
