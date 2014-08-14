//
//  MasterViewController.h
//  Footbook
//
//  Created by Alejandro Tami on 13/08/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <CoreData/CoreData.h>

@interface MasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
