//
//  SEVServicoMainViewController.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 27/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVServicoMainViewController.h"
#import "SEVModel.h"
#import <Parse/Parse.h>
#import "SEVServicosDisponiveisTableViewCell.h"
#import "SEVDetalhesServicoDisponivelTableViewController.h"

@interface SEVServicoMainViewController () <UISearchControllerDelegate>
{
    NSArray *servicos;
    NSString *servicoSelecionado;
    NSArray *searchResults;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SEVServicoMainViewController

- (IBAction)profileButtonPressed:(id)sender
{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self queryServicesWithType:[SEVModel eletrica]];
    searchResults = [[NSArray alloc] init];
   
    
}

- (void)viewDidAppear:(BOOL)animated {

    [self queryServicesWithType:[SEVModel servicoSelecionado]];

}

- (void)queryServicesWithType: (NSString *)tipo {

    servicos = [SEVModel BuscaServicosPorTipo:tipo];
    [self.tableView reloadData];

}

- (IBAction)chaveiroButtonPressed:(id)sender {
    [self desselectImageButton];
    [self queryServicesWithType:[SEVModel chaveiro]];
    [self selectImageButton];

}
- (IBAction)limpezaButtonPressed:(id)sender {
    [self desselectImageButton];
    [self queryServicesWithType:[SEVModel limpeza]];
    [self selectImageButton];
}

- (IBAction)eletricaButtonPressed:(id)sender {
    [self desselectImageButton];
    [self queryServicesWithType:[SEVModel eletrica]];
    [self selectImageButton];
    
}
- (IBAction)alvenariaButtonPressed:(id)sender {
    [self desselectImageButton];
    [self queryServicesWithType:[SEVModel alvenaria]];
    [self selectImageButton];
}
- (IBAction)pinturaButtonPressed:(id)sender {
    [self desselectImageButton];
    [self queryServicesWithType:[SEVModel pintura]];
    [self selectImageButton];
}
- (IBAction)hidraulicaButtonPressed:(id)sender {
    [self desselectImageButton];
    [self queryServicesWithType:[SEVModel hidraulica]];
    [self selectImageButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// procedimento para desselecionar os botões, junto com as imagens
- (void)desselectImageButton{
    
    if ([[SEVModel servicoSelecionado] isEqualToString:@"eletrica"]) {
        [self.btEletrica setImage:[UIImage imageNamed:@"Elet-select"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"chaveiro"]) {
        [self.btChaveiro setImage:[UIImage imageNamed:@"Chav-select"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"hidraulica"]) {
        [self.btHidraulica setImage:[UIImage imageNamed:@"Hidro-select"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"alvenaria"]) {
        [self.btAlvenaria setImage:[UIImage imageNamed:@"Alv-select"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"limpeza"]) {
        [self.btLimpeza setImage:[UIImage imageNamed:@"Limp-select"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"pintura"]) {
        [self.btPintura setImage:[UIImage imageNamed:@"Pint-select"] forState:UIControlStateNormal];
    }
    
}

// procedimento para selecionar os botões, junto com as imagens
- (void)selectImageButton{
    
    if ([[SEVModel servicoSelecionado] isEqualToString:@"eletrica"]) {
        [self.btEletrica setImage:[UIImage imageNamed:@"Elet-desselect"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"chaveiro"]) {
        [self.btChaveiro setImage:[UIImage imageNamed:@"Chav-desselect"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"hidraulica"]) {
        [self.btHidraulica setImage:[UIImage imageNamed:@"Hidro-desselect"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"alvenaria"]) {
        [self.btAlvenaria setImage:[UIImage imageNamed:@"Alv-desselect"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"limpeza"]) {
        [self.btLimpeza setImage:[UIImage imageNamed:@"Limp-desselect"] forState:UIControlStateNormal];
    }else if ([[SEVModel servicoSelecionado] isEqualToString:@"pintura"]) {
        [self.btPintura setImage:[UIImage imageNamed:@"Pint-desselect"] forState:UIControlStateNormal];
    }
    
}

- (IBAction)novoServico:(id)sender {
    if ([PFUser currentUser]) {
        [self performSegueWithIdentifier:@"novoMain" sender:self];
        
    }
    else{
        //SEVMainTabBarController *tabBar = [[SEVMainTabBarController alloc] init];
        [self.parentViewController.tabBarController setSelectedIndex:1];
    }
}

#pragma table view methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // se o search bar obtiver resultados, somente será mostrado o vetor
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        return searchResults.count;
    }
    // senão, apenas os objetos
    else
    {
        return servicos.count;
    }
}


- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SEVServicosDisponiveisTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (tableView == self.tableView)
    {
        cell.labelPrincipal.text  = [servicos[indexPath.row] objectForKey:@"descricao"];
        cell.labelSecundario.text  = [servicos[indexPath.row] objectForKey:@"detalhe"];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
    {
        cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
    }
    else
    {
        cell.textLabel.text = [servicos objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    //Salva proposta
    /*
    SEVModel *model = [[SEVModel alloc] init];

    [model salvaPropostaNoServico:servicos[indexPath.row] completion:^(BOOL finished) {
        
        NSLog(finished ? @"Yes" : @"No");
        if (finished ? @"Yes" : @"No"){
            printf("Proposta bem sucedida");
        }
    }];
    */
    
    [self performSegueWithIdentifier:@"DetalhesServicoDisponivel" sender:self];
    
    
}

#pragma search methods

- (void) filterContentForSearchText: (NSString *)searchText scope:(NSString *)scope
{
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    if ([[segue identifier] isEqualToString:@"DetalhesServicoDisponivel"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        SEVDetalhesServicoDisponivelTableViewController *destination = segue.destinationViewController;
        
        destination.dictionary = servicos[indexPath.row];
        
    }


    
}


@end
