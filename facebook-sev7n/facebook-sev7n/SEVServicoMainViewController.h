//
//  SEVServicoMainViewController.h
//  facebook-sev7n
//
//  Created by Lúcio Barros on 27/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "SCProfilePictureButton.h"

@interface SEVServicoMainViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btEletrica;
@property (weak, nonatomic) IBOutlet UIButton *btAlvenaria;
@property (weak, nonatomic) IBOutlet UIButton *btPintura;
@property (weak, nonatomic) IBOutlet UIButton *btHidraulica;
@property (weak, nonatomic) IBOutlet UIButton *btLimpeza;
@property (weak, nonatomic) IBOutlet UIButton *btChaveiro;
@property (strong, nonatomic) IBOutlet UIView *viewSwip;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
@property (weak, nonatomic) IBOutlet UITextField *searchField;


@end
