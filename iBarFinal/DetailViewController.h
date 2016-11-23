//
//  DetailViewController.h
//  iBarFinal
//
//  Created by Lucas Diogo on 23/11/16.
//  Copyright © 2016 Lucas Diogo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iBarFinal+CoreDataModel.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) Event *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

