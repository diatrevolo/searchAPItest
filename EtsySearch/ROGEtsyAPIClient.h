//
//  ROGEtsyAPIClient.h
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface ROGEtsyAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;
+ (NSString*)getAPIKey;

@end
