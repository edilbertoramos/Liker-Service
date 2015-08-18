//
//  SEVNovoDetalhesTableViewController.h
//  facebook-sev7n
//
//  Created by Lúcio Barros on 29/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEVNovoDetalhesTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UILabel *tipoLabel;

@property (strong) NSString *tipo;

@property (strong, nonatomic) IBOutlet UILabel *descricaoLabel;

@property (strong) NSString  *descricao;

@end
