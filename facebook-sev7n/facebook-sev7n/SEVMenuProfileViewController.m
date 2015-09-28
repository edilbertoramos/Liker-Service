//
//  SEVMenuProfileViewController.m
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 9/28/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import "SEVMenuProfileViewController.h"
#import "SEVServicoMainViewController.h"
@interface SEVMenuProfileViewController ()

@end

@implementation SEVMenuProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nav.layer.borderWidth = 1;
    self.nav.layer.borderColor = [UIColor redColor].CGColor;
    self.view.backgroundColor = [SEVMenuProfileViewController SEVYellowColor];
    UISwipeGestureRecognizer * swipedown=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeDown:)];
    swipedown.direction=UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipedown];
}
- (void)swipeDown:(UISwipeGestureRecognizer*)gestureRecognizer{
    NSLog(@"\n\ntetetetete");
    [self dismissViewControllerAnimated:YES completion:nil];
}

+ (UIColor *) SEVYellowColor
{
    return [UIColor colorWithRed:1 green:0.831 blue:0.29 alpha:1]; /*#ffd44a*/

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
