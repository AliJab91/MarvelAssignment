//
//  MainViewCell.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "MainViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation MainViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - DISPLAY NAME AND IMAGE IN THE CELL
-(void)displayNameAndImage:(ResutlsArray*)result {
     self.receivedResult = result;
    self.nameLabel.text = result.name;
    [self getImage:result.thumbnail.urlPath extension:result.thumbnail.extension];
}

#pragma mark -  GET IMAGE FORM THE WEB AND DISPLAY IT IN THE CELL
-(void)getImage:(NSString*)url extension:(NSString*)extension {
    NSString *finalUrl = [self getFinalURL:url extension:extension];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:finalUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if(error == nil){
         
        }
    }];
}

#pragma mark - GET IMAGES FOR LOCALL
-(void)getimageForLocalData:(NSString*)url {
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:url]];
placeholderImage:[UIImage imageNamed:@"placeholder.png"];
}

#pragma mark - CONVERT IMAGES AS NSDATA
-(NSData*)getImageAsNSData:(UIImage *)image {
    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
    return imageData;
}

#pragma mark - GENERATE THE FINAL IMAGE URL
-(NSString *)getFinalURL:(NSString*)url extension:(NSString*)extension {
    NSString* finalUrl = [NSString stringWithFormat:@"%@%@%@",url,@"/standard_xlarge.",extension];
    return finalUrl;
}


@end
