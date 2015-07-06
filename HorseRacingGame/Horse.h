//
//  Horse.h
//  HorseRacingGame
//
//  Created by Lee Joe on 4/30/15.
//  Copyright (c) 2015 Lee Joe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Horse : NSObject
@property (nonatomic,strong)  UIProgressView *progressBar;
@property (nonatomic,strong)  UILabel *name;

//-(void)horseMove;
-(Horse*)init: (UILabel*)name:(UIProgressView*)progressView;
-(void)run;
@end
