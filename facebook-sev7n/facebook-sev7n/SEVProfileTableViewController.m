//
//  SEVProfileTableViewController.m
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 9/29/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import "SEVProfileTableViewController.h"

@interface SEVProfileTableViewController ()

@end

@implementation SEVProfileTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

#pragma parse

- (void) registerParse
{
    PFUser *user = [PFUser currentUser]; // criando user
    
    // salvando nas colunas do Parse
    user[@"nome"] = self.nameField.text;
    user[@"sobrenome"] = self.lastNameField.text;
    user[@"endereco"] = self.addressField.text;
    user[@"referencia"] = self.referenceField.text;
    user[@"telefone"] = self.phoneField.text;
    user[@"celular"] = self.cellPhoneField.text;
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error)
        {
            NSLog(@"SAVE");
            
        }
        else
        {
            NSLog(@"NOT SAVE");
            
        }
    }];

    
}

- (IBAction)saveBt:(id)sender
{
    if (![self.nameField.text isEqualToString:@""] && ![self.lastNameField.text isEqualToString:@""] && ![self.addressField.text isEqualToString:@""] && ![self.referenceField.text isEqualToString:@""] && ![self.phoneField.text isEqualToString:@""] && ![self.cellPhoneField.text isEqualToString:@""])
    {
        [self registerParse];
    }
    
    else
    {
        NSLog(@"Nothing!");
    }
}

@end
