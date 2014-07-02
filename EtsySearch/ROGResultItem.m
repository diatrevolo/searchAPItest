//
//  ROGResultItem.m
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ROGResultItem.h"

@implementation ROGResultItem

- (id)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.listingId = (NSUInteger)[[attributes valueForKey:@"listing_id"] integerValue];
    self.state = [attributes valueForKey:@"state"];
    self.userId = [attributes valueForKey:@"user_id"];
    self.categoryId = [attributes valueForKey:@"category_id"];
    self.title = [attributes valueForKey:@"title"];
    self.description = [attributes valueForKey:@"description"];
    self.price = [NSString stringWithFormat:@"%@ %@", [attributes valueForKey:@"price"], [attributes valueForKey:@"curency_code"]];
    self.quantity = (NSUInteger)[[attributes valueForKey:@"quantity"] integerValue];
    self.tags = [attributes valueForKey:@"tags"];
    NSDictionary *mainImage = [attributes objectForKey:@"MainImage"];
    self.imageUrl = [mainImage objectForKey:@"url_75x75"];
    
    return self;
}

+ (NSURLSessionDataTask *)searchResultsForKeywords:(NSString*)keywords pageNumber:(int)page withBlock:(void (^)(NSArray *results, NSError *error))block {
    NSDictionary *params = @{@"api_key" : [ROGEtsyAPIClient getAPIKey], @"includes" : @"MainImage", @"keywords" : keywords, @"page" : [NSNumber numberWithInt:page]};
    return [[ROGEtsyAPIClient sharedClient] GET:@"v2/listings/active" parameters:params success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSNumber *count = [JSON valueForKey:@"count"];
        if (count.intValue > 0) {
            NSArray *items = [JSON valueForKey:@"results"];
            NSMutableArray *mutableItems = [NSMutableArray arrayWithCapacity:count.intValue];
            for (NSDictionary *attributes in items) {
                ROGResultItem *item = [[ROGResultItem alloc] initWithAttributes:attributes];
                [mutableItems addObject:item];
            }
            
            if (block) {
                block([NSArray arrayWithArray:mutableItems], nil);
            }
        }
        
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block([NSArray array], error);
        }
    }];
}

@end
