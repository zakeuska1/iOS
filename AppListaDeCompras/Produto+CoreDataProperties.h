//
//  Produto+CoreDataProperties.h
//  AppListaDeCompras
//
//  Created by ALUNO on 08/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "Produto+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSString *marca;
@property (nullable, nonatomic, copy) NSString *quantidade;

@end

NS_ASSUME_NONNULL_END
