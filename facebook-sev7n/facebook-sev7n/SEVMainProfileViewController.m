//
//  SEVMainProfileViewController.m
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 9/29/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import "SEVMainProfileViewController.h"

@interface SEVMainProfileViewController ()

@end

@implementation SEVMainProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma photo action

- (IBAction)takePhoto:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera; // tipo de imagem que será mostrada
    
    [self presentViewController:picker animated:YES completion:NULL];
}

@end
