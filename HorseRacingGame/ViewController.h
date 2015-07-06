//
//  ViewController.h
//  HorseRacingGame
//
//  Created by Lee Joe on 4/30/15.
//  Copyright (c) 2015 Lee Joe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Horse.h"


@interface ViewController : UIViewController
@property (nonatomic,strong) Horse *horse1;
@property (nonatomic,strong) Horse *horse2;
@property (nonatomic,strong) Horse *horse3;
@property (nonatomic,retain) IBOutlet UILabel *h1_label;
@property (nonatomic,retain) IBOutlet UIProgressView *h1_progress;
@property (nonatomic,retain) IBOutlet UILabel *h2_label;
@property (nonatomic,retain) IBOutlet UIProgressView *h2_progress;
@property (nonatomic,retain) IBOutlet UILabel *h3_label;
@property (nonatomic,retain) IBOutlet UIProgressView *h3_progress;
@property (nonatomic,strong) IBOutlet UIButton *go_button;

-(IBAction) GoClicked:(id)sneder;

@end

