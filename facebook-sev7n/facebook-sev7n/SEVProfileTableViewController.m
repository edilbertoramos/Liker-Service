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

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
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
    
    // propriedade para salvar a imagem no Parse
    NSData *imageData = UIImageJPEGRepresentation(_imageView.image, 1.0);
    PFFile *imageFile = [PFFile fileWithName:@"" data:imageData];
    
    // salvando nas colunas do Parse
    user[@"nome"] = self.nameField.text;
    user[@"sobrenome"] = self.lastNameField.text;
    user[@"endereco"] = self.addressField.text;
    user[@"referencia"] = self.referenceField.text;
    user[@"telefone"] = self.phoneField.text;
    user[@"celular"] = self.cellPhoneField.text;
    //[user setObject:imageFile forKey:@"foto"]; // salvando a imagem
    
   [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error)
    {
        if (!error)
        {
            UIAlertController *alert = [SEVAlertViewController styleSimpleWithTitle:@"Perfil atualizado!" andWithMessage:@"Novos campos salvos com sucesso!"];
            [self presentViewController:alert animated:YES completion:nil];
            
            NSLog(@"FOI");
            
        }
        else
        {
            UIAlertController *alert = [SEVAlertViewController styleSimpleWithTitle:@"Erro!" andWithMessage:@"Cheque sua conexão com a internet e tente de novo"];
            [self presentViewController:alert animated:YES completion:nil];
            
            NSLog(@"NAO FOI");
            
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
        UIAlertController *alert = [SEVAlertViewController styleSimpleWithTitle:@"Alerta!" andWithMessage:@"Preencha todos os campos!"];
        [self presentViewController:alert animated:YES completion:nil];
        NSLog(@"FALTANDO CAMPOS!");
    }
}

@end
