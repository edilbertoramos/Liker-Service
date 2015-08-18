//
//  SEVModel.m
//  facebook-sev7n
//
//  Created by Lúcio Barros on 30/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import "SEVModel.h"

@implementation SEVModel


-(void)salvaServicoWithDetalhe:(NSString *)detalhe andDescricao:(NSString *)descricao andEndereco:(NSString *)endereco andTelefone:(NSString *)telefone andImage1:(UIImage *)image1 andImage2:(UIImage *)image2 andImage3:(UIImage *)image3 andTipo:(NSString *)tipo completion:(myCompletion) compblock
{
    if (![descricao isEqualToString:@""] && ![detalhe isEqualToString:@""] && ![endereco isEqualToString:@""]  && ![telefone isEqualToString:@""])
    {
        PFObject *servico = [PFObject objectWithClassName:@"Servico"];
        [servico setObject:[PFUser currentUser] forKey:@"User"];
        servico[@"endereco"] = endereco;
        servico[@"descricao"] = descricao;
        servico[@"detalhe"] = detalhe;
        servico[@"tipo"] = tipo;
        
        if (image1){
            servico[@"image1"] = [self imageFiles:image1 andName:@"image1"];
        }
        if (image2) {
            servico[@"image2"] = [self imageFiles:image2 andName:@"image2"];
        }
        if (image3){
            servico[@"image3"] = [self imageFiles:image3 andName:@"image3"];
        }

        [servico saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (succeeded) {
                compblock(YES);
            }
            else
            {
                compblock(NO);
            }
        }];
        
    }
    else
    {
        compblock(NO);
    }

}

- (PFFile *)imageFiles:(UIImage *)image andName:(NSString *)name{
    
    NSData *imageData = UIImagePNGRepresentation(image);
    
    PFFile *imageFile = [PFFile fileWithName:name data:imageData];
    
    return imageFile;
    
}

+ (NSArray *)BuscaServicosPorTipo: (NSString *)tipo
{
    PFQuery *servicosDisponiveis = [PFQuery queryWithClassName:@"Servico"];
    
    [servicosDisponiveis whereKey:@"tipo" equalTo:tipo];
    
    return [servicosDisponiveis findObjects];
}


+ (NSString *)alvenaria{
    sericoSelecionado = @"alvenaria";
    return sericoSelecionado;
}
+ (NSString *)chaveiro{
    sericoSelecionado = @"chaveiro";
    return sericoSelecionado;
}
+ (NSString *)eletrica{
    sericoSelecionado = @"eletrica";
    return sericoSelecionado;
}
+ (NSString *)hidraulica{
    sericoSelecionado = @"hidraulica";
    return sericoSelecionado;
}
+ (NSString *)limpeza{
    sericoSelecionado = @"limpeza";
    return sericoSelecionado;
}
+ (NSString *)pintura{
    sericoSelecionado = @"pintura";
    return sericoSelecionado;
}

static NSString* sericoSelecionado;

+ (NSString *)servicoSelecionado{
    return sericoSelecionado;
}

@end
