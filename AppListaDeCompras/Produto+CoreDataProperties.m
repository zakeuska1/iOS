//
//  Produto+CoreDataProperties.m
//  AppListaDeCompras
//
//  Created by ALUNO on 08/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Produto+CoreDataProperties.h"

@implementation Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Produto"];
}

@dynamic nome;
@dynamic marca;
@dynamic quantidade;

@end
