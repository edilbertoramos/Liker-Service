//
//  SEVMeusServicosViewController.h
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 10/1/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "SEVModel.h"

@interface SEVMeusServicosViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (IBAction)meusContatos:(id)sender;
- (IBAction)clientes:(id)sender;
- (IBAction)favoritos:(id)sender;
- (IBAction)adicionados:(id)sender;

@end
