//
//  PeopleTableViewCell.m
//  Footbook
//
//  Created by Alejandro Tami on 13/08/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "PeopleTableViewCell.h"

@implementation PeopleTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
