//
//  Cardapio+CoreDataProperties.m
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import "Cardapio+CoreDataProperties.h"

@implementation Cardapio (CoreDataProperties)

+ (NSFetchRequest<Cardapio *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Cardapio"];
}

@dynamic cardapio;
@dynamic item;
@dynamic valor;

@end
