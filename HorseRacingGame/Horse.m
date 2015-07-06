//
//  Horse.m
//  HorseRacingGame
//
//  Created by Lee Joe on 4/30/15.
//  Copyright (c) 2015 Lee Joe. All rights reserved.
//

#import "Horse.h"

@implementation Horse
-(Horse*) init:(UILabel *)name :(UIProgressView*) progressView{
    self.name = name;
    self.progressBar = progressView;
    self.progressBar.progress = 0.0;
    return self;
}

-(void)run{
    float progress=self.progressBar.progress;
    if(progress < 1)
    {
        float move_step = (1+arc4random()%10)/500.0;
        self.progressBar.progress += move_step;
    }
}


@end
