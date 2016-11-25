//
//  Bar+CoreDataProperties.m
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import "Bar+CoreDataProperties.h"

@implementation Bar (CoreDataProperties)

+ (NSFetchRequest<Bar *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Bar"];
}

@dynamic cardapio;
@dynamic descricao;
@dynamic nome;
@dynamic uuid;

@end
