//
//  SEVMeusServicosViewController.m
//  facebook-sev7n
//
//  Created by Rodrigo Machado on 10/1/15.
//  Copyright © 2015 sev7n. All rights reserved.
//

#import "SEVMeusServicosViewController.h"

@interface SEVMeusServicosViewController ()
{
    NSArray *servicos;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SEVMeusServicosViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma table view methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    SEVMeusServicosViewController *cell = 
//}


- (IBAction)meusContatos:(id)sender
{
    
}

- (IBAction)clientes:(id)sender
{
    
}

- (IBAction)favoritos:(id)sender
{
    
}

- (IBAction)adicionados:(id)sender
{
    
}

@end
