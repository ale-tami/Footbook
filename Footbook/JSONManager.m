//
//  JSONManager.m
//  MeetUpClient
//
//  Created by Alejandro Tami on 04/08/14.
//  Copyright (c) 2014 Alejandro Tami. All rights reserved.
//

#import "JSONManager.h"

#define urlJason "http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/4/friends.json"

@interface JSONManager ()

@property NSMutableArray *imagesArray;

@end

@implementation JSONManager

static JSONManager *jsonManager = nil;


+ (instancetype) getInstance
{
    if (jsonManager) {
        return jsonManager;
    } else {
        jsonManager.imagesArray = [NSMutableArray array];
        

        return jsonManager = [JSONManager new];
    }
}



- (void)makeRequest
{
    // to be refactored, make it generic
    __block NSDictionary * responseJSON = [[NSDictionary alloc] init];
    

    NSString *completeURL = [NSString stringWithFormat:@urlJason];
    
    NSString *stringURL = completeURL;
    
    NSURL *url = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        responseJSON = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        [self.delegate responseWithJSON:responseJSON];
      
    
    }];
    
}

- (void) responseWithJSON:(NSDictionary *) json
{
    
}




@end
