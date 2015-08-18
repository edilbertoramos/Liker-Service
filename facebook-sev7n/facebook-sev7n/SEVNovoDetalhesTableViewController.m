//
//  SEVNovoDetalhesTableViewController.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 29/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVNovoDetalhesTableViewController.h"
#import "SEVModel.h"
#import "MBProgressHUD.h"

@interface SEVNovoDetalhesTableViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate>
{
    int i;
    int j;
    UIImage *imagem1;
    UIImage *imagem2;
    UIImage *imagem3;
}

@property (strong, nonatomic) IBOutlet UITextView *detalhesTextView;
@property (strong, nonatomic) IBOutlet UITextView *enderecoTextView;
@property (strong, nonatomic) IBOutlet UITextField *telefoneTextField;
@property (strong, nonatomic) IBOutlet UIButton *image1;
@property (strong, nonatomic) IBOutlet UIButton *image2;
@property (strong, nonatomic) IBOutlet UIButton *image3;


@end

@implementation SEVNovoDetalhesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.image2.hidden = YES;
    self.image3.hidden = YES;
    self.telefoneTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)criarServico:(id)sender {
    SEVModel *model = [[SEVModel alloc] init];
    
    // Show progress
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.labelText = @"Uploading";
    [hud show:YES];
    
    [model salvaServicoWithDetalhe:self.detalhesTextView.text andDescricao:self.descricao andEndereco:self.enderecoTextView.text andTelefone:self.telefoneTextField.text andImage1:imagem1 andImage2:imagem2 andImage3:imagem3 andTipo:self.tipo completion:^(BOOL finished) {
       
        NSLog(finished ? @"Yes" : @"No");
        if (finished ? @"Yes" : @"No"){
            // Hide progress
            [hud hide:YES];
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }];
    
}
- (IBAction)image1:(id)sender {
    i = 1;
    if (imagem1){
        [self alerta];
    }
    else{
        [self alertaCameraGaleria];
    }
}
- (IBAction)image2:(id)sender {
    i = 2;
    if (imagem2){
        [self alerta];
    }
    else{
        [self alertaCameraGaleria];
    }
    

}
- (IBAction)image3:(id)sender {
    i = 3;
    if (imagem3){
        [self alerta];
    }
    else{
        [self alertaCameraGaleria];
    }

}







- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    if (i == 1) {
        imagem1 = chosenImage;
        [self.image1 setBackgroundImage:chosenImage forState:UIControlStateNormal];
        self.image2.hidden = NO;
    }
    else if (i == 2){
        imagem2 = chosenImage;
        [self.image2 setBackgroundImage:chosenImage forState:UIControlStateNormal];
        self.image3.hidden = NO;
    }
    else if (i == 3){
        imagem3 = chosenImage;
        [self.image3 setBackgroundImage:chosenImage forState:UIControlStateNormal];
    }
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}


-(void)viewDidAppear:(BOOL)animated{
    self.tipoLabel.text = [NSString stringWithFormat:@"Tipo: %@",self.tipo];
    self.descricaoLabel.text = [NSString stringWithFormat:@"Descricao: %@",self.descricao];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}



-(void)alerta{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"O que você deseja?"
                                  message:nil
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];

    UIAlertAction* tirarFoto = [UIAlertAction actionWithTitle:@"Tirar outra foto"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
                                    {
                                        
                                        picker.delegate = self;
                                        picker.allowsEditing = YES;
                                        
                                        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                        [self presentViewController:picker animated:YES completion:NULL];
                                        
                                    }];
    
    
    UIAlertAction* escolherGaleria = [UIAlertAction actionWithTitle:@"Escolher da galeria"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
                                    {
                                        
                                        picker.delegate = self;
                                        picker.allowsEditing = YES;
                                        
                                        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                        [self presentViewController:picker animated:YES completion:NULL];
                                    }];

    
    
//    UIAlertAction* apagarFoto = [UIAlertAction actionWithTitle:@"Apagar foto"
//                                                            style:UIAlertActionStyleDefault
//                                                          handler:^(UIAlertAction * action)
//                                    {
//                                        if(i == 1){
//                                            imagem1 = nil;
//                                            [self.image1 setBackgroundImage:imagem1 forState:UIControlStateNormal];
//
//                                        }
//                                        //[self performSegueWithIdentifier:@"outroEndereco" sender:self];
//                                        
//                                    }];
    
    
    
    UIAlertAction* cancelar = [UIAlertAction actionWithTitle:@"Cancelar"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * action)
                               {
                                   
                                   //        [self dismissViewControllerAnimated:alert completion:nil];
                                   
                               }];
    
    
    [alert addAction:tirarFoto];
    [alert addAction:escolherGaleria];
    //[alert addAction:apagarFoto];

    [alert addAction:cancelar];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)alertaCameraGaleria{
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"O que você deseja?"
                                  message:nil
                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    UIAlertAction *mesmoEndereco = [UIAlertAction actionWithTitle:@"Tirar foto"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
                                    {
                                        
                                        
                                        
                                        picker.delegate = self;
                                        picker.allowsEditing = YES;
                                        
                                        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                                        [self presentViewController:picker animated:YES completion:NULL];

                                        
                                    }];
    
    
    
    UIAlertAction* outroEndereco = [UIAlertAction actionWithTitle:@"Escolher da galeria"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
                                    {
                                        
                                        
                                        picker.delegate = self;
                                        picker.allowsEditing = YES;
                                        
                                        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                                        [self presentViewController:picker animated:YES completion:NULL];

                                    }];
    
    
    
    UIAlertAction* cancelar = [UIAlertAction actionWithTitle:@"Cancelar"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * action)
                               {
                                   
                                   //        [self dismissViewControllerAnimated:alert completion:nil];
                                   
                               }];
    
    
    [alert addAction:mesmoEndereco];
    [alert addAction:outroEndereco];
    [alert addAction:cancelar];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (string.length) {
        if (textField.text.length<=14) {
            if (textField.text.length==2) {
                NSString *tempStr=[NSString stringWithFormat:@"(%@) ",textField.text];
                textField.text=tempStr;
            } else if (textField.text.length==10) {
                NSString *tempStr=[NSString stringWithFormat:@"%@-",textField.text];
                textField.text=tempStr;
            }
        } else {
            return NO;
        }
    }
    return YES;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
