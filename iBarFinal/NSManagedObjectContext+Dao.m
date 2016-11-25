//
//  NSManagedObjectContext+Dao.m
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import "NSManagedObjectContext+Dao.h"

@implementation NSManagedObjectContext (Dao)

-(NSArray<Bar *> *)todosBares {
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Bar"];
    return [self executeFetchRequest:request error:nil];
}

-(NSArray<Cardapio *> *)todosCardapio {
    NSFetchRequest * request = [NSFetchRequest fetchRequestWithEntityName:@"Cardapio"];
    return [self executeFetchRequest:request error:nil];
}

@end
