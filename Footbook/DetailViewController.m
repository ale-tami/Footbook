//
//  DetailViewController.m
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
#import "AppDelegate.h"

/*
 
 It wont save on db, error keeps returning nil, and managedObjectContext returns yes, meaning save succesful
 Code is ok, objects exist, and are not duplicated, since it creates a new one every time a row is selected
 sqlite file is created, no eerors nor exceptions are thown... may Jobs have marcy on my soul
 
 please dont mind the duplicated and incomplete :D
 
 */


@interface DetailViewController ()<JSONManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *peopleWithFeet;

@end

@implementation DetailViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[JSONManager getInstance] makeRequest];
    [JSONManager getInstance].delegate = self;
    
    self.managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];

    
}

- (void) responseWithJSON:(NSDictionary *) json
{
    self.peopleWithFeet = [NSMutableArray arrayWithArray:(NSArray*)json]; // thanks to my jedi powers I know for sure that this is an array
    [self.tableView reloadData];
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    People *people = [NSEntityDescription insertNewObjectForEntityForName:@"People" inManagedObjectContext:self.managedObjectContext];
    people.name = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    people.hobbitness = [[NSArray arrayWithObjects:@"Non Hobbit", @"Almost Hobbit", @"Freakin Frodo",nil] objectAtIndex: arc4random()%3];
    people.feetAmount = [NSNumber numberWithInt:arc4random()%100];
    people.toesAmount = [NSNumber numberWithInt:arc4random()%10];
    
    ((PeopleTableViewCell*)[tableView cellForRowAtIndexPath:indexPath]).peopleProperty = people;
    NSError *error = nil;
    
    BOOL blah = [self.managedObjectContext save:&error];
    
    NSLog(@"error %@",error );
    NSLog(blah ? @"Yes" : @"No");
    
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"People"];
    
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Footbook"];
    
    NSLog(@"OBJECTS %@", [self.fetchedResultsController fetchedObjects]);
    
    NSLog(@"moc %@ has %d insertedObjects",
          self.managedObjectContext,
          [[[self managedObjectContext] insertedObjects] count]) ;
    NSLog(@"Before saving, &error = %@", error) ;
    BOOL savedOK = [[self managedObjectContext] save:&error] ;
    NSLog(@"savedOK = %d", savedOK) ;
    NSLog(@"NSError saving = %@", error) ;
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    People *people = ((PeopleTableViewCell*)[tableView cellForRowAtIndexPath:indexPath]).peopleProperty;
    
    [self.managedObjectContext deleteObject:people];
    NSError *error = nil;
    BOOL blah = [self.managedObjectContext save:&error];
    NSLog(@"error %@",error );
    NSLog(blah ? @"Yes" : @"No");
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.peopleWithFeet.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.peopleWithFeet objectAtIndex:indexPath.row];
    
    
    return cell;
}

@end
