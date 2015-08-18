//
//  ViewController.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 14/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVNovoMainViewController.h"
#import "SEVNovoDetalhesTableViewController.h"
#import "SEVMainTabBarController.h"
#import "SEVModel.h"

@interface SEVNovoMainViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *chaveiro;
    NSArray *eletrica;
    NSArray *alvenaria;
    NSArray *pintura;
    NSArray *hidraulica;
    NSArray *limpeza;
    
    NSArray *descricaoArray;


}
@property (strong, nonatomic) IBOutlet SCProfilePictureButton *profilePictureButton;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation SEVNovoMainViewController

- (IBAction)profileButtonPressed:(id)sender {

    if ([FBSDKAccessToken currentAccessToken]) {
        NSLog(@"esta logado");
        [self performSegueWithIdentifier:@"logoutSegue" sender:self];

    }
    else{
        NSLog(@"nao esta logado");
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
    }
}
- (IBAction)chaveiroButtonPressed:(id)sender {
    [self alteraTipo:[SEVModel chaveiro]];
}

- (IBAction)limpezaButtonPressed:(id)sender {
    [self alteraTipo:[SEVModel limpeza]];
}

- (IBAction)eletricaButtonPressed:(id)sender {
    [self alteraTipo:[SEVModel eletrica]];
}

- (IBAction)alvenariaButtonPressed:(id)sender {
    [self alteraTipo:[SEVModel alvenaria]];
}

- (IBAction)pinturaButtonPressed:(id)sender {
    [self alteraTipo:[SEVModel pintura]];
}

- (IBAction)hidraulicaButtonPressed:(id)sender {
    [self alteraTipo:[SEVModel hidraulica]];
}

- (void)alteraTipo: (NSString *)servicoSelecionado{
    
    if ([servicoSelecionado  isEqual: @"chaveiro"]){
        descricaoArray = chaveiro;
    }
    else if ([servicoSelecionado  isEqual: @"eletrica"]){
        descricaoArray = eletrica;
    }
    else if ([servicoSelecionado  isEqual: @"hidraulica"]){
        descricaoArray = hidraulica;
    }
    else if ([servicoSelecionado  isEqual: @"pintura"]){
        descricaoArray = pintura;
    }
    else if ([servicoSelecionado  isEqual: @"alvenaria"]){
        descricaoArray = alvenaria;
    }
    else if ([servicoSelecionado  isEqual: @"limpeza"]){
        descricaoArray = limpeza;
    }

    [self.tableView reloadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.profilePictureButton.profileID = @"me";
    self.profilePictureButton.pictureCropping = FBSDKProfilePictureModeSquare;

    chaveiro = @[@"Instalação de fechadura(s)", @"Troca de segredo", @"Cópia de chave(s)"];
    eletrica = @[@"Instalação de disjuntores", @"Instalação de fusíveis", @"Instalação de tomada(s)", @"Instalação e manutenção de chuveiros", @"Instalação e manutenção de torneiras elétricas", @"Reparos elétricos em geral"];
    alvenaria = @[@"Construção de estrutura(s)",@"Demolição de estrutura(s)", @"Reforma em estrutura(s)", @"Instalação de pisos e azulejos"];
    hidraulica = @[@"Eliminação de goteiras e vazamentos",@"Limpeza de caixa d'água", @"Instalação de vaso sanitário",@"Desentupimentos de canos e calhas", @"Reparos hidráulicos em geral"];
    pintura = @[@"Pintura em fachadas",@"Reparos em paredes", @"Pintura em ambientes internos",@"Reparos em janelas", @"Reparos em portas", @"Pintura em geral"];
    limpeza = @[@"Outros"];
    
    descricaoArray = [[NSArray alloc] init];
    
    [self alteraTipo:[SEVModel servicoSelecionado]];
    
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
        cell.textLabel.text = descricaoArray[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    [self performSegueWithIdentifier:@"novoServico" sender:self];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return descricaoArray.count;
}
//
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"novoServico"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        SEVNovoDetalhesTableViewController *destination = segue.destinationViewController;
        
        destination.tipo = [SEVModel servicoSelecionado];
        destination.descricao = descricaoArray[indexPath.row];
        
        //[segue.destinationViewController setTitle:@"novoServico"];
    }
}
@end
