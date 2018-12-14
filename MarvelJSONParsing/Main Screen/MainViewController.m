//
//  MainViewController.m
//  MarvelJSONParsing
//
//  Created by Omega on 12/13/18.
//  Copyright © 2018 Omega. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "APIRequests.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableViewFunctions];
    [self getData];
    // Do any additional setup after loading the view.
}

-(void)setTableViewFunctions {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MainViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
}

-(void)getData {
    [APIRequests getMarvelDataWithcompletionBlock:^(BOOL success, NSError * _Nonnull error, JsonData * _Nonnull data) {
        if(success){
            
        }else {
            
        }
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.nameLabel.text = @"test";
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  10;
}

@end
