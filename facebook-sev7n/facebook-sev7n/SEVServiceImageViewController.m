//
//  SEVServiceImageViewController.m
//  facebook-sev7n
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 20/08/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVServiceImageViewController.h"
#import "SEVPageImageViewController.h"
@interface SEVServiceImageViewController () <UIPageViewControllerDataSource>

@property (nonatomic, strong) NSArray *contentImages;
@property (nonatomic, strong) UIPageViewController *pageViewController;


@end

@implementation SEVServiceImageViewController

@synthesize contentImages;



- (void)viewDidLoad {
    [super viewDidLoad];
    [self createPageViewController];
    [self setupPageControl];

    
}






- (void) createPageViewController
{
    contentImages = self.images;
    
    UIPageViewController *pageController = [self.storyboard instantiateViewControllerWithIdentifier: @"PageController"];
    pageController.dataSource = self;
    
    if([contentImages count])
    {
        NSArray *startingViewControllers = @[[self itemControllerForIndex: 0]];
        [pageController setViewControllers: startingViewControllers
                                 direction: UIPageViewControllerNavigationDirectionForward
                                  animated: NO
                                completion: nil];
    }
    
    self.pageViewController = pageController;
    [self addChildViewController: self.pageViewController];
    [self.view addSubview: self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController: self];
}


- (void) setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor: [UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor: [UIColor whiteColor]];
    [[UIPageControl appearance] setBackgroundColor: [UIColor blackColor]];
}


- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerBeforeViewController:(UIViewController *) viewController
{
    SEVPageImageViewController *itemController = (SEVPageImageViewController *) viewController;
    
    if (itemController.itemIndex > 0)
    {
        return [self itemControllerForIndex: itemController.itemIndex-1];
    }
    
    return nil;
}

- (UIViewController *) pageViewController: (UIPageViewController *) pageViewController viewControllerAfterViewController:(UIViewController *) viewController
{
    SEVPageImageViewController *itemController = (SEVPageImageViewController *) viewController;
    
    if (itemController.itemIndex+1 < [contentImages count])
    {
        return [self itemControllerForIndex: itemController.itemIndex+1];
    }
    
    return nil;
}



- (SEVPageImageViewController *) itemControllerForIndex: (NSUInteger) itemIndex
{
    if (itemIndex < [contentImages count])
    {
        SEVPageImageViewController *pageItemController = [self.storyboard instantiateViewControllerWithIdentifier: @"ImageViewController"];
        pageItemController.itemIndex = itemIndex;
        pageItemController.image = contentImages[itemIndex];
        return pageItemController;
    }
    
    return nil;
}

- (NSInteger) presentationCountForPageViewController: (UIPageViewController *) pageViewController
{
    return [contentImages count];
}

- (NSInteger) presentationIndexForPageViewController: (UIPageViewController *) pageViewController
{
    return 0;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
