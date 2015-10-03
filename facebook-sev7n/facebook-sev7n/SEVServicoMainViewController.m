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
#import "SEVMenuProfileViewController.h"
@interface SEVServicoMainViewController () <UISearchControllerDelegate, UIGestureRecognizerDelegate>
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
    PFUser *user = [PFUser currentUser];
    NSLog(@"%@", [user objectForKey:@"nome"]);
    [self queryServicesWithType:[SEVModel eletrica]];
    searchResults = [[NSArray alloc] init];
    
    UISwipeGestureRecognizer * swipeleft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeleft.direction=UISwipeGestureRecognizerDirectionLeft;
    [self.profileButton addGestureRecognizer:swipeleft];
    
    UISwipeGestureRecognizer * swipeUp=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeUp:)];
    swipeUp.direction=UISwipeGestureRecognizerDirectionUp;
    [self.profileButton addGestureRecognizer:swipeUp];
    
    self.navigationController.navigationBar.layer.borderWidth = 1;
    self.navigationController.navigationBar.layer.borderColor = [SEVMenuProfileViewController SEVYellowColor].CGColor;
    
    self.searchField.layer.borderWidth = 1;
    self.searchField.layer.borderColor = [SEVMenuProfileViewController SEVYellowColor].CGColor;
    self.searchField.layer.cornerRadius = 7;

    self.searchField.backgroundColor = [UIColor blackColor];
    self.searchField.placeholder = @"Digite um Serviço";
    
}

-(void)swipeLeft:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"\n\nLeft");
    [self showMenu];
}


-(void)swipeUp:(UISwipeGestureRecognizer*)gestureRecognizer
{
    NSLog(@"\n\nUp");
    [self showMenu];
}

- (void)showMenu
{
    [self performSegueWithIdentifier:@"menu" sender:self];

//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    SEVMenuProfileViewController *viewController = (SEVMenuProfileViewController *)[storyboard instantiateViewControllerWithIdentifier:@"Menu"];
//    [self presentViewController:viewController animated:YES completion:nil];
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
        NSLog(@"\n1: %ld", searchResults.count);
        return searchResults.count;
    }
    // senão, apenas os objetos
    else
    {
        NSLog(@"\n2: %ld", servicos.count);

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
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

//        cell.labelPrincipal.text  = [searchResults[indexPath.row] objectForKey:@"descricao"];
        cell1.textLabel.text = [searchResults[indexPath.row] objectForKey:@"descricao"];
        return cell1;
    }
    else
    {
        cell.labelPrincipal.text  = [servicos[indexPath.row] objectForKey:@"descricao"];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
    //Salva proposta
    
//    SEVModel *model = [[SEVModel alloc] init];
//
//    [model salvaPropostaNoServico:servicos[indexPath.row] completion:^(BOOL finished) {
//        
//        NSLog(finished ? @"Yes" : @"No");
//        if (finished ? @"Yes" : @"No"){
//            printf("Proposta bem sucedida");
//        }
//    }];
//    
    
    [self performSegueWithIdentifier:@"DetalhesServicoDisponivel" sender:self];
    
    
}

#pragma search methods

- (void) filterContentForSearchText: (NSString *)searchText scope:(NSString *)scope
{
    // ache todas as palavras que comece com a letra informada
    
    // filtrar o array de serviços
    NSMutableArray *t = [@[] mutableCopy];
    for (NSDictionary *dic in servicos) {
        [t addObject:[dic objectForKey:@"descricao"]];
    }
    NSLog(@"\n\n\n%@", t);
//    NSString* filter = @"%K CONTAINS %@";
//    NSPredicate* predicate = [NSPredicate predicateWithFormat:filter, @"SELF", "I"];

    NSArray* data = @[@"Grapes", @"Apples", @"Oranges"];
    NSString* filter = @"%K CONTAINS %@";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:filter, @"SELF", @"a"];
    NSArray* filteredData = [data filteredArrayUsingPredicate:predicate];

    NSLog(@"\n\n\n---%ld", filteredData.count);

//    searchResults = [t filteredArrayUsingPredicate:predicate];

}

- (BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    NSLog(@"\n\nFiltro: %@", searchString);
    //[self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    
    return YES;
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
