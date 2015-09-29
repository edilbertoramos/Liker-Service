//
//  SEVProfileTableViewController.h
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 9/29/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEVProfileTableViewController : UITableViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;


@end
