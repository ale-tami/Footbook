//
//  MasterViewController.m
//  Footbook
//
//  Created by Alejandro Tami on 13/08/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "JSONManager.h"
#import "People.h"
#import "PeopleTableViewCell.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"People"];
    
     request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Footbook"];

    if (![self.fetchedResultsController fetchedObjects]) {
        [self performSegueWithIdentifier:@"ToFeetPeople" sender:self];
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"People"];
    
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Footbook"];

    [self.tableView reloadData];
}


- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.fetchedResultsController.sections objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *dvc = segue.destinationViewController;
    dvc.fetchedResultsController = self.fetchedResultsController;
 //   dvc.managedObjectContext = self.managedObjectContext;
                                    
}

@end
