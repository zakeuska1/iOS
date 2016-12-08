//
//  Produto+CoreDataProperties.h
//  AppListaDeCompras
//
//  Created by ALUNO on 07/12/16.
//  Copyright © 2016 IESB. All rights reserved.
//

#import "Produto+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Produto (CoreDataProperties)

+ (NSFetchRequest<Produto *> *)fetchRequest;

@property (nullable, nonatomic, retain) NSData *foto;
@property (nullable, nonatomic, copy) NSString *marca;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nonatomic) int16_t quantidade;
@property (nonatomic) int16_t unidMed;

@end

NS_ASSUME_NONNULL_END
