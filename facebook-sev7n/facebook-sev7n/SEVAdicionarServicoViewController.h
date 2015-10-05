//
//  SEVAdicionarServicoViewController.h
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 10/5/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEVAdicionarServicoViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextField *tfServico;
@property (weak, nonatomic) IBOutlet UITextView *tvDescricao;
@property (weak, nonatomic) IBOutlet UITextField *tfEndereco;

- (IBAction)photo:(id)sender;
- (IBAction)salvar:(id)sender;


@end
