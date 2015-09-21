//
//  SEVDetalhesServicoDisponivelTableViewController.m
//  facebook-sev7n
//
//  Created by EDILBERTO DA SILVA RAMOS JUNIOR on 19/08/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVDetalhesServicoDisponivelTableViewController.h"
#import "SEVModel.h"
#import "SEVServiceImageViewController.h"
@interface SEVDetalhesServicoDisponivelTableViewController (){
    SEVModel *model;
    NSMutableArray *images;
}

@end

@implementation SEVDetalhesServicoDisponivelTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    model = [[SEVModel alloc] init];
    images = [@[] mutableCopy];
    
    self.tipoLabel.text = [self.dictionary objectForKey:@"tipo"];
    self.enderecoLabel.text = [self.dictionary objectForKey:@"endereco"];
    self.detalhesLabel.text = [self.dictionary objectForKey:@"detalhe"];
    self.telefoneLabel.text = [self.dictionary objectForKey:@"telefone"];
    self.descricaoLabel.text = [self.dictionary objectForKey:@"descricao"];
    
    CGSize size = self.oneImage.frame.size;
    
    [model buscaImageWithServico:self.dictionary andWithIndex:1 andWithSize:size completion:^(UIImage *image){
        if (image) {
            self.oneImage.backgroundColor = [UIColor colorWithPatternImage:image];
            self.oneImage.imageView.image = image;
            [images addObject:image];

        }
    }];
    [model buscaImageWithServico:self.dictionary andWithIndex:2 andWithSize:size completion:^(UIImage *image){
        if (image) {
            self.twoImage.backgroundColor = [UIColor colorWithPatternImage:image];
            self.twoImage.imageView.image = image;
            [images addObject:image];
}
    }];
    [model buscaImageWithServico:self.dictionary andWithIndex:3 andWithSize:size completion:^(UIImage *image){
        if (image) {
            self.threeImage.backgroundColor = [UIColor colorWithPatternImage:image];
            self.threeImage.imageView.image = image;
            [images addObject:image];
}
        
    }];
    self.threeImage.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"todosIcon"]];
    self.threeImage.imageView.image = [UIImage imageNamed:@"todosIcon"];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

- (IBAction)oneImageAction:(id)sender {

    
}
- (IBAction)twoImageAction:(id)sender{

}
- (IBAction)threeImageAction:(id)sender{
}
     
- (IBAction)aceitarAction:(id)sender{

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SEVServiceImageViewController *destination = segue.destinationViewController;

    
    destination.images = @[self.oneImage.imageView.image,self.twoImage.imageView.image,self.threeImage.imageView.image];
    
    destination.images = images;
    
    
    if ([[segue identifier] isEqualToString:@"segueImage1"]) {
        
        destination.imageIndex = 0;
        
    }
    if ([[segue identifier] isEqualToString:@"segueImage2"]) {
        
        destination.imageIndex = 1;

    }
    if ([[segue identifier] isEqualToString:@"segueImage3"]) {
        
        NSLog(@"\n\n\nimage3");

        destination.imageIndex = 2;

    }
    
    
    
}

@end
