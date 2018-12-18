//
//  DetailViewController.m
//  MarvelJSONParsing
//
//  Created by Ali Jaber on 17/12/18.
//  Copyright © 2018 Al Jaber. All rights reserved.
//

#import "DetailViewController.h"
#import "WebLoaderViewController.h"
#import "Urls.h"
@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *characterNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *wikiBtn;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fillLabel];
    [self fillImage];
    [self setButtonDesign];
    // Do any additional setup after loading the view.
}

#pragma mark - SET BUTTON DESIGNS
-(void)setButtonDesign {
    self.wikiBtn.layer.cornerRadius = 5;
    self.wikiBtn.layer.borderWidth = 1.0f;
}
#pragma mark - FILL THE CHARACTER NAME LABEL
-(void)fillLabel {
    self.characterNameLabel.text = [self.receivedObject valueForKey:@"character_name"];
}

#pragma mark - GENERATE THE FINAL URL PATH AND USE IT TO GET THE IMAGE
-(void)fillImage{
    [self setImageFromUrl:[self.receivedObject valueForKey:@"character_largeImgUrl"] imageView:self.imageView];
}

#pragma mark - SEGUE TO THE WEBVIEW
- (IBAction)wikiBtnTapped:(id)sender {
    NSString *wikiLink = [self getWikiLink];
    if([wikiLink isEqualToString:@""]){
        [self showAlertWithTitle:@"" message:@"No wiki url is available"];
    }else {
        [self performSegueWithIdentifier:@"wikiWebView" sender:wikiLink];
    }
}

#pragma mark - PREPARE FOR SEGUE TO SEND THE WIKI URL
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"wikiWebView"]){
        WebLoaderViewController *webVC = [segue destinationViewController];
        webVC.wikiUrl = (NSString*)sender;
    }
}

#pragma mark - GET WIKI LINK
-(NSString*)getWikiLink {
    NSString *url = [self.receivedObject valueForKey:@"wikiUrl"];
    if ([url isEqualToString:@""]){
        return @"";
    }else {
         return url;
    }
}

#pragma mark - DOWNLOAD IMAGES FROM WEB BY URL AND SET THEM IN IMAGEVIEW
-(void)setImageFromUrl:(NSString*)url imageView:(UIImageView*)imageView {
    [imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    placeholderImage:[UIImage imageNamed:@"placeholder.png"];
}

@end
