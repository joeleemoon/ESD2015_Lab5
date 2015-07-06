//
//  ViewController.m
//  HorseRacingGame
//
//  Created by Lee Joe on 4/30/15.
//  Copyright (c) 2015 Lee Joe. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController


NSLock *rankLock;
NSLock *moveLock;
int finish_horse=0;
int first_flag=1;
BOOL run_flag = true;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.h1_label.text = @"Horse1";
    self.horse1=[[Horse alloc]init:self.h1_label:self
                 .h1_progress];
    self.h2_label.text = @"Horse2";
    self.horse2=[[Horse alloc]init:self.h2_label:self
                 .h2_progress];
    self.h3_label.text = @"Horse3";
    self.horse3=[[Horse alloc]init:self.h3_label:self
                 .h3_progress];
    rankLock = [[NSLock alloc]init];
    moveLock = [[NSLock alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction) GoClicked:(UIButton*)sender{

    switch (first_flag) {
        case 0:  //Continue
        {
            [moveLock unlock];
            [self.go_button setEnabled:NO];
            break;
        }
        case 1:  //GO
        {
            NSThread* myThread1 = [[NSThread alloc] initWithTarget:self selector:@selector(horseMove:) object:self.horse1];
            NSThread* myThread2 = [[NSThread alloc] initWithTarget:self selector:@selector(horseMove:) object:self.horse2];
            NSThread* myThread3 = [[NSThread alloc] initWithTarget:self selector:@selector(horseMove:) object:self.horse3];
            [myThread1 start];
            [myThread2 start];
            [myThread3 start];
            [self.go_button setEnabled:NO];
            [self.go_button setTitle:@"Continue" forState:UIControlStateNormal];
            break;
        }
        case 2:  //Reset
        {
            [self horseReset];
            break;
        }
        default:
            break;
    }
    
}

-(void) horseMove:(Horse*)h
{
    while (h.progressBar.progress < 1) {
        [moveLock lock];
        
        [h performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:YES];
        [self horseRanking:h];
        [NSThread sleepForTimeInterval:0.1];
    }
}

-(void) horseRanking:(Horse*)h{
    if(h.progressBar.progress >= 1)
    {
        [rankLock lock];
        h.name.text = [[NSString alloc]initWithFormat:@"Rank %d",finish_horse+1 ];
        finish_horse++;
        first_flag=0;
        if(finish_horse == 3){
            [self.go_button setTitle:@"Reset" forState:UIControlStateNormal];
            first_flag =2;
            [self.go_button setEnabled:YES];
        }
        [rankLock unlock];
        [self.go_button setEnabled:YES];
    }
    else
    {
        [moveLock unlock];
    }
    
}

-(void) horseReset{
    self.h1_label.text = @"Horse1";
    self.h1_progress.progress = 0.0;
    self.h2_label.text = @"Horse2";
    self.h2_progress.progress = 0.0;
    self.h3_label.text = @"Horse3";
    self.h3_progress.progress = 0.0;
    self.horse1=[[Horse alloc]init:self.h1_label:self
                 .h1_progress];
    self.horse2=[[Horse alloc]init:self.h2_label:self
                 .h2_progress];
    self.horse3=[[Horse alloc]init:self.h3_label:self
                 .h3_progress];
    first_flag = 1;
    finish_horse = 0;
    [moveLock unlock];
    [self.go_button setTitle:@"GO!" forState:UIControlStateNormal];
}


@end
