//
//  ROGEtsyAPIClient.m
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import "ROGEtsyAPIClient.h"

static NSString * const APIToken = @"liwecjs0c3ssk6let4p1wqt9";
static NSString * const APIBaseURLString = @"https://api.etsy.com/";

@implementation ROGEtsyAPIClient

+ (instancetype)sharedClient {
    static ROGEtsyAPIClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[ROGEtsyAPIClient alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

+ (NSString*)getAPIKey {
    return APIToken;
}

@end
