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

@interface SEVServicoMainViewController (){
    NSArray *servicos;
    NSString *servicoSelecionado;

}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SEVServicoMainViewController
- (IBAction)profileButtonPressed:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self queryServicesWithType:[SEVModel eletrica]];
    
}

- (void)viewDidAppear:(BOOL)animated{

    [self queryServicesWithType:[SEVModel servicoSelecionado]];

}

- (void)queryServicesWithType: (NSString *)tipo {

    servicos = [SEVModel BuscaServicosPorTipo:tipo];
    [self.tableView reloadData];

}

- (IBAction)chaveiroButtonPressed:(id)sender {
    [self queryServicesWithType:[SEVModel chaveiro]];
}
- (IBAction)limpezaButtonPressed:(id)sender {
    [self queryServicesWithType:[SEVModel limpeza]];
}

- (IBAction)eletricaButtonPressed:(id)sender {
    [self queryServicesWithType:[SEVModel eletrica]];
}
- (IBAction)alvenariaButtonPressed:(id)sender {
    [self queryServicesWithType:[SEVModel alvenaria]];
}
- (IBAction)pinturaButtonPressed:(id)sender {
    [self queryServicesWithType:[SEVModel pintura]];
}
- (IBAction)hidraulicaButtonPressed:(id)sender {
    [self queryServicesWithType:[SEVModel hidraulica]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return servicos.count;
}

- (UITableViewCell *)tableView:(UITableView *) tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SEVServicosDisponiveisTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    cell.labelPrincipal.text  = [servicos[indexPath.row] objectForKey:@"descricao"];
    cell.labelSecundario.text  = [servicos[indexPath.row] objectForKey:@"detalhe"];
    
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
