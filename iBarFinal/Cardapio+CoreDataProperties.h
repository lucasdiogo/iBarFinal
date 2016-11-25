//
//  Cardapio+CoreDataProperties.h
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import "Cardapio+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Cardapio (CoreDataProperties)

+ (NSFetchRequest<Cardapio *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *cardapio;
@property (nullable, nonatomic, copy) NSString *item;
@property (nullable, nonatomic, copy) NSString *valor;

@end

NS_ASSUME_NONNULL_END
