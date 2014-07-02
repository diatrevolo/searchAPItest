//
//  ROGResultItem.h
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ROGEtsyAPIClient.h"

@interface ROGResultItem : NSObject

@property (nonatomic, assign) NSUInteger listingId;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, assign) NSUInteger quantity;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *imageUrl;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)searchResultsForKeywords:(NSString*)keywords pageNumber:(int)page withBlock:(void (^)(NSArray *results, NSError *error))block;

@end


/**
 {
 "listing_id": 175682653,
 "state": "active",
 "user_id": 10941844,
 "category_id": 69190161,
 "title": "Blue Bird",
 "description": "Bird, hand built out of clay by myself.  This bird was created from a single ball of white clay into a  compact  form with soft blue glaze all over and darker blue over-glaze detail.\r\nThe size of this bird is 3 1/2&quot; long and 2 1/2&quot; high.",
 "creation_tsz": 1404308281,
 "ending_tsz": 1414939081,
 "original_creation_tsz": 1389657464,
 "last_modified_tsz": 1404308392,
 "price": "15.00",
 "currency_code": "USD",
 "quantity": 1,
 "tags": [
 "bird",
 "blue bird",
 "fly",
 "feather",
 "wing",
 "beak",
 "flight",
 "blue",
 "light",
 "song",
 "bird song",
 "cheep",
 "sky"
 ],
 "category_path": [
 "Art",
 "Sculpture",
 "Animal"
 ],
 "category_path_ids": [
 68887312,
 68888532,
 69190161
 ],
 "materials": [
 "clay",
 "glaze"
 ],
 "shop_section_id": 15003361,
 "featured_rank": null,
 "state_tsz": 1400108425,
 "url": "https://www.etsy.com/listing/175682653/blue-bird?utm_source=iosteaminterviewapp&utm_medium=api&utm_campaign=api",
 "views": 12,
 "num_favorers": 1,
 "shipping_template_id": null,
 "processing_min": 3,
 "processing_max": 5,
 "who_made": "i_did",
 "is_supply": "false",
 "when_made": "2010_2014",
 "is_private": false,
 "recipient": null,
 "occasion": null,
 "style": [
 "Art Nouveau",
 "Fantasy"
 ],
 "non_taxable": false,
 "is_customizable": true,
 "is_digital": false,
 "file_data": "",
 "language": "en-US",
 "has_variations": false,
 "used_manufacturer": false,
 "MainImage": {
 "listing_image_id": 550570327,
 "hex_code": null,
 "red": null,
 "green": null,
 "blue": null,
 "hue": null,
 "saturation": null,
 "brightness": null,
 "is_black_and_white": null,
 "creation_tsz": null,
 "listing_id": 175682653,
 "rank": null,
 "url_75x75": "https://img1.etsystatic.com/044/0/6006916/il_75x75.550570327_31b6.jpg",
 "url_170x135": "https://img1.etsystatic.com/044/0/6006916/il_170x135.550570327_31b6.jpg",
 "url_570xN": "https://img1.etsystatic.com/044/0/6006916/il_570xN.550570327_31b6.jpg",
 "url_fullxfull": "https://img1.etsystatic.com/044/0/6006916/il_fullxfull.550570327_31b6.jpg",
 "full_height": null,
 "full_width": null
 }
 }
*/