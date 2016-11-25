//
//  Bar+CoreDataProperties.h
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import "Bar+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Bar (CoreDataProperties)

+ (NSFetchRequest<Bar *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *cardapio;
@property (nullable, nonatomic, copy) NSString *descricao;
@property (nullable, nonatomic, copy) NSString *nome;
@property (nullable, nonatomic, copy) NSString *endereco;
@property (nullable, nonatomic, copy) NSString *uuid;

@end

NS_ASSUME_NONNULL_END
