//
//  MainViewCell.h
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ResutlsArray.h"
#import "CoreDataFunctions.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong,nonatomic) ResutlsArray *receivedResult;
-(void)displayNameAndImage:(ResutlsArray*)result;
-(void)getimageForLocalData:(NSString*)url;
@end

NS_ASSUME_NONNULL_END
