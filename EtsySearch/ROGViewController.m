//
//  ROGViewController.m
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import "ROGViewController.h"

@interface ROGViewController ()
{
    NSString *searchTerm;
    int pageNumber;
}
@end

@implementation ROGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    pageNumber = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    searchTerm = searchText;
    pageNumber = 1;
    [ROGResultItem searchResultsForKeywords:searchTerm pageNumber:pageNumber withBlock:^(NSArray *results, NSError *error) {
        self.searchResults = results;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        
    }];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchBar resignFirstResponder];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.searchResults count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.searchResults.count && self.searchResults != nil) {
        static NSString *MoreCellIdentifier = @"MoreCell";
        UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MoreCellIdentifier];
        
        if (cell==nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MoreCellIdentifier];
        }
        [cell.textLabel setText:@"Load More"];
        return cell;
    } else {
        static NSString *CellIdentifier = @"ItemCell";
        ROGItemTableViewCell *cell = (ROGItemTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        // Configure the cell...
        if (cell == nil) {
            cell = [[ROGItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        // Display recipe in the table cell
        ROGResultItem *item = [self.searchResults objectAtIndex:indexPath.row];
        [cell.titleLabel setText:[item title]];
        [cell.descriptionTextView setText:[item description]];
        [cell.productImageView setImageWithURL:[NSURL URLWithString:[item imageUrl]]];
        
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == self.searchResults.count) {
        pageNumber++;
        NSMutableArray *mutableArray = [NSMutableArray arrayWithArray:self.searchResults];
        [ROGResultItem searchResultsForKeywords:searchTerm pageNumber:pageNumber withBlock:^(NSArray *results, NSError *error) {
            [mutableArray addObjectsFromArray:results];
            self.searchResults = [NSArray arrayWithArray:mutableArray];
            [self.tableView reloadData];
        }];
    }
}


@end
