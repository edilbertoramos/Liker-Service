//
//  SEVPageImageViewController.m
//  facebook-sev7n
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 21/08/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVPageImageViewController.h"

@interface SEVPageImageViewController ()

@end

@implementation SEVPageImageViewController

@synthesize itemIndex;
@synthesize image;
@synthesize contentImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    contentImageView.image = image;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) setImageName: (UIImage *)imageObject
{
    
    if (imageObject) {
        contentImageView.image = imageObject;
    }
}


@end
