//
//  MainViewController.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "MainViewController.h"
#import "MainViewCell.h"
#import "APIRequests.h"
#import "JsonData.h"
#import "ResutlsArray.h"
#import "DetailViewController.h"
#import "CoreDataFunctions.h"
@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) JsonData *receivedData;
@property (strong,nonatomic) NSArray* savedData;
@property (strong,nonatomic) NSMutableArray* charactersToSave;
@property (nonatomic) BOOL dataIsLocall;
@property (strong,nonatomic) NSMutableArray *savedIds;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTableViewFunctions];
    [self setArrays];
    [self getData];
    self.title = @"Marvel characters";
}

#pragma mark - SET ARRAYS
-(void)setArrays {
    self.charactersToSave = [[NSMutableArray alloc]init];
    self.savedData = [[NSArray alloc] init];
    self.savedIds = [[NSMutableArray alloc] init];
}


#pragma mark - SET TABLEVIEW FUNCTIONS
-(void)setTableViewFunctions {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"MainViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
   // self.tableView.estimatedRowHeight = 200;
}

#pragma mark -  CHECK THE SOURCE OF THE DATA(IF LOCALL OR FROM API)
-(void)getData {
    if(self.retrieveLocallData.count > 0){
        self.savedData = nil;
        self.dataIsLocall = YES;
        self.savedData = [self retrieveLocallData ];
        [self.tableView reloadData];

    }else {
        self.dataIsLocall = NO;
        [self getDataFromServer];
   }
}

#pragma mark -  GET DATA FROM API REQUESTS
-(void)getDataFromServer {
    [self.charactersToSave removeAllObjects];
    [self showLodader];
    [APIRequests getMarvelDataWithcompletionBlock:^(BOOL success, NSError * _Nonnull error, JsonData * _Nonnull data) {
        [self hideLoader];
        if(success){
            for (ResutlsArray *result in data.dataObject.resutls) {
                if([self.savedIds containsObject:[NSString stringWithFormat:@"%ld", (long)result.resultId]]){
                    NSLog(@"available");
                }else {
                    [self.savedIds addObject:[NSString stringWithFormat:@"%ld", (long)result.resultId]];
                    [self.charactersToSave addObject:result];
                }
            }
            [self saveDataLocally:self.charactersToSave];
            self.receivedData = data;
            [self.tableView reloadData];
        }else {
        }
    }];
}

#pragma mark- SAVE DATA LOCALLY AND CHECK IF IT HAS A WIKI URL
-(void)saveDataLocally:(NSMutableArray*)data {
    self.dataIsLocall = YES;
    for (ResutlsArray*result in data ) {
        NSInteger counter = 0;
        NSString *smallImageUrl = [self getFinalURL:result.thumbnail.urlPath extension:result.thumbnail.extension image:@"standard_xlarge"];
        NSString *largeImageUrl =  [self getFinalURL:result.thumbnail.urlPath extension:result.thumbnail.extension image:@"standard_xlarge"];
        for (Urls *url in result.urls) {
            counter += 1;
            if([url.type isEqualToString:@"wiki"]){
                [CoreDataFunctions insertCharacter:result.name characterId:result.resultId wikiUrl:url.url smallImgUrl:smallImageUrl largeImgUrl:largeImageUrl ];
                break;
            }else {
                if(counter == result.urls.count){
                    [CoreDataFunctions insertCharacter:result.name characterId:result.resultId wikiUrl:@"NO" smallImgUrl:smallImageUrl largeImgUrl:largeImageUrl ];
                    break;
                }
            }
        }
    }
    [self getData];
    [self.tableView reloadData];
}

#pragma mark- SET THE FINAL IMAGE URL
-(NSString *)getFinalURL:(NSString*)url extension:(NSString*)extension image:(NSString*)image {
    NSString* finalUrl = [NSString stringWithFormat:@"%@%@%@%@%@",url,@"/",image,@".",extension];
    return finalUrl;
}

#pragma mark- RETRIEVE ALL DATA SAVED IN LOCALL DATABASE
-(NSArray*)retrieveLocallData {
    return [CoreDataFunctions retrieveAllCharacters];
}

#pragma mark - PREPARE FOR SEGUE TO SEND DATA TO DETAIL VIEW
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"detailsSegue"]){
        DetailViewController *detailVC = [segue destinationViewController];
        if(self.dataIsLocall){
            detailVC.receivedObject = (NSManagedObject*)sender;
        }else {
            detailVC.receivedResults = (ResutlsArray*)sender;
        }
    }
}
#pragma mark - TABLEVIEW FUNCTIONS
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.dataIsLocall){
        NSManagedObject *object = self.savedData[indexPath.section];
        [self performSegueWithIdentifier:@"detailsSegue" sender:object];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if(self.dataIsLocall){
        return self.savedData.count;
    }
    return self.receivedData.dataObject.resutls.count;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.dataIsLocall){
        NSManagedObject *object = self.savedData[indexPath.section];
        cell.nameLabel.text = [object valueForKey:@"character_name"];
        [cell getimageForLocalData:[object valueForKey:@"charcter_smallImgUrl"]];
    }
//    else {
//        ResutlsArray *result = self.receivedData.dataObject.resutls[indexPath.section];
//        [cell displayNameAndImage:result];
//    }
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger limit = [[NSUserDefaults standardUserDefaults] integerForKey:@"limit"];
    if(indexPath.section == limit - 1){
        [self getDataFromServer];
    }
}
@end
