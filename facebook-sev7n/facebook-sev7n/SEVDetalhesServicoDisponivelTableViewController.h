//
//  SEVDetalhesServicoDisponivelTableViewController.h
//  facebook-sev7n
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 19/08/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface SEVDetalhesServicoDisponivelTableViewController : UITableViewController


@property (weak, nonatomic) IBOutlet UILabel *tipoLabel;
@property (weak, nonatomic) IBOutlet UILabel *descricaoLabel;
@property (weak, nonatomic) IBOutlet UITextView *detalhesLabel;

@property (weak, nonatomic) IBOutlet UITextView *telefoneLabel;
@property (weak, nonatomic) IBOutlet UITextView *enderecoLabel;
@property (weak, nonatomic) IBOutlet UIButton *oneImage;
@property (weak, nonatomic) IBOutlet UIButton *twoImage;
@property (weak, nonatomic) IBOutlet UIButton *threeImage;


- (IBAction)oneImageAction:(id)sender;
- (IBAction)twoImageAction:(id)sender;
- (IBAction)threeImageAction:(id)sender;
- (IBAction)aceitarAction:(id)sender;


@property (strong) NSDictionary *dictionary;





@end
