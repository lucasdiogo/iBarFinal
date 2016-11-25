//
//  NSManagedObjectContext+Dao.h
//  iBarFinal
//
//  Created by Lucas Diogo on 24/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import <CoreData/CoreData.h>
#import "Bar+CoreDataClass.h"
#import "Cardapio+CoreDataClass.h"

@interface NSManagedObjectContext (Dao)

-(NSArray<Bar *> *) todosBares;
-(NSArray<Cardapio *> *) todosCardapio;

@end
