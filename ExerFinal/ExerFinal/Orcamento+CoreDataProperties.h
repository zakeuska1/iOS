//
//  Orcamento+CoreDataProperties.h
//  ExerFinal
//
//  Created by ALUNO on 25/10/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Orcamento+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Orcamento (CoreDataProperties)

+ (NSFetchRequest<Orcamento *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;

@end

NS_ASSUME_NONNULL_END
