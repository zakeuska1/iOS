//
//  Produto+CoreDataProperties.m
//  AppListaDeCompras
//
//  Created by ALUNO on 12/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Produto+CoreDataProperties.h"

@implementation Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Produto"];
}

@dynamic foto;
@dynamic marca;
@dynamic nome;
@dynamic quantidade;
@dynamic unidMed;

@end
