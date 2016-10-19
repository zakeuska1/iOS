//
//  Pessoa+CoreDataProperties.m
//  AppCoreData
//
//  Created by ALUNO on 19/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Pessoa+CoreDataProperties.h"

@implementation Pessoa (CoreDataProperties)

+ (NSFetchRequest<Pessoa *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Pessoa"];
}

@dynamic nome;
@dynamic dataNascimento;
@dynamic telefone;
@dynamic email;
@dynamic produtos;

@end
