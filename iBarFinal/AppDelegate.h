//
//  AppDelegate.h
//  iBarFinal
//
//  Created by Lucas Diogo on 23/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

