//
//  People.h
//  Footbook
//
//  Created by Alejandro Tami on 13/08/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface People : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * feetAmount;
@property (nonatomic, retain) NSString * hobbitness;
@property (nonatomic, retain) NSNumber * toesAmount;

@end
