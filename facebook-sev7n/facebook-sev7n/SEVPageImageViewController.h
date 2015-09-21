//
//  SEVPageImageViewController.h
//  facebook-sev7n
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 21/08/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEVPageImageViewController : UIViewController

@property (nonatomic) NSUInteger itemIndex;


@property (nonatomic, strong) UIImage *image;


@property (weak, nonatomic) IBOutlet UIImageView *contentImageView;

@end
