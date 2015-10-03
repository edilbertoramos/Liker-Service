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
    [self queryServicesWithType:[SEVModel clientes]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma model methods

- (void)queryServicesWithType: (NSString *)tiposServicos
{
    servicos = [SEVModel BuscaServicosComoCliente];
    [self.tableView reloadData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self queryServicesWithType:[SEVModel meusServicos]];
}

#pragma table view methods

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return servicos.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEVServicosDisponiveisTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (tableView == self.tableView)
    {
        cell.label1.text  = [servicos[indexPath.row] objectForKey:@"descricao"];
        cell.label2.text  = [servicos[indexPath.row] objectForKey:@"detalhe"];
    }

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // [self performSegueWithIdentifier:@"DetalhesServicoDisponivel" sender:self];
}



#pragma buttons methods

// estabelendo uma ligação com o modelo para fazer as requisições no Parse
- (IBAction)clientes:(id)sender
{
    [self queryServicesWithType:[SEVModel clientes]];
}

- (IBAction)favoritos:(id)sender
{
    [self queryServicesWithType:[SEVModel favoritos]];
}

- (IBAction)adicionados:(id)sender
{
    [self queryServicesWithType:[SEVModel adicionados]];
}

@end
