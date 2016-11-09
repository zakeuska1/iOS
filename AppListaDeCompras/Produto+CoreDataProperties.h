//
//  Produto+CoreDataProperties.h
//  AppListaDeCompras
//
//  Created by ALUNO on 09/11/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Produto+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *marca;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSString *quantidade;
@property (nullable, nonatomic, retain) NSData *foto;

@end

NS_ASSUME_NONNULL_END
