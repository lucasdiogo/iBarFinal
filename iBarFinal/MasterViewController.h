//
//  MasterViewController.h
//  iBarFinal
//
//  Created by Lucas Diogo on 23/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>



@class DetailViewController;

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(IBAction)unwindToMaster:(UIStoryboardSegue *)segue;


@end

