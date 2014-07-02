//
//  ROGViewController.h
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ROGResultItem.h"
#import "ROGItemTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface ROGViewController : UIViewController <UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *searchResults;
@property (nonatomic, weak) IBOutlet UISearchBar *searchBar;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end
