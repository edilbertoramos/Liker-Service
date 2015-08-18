//
//  SEVModel.h
//  facebook-sev7n
//
//  Created by Lúcio Barros on 30/07/15.
//  Copyright (c) 2015 sev7n. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface SEVModel : NSObject

typedef void(^myCompletion)(BOOL);

- (void)salvaServicoWithDetalhe:(NSString *)detalhe andDescricao:(NSString *)descricao andEndereco:(NSString *)endereco andTelefone:(NSString *)telefone andImage1:(UIImage *)image1 andImage2:(UIImage *)image2 andImage3:(UIImage *)image3 andTipo:(NSString *)tipo completion:(myCompletion) compblock;

- (PFFile *)imageFiles:(UIImage *)image andName:(NSString *)name;

+ (NSArray *)BuscaServicosPorTipo: (NSString *)tipo;

+ (NSArray *)BuscaServicosComoProfissional;

+ (NSArray *)BuscaServicosComoCliente;
+ (NSString *)alvenaria;
+ (NSString *)chaveiro;
+ (NSString *)eletrica;
+ (NSString *)hidraulica;
+ (NSString *)limpeza;
+ (NSString *)pintura;

+ (NSString *)servicoSelecionado;

@end

