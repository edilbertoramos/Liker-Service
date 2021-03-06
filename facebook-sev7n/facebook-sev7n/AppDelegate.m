//
//  AppDelegate.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 14/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "AppDelegate.h"
#import "SEVLogoutViewController.h"
#import "SEVLoginViewController.h"
#import "SEVMainTabBarController.h"
#import "SEVServicoNavigationController.h"
#import "SEVPerfilNavigationController.h"
#import <Parse/Parse.h>
#import <ParseFacebookUtilsV4/PFFacebookUtils.h>
#import "SEVMenuProfileViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
 
    // [Optional] Power your app with Local Datastore. For more info, go to
    // https://parse.com/docs/ios_guide#localdatastore/iOS
    [Parse enableLocalDatastore];
    
    // Initialize Parse.
    [Parse setApplicationId:@"GX0DVIyUyKnIoUfRCXMeDqKLIhbmvcGaCu9nXMX7"
                  clientKey:@"j6IFFRL6TyHFeR5TJV5fdHEO6mJJknpkouQxnRD5"];
    
    [PFFacebookUtils initializeFacebookWithApplicationLaunchOptions:launchOptions];

    // [Optional] Track statistics around application opens.
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
   
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blackColor];
    shadow.shadowOffset = CGSizeMake(1, 0);
    
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                          NSShadowAttributeName:shadow};
    
    [[UINavigationBar appearance] setTitleTextAttributes:titleTextAttributes];
    [[UINavigationBar appearance] setTranslucent:NO];

    [[UITableView appearance] setBackgroundColor: [UIColor blackColor]];
    
    [[UITabBar appearance] setBarTintColor: [UIColor blackColor]];
    [[UITabBar appearance] setTintColor: [UIColor whiteColor]];
    [[UITabBar appearance] setTranslucent:NO];

//    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(40, 130, 240, 232)];
//
//    
//    UIButton *buttonSwipe=[UIButton buttonWithType:UIButtonTypeRoundedRect];
//    buttonSwipe.frame= CGRectMake(200, 15, 15, 15);
//    [buttonSwipe setTitle:@"Ok" forState:UIControlStateNormal];
//    [buttonSwipe addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
//    //buttonSwipe.imageView.image = [UIImage imageNamed:@"icon_perfil"];
//    
//    [myView addSubview:buttonSwipe];
//    [myView setTag:111];
//    
//    [[UIView appearance] addSubview:myView];
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                    didFinishLaunchingWithOptions:launchOptions];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    if ([PFUser currentUser]) {
        // User is logged in, do work such as go to next view controller.
        
        SEVServicoNavigationController *servicoController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"servicoNavController"]; //or the homeController
        SEVPerfilNavigationController *logoutController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"logoutController"]; //or the homeController
        SEVMainTabBarController *tabBar = [[SEVMainTabBarController alloc] init];
        logoutController.title = @"Perfil";
        
      
        
        tabBar.viewControllers=[NSArray arrayWithObjects:servicoController,logoutController, nil];
        
        
        self.window.rootViewController = tabBar;
    }
    else{
        SEVServicoNavigationController *servicoNavController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"servicoNavController"]; //or the homeController
        SEVLoginViewController *loginController=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"loginController"]; //or the homeController
        SEVMainTabBarController *tabBar = [[SEVMainTabBarController alloc] init];
        loginController.title = @"Perfil";
        
        
        
        tabBar.viewControllers=[NSArray arrayWithObjects:servicoNavController,loginController, nil];
        
        
        self.window.rootViewController = tabBar;    }
    
    [FBSDKAppEvents activateApp];
    
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "br.com.sev7n.facebook_sev7n" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"facebook_sev7n" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"facebook_sev7n.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
