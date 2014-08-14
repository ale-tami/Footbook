//
//  DetailViewController.h
//  Footbook
//
//  Created by Alejandro Tami on 13/08/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController<NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;


@end
