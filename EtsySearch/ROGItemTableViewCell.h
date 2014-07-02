//
//  ROGItemTableViewCell.h
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ROGItemTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *productImageView;
@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UITextView *descriptionTextView;

@end
