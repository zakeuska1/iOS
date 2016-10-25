//
//  Orcamento+CoreDataProperties.m
//  ExerFinal
//
//  Created by ALUNO on 25/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Orcamento+CoreDataProperties.h"

@implementation Orcamento (CoreDataProperties)

+ (NSFetchRequest<Orcamento *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Orcamento"];
}

@dynamic nome;

@end
