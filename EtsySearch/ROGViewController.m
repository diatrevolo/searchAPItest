//
//  ROGViewController.m
//  EtsySearch
//
//  Created by Roberto on 7/2/14.
//  Copyright (c) 2014 Roberto Osorio. All rights reserved.
//

#import "ROGViewController.h"

@interface ROGViewController ()

@end

@implementation ROGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tgr.delegate = self;
    [self.tableView addGestureRecognizer:tgr];
}

- (void)viewTapped:(UITapGestureRecognizer*)tapGestureRecognizer {
    [self.searchBar resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    [ROGResultItem searchResultsForKeywords:searchText withBlock:^(NSArray *results, NSError *error) {
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
    return [self.searchResults count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
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


@end
